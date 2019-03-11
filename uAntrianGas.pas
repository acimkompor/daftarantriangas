unit uAntrianGas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, AdvUtil, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Data.DB, DateUtils,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, INIFiles, frxClass, frxDBSet,
  frxBarcode;

type
  TfrmAntrian = class(TForm)
    Panel1: TPanel;
    Grid: TAdvStringGrid;
    GroupBox1: TGroupBox;
    ektp: TEdit;
    Label1: TLabel;
    dtpAntri: TDateTimePicker;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    ecari: TEdit;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    eNoantrian: TEdit;
    Label5: TLabel;
    btnCetak_ulang: TButton;
    btnHapus: TButton;
    btnPrintReport: TButton;
    qry: TZQuery;
    dtpTgl: TDateTimePicker;
    btnAdd: TButton;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lbAntrian: TLabel;
    Label10: TLabel;
    lbambil: TLabel;
    Label12: TLabel;
    lbBelum: TLabel;
    Label14: TLabel;
    lbcetak: TLabel;
    procedure GridEnter(Sender: TObject);
    procedure GridExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtpTglChange(Sender: TObject);
    procedure ecariChange(Sender: TObject);
    procedure ektpKeyPress(Sender: TObject; var Key: Char);
    procedure btnAddClick(Sender: TObject);
    procedure GridClick(Sender: TObject);
    procedure btnCetak_ulangClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure btnPrintReportClick(Sender: TObject);
    procedure Label6DblClick(Sender: TObject);
    procedure Label7DblClick(Sender: TObject);
    procedure eNoantrianKeyPress(Sender: TObject; var Key: Char);
    procedure GridDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure dtpAntriChange(Sender: TObject);
  private
    { Private declarations }
    procedure AturKolom;
    procedure TampilData;
    procedure Bersih;
    procedure CekDurasi;
    function CekAntrian(AKtp:string):boolean;
    procedure print;
    procedure AmbilAntrian(ANo: string);
    procedure AmbilTotalAll;
    procedure CekAwalDB;
  public
    { Public declarations }
    procedure InsertAntrian(AnoKtp: String);
  end;

var
  frmAntrian: TfrmAntrian;

implementation

{$R *.dfm}

uses Config, UDepan, uCarinama, uDataBaru, UITypes;

{ TfrmAntrian }

var
  ida: string;
  noantri: string;

procedure TfrmAntrian.AmbilAntrian(ANo: string);
var
  str: string;
  nama: string;
  tgljam, jam, tgl, status: string;
begin
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(Format('SELECT a.*, b.tgl, b.ID, b.noAntrian, b.Status, b.tgljam, b.jam '
            + 'FROM Antrigas_DataOrang a, Antrigas_DtAntrian b Where '
            + 'b.noktp = a.noktp AND noantrian = "%s"', [ANo]));
  qry.Open;
  if Not qry.eof then
  begin
    nama   := qry['nama'];
    status := qry['status'];
    tgl    := FormatDateTime('dd/MM/yyyy', qry.fieldByName('tgljam').AsDateTime) + ' ' + qry.fieldByName('jam').AsString;
    if status = 'Ambil' then
    begin
      ShowMessage('Sudah di ambil tgl: ' + tgl);
      exit;
    end;
    if qry.FieldByName('tgl').AsDateTime > Now() then
    begin
      ShowMessage('Tidak bisa di ambil sekarang po, buat tanggal besok');
      exit;
    end
    else
    if qry.FieldByName('tgl').AsDateTime < IncDay(Now(), -1) then
    begin
      MessageDlg('Antrian kemarin baru mo di ambil sekarang. dasar!!!', mtWarning, [mbOK], 0);
      if MessageDlg('Lanjutkah Po....?', mtConfirmation, [mbYes, mbNo],0)=mrYes then
      begin
        tgljam := FormatDateTime('yyyy-MM-dd HH:mm:ss', Now());
        jam    := FormatDateTime('HH:mm:ss', Now());
        status := 'Ambil';
        str := Format('UPDATE Antrigas_DtAntrian SET tgljam = "%s", jam = "%s", status = "%s" '
                    + 'WHERE noantrian = "%s"',
                    [tgljam, jam, status, ANo]);
        RunQuery(str, qry);
        MessageDlg(nama + ' Baru aja ngambil gasnya po...', mtInformation, [mbOK], 0);
        eNoantrian.Text := '';
        TampilData;
      end;
    end
    else
    begin
      tgljam := FormatDateTime('yyyy-MM-dd HH:mm:ss', Now());
      jam    := FormatDateTime('HH:mm:ss', Now());
      status := 'Ambil';
      str := Format('UPDATE Antrigas_DtAntrian SET tgljam = "%s", jam = "%s", status = "%s" '
                  + 'WHERE noantrian = "%s"',
                  [tgljam, jam, status, ANo]);
      RunQuery(str, qry);
      MessageDlg(nama + ' Baru aja ngambil gasnya po...', mtInformation, [mbOK], 0);
      eNoantrian.Text := '';
      TampilData;
    end;
  end else
  ShowMessage('No antrian tidak ditemukan');
end;

procedure TfrmAntrian.AmbilTotalAll;
var
  tgl: string;
begin
  tgl := FormatDateTime('yyyy-mm-dd', dtpTgl.Date);
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add('SELECT a.*, b.tgl, b.ID, b.noAntrian, b.Status '
            + 'FROM Antrigas_DataOrang a, Antrigas_DtAntrian b Where '
            + 'b.noktp = a.noktp AND b.tgl = :tanggal Order By b.ID Asc');
  qry.ParamByName('tanggal').AsString := tgl;
  qry.Open;

  lbAntrian.Caption := inttostr(qry.RecordCount);

  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(Format('SELECT a.*, b.tgl, b.ID, b.noAntrian, b.Status '
            + 'FROM Antrigas_DataOrang a, Antrigas_DtAntrian b Where '
            + 'b.noktp = a.noktp AND b.tgl = :tanggal AND status = "%s" Order By b.ID Asc', ['Ambil']));
  qry.ParamByName('tanggal').AsString := tgl;
  qry.Open;

  lbambil.Caption := inttostr(qry.RecordCount);
  lbBelum.Caption := IntToStr(StrToInt(lbAntrian.Caption) - StrToInt(lbambil.Caption));

  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add('SELECT SUM(print) AS jumlah FROM  Antrigas_DtAntrian Where '
            + 'tgl = :tanggal');
  qry.ParamByName('tanggal').AsString := tgl;
  qry.Open;

  if qry.FieldByName('jumlah').AsString = '' then
  lbcetak.Caption := '0' else
  lbcetak.Caption := qry.FieldByName('jumlah').AsString;
end;

procedure TfrmAntrian.AturKolom;
begin
  with Grid do
  begin
    RowCount := 1;
    DefaultRowHeight := 25;
    ColCount := 7;
    Options  := [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect];
    ShowSelection := false;
    Cells[0,0] := 'NO';
    Cells[1,0] := 'id';
    Cells[2,0] := 'NO ANTRIAN';
    Cells[3,0] := 'NO KTP';
    Cells[4,0] := 'NAMA LENGKAP';
    Cells[5,0] := 'TGL ANTRI';
    Cells[6,0] := 'STATUS';
    ColWidths[0] := 50;
    ColWidths[1] := 0;
    ColWidths[2] := 100;
    ColWidths[3] := 150;
    ColWidths[4] := 200;
    ColWidths[5] := 100;
    ColWidths[6] := 90;
  end;
end;

procedure TfrmAntrian.Bersih;
begin
  ektp.Text := '';
  ecari.Text := '';
  dtpAntri.Date := Now();
  dtpTgl.Date := Now();
  eNoantrian.Text := '';
  ida := '';
  ektp.SetFocus;
  Suara(0);
end;

procedure TfrmAntrian.btnAddClick(Sender: TObject);
begin
  frmCariNama.ShowModal;
end;

procedure TfrmAntrian.btnCetak_ulangClick(Sender: TObject);
var
  str: string;
begin
  if noantri <> '' then
  begin
    str := Format('UPDATE Antrigas_DtAntrian SET print = print + 1 '
                    + 'WHERE noantrian = "%s"',
                    [noantri]);
    RunQuery(str, qry);
    print;
    AmbilTotalAll;
  end;
end;

procedure TfrmAntrian.btnHapusClick(Sender: TObject);
var
  str: string;
begin
  if noantri <> '' then
  begin
    if MessageDlg('Yakin data akan di hapus?', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
    begin
      str := Format('DELETE FROM Antrigas_DtAntrian WHERE noantrian = "%s"', [noantri]);
      try
        RunQuery(str, qry);
        TampilData;
        noantri := '';
        ShowMessage('Berhasil dihapus');
      except
        on E : Exception do
          ShowMessage('error : '+E.Message);
      end;
    end;
  end else
  ShowMessage('Data belum dipilih');
end;

procedure TfrmAntrian.btnPrintReportClick(Sender: TObject);
var
  tgl: string;
begin
  tgl := FormatDateTime('yyyy-mm-dd', dtpTgl.Date);
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(Format('SELECT a.*, b.tgl, b.ID, b.noAntrian, b.Status '
            + 'FROM Antrigas_DataOrang a, Antrigas_DtAntrian b Where '
            + 'b.noktp = a.noktp AND nama LIKE "%s" AND b.tgl = :tanggal Order By b.ID Asc', [ecari.Text+'%']));
  qry.ParamByName('tanggal').AsString := tgl;
  qry.Open;

  frxReport1.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'report/laporan_antrian.fr3');
  frxReport1.PrepareReport;
  frxReport1.ShowReport();
end;

function TfrmAntrian.CekAntrian(AKtp: string): boolean;
var
  dur: integer;
  datecek: TDate;
  tglAw, tglAk: string;
begin
  if RadioButton1.Checked = true then
    dur := 1 else
  if RadioButton2.Checked = true then
    dur := 2 else
  if RadioButton3.Checked = true then
    dur := 3 else
  if RadioButton4.Checked = true then
    dur := 4;
  datecek := IncDay(dtpAntri.Date, - dur);
  tglAw := FormatDateTime('yyyy-MM-dd', datecek);
  tglAk := FormatDateTime('yyyy-MM-dd', dtpAntri.Date);

  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(Format('SELECT * FROM Antrigas_DtAntrian WHERE noktp = "%s" AND tgl >= :tglAw AND '
              + 'tgl <= :tglAk ORDER BY noantrian ASC',
              [AKtp]));
  qry.ParamByName('tglAw').AsString := tglAw;
  qry.ParamByName('tglAk').AsString := tglAk;
  qry.Open;
  if Not qry.Eof then
  begin
    ShowMessage('Ditemukan antri tanggal : ' + datetostr(qry.FieldByName('tgl').AsDateTime));
    Result := false;
  end
  else
    Result := true;
end;

procedure TfrmAntrian.CekAwalDB;
var
   tglcek: TDate;
begin
 tglcek := IncMonth(Now, -1);
  with qry do
  begin
    CLose;
    SQL.Clear;
    SQL.Add('Select Tgl From Antrigas_dtAntrian Where tgl <= :tgl');
    ParamByName('tgl').AsDate := tglcek;
    Open;

    if RecordCount <> 0 then
    begin
      try
        Close;
        SQL.Clear;
        SQL.Add('Delete From Antrigas_DtAntrian Where Tgl<= :tgl');
        ParamByName('tgl').AsDate := tglcek;
        ExecSQL;
      Except
         on E:Exception do
         MessageDlg(E.Message,mtError,[mbOK],0);
      end;
    end;
  end;
end;

procedure TfrmAntrian.CekDurasi;
var
  myini: TIniFile;
  cek  : string;
begin
  myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'config.inf');
  cek := myini.ReadString('configurasi', 'cek_dur', '2');
  if FormatDateTime('dddd', dtpAntri.Date) = 'Senin' then
  cek := inttostr(StrToInt(cek) + 1);

  if cek = '1' then
  RadioButton1.Checked := true else
  if cek = '2' then
  RadioButton2.Checked := true else
  if cek = '3' then
  RadioButton3.Checked := true else
  if cek = '4' then
  RadioButton4.Checked := true;
  myini.Free;
end;

procedure TfrmAntrian.dtpAntriChange(Sender: TObject);
begin
  CekDurasi;
end;

procedure TfrmAntrian.dtpTglChange(Sender: TObject);
begin
  TampilData;
end;

procedure TfrmAntrian.ecariChange(Sender: TObject);
begin
  TampilData;
end;

procedure TfrmAntrian.ektpKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if ektp.Text = '' then
    frmCariNama.ShowModal else
    InsertAntrian(ektp.Text);
  end;
end;

procedure TfrmAntrian.eNoantrianKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    AmbilAntrian(eNoantrian.Text);
  end;
end;

procedure TfrmAntrian.FormShow(Sender: TObject);
begin
  hari;
  bulan;
  CekAwalDB;
  CekDurasi;
  AturKolom;
  Bersih;
  TampilData;
  noantri := GetNumberAntrian('Antrigas_DtAntrian', qry);
end;

procedure TfrmAntrian.GridClick(Sender: TObject);
begin
  if Grid.RowCount > 1 then
  begin
    noantri := Grid.Cells[2, Grid.Row]
  end;
end;

procedure TfrmAntrian.GridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var dt:String;
begin
	dt := Grid.Cells[6, aRow];
	if (aCol = 6) AND (aRow > 0) and (dt = 'Belum') then
		begin
			Grid.canvas.Brush.Color:=$00AC91FF;
			Grid.canvas.Font.Color:=clBlack;
			Grid.Canvas.TextRect(Rect, Rect.Left + 25, Rect.Top + 3, Grid.Cells[6, ARow]);
		end else
  if (aCol = 6) AND (aRow > 0) and (dt = 'Ambil') then
		begin
			Grid.canvas.Brush.Color:=$0000FF80;
			Grid.canvas.Font.Color:=clBlack;
			Grid.Canvas.TextRect(Rect, Rect.Left + 25, Rect.Top + 3, Grid.Cells[6, ARow]);
		end;
end;

procedure TfrmAntrian.GridEnter(Sender: TObject);
begin
  Grid.ShowSelection := true;
end;

procedure TfrmAntrian.GridExit(Sender: TObject);
begin
  Grid.ShowSelection := false;
end;

procedure TfrmAntrian.InsertAntrian(AnoKtp: String);
var
  str: string;
  tgl, status: string;
begin
  if CekAntrian(ektp.Text) then
  begin
    str := Format('SELECT * FROM Antrigas_DataOrang WHERE noktp = "%s"', [ektp.Text]);
    RunQuery(str, qry);
    if Not qry.Eof then
    begin

      noantri := GetNumberAntrian('Antrigas_DtAntrian', qry);
      tgl     := FormatDateTime('yyyy-MM-dd', dtpAntri.Date);
      status  := 'Belum';

      str := Format('INSERT INTO Antrigas_DtAntrian (noAntrian, noktp, tgl, status, print) VALUES '
                  + '("%s", "%s", "%s", "%s", "%s")',
                  [noantri, ektp.Text, tgl, status, '1']);
      RunQuery(str, qry);
      print;
      TampilData;
      ektp.Text := '';
      ektp.SetFocus;
    end
    else
    begin
      ShowMessage('No ktp tidak ditemukan');
      if MessageDlg('Ingin tambah data baru?', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
      begin
        frmDataBaru.ShowModal;
      end;
    end;
  end;
end;

procedure TfrmAntrian.Label6DblClick(Sender: TObject);
var
  tgl: string;
begin
  tgl := FormatDateTime('yyyy-mm-dd', dtpTgl.Date);
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(Format('SELECT a.*, b.tgl, b.ID, b.noAntrian, b.Status '
            + 'FROM Antrigas_DataOrang a, Antrigas_DtAntrian b Where '
            + 'b.noktp = a.noktp AND noantrian = "%s"', [noantri]));
  qry.Open;

  frxReport1.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'report/struk.fr3');
  frxReport1.PrepareReport;
  frxReport1.DesignReport;
end;

procedure TfrmAntrian.Label7DblClick(Sender: TObject);
var
  tgl: string;
begin
  tgl := FormatDateTime('yyyy-mm-dd', dtpTgl.Date);
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(Format('SELECT a.*, b.tgl, b.ID, b.noAntrian, b.Status '
            + 'FROM Antrigas_DataOrang a, Antrigas_DtAntrian b Where '
            + 'b.noktp = a.noktp AND nama LIKE "%s" AND b.tgl = :tanggal Order By b.ID Asc', [ecari.Text+'%']));
  qry.ParamByName('tanggal').AsString := tgl;
  qry.Open;

  frxReport1.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'report/laporan_antrian.fr3');
  frxReport1.PrepareReport;
  frxReport1.DesignReport;
end;

procedure TfrmAntrian.print;
var
  tgl: string;
  myini: TIniFile;
  slg : string;
begin
  myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'config.inf');
  slg := myini.ReadString('slogan', 'slg', '');
  tgl := FormatDateTime('yyyy-mm-dd', dtpTgl.Date);
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(Format('SELECT a.*, b.tgl, b.ID, b.noAntrian, b.Status '
            + 'FROM Antrigas_DataOrang a, Antrigas_DtAntrian b Where '
            + 'b.noktp = a.noktp AND noantrian = "%s"', [noantri]));
  qry.Open;

  frxReport1.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'report/struk.fr3');
  TfrxMemoView(frxReport1.FindObject('selogan')).Memo.Text := slg;
  TfrxMemoView(frxReport1.FindObject('tgl_antri')).Memo.Text := 'Tanggal Cetak : ' + FormatDateTime('dd/MM/yyyy', Now());
  MyPrintDefault(frxReport1);
  frxReport1.PrepareReport;
  frxReport1.PrintOptions.ShowDialog := false;
  frxReport1.Print;
  noantri := '';
end;

procedure TfrmAntrian.TampilData;
var
  iii: integer;
  tgl: string;
begin
  tgl := FormatDateTime('yyyy-mm-dd', dtpTgl.Date);
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(Format('SELECT a.*, b.tgl, b.ID, b.noAntrian, b.Status '
            + 'FROM Antrigas_DataOrang a, Antrigas_DtAntrian b Where '
            + 'b.noktp = a.noktp AND nama LIKE "%s" AND b.tgl = :tanggal Order By b.ID Asc', [ecari.Text+'%']));
  qry.ParamByName('tanggal').AsString := tgl;
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
        Cells[1, iii] := qry.FieldByName('id').AsString;
        Cells[2, iii] := qry.FieldByName('noAntrian').AsString;
        Cells[3, iii] := qry.FieldByName('noktp').AsString;
        Cells[4, iii] := qry.FieldByName('nama').AsString;
        Cells[5, iii] := FormatDateTime('dd MMM yyy', qry.FieldByName('tgl').AsDateTime);
        Cells[6, iii] := qry.FieldByName('status').AsString;

        Alignments[4, iii] := taLeftJustify;
        inc(iii);
        qry.Next;
      end;
     end;
   end;
   AmbilTotalAll;
end;

end.
