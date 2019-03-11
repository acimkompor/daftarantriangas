unit uDatabarangManual;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvUtil, Vcl.Grids, AdvObj, BaseGrid,
  AdvGrid, Vcl.StdCtrls, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TfrmDatabarangManual = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    eid: TEdit;
    ebarcode: TEdit;
    Label3: TLabel;
    enamabarang: TEdit;
    Label4: TLabel;
    eharga: TEdit;
    btnSimpan: TButton;
    btnHapus: TButton;
    ecari: TEdit;
    Grid: TAdvStringGrid;
    qry: TZQuery;
    procedure GridEnter(Sender: TObject);
    procedure GridExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ecariChange(Sender: TObject);
    procedure ehargaChange(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure GridClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure AturKolom;
    procedure Tampildata;
    procedure Bersih;

  public
    { Public declarations }
  end;

var
  frmDatabarangManual: TfrmDatabarangManual;

implementation

{$R *.dfm}

uses Config, UDepan;

{ TfrmDatabarangManual }

var
  edited: boolean;
  idg: string;
  barcode: string;

procedure TfrmDatabarangManual.AturKolom;
begin
  with Grid do
  begin
    RowCount := 1;
    DefaultRowHeight := 25;
    ColCount := 5;
    Options  := [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect];
    ShowSelection := false;
    Cells[0,0] := 'NO';
    Cells[1,0] := 'ID BARANG';
    Cells[2,0] := 'BARCODE';
    Cells[3,0] := 'NAMA BARANG';
    Cells[4,0] := 'HARGA';
    ColWidths[0] := 40;
    ColWidths[1] := 100;
    ColWidths[2] := 150;
    ColWidths[3] := 300;
    ColWidths[4] := 90;
  end;
end;

procedure TfrmDatabarangManual.Bersih;
begin
  eid.Text := '';
  ebarcode.Text := '';
  enamabarang.Text := '';
  eharga.Text := '';
  ecari.Text := '';
  eid.Enabled := true;
  eid.SetFocus;
  edited :=  false;
  idg := '';
  barcode := '';
end;

procedure TfrmDatabarangManual.btnSimpanClick(Sender: TObject);
var
  str: string;
begin
  if eid.Text = '' then
  begin
    ShowMessage('kolom id kosong po....');
    exit;
  end;
  if ebarcode.Text = '' then
  begin
    ShowMessage('kolom barcode kosong po....');
    exit;
  end;
  if enamabarang.Text = '' then
  begin
    ShowMessage('kolom nama barang kosong po....');
    exit;
  end;
  if eharga.Text = '' then
  begin
    ShowMessage('kolom harga barang kosong po....');
    exit;
  end;

  if edited = false then
  begin
    str := Format('SELECT * FROM gas_tabel WHERE idgas = "%s" OR barcode = "%s"', [eid.Text, ebarcode.Text]);
    qry.Close;
    qry.SQL.Clear;
    qry.SQL.Add(str);
    qry.Open;

    if Not qry.Eof then
    begin
      ShowMessage('ada id atau barcode yang kembar');
      exit;
    end else
    begin
      str := Format('INSERT INTO gas_tabel (idgas, barcode, namagas, harga) '
                  + 'VALUES ("%s", "%s", "%s", "%s")',
                  [eid.Text, ebarcode.Text, enamabarang.Text, hapusribuan(eharga.Text)]);
      qry.Close;
      qry.SQL.Clear;
      qry.SQL.Add(str);
      try
        qry.ExecSQL;
        ShowMessage('Berhasil di tambahkan');
        Tampildata;
        Bersih;
      except
        on E : Exception do
        ShowMessage('error : ' + E.Message);
      end;
    end;
  end else
  if edited = true then
  begin
    if barcode <> ebarcode.Text then
    begin
      str := Format('SELECT * FROM gas_tabel WHERE barcode = "%s"', [ebarcode.Text]);
      qry.Close;
      qry.SQL.Clear;
      qry.SQL.Add(str);
      qry.Open;

      if Not qry.Eof then
      begin
        ShowMessage('ada barcode sama di temuakan, cek kembali');
        exit;
      end else
      begin
        str := Format('UPDATE gas_tabel SET barcode = "%s", namagas = "%s", harga = "%s" WHERE idgas = "%s"',
                  [ebarcode.Text, enamabarang.Text, HapusRibuan(eharga.Text), eid.Text]);
        qry.Close;
        qry.SQL.Clear;
        qry.SQL.Add(str);
        try
          qry.ExecSQL;
          ShowMessage('Berhasil di edit');
          Tampildata;
          Bersih;
        except
          on E : Exception do
          ShowMessage('error : ' + E.Message);
        end;
      end;
    end else
    begin
      str := Format('UPDATE gas_tabel SET barcode = "%s", namagas = "%s", harga = "%s" WHERE idgas = "%s"',
                  [ebarcode.Text, enamabarang.Text, HapusRibuan(eharga.Text), eid.Text]);
      qry.Close;
      qry.SQL.Clear;
      qry.SQL.Add(str);
      try
        qry.ExecSQL;
        ShowMessage('Berhasil di edit');
        Tampildata;
        Bersih;
      except
        on E : Exception do
        ShowMessage('error : ' + E.Message);
      end;
    end;
  end;
end;

procedure TfrmDatabarangManual.ecariChange(Sender: TObject);
begin
  Tampildata;
end;

procedure TfrmDatabarangManual.ehargaChange(Sender: TObject);
begin
  Ribuan(eharga);
end;

procedure TfrmDatabarangManual.FormShow(Sender: TObject);
begin
  AturKolom;
  Bersih;
  Tampildata;
end;

procedure TfrmDatabarangManual.GridClick(Sender: TObject);
begin
  idg := Grid.Cells[1, Grid.Row];
end;

procedure TfrmDatabarangManual.GridDblClick(Sender: TObject);
begin
  if Grid.RowCount > 1 then
  begin
    idg     := Grid.Cells[1, Grid.Row];
    barcode := Grid.Cells[2, Grid.Row];

    edited           := true;
    eid.Text         := idg;
    ebarcode.Text    := barcode;
    enamabarang.Text := Grid.Cells[3, Grid.Row];
    eharga.Text      := Grid.Cells[4, Grid.Row];
    eid.Enabled      := false;
    ebarcode.SetFocus;
  end;
end;

procedure TfrmDatabarangManual.GridEnter(Sender: TObject);
begin
  Grid.ShowSelection := true;
end;

procedure TfrmDatabarangManual.GridExit(Sender: TObject);
begin
  Grid.ShowSelection := false;
end;

procedure TfrmDatabarangManual.Tampildata;
var
  iii: integer;
  tgl: string;
begin
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(Format('SELECT * FROM gas_tabel WHERE namagas LIKE "%s" Order By namagas Asc', [ecari.Text+'%']));
  qry.Open;

  iii := 1;
  if qry.RecordCount < 1 then
   Grid.RowCount := 1
   else
   begin
     Grid.RowCount := qry.RecordCount + 1;
     Grid.FixedRows := 1;
     while Not qry.Eof do
     begin
      with Grid do
      begin
        Cells[0, iii] := Format('%d.', [iii]);
        Cells[1, iii] := qry.FieldByName('idgas').AsString;
        Cells[2, iii] := qry.FieldByName('barcode').AsString;
        Cells[3, iii] := qry.FieldByName('namagas').AsString;
        Cells[4, iii] := RibuanStr(qry.FieldByName('harga').Asstring);

        Alignments[4, iii] := taRightJustify;
        Alignments[3, iii] := taLeftJustify;
        inc(iii);
        qry.Next;
      end;
     end;
   end;
end;

end.
