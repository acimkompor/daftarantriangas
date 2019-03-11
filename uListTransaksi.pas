unit uListTransaksi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvUtil, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Menus;

type
  TfrmListTransaksi = class(TForm)
    GroupBox1: TGroupBox;
    Grid: TAdvStringGrid;
    Splitter1: TSplitter;
    Grid2: TAdvStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    cb1: TComboBox;
    dtp1: TDateTimePicker;
    btnTampil: TButton;
    btnCetak: TButton;
    qry: TZQuery;
    lbtotal: TLabel;
    PopupMenu1: TPopupMenu;
    EditQty1: TMenuItem;
    N1: TMenuItem;
    Hapus1: TMenuItem;
    Button1: TButton;
    PopupMenu2: TPopupMenu;
    Hapus2: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure GridClick(Sender: TObject);
    procedure GridEnter(Sender: TObject);
    procedure GridExit(Sender: TObject);
    procedure btnTampilClick(Sender: TObject);
    procedure cb1Change(Sender: TObject);
    procedure dtp1Change(Sender: TObject);
    procedure Grid2Enter(Sender: TObject);
    procedure Grid2Exit(Sender: TObject);
    procedure Grid2DblClick(Sender: TObject);
    procedure EditQty1Click(Sender: TObject);
    procedure btnCetakClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Hapus1Click(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure Hapus2Click(Sender: TObject);
  private
    { Private declarations }
    procedure AturKolom1;
    procedure AturKolom2;
    procedure TampilData2;
    procedure TampilKombo;
  public
    { Public declarations }
    procedure TampilData1;
  end;

var
  frmListTransaksi: TfrmListTransaksi;

implementation

{$R *.dfm}

uses Config, UDepan, uUDF_FR, uEditQtyListTransaksi, uConfig;

{ TfrmListTransaksi }

var
  nonota: string;
  notrx : string;
  total : string;
  iditem, nmbrg, qty: string;
  hrg: integer;

procedure TfrmListTransaksi.AturKolom1;
begin
  with Grid do
  begin
    RowCount := 1;
    DefaultRowHeight := 25;
    ColCount := 5;
    Options  := [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect];
    ShowSelection := false;
    ColWidths[0] := 40;
    ColWidths[1] := 120;
    ColWidths[2] := 90;
    ColWidths[3] := 90;
    ColWidths[4] := 100;
  end;
end;

procedure TfrmListTransaksi.AturKolom2;
begin
  with Grid2 do
  begin
    RowCount := 1;
    DefaultRowHeight := 25;
    ColCount := 7;
    Options  := [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect];
    ShowSelection := false;
    ColWidths[0] := 40;
    ColWidths[1] := 100;
    ColWidths[2] := 90;
    ColWidths[3] := 250;
    ColWidths[4] := 90;
    ColWidths[5] := 50;
    ColWidths[6] := 90;
  end;
end;

procedure TfrmListTransaksi.btnCetakClick(Sender: TObject);
begin
  ReportGrid := Grid2;
  ReportForm := self;
  if Grid2.RowCount > 1  then
  begin
    LiveReport('Struk_Transaksi_ulang');
  end else
  begin
    ShowMessage('Data tidak ditemukan');
  end;
end;

procedure TfrmListTransaksi.btnTampilClick(Sender: TObject);
begin
  TampilData1;
end;

procedure TfrmListTransaksi.Button1Click(Sender: TObject);
begin
  ReportGrid := Grid2;
  ReportForm := self;
  DesignReport('Struk_Transaksi_ulang');
end;

procedure TfrmListTransaksi.cb1Change(Sender: TObject);
begin
  Grid.RowCount := 1;
  Grid2.RowCount := 1;
end;

procedure TfrmListTransaksi.dtp1Change(Sender: TObject);
begin
  Grid.RowCount := 1;
  Grid2.RowCount := 1;
  TampilKombo;
end;

procedure TfrmListTransaksi.EditQty1Click(Sender: TObject);
begin
  frmEditQtyListTransaksi.Label1.Caption := nmbrg;
  frmEditQtyListTransaksi.Edit1.Text     := qty;
  frmEditQtyListTransaksi.harga          := hrg;
  frmEditQtyListTransaksi.iditem         := iditem;
  frmEditQtyListTransaksi.nonota         := nonota;
  frmEditQtyListTransaksi.ShowModal;
end;

procedure TfrmListTransaksi.FormShow(Sender: TObject);
begin
  AturKolom1;
  AturKolom2;
  cb1.ItemIndex := cb1.Items.IndexOf(frmDepan.kasir);
  dtp1.Date := Now();
  TampilKombo;
end;

procedure TfrmListTransaksi.Grid2DblClick(Sender: TObject);
var
MausPos: TPoint;
begin
  GetCursorPos(MausPos);
  if Grid2.RowCount > 1 then
  begin
    iditem := Grid2.Cells[2, Grid2.Row];
    nmbrg  := Grid2.cells[3, Grid2.Row];
    hrg    := strtoint(HapusRibuan(Grid2.Cells[4, Grid2.Row]));
    qty    := Grid2.Cells[5, Grid2.Row];
    PopupMenu1.Popup(MausPos.X, MausPos.y);
  end;
end;

procedure TfrmListTransaksi.Grid2Enter(Sender: TObject);
begin
  Grid2.ShowSelection := true;
end;

procedure TfrmListTransaksi.Grid2Exit(Sender: TObject);
begin
  Grid2.ShowSelection := false;
end;

procedure TfrmListTransaksi.GridClick(Sender: TObject);
begin
  if Grid.RowCount > 1 then
  begin
    nonota := Grid.Cells[1, Grid.Row];
    total  := Grid.Cells[2, Grid.Row];

    TampilData2;
  end;
end;

procedure TfrmListTransaksi.GridDblClick(Sender: TObject);
var
  MausPos: TPoint;
begin
  GetCursorPos(MausPos);
  if Grid.RowCount > 1 then
  begin
    notrx := Grid.Cells[1, Grid.Row];
    PopupMenu2.Popup(MausPos.X, MausPos.y);
  end;
end;

procedure TfrmListTransaksi.GridEnter(Sender: TObject);
begin
  Grid.ShowSelection := true;
end;

procedure TfrmListTransaksi.GridExit(Sender: TObject);
begin
  Grid.ShowSelection := false;
end;

procedure TfrmListTransaksi.Hapus1Click(Sender: TObject);
var
  str: string;
  grt: integer;
begin
  if MessageBox(Handle, PChar('Yakin ' + nmbrg + #13#10' Akan dihapus?'), 'Konfirmasi', 48 + 1) = mrOK then
  begin
    str := Format('DELETE FROM gas_transaksiDetail WHERE idgas = "%s"', [iditem]);
    RunQuery(str, qry);

    str := Format('SELECT SUM(jumlah) AS total FROM gas_TransaksiDetail WHERE nonota = "%s"',
                  [nonota]);
    RunQuery(str, qry);
    grt := qry.FieldByName('total').AsInteger;

    str := Format('UPDATE gas_Transaksi SET jumlah = %d WHERE nonota = "%s"',
                  [grt, nonota]);
    RunQuery(str, qry);
    tampilData1;
    Grid2.RowCount := 1;
  end;
end;

procedure TfrmListTransaksi.Hapus2Click(Sender: TObject);
var
  str: string;
begin
  if notrx <> '' then
  begin
    if MessageBox(Handle, PChar('Yakin no Transaksi ' + notrx + #13#10' akan dihapus?'), 'Konfirmasi', 48 + 1) =mrOK then
    begin
      str := Format('DELETE FROM gas_transaksi WHERE nonota = "%s"', [notrx]);
      RunQuery(str, qry);
      str := Format('DELETE FROM gas_transaksiDetail WHERE nonota = "%s"', [notrx]);
      RunQuery(str, qry);
      TampilData1;
      Grid2.RowCount := 1;
      notrx := '';
    end;
  end;
end;

procedure TfrmListTransaksi.TampilData1;
var
  i  :  Integer;
  tgl: string;
begin
  tgl := FormatDateTime('yyyy-mm-dd', dtp1.Date);
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(Format('SELECT * FROM gas_Transaksi WHERE tgl = :tgl AND kasir = "%s" ORDER BY nonota DESC',
                [cb1.Text]));
  qry.ParamByName('tgl').AsString := tgl;
  qry.Open;
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
     Grid.Cells[1, i + 1] := qry.FieldByName('nonota').AsString;
     Grid.Cells[2, i + 1] := FormatFloat('#,#0', qry.FieldByName('jumlah').AsInteger);
     Grid.Cells[3, i + 1] := FormatDateTime('dd-MMM-yyyy', qry.FieldByName('tgl').AsDateTime);
     Grid.Cells[4, i + 1] := qry.FieldByName('kasir').AsString;
     Grid.Alignments[2, i + 1] := taRightJustify;
     qry.Next;
    end;
  end;
end;

procedure TfrmListTransaksi.TampilData2;
var
  i :  Integer;
  str : String;
begin
  str := Format('SELECT * FROM gas_transaksiDetail WHERE nonota = "%s" ORDER BY ID DESC',
                [nonota]);
  RunQuery(str, qry);
  if qry.RecordCount = 0 then
  begin
    Grid2.RowCount := 1;
  end else
  if qry.RecordCount <> 0 then
  begin
    Grid2.RowCount := qry.RecordCount+1;
    for i := 0 to qry.RecordCount -1 do
    begin
     Grid2.Cells[0, i + 1] := IntToStr(i + 1) + '.';
     Grid2.Cells[1, i + 1] := qry.FieldByName('nonota').AsString;
     Grid2.Cells[2, i + 1] := qry.FieldByName('idgas').AsString;
     Grid2.Cells[3, i + 1] := qry.FieldByName('namagas').AsString;
     Grid2.Cells[4, i + 1] := FormatFloat('#,#0', qry.FieldByName('hrgsatuan').AsInteger);
     Grid2.Cells[5, i + 1] := qry.FieldByName('qty').AsString;
     Grid2.Cells[6, i + 1] := FormatFloat('#,#0', qry.FieldByName('jumlah').AsInteger);

     Grid2.Alignments[3, i + 1] := taLeftJustify;
     Grid2.Alignments[4, i + 1] := taRightJustify;
     Grid2.Alignments[6, i + 1] := taRightJustify;
     qry.Next;
    end;
  end;

  lbtotal.Caption := total;
end;

procedure TfrmListTransaksi.TampilKombo;
var
  str: String;
  tgl: string;
begin
  tgl := FormatDateTime('yyyy-mm-dd', dtp1.Date);
  str := 'SELECT DISTINCT(kasir) FROM gas_Transaksi WHERE tgl = :tgl ORDER BY kasir ASC';
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(str);
  qry.ParamByName('tgl').AsString := tgl;
  qry.Open;

  cb1.Clear;
  While Not qry.Eof do
  begin
    cb1.Items.Add(qry.FieldByName('kasir').AsString);
    qry.Next;
  end;
end;

end.
