unit uTransaksi_Manual;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvUtil, Vcl.Grids, AdvObj, BaseGrid,
  AdvGrid, Vcl.StdCtrls, Vcl.Menus, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, frxClass, Vcl.ExtCtrls;

type
  TfrmTransaksi_Manual = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    lbtotal: TLabel;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Grid: TAdvStringGrid;
    eBarcode: TEdit;
    Label2: TLabel;
    btnProses: TButton;
    btnEdit_transaksi: TButton;
    btnLaporan: TButton;
    PopupMenu1: TPopupMenu;
    EditQty1: TMenuItem;
    N1: TMenuItem;
    HapusTransaksi1: TMenuItem;
    HapusSemuaTransaksi1: TMenuItem;
    qry: TZQuery;
    GridSrc: TAdvStringGrid;
    Label3: TLabel;
    lbNoNota: TLabel;
    Button1: TButton;
    frxReport1: TfrxReport;
    Label4: TLabel;
    lbTanggal: TLabel;
    Timer1: TTimer;
    Label5: TLabel;
    lbKasir: TLabel;
    procedure GridEnter(Sender: TObject);
    procedure GridExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eBarcodeChange(Sender: TObject);
    procedure GridSrcEnter(Sender: TObject);
    procedure GridSrcExit(Sender: TObject);
    procedure eBarcodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridSrcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridSrcDblClick(Sender: TObject);
    procedure GridClick(Sender: TObject);
    procedure EditQty1Click(Sender: TObject);
    procedure HapusTransaksi1Click(Sender: TObject);
    procedure HapusSemuaTransaksi1Click(Sender: TObject);
    procedure btnProsesClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnEdit_transaksiClick(Sender: TObject);
    procedure btnLaporanClick(Sender: TObject);
  private
    { Private declarations }
    procedure AturKolom;
    procedure Bersih;
    procedure TampilSearch;
    procedure InputTransaksiTemp;
    procedure PrintStruk;
  public
    { Public declarations }
    qty   : integer;
    procedure AmbilData;
  end;

var
  frmTransaksi_Manual: TfrmTransaksi_Manual;

implementation

{$R *.dfm}

uses Config, UDepan, uEditQty, uUDF_FR, uConfig, uListTransaksi,
  uReportPenjualan;

{ TfrmTransaksi_Manual }

var
  iditem: string;
  harga : integer;
  nmbrg : string;

procedure TfrmTransaksi_Manual.AmbilData;
var
    i :  Integer;
    str : String;
begin
    str :=  'Select gas_tabel.namagas, gas_Temp.* from gas_tabel, gas_Temp Where '
          + 'gas_temp.idgas = gas_tabel.idgas AND status = "0" Order By gas_Temp.ID Desc';
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
			 Grid.Cells[1, i + 1] := qry.FieldByName('idgas').AsString;
			 Grid.Cells[2, i + 1] := qry.FieldByName('namagas').AsString;
			 Grid.Cells[3, i + 1] := FormatFloat('#,#0', qry.FieldByName('hrgsatuan').AsInteger);
			 Grid.Cells[4, i + 1] := qry.FieldByName('qty').AsString;
			 Grid.Cells[5, i + 1] := FormatFloat('#,#0', qry.FieldByName('jumlah').AsInteger);

       Grid.Alignments[2, i + 1] := taLeftJustify;
       Grid.Alignments[3, i + 1] := taRightJustify;
       Grid.Alignments[5, i + 1] := taRightJustify;
			 qry.Next;
			end;
		end;

    str  := 'Select SUM(jumlah) as jumlah from gas_temp';
    RunQuery(str, qry);
    lbtotal.Caption := FormatFloat('#,#0',qry.FieldByName('jumlah').AsInteger);
    eBarcode.SetFocus;
end;

procedure TfrmTransaksi_Manual.AturKolom;
begin
  with Grid do
  begin
    RowCount := 1;
    DefaultRowHeight := 25;
    ColCount := 6;
    Options  := [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect];
    ShowSelection := false;
    Cells[0,0] := 'NO';
    Cells[1,0] := 'id';
    Cells[2,0] := 'NAMA BARANG';
    Cells[3,0] := 'HARGA SATUAN';
    Cells[4,0] := 'QTY';
    Cells[5,0] := 'TOTAL';
    ColWidths[0] := 40;
    ColWidths[1] := 0;
    ColWidths[2] := 250;
    ColWidths[3] := 120;
    ColWidths[4] := 60;
    ColWidths[5] := 120;
  end;
end;

procedure TfrmTransaksi_Manual.Bersih;
begin
  eBarcode.Text := '';
  eBarcode.SetFocus;
end;

procedure TfrmTransaksi_Manual.btnEdit_transaksiClick(Sender: TObject);
begin
  frmListTransaksi.ShowModal;
end;

procedure TfrmTransaksi_Manual.btnLaporanClick(Sender: TObject);
begin
  frmReportPenjualan.ShowModal;
end;

procedure TfrmTransaksi_Manual.btnProsesClick(Sender: TObject);
var
  str: string;
  iii: integer;
  idg, nm, tgl: string;
  t_qty, t_hrg, t_jumlah, t_total: integer;
begin
  tgl := FormatDateTime('yyyy-MM-dd', now);
  t_total := StrToInt(HapusRibuan(lbtotal.Caption));
  if Grid.RowCount > 1 then
    begin
    if MessageBox(Handle, PChar('Lanju Proses....?'), 'Konfirmasi', 64+4 )= mrYes then
    begin
      for iii := 1 to Grid.RowCount - 1 do
      begin
        idg      := Grid.Cells[1, iii];
        nm       := Grid.Cells[2, iii];
        t_hrg    := strtoint(HapusRibuan(Grid.Cells[3, iii]));
        t_qty    := strtoint(Grid.Cells[4, iii]);
        t_jumlah := strtoint(HapusRibuan(Grid.Cells[5, iii]));
        str := Format('INSERT INTO gas_transaksiDetail (nonota, idgas, namagas, hrgsatuan, qty, '
                    + 'jumlah, status, tgl, kasir) VALUES ("%s", "%s", "%s", %d, %d, %d, "%s", "%s", "%s")',
                    [lbNoNota.Caption, idg, nm, t_hrg, t_qty, t_jumlah, '1', tgl, frmDepan.kasir]);
        RunQuery(str, qry);
      end;

      str := Format('INSERT INTO gas_Transaksi (nonota, jumlah, tgl, kasir) VALUES '
                  + '("%s", %d, "%s", "%s")', [lbNoNota.Caption, t_total, tgl, frmDepan.kasir]);
//      ShowMessage(str);
      RunQuery(str, qry);

      str := Format('DELETE FROM gas_temp WHERE status = "%s"', ['0']);
      RunQuery(str, qry);
      if MessageBox(Handle, 'Lanjut Print?','Komfirmasi', 64 + 1) = mrOK then
      PrintStruk;
      AmbilData;
      lbNoNota.Caption := GetNoTransaksi('gas_Transaksi', 'nonota', qry);
    end;
  end;
end;

procedure TfrmTransaksi_Manual.Button1Click(Sender: TObject);
begin
  ReportGrid := Grid;
  ReportForm := self;
  DesignReport('Struk_Transaksi');
end;

procedure TfrmTransaksi_Manual.eBarcodeChange(Sender: TObject);
begin
  TampilSearch;
  if (GridSrc.RowCount > 1) AND (eBarcode.Text <> '') then
  GridSrc.Show else GridSrc.Hide;
end;

procedure TfrmTransaksi_Manual.eBarcodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if GridSrc.Visible = true then
  begin
    case Key of
      VK_DOWN: GridSrc.SetFocus;
    end;
  end;
end;

procedure TfrmTransaksi_Manual.EditQty1Click(Sender: TObject);
begin
  if iditem <> '' then
  begin
    frmEditQty.id             := iditem;
    frmEditQty.label1.Caption := nmbrg;
    frmEditQty.harga          := harga;
    frmEditQty.qty            := qty;
    frmEditQty.edit1.Text     := inttostr(qty);
    frmEditQty.ShowModal;
  end;
end;

procedure TfrmTransaksi_Manual.FormShow(Sender: TObject);
begin
  AturKolom;
  AmbilData;
  lbNoNota.Caption := GetNoTransaksi('gas_Transaksi', 'nonota', qry);
  Bersih;
  GridSrc.Left := eBarcode.Left;
  GridSrc.Top  := eBarcode.Top + eBarcode.Height + 3;
  lbKasir.caption := frmDepan.kasir;
end;

procedure TfrmTransaksi_Manual.GridClick(Sender: TObject);
begin
  if Grid.RowCount > 1 then
  begin
    iditem := Grid.Cells[1, Grid.Row];
    qty    := strtoint(Grid.Cells[4, Grid.Row]);
    harga  := strtoint(HapusRibuan(Grid.Cells[3, Grid.Row]));
    nmbrg  := Grid.Cells[2, Grid.Row];
  end;
end;

procedure TfrmTransaksi_Manual.GridEnter(Sender: TObject);
begin
  Grid.ShowSelection := true;
end;

procedure TfrmTransaksi_Manual.GridExit(Sender: TObject);
begin
  Grid.ShowSelection := false;
end;

procedure TfrmTransaksi_Manual.GridSrcDblClick(Sender: TObject);
begin
  iditem := GridSrc.Cells[1, GridSrc.Row];
  harga  := StrToInt(HapusRibuan(GridSrc.Cells[3, GridSrc.Row]));
  nmbrg  := GridSrc.Cells[2, GridSrc.Row];
  qty    := 1;
  InputTransaksiTemp;
  eBarcode.Text := '';
  eBarcode.SetFocus;
end;

procedure TfrmTransaksi_Manual.GridSrcEnter(Sender: TObject);
begin
  GridSrc.ShowSelection := true;
end;

procedure TfrmTransaksi_Manual.GridSrcExit(Sender: TObject);
begin
  GridSrc.ShowSelection := false;
end;

procedure TfrmTransaksi_Manual.GridSrcKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if GridSrc.Row = 1 then
  begin
    case Key of
      VK_UP:
        begin
          eBarcode.SetFocus;
          eBarcode.SelStart := Length(eBarcode.Text);
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

procedure TfrmTransaksi_Manual.HapusSemuaTransaksi1Click(Sender: TObject);
var
  str: string;
begin
  if MessageBox(handle, Pchar('Yakin semua transaksi akan dihapus?'), 'Konfirmasi', 48 + 4) = mrYes then
  begin
    str := Format('DELETE FROM gas_temp WHERE status = "%s"', ['0']);
    RunQuery(str, qry);
    AmbilData;
  end;

end;

procedure TfrmTransaksi_Manual.HapusTransaksi1Click(Sender: TObject);
var
  str: string;
begin
  if iditem <> '' then
  begin
    if MessageBox(handle, Pchar('Yakin ' + nmbrg + #13#10' akan dihapus?'), 'Konfirmasi', 48 + 4) = mrYes then
    begin
      str := Format('DELETE FROM gas_temp WHERE idgas = "%s"', [iditem]);
      RunQuery(str, qry);
      MessageBox(Handle, 'Sukses dihapus', 'Info', 64);
      AmbilData;
    end;
  end;
end;

procedure TfrmTransaksi_Manual.InputTransaksiTemp;
var
  total: integer;
  sql  : string;
begin
  sql := Format('SELECT * FROM gas_temp WHERE idgas = "%s" AND nonota = "%s"',
              [iditem, lbNoNota.Caption]);
  RunQuery(sql, qry);
  if Not qry.eof then
  begin
    qty := qry.FieldByName('qty').AsInteger + 1;
    harga := qry.FieldByName('hrgsatuan').AsInteger;

    total := qty * harga;
    sql := Format('UPDATE gas_temp SET qty = %d, jumlah = %d WHERE idgas = "%s"',
                [qty, total, iditem]);
    RunQuery(sql, qry);
  end else
  begin
    total := harga * qty;
    sql := Format('INSERT INTO gas_temp (nonota, idgas, hrgsatuan, qty, jumlah, status) '
                + 'VALUES ("%s", "%s", %d, %d, %d, "%s")',
                [lbNoNota.Caption, iditem, harga, qty, total, '0']);
    RunQuery(sql, qry);
  end;
  AmbilData;
end;

procedure TfrmTransaksi_Manual.PrintStruk;
begin
  ReportGrid := Grid;
  ReportForm := self;
  if Grid.RowCount > 1  then
  begin
    LiveReport('Struk_Transaksi');
  end else
  begin
    ShowMessage('Data tidak ditemukan');
  end;
end;

procedure TfrmTransaksi_Manual.TampilSearch;
var
  str: string;
  i  : integer;
begin
  with GridSrc do
  begin
    RowCount := 1;
    DefaultRowHeight := 25;
    ColCount := 5;
    Options  := [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect];
    ShowSelection := false;
    ColWidths[0] := 40;
    ColWidths[1] := 80;
    ColWidths[2] := 300;
    ColWidths[3] := 80;
  end;

  str := Format('Select * from gas_tabel Where namagas LIKE "%s" Order By namagas Asc',
              ['%' + eBarcode.Text + '%']);
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
     GridSrc.Cells[1, i + 1] := qry.FieldByName('idgas').AsString;
     GridSrc.Cells[2, i + 1] := qry.FieldByName('namagas').AsString;
     GridSrc.Cells[3, i + 1] := FormatFloat('#,#0', qry.FieldByName('harga').AsInteger);

     GridSrc.Alignments[2, i + 1] := taLeftJustify;
     GridSrc.Alignments[3, i + 1] := taRightJustify;
     qry.Next;
    end;
  end;
end;

procedure TfrmTransaksi_Manual.Timer1Timer(Sender: TObject);
begin
  lbTanggal.Caption := FormatDateTime('dd MMMM yyyy HH:mm:ss', Now());
end;

end.
