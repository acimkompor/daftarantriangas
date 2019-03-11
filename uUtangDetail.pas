unit uUtangDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvUtil, Vcl.Grids, AdvObj, BaseGrid,
  AdvGrid, Vcl.StdCtrls, Vcl.ComCtrls, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, frxClass, frxDBSet, ZAbstractConnection,
  ZConnection;

type
  TfrmUtangDetail = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit3: TEdit;
    Button1: TButton;
    Button3: TButton;
    Button2: TButton;
    Grid: TAdvStringGrid;
    Label6: TLabel;
    Label7: TLabel;
    GridSrc: TAdvStringGrid;
    qry: TZQuery;
    frxReport1: TfrxReport;
    ListUtang: TfrxDBDataset;
    Button4: TButton;
    procedure FormShow(Sender: TObject);
    procedure GridSrcEnter(Sender: TObject);
    procedure GridSrcExit(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridSrcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridSrcDblClick(Sender: TObject);
    procedure GridEnter(Sender: TObject);
    procedure GridExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Label6DblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    procedure TampilData;
    procedure bersih;
    procedure TampilSearch;
  public
    { Public declarations }
    iduser: integer;
  end;

var
  frmUtangDetail: TfrmUtangDetail;

implementation

{$R *.dfm}

uses Config, uConfig, UDepan, uListUtang, uUDF_FR;

{ TfrmUtangDetail }

var
  edit: Boolean;
  id: integer;

procedure TfrmUtangDetail.GridDblClick(Sender: TObject);
var
  str: string;
begin
  if Grid.RowCount > 1 then
  begin
    id   := StrToInt(Grid.Cells[1, Grid.Row]);
    edit := true;
    edit1.Text := Grid.Cells[2, Grid.Row];
    edit2.Text := Grid.Cells[3, Grid.Row];
    edit3.Text := Grid.Cells[5, Grid.Row];
    str := Format('SELECT * FROM u_list_utang WHERE ID = %d', [id]);
    RunQuery(str, qry);
    DateTimePicker1.Date := qry.FieldByName('tgl').AsDateTime;
    edit1.Enabled := false;
    edit2.SetFocus;
    Button4.Enabled := true;
    GridSrc.Hide;
  end;
end;

procedure TfrmUtangDetail.GridEnter(Sender: TObject);
begin
  Grid.ShowSelection := true;
end;

procedure TfrmUtangDetail.GridExit(Sender: TObject);
begin
  Grid.ShowSelection := false;
end;

procedure TfrmUtangDetail.GridSrcDblClick(Sender: TObject);
begin
  edit1.Text := GridSrc.Cells[1, GridSrc.Row];
  edit2.SetFocus;
  GridSrc.Hide;
end;

procedure TfrmUtangDetail.GridSrcEnter(Sender: TObject);
begin
  GridSrc.ShowSelection := true;
end;

procedure TfrmUtangDetail.GridSrcExit(Sender: TObject);
begin
  GridSrc.ShowSelection := false;
end;

procedure TfrmUtangDetail.GridSrcKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if GridSrc.Row = 1 then
  begin
    case Key of
      VK_UP:
        begin
          edit1.SetFocus;
          edit1.SelStart := Length(edit1.Text);
        end;
    end;
  end;
  case Key of
    VK_RETURN:
      begin
        GridSrcDblClick(Sender);
      end;
  end;
end;

procedure TfrmUtangDetail.Label6DblClick(Sender: TObject);
var
  str: string;
begin
  ReportForm := self;
  str := Format('Select Nama_brng, SUM(qty) as qty from u_list_utang Where id_nama = %d'
       +' AND status = "%s" GROUP BY nama_brng',
       [iduser, 'blm_lunas']);
  ListUtang.DataSet := qry;
  RunQuery(str, qry);
  frxReport1.LoadFromFile('report/struk_utang.fr3');
  frxReport1.DesignReport;
end;

procedure TfrmUtangDetail.bersih;
begin
  edit1.Text := '';
  edit2.Text := '1';
  DateTimePicker1.Date := now();
  edit3.Text := '';
  edit1.Enabled := true;
  edit1.SetFocus;
  edit := false;
  Button4.Enabled := false;
end;

procedure TfrmUtangDetail.Button1Click(Sender: TObject);
var
  str: string;
  qty: integer;
  tgl: string;
begin
  str := Format('SELECT * FROM u_tb_barang WHERE item_name = "%s"', [edit1.Text]);
  RunQuery(str, qry);
  if Not qry.Eof then
  begin
    qty := StrToIntDef(edit2.Text, 1);
    tgl := FormatDateTime('yyyy-MM-dd', DateTimePicker1.Date);
    if edit = false then
    begin
      str := Format('INSERT INTO u_list_utang (id_nama, nama_brng, qty, tgl, ket, status) '
                  + 'VALUES (%d, "%s", %d, "%s", "%s", "%s")',
                    [iduser, edit1.Text, qty, tgl, edit3.Text, 'blm_lunas']);
    end else
    if edit = true then
    begin
      str := Format('UPDATE u_list_utang SET qty = %d, tgl = "%s", ket = "%s" WHERE '
                  + 'ID = %d', [qty, tgl, edit3.Text, id]);
    end;
    RunQuery(str, qry);
    bersih;
    TampilData;
    str := Format('UPDATE u_list_nama SET qty = "%s" WHERE id_nama = %d', [label7.Caption, iduser]);
    RunQuery(str, qry);
  end else
  MessageBox(handle, 'Nama barang tidak sesuai', 'ceked', 16);
end;

procedure TfrmUtangDetail.Button2Click(Sender: TObject);
var
  str: string;
  tgl: string;
  idb: integer;
  iii: integer;
begin
  if Grid.RowCount > 1 then
  begin
    if MessageBox(handle, 'Proses ini tidak dapat di kembalikan, cek kembali. '#13#10'Yakin lanjut proses?', 'Konfirmasi', 48 + 1) = mrOK then
    begin
      tgl := FormatDateTime('yyyy-MM-dd', Now());
      str := Format('INSERT INTO u_log_bayar (id_nama, tgl_bayar, keterangan) VALUES '
                  + '(%d, "%s", %d)', 
                    [iduser, tgl, 0]);
      RunQuery(str, qry);
      str := 'Select * from u_log_bayar ORDER BY id_bayar DESC';
      RunQuery(str, qry);
      idb := qry.FieldByName('id_bayar').AsInteger; 
//      ShowMessage(grid.RowCount.ToString);
      for iii := 1 to Grid.RowCount - 1 do
        begin
          id := StrToInt(Grid.Cells[1, iii]);
//          ShowMessage(id.ToString);
          str := Format('UPDATE u_list_utang SET status = "%s", id_bayar = %d WHERE ID = %d',
                        ['lunas', idb, id]);
          RunQuery(str, qry);
        end;
      TampilData;
      str := Format('UPDATE u_list_nama SET qty = "%s" WHERE id_nama = %d', [label7.Caption, iduser]);
      RunQuery(str, qry);
    end;
  end;
end;

procedure TfrmUtangDetail.Button3Click(Sender: TObject);
var
  str: string;
begin
  ReportForm := self;
  str := Format('Select Nama_brng, SUM(qty) as qty from u_list_utang Where id_nama = %d'
       +' AND status = "%s" GROUP BY nama_brng',
       [iduser, 'blm_lunas']);
  ListUtang.DataSet := qry;
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(str);
  qry.Open;
  frxReport1.LoadFromFile('report/struk_utang.fr3');
  MyPrintDefault(frxReport1);
  frxReport1.PrepareReport;
  frxReport1.PrintOptions.ShowDialog := false;
  frxReport1.Print;
end;

procedure TfrmUtangDetail.Button4Click(Sender: TObject);
var
  str: string;
begin
  if MessageBox(handle, 'Yakin akan dihapus?', 'Konfirmasi', 48 + 1) = mrOK then
  begin
    str := Format('DELETE FROM u_list_utang WHERE ID = %d', [id]);
    RunQuery(str, qry);
    bersih;
    TampilData;
    str := Format('UPDATE u_list_nama SET qty = "%s" WHERE id_nama = %d', [label7.Caption, iduser]);
    RunQuery(str, qry);
  end;
end;

procedure TfrmUtangDetail.Edit1Change(Sender: TObject);
begin
  TampilSearch;
  if (GridSrc.RowCount > 1) AND (edit1.Text <> '') then
  GridSrc.Show else GridSrc.Hide;
end;

procedure TfrmUtangDetail.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if GridSrc.Visible = true then
  begin
    case Key of
      VK_DOWN: GridSrc.SetFocus;
    end;
  end;
end;

procedure TfrmUtangDetail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmListUtang.TampilData;
end;

procedure TfrmUtangDetail.FormShow(Sender: TObject);
begin
  bersih;
  TampilData;
  Grid.ShowSelection := false;
  GridSrc.ShowSelection := false;
  GridSrc.Left := edit1.Left;
  GridSrc.Top  := edit1.Top + edit1.Height + 3;
end;

procedure TfrmUtangDetail.TampilData;
var
  i  :  Integer;
  str: string;
begin
  Grid.ColWidths[1] := 0;
  str := Format('SELECT * FROM u_list_utang WHERE id_nama = %d AND status = "%s"',
                [iduser, 'blm_lunas']);
  RunQuery(str, qry);
  if qry.RecordCount = 0 then
  begin
    Grid.RowCount := 1;
  end else
  if qry.RecordCount <> 0 then
  begin
    Grid.RowCount := qry.RecordCount+1;
    for i := 0 to qry.RecordCount -1 do
    begin
     Grid.Cells[0, i + 1] := IntToStr(i + 1) + '.';
     Grid.Cells[1, i + 1] := qry.FieldByName('ID').AsString;
     Grid.Cells[2, i + 1] := qry.FieldByName('nama_brng').AsString;
     Grid.Cells[3, i + 1] := qry.FieldByName('qty').AsString;
     Grid.Cells[4, i + 1] := FormatDateTime('dd-MMM-yyyy', qry.FieldByName('tgl').AsDateTime);
     Grid.Cells[5, i + 1] := qry.FieldByName('ket').AsString;
     Grid.Alignments[2, i + 1] := taLeftJustify;
     qry.Next;
    end;
  end;

  str := Format('SELECT SUM(qty) AS qty FROM u_list_utang WHERE id_nama = %d AND status = "%s"',
                [iduser, 'blm_lunas']);
  RunQuery(str, qry);
  if (qry.IsEmpty) or (qry.FieldByName('qty').AsString = '') then
  Label7.Caption := '0' else
  Label7.Caption := qry.FieldByName('qty').AsString;
end;

procedure TfrmUtangDetail.TampilSearch;
var
  i  :  Integer;
  str: string;
begin
  str := Format('SELECT * FROM u_tb_barang WHERE item_name LIKE "%s" ORDER BY item_name ASC',
                ['%' + edit1.Text + '%']);
  RunQuery(str, qry);
  if qry.RecordCount = 0 then
  begin
    GridSrc.RowCount := 1;
  end else
  if qry.RecordCount <> 0 then
  begin
    GridSrc.RowCount := qry.RecordCount+1;
    for i := 0 to qry.RecordCount -1 do
    begin
     GridSrc.Cells[0, i + 1] := IntToStr(i + 1) + '.';
     GridSrc.Cells[1, i + 1] := qry.FieldByName('item_name').AsString;
     GridSrc.Alignments[1, i + 1] := taLeftJustify;
     qry.Next;
    end;
  end;
end;

end.
