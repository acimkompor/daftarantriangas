unit uListUtang;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvUtil, Vcl.Grids, AdvObj, BaseGrid,
  AdvGrid, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.StdCtrls,
  Vcl.Menus, frxClass, frxDBSet, ZAbstractConnection, ZConnection;

type
  TfrmListUtang = class(TForm)
    Grid: TAdvStringGrid;
    qry: TZQuery;
    Edit1: TEdit;
    PopupMenu1: TPopupMenu;
    View1: TMenuItem;
    N1: TMenuItem;
    Editnama1: TMenuItem;
    Hapus1: TMenuItem;
    ambahbaru1: TMenuItem;
    Label1: TLabel;
    Button1: TButton;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    procedure FormShow(Sender: TObject);
    procedure GridDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure Edit1Change(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure Editnama1Click(Sender: TObject);
    procedure ambahbaru1Click(Sender: TObject);
    procedure Hapus1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Label1DblClick(Sender: TObject);
    procedure View1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure TampilData;
  end;

var
  frmListUtang: TfrmListUtang;

implementation

{$R *.dfm}

uses Config, uConfig, UDepan, uEditnama, uUtangDetail;

{ TfrmListUtang }
var
  nm: string;
  idn, qty: integer;

procedure TfrmListUtang.ambahbaru1Click(Sender: TObject);
begin
  frmEditnama.edt := false;
  frmEditnama.ShowModal;
end;

procedure TfrmListUtang.Button1Click(Sender: TObject);
var
  str: string;
begin
  Str := 'Select nama_brng, SUM(qty) as qty from u_list_utang Where status = "blm_lunas"'
      + 'GROUP BY nama_brng Order by nama_brng Asc';
  frxDBDataset1.DataSet := qry;
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(str);
  frxReport1.LoadFromFile('report/laporan_semua_utang.fr3');
  frxReport1.ShowReport;
//  ShowReport('laporan_semua_utang');
end;

procedure TfrmListUtang.Edit1Change(Sender: TObject);
begin
  TampilData;
end;

procedure TfrmListUtang.Editnama1Click(Sender: TObject);
begin
  frmEditnama.idn        := idn;
  frmEditnama.Edit1.Text := nm;
  frmEditnama.edt        := true;
  frmEditnama.ShowModal;
end;

procedure TfrmListUtang.FormShow(Sender: TObject);
begin
  Edit1.Text := '';
  edit1.SetFocus;
  TampilData;
end;

procedure TfrmListUtang.GridDblClick(Sender: TObject);
var
  posisi: TPoint;
begin
  GetCursorPos(posisi);
  if Grid.RowCount > 1 then
  begin
    idn := StrToInt(Grid.Cells[1, Grid.Row]);
    nm  := Grid.Cells[2, Grid.Row];
    qty := StrToInt(Grid.Cells[3, Grid.Row]);
    PopupMenu1.Popup(posisi.X, posisi.Y);
  end;
end;

procedure TfrmListUtang.GridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  dt: integer;
begin
	dt := strtointDef(Grid.Cells[3, aRow], 0);
	if (aCol = 3) AND (aRow > 0) and (dt > 0) then
		begin
			Grid.canvas.Brush.Color := $00AC91FF;
			Grid.canvas.Font.Color  := clBlack;
			Grid.Canvas.TextRect(Rect, Rect.Left + 30, Rect.Top + 3, Grid.Cells[3, ARow]);
		end else
				if (aCol = 3) AND (aRow > 0) and (dt < 1) then
		begin
			Grid.canvas.Brush.Color := $0000FF80;
			Grid.canvas.Font.Color  := clBlack;
			Grid.Canvas.TextRect(Rect, Rect.Left + 30, Rect.Top + 3, Grid.Cells[3, ARow]);
		end;
end;

procedure TfrmListUtang.Hapus1Click(Sender: TObject);
var
  str: string;
begin
  if qty = 0 then
  begin
    if MessageBox(handle, PChar('Yakin ' + nm  + #13#10' Akan dihapus?'), 'Konfirmasi', 48 + 1) = mrOK then
    begin
      str := Format('DELETE FROM u_list_nama WHERE id_nama = %d', [idn]);
      RunQuery(str, qry);
      TampilData;
      edit1.SetFocus;
    end;
  end;
end;

procedure TfrmListUtang.Label1DblClick(Sender: TObject);
var
  str: string;
begin
  Str := 'Select nama_brng, SUM(qty) as qty from u_list_utang Where status = "blm_lunas"'
      + 'GROUP BY nama_brng Order by nama_brng Asc';
  frxDBDataset1.DataSet := qry;
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(str);
  frxReport1.LoadFromFile('report/laporan_semua_utang.fr3');
  frxReport1.DesignReport;
end;

procedure TfrmListUtang.TampilData;
var
  i  :  Integer;
  str: string;
begin
  Grid.ColWidths[1] := 0;
  str := Format('SELECT * FROM u_list_nama WHERE nama LIKE "%s" ORDER BY nama ASC',
                ['%' + Edit1.Text + '%']);
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
     Grid.Cells[1, i + 1] := qry.FieldByName('id_nama').AsString;
     Grid.Cells[2, i + 1] := qry.FieldByName('nama').AsString;
     Grid.Cells[3, i + 1] := qry.FieldByName('qty').AsString;
     Grid.Alignments[2, i + 1] := taLeftJustify;
     qry.Next;
    end;
  end;

  str := 'SELECT SUM(qty) AS tot FROM u_list_nama';
  RunQuery(str, qry);
  Label1.Caption := qry.FieldByName('tot').AsString;
end;

procedure TfrmListUtang.View1Click(Sender: TObject);
begin
  frmUtangDetail.iduser         := idn;
  frmUtangDetail.label1.Caption := nm;
  frmUtangDetail.ShowModal;
end;

end.
