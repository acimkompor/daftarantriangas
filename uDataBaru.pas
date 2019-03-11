unit uDataBaru;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvUtil, Vcl.Grids, AdvObj, BaseGrid,
  AdvGrid, Vcl.StdCtrls, Data.DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, Vcl.ComCtrls;

type
  TfrmDataBaru = class(TForm)
    qry: TZQuery;
    btnSimpan: TButton;
    ektp: TEdit;
    enama: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    etempatlahir: TEdit;
    dtpLahir: TDateTimePicker;
    ealamat: TEdit;
    Label6: TLabel;
    ert: TEdit;
    btnHapus: TButton;
    btnExit: TButton;
    Grid: TAdvStringGrid;
    eCari: TEdit;
    Button1: TButton;
    procedure btnSimpanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridEnter(Sender: TObject);
    procedure GridExit(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure eCariChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure GridClick(Sender: TObject);
  private
    { Private declarations }
    procedure AturKolom;
    procedure TampilData;
    procedure Bersih;
  public
    { Public declarations }
  end;

var
  frmDataBaru: TfrmDataBaru;

implementation

{$R *.dfm}

uses UDepan, Config;

{ TfrmDataBaru }

var
  edit: boolean;
  noid, noktp: string;

procedure TfrmDataBaru.AturKolom;
begin
  with Grid do
  begin
    RowCount := 1;
    DefaultRowHeight := 25;
    ColCount := 8;
    Options  := [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect];
    ShowSelection := false;
    Cells[0,0] := 'NO';
    Cells[1,0] := 'id';
    Cells[2,0] := 'NO KTP';
    Cells[3,0] := 'NAMA LENGKAP';
    Cells[4,0] := 'TEMPAT LAHIR';
    Cells[5,0] := 'TGL LAHIR';
    Cells[6,0] := 'ALAMAT';
    Cells[7,0] := 'RT';
    ColWidths[0] := 50;
    ColWidths[1] := 0;
    ColWidths[2] := 130;
    ColWidths[3] := 250;
    ColWidths[4] := 120;
    ColWidths[5] := 100;
    ColWidths[6] := 200;
    ColWidths[7] := 50;
  end;
end;

procedure TfrmDataBaru.Bersih;
begin
  ektp.Text := '';
  enama.Text := '';
  etempatlahir.Text := '';
  dtpLahir.Date := now();
  ealamat.Text := '';
  ert.Text := '';
  eCari.Text := '';
  ektp.Enabled := true;
  ektp.SetFocus;
  btnSimpan.Caption := 'Simpan';
  edit := false;
  noid := '';
  noktp := '';
end;

procedure TfrmDataBaru.btnExitClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmDataBaru.btnHapusClick(Sender: TObject);
var
  str: string;
begin
  if noid <> '' then
  begin
    if MessageDlg('Yakin data akan di hapus?', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
    begin
      str := Format('DELETE FROM antrigas_dataorang WHERE noktp = "%s"', [noktp]);
      try
        RunQuery(str, qry);
        TampilData;
        Bersih;
        ShowMessage('Berhasil dihapus');
      except
        on E : Exception do
          ShowMessage('error : '+E.Message);
      end;
    end;
  end else
  ShowMessage('Data belum dipilih');
end;

procedure TfrmDataBaru.btnSimpanClick(Sender: TObject);
var
  str: string;
  tgl: string;
begin
  if edit = false then
  begin
    str := Format('SELECT * FROM antrigas_dataorang WHERE noktp = "%s"', [ektp.Text]);
    RunQuery(str, qry);
    if Not qry.Eof then
    begin
      ShowMessage('no ktp sudah ada dalam database');
      ektp.SetFocus;
      exit;
    end;
  end;

  if ektp.Text = '' then
  begin
    ShowMessage('Kolom ktp masih kosong');
    ektp.SetFocus;
  end
  else
  if enama.Text = '' then
   begin
    ShowMessage('Kolom nama masih kosong');
    enama.SetFocus;
  end
  else
  if etempatlahir.Text = '' then
   begin
    ShowMessage('Kolom tempat lahir masih kosong');
    etempatlahir.SetFocus;
  end
  else
  if ealamat.Text = '' then
   begin
    ShowMessage('Kolom alamat masih kosong');
    ealamat.SetFocus;
  end
  else
  begin
    if edit = false then
    begin
      tgl := FormatDateTime('yyyy-MM-dd', dtpLahir.date);
      str := Format('INSERT INTO antrigas_dataorang (noktp, nama, tl, tgl_lahir, alamat, rt) '
                  + ' VALUES ("%s", "%s", "%s", "%s", "%s", "%s")',
                  [ektp.Text, enama.Text, etempatlahir.Text, tgl, ealamat.Text, ert.Text]);
      qry.SQL.Text := str;
      try
        qry.ExecSQL;
        ShowMessage('sukses');
      except
        ShowMessage('Gagal');
      end;
    end else
    begin
      tgl := FormatDateTime('yyyy-MM-dd', dtpLahir.date);
      str := Format('UPDATE antrigas_dataorang SET nama = "%s", tl = "%s", tgl_lahir = "%s", '
                  + 'alamat = "%s", rt = "%s" WHERE noktp = "%s"',
                  [enama.Text, etempatlahir.Text, tgl, ealamat.Text, ert.Text, noktp]);
      qry.SQL.Text := str;
      try
        qry.ExecSQL;
        ShowMessage('sukses update');
      except
        ShowMessage('Gagal update');
      end;
    end;

    TampilData;
    Bersih;
  end;
end;

procedure TfrmDataBaru.Button1Click(Sender: TObject);
begin
  Bersih;
end;

procedure TfrmDataBaru.eCariChange(Sender: TObject);
begin
  TampilData;
end;

procedure TfrmDataBaru.FormShow(Sender: TObject);
begin
  Hari;
  Bulan;
  BulanShort;
  Setingan;
  bersih;
  AturKolom;
  TampilData;
end;

procedure TfrmDataBaru.GridClick(Sender: TObject);
begin
  if Grid.RowCount > 1 then
  begin
    noid := Grid.Cells[1, Grid.Row];
    noktp := Grid.Cells[2, Grid.Row]
  end;
end;

procedure TfrmDataBaru.GridDblClick(Sender: TObject);
var
  str: string;
begin
  if Grid.RowCount > 1 then
  begin
    noid := Grid.Cells[1, Grid.Row];
    str  := Format('SELECT * FROM antrigas_dataorang WHERE NoAnggota LIKE "%s"',
                  [noid]);
    RunQuery(str, qry);
    ektp.Text         := qry['noktp'];
    enama.Text        := qry['nama'];
    etempatlahir.Text := qry['tl'];
    dtpLahir.Date     := qry.FieldByName('tgl_lahir').AsDateTime;
    ealamat.Text      := qry['alamat'];
    ert.Text          := qry['rt'];
    ektp.Enabled      := false;
    edit := true;
    enama.SetFocus;
  end;
end;

procedure TfrmDataBaru.GridEnter(Sender: TObject);
begin
  Grid.ShowSelection := true;
end;

procedure TfrmDataBaru.GridExit(Sender: TObject);
begin
  Grid.ShowSelection := false;
end;

procedure TfrmDataBaru.TampilData;
var
  iii: integer;
  str: String;
begin
  str := Format('SELECT * FROM antrigas_dataorang WHERE nama LIKE "%%%s%%" OR noktp LIKE "%%%s%%" ORDER BY nama ASC',
                [ecari.Text, ecari.Text]);
  qry.SQL.Text := str;
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
        Cells[1, iii] := qry.FieldByName('noanggota').AsString;
        Cells[2, iii] := qry.FieldByName('noktp').AsString;
        Cells[3, iii] := qry.FieldByName('nama').AsString;
        Cells[4, iii] := qry.FieldByName('tl').AsString;
        Cells[5, iii] := FormatDateTime('dd MMM yyy', qry.FieldByName('tgl_lahir').AsDateTime);
        Cells[6, iii] := qry.FieldByName('alamat').AsString;
        Cells[7, iii] := qry.FieldByName('rt').AsString;

        Alignments[6, iii] := taRightJustify;
        Alignments[3, iii] := taLeftJustify;
        inc(iii);
        qry.Next;
      end;
     end;
   end;
end;

end.
