unit Config;

interface

uses  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
      Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JSON, IdHTTP, ZDataSet, frxClass, DateUtils, INIFiles, Data.DB;

      function RibuanStr(AStr: String): String;
      function Ribuan(Edit: TEdit): String;
      function HapusRibuan(AStr: String): String;
      procedure Hari;
      procedure Bulan;
      procedure BulanShort;
      procedure Setingan;
      procedure RunQuery(_SQL: String; QData: TZQuery);
      function GetNumberAntrian(ATab: String; QData: TZQuery): string;
      procedure MyPrintDefault(AReport: TFrxReport);
      procedure Suara(Index: Cardinal);
      function GetNoTransaksi(ATab, ACol: String; QData: TZQuery): string;

implementation

uses UDepan;

var
  NamaHari: array[1..7] of string = ('Minggu','Senin','Selasa','Rabu','Kamis','Jum'+char(39)+'at','Sabtu');
  NamaBulan: array[1..12] of string = ('Januari','Februari','Maret','April','Mei','Juni','Juli','Agustus','September','Oktober','Nopember','Desember');
  BulanS: array[1..12] of string = ('Jan','Feb','Mar','Apr','Mei','Jun','Jul','Agst','Sep','Okt','Nop','Des');

function RibuanStr(AStr: String): String;
var
  Angka: Currency;
begin
  Astr := StringReplace(Astr, ',', '', [rfReplaceAll, rfIgnoreCase]);
  Astr := StringReplace(Astr, '.', '', [rfReplaceAll, rfIgnoreCase]);
  Angka := StrToCurrDef(Astr, 0);
  Result := FormatCurr('#,###0', Angka);
end;

function Ribuan(Edit: TEdit): String;
Var
  Nilai: String;
  Angka: Currency;
begin
  if Edit.Text = '' then exit;
  Nilai := Edit.Text;
  Nilai := StringReplace(Nilai, ',','', [rfReplaceAll, rfIgnoreCase]);
  Nilai := StringReplace(Nilai, '.','', [rfReplaceAll, rfIgnoreCase]);
  Angka := StrToCurrDef(Nilai, 0);
  Edit.Text := FormatCurr('#,###0', Angka);
  Edit.SelStart := Length(Edit.Text);
end;

function HapusRibuan(AStr: String): String;
begin
  AStr := StringReplace(AStr, '.', '', [rfReplaceAll, rfIgnoreCase]);
  AStr := StringReplace(AStr, ',', '', [rfReplaceAll, rfIgnoreCase]);
  Result := AStr;
end;

procedure Hari;
var
  iii: integer;
begin
  for iii := 1 to High(NamaHari) do
    FormatSettings.LongDayNames[iii] := NamaHari[iii];
end;

procedure Bulan;
var
  iii: integer;
begin
  for iii := 1 to High(NamaBulan) do
    FormatSettings.LongMonthNames[iii] := NamaBulan[iii];
end;

procedure BulanShort;
var
  iii: integer;
begin
  for iii := 1 to High(BulanS) do
    FormatSettings.ShortMonthNames[iii] := BulanS[iii];
end;

procedure Setingan;
begin
  FormatSettings.DecimalSeparator  := '.';
  FormatSettings.ThousandSeparator := ',';
  FormatSettings.ShortDateFormat   := 'dd-MMM-yy';
  FormatSettings.LongDateFormat    := 'dd mmmm yyyy';
  FormatSettings.CurrencyString    := 'Rp.';
end;

procedure RunQuery(_SQL: String; QData: TZQuery);
var
  Cek: String;
begin
  with Qdata do
  begin
    Close;
    Connection := frmDepan.Conn;
    SQL.Clear;
    Cek := Copy(_SQL, 1, 3);
    SQL.Text := _SQL;
    if UpperCase(Cek) = 'SEL' then
    Open else ExecSQL;
  end;
end;

function GetNumberAntrian(ATab: string; QData: TZQuery): string;
var
  dt: String;
begin
	with QData do
		begin
			Close;
			SQl.Clear;
			SQL.Add(Format('Select TOP 1 * from %s', [ATab]));
			SQL.Add(' Order By ID DESC');
			Open;
		end;

		dt := QData.Fields[1].AsString;

    if dt = '99999' then dt := '00001'
		else
		if dt <> '' then dt := FormatFloat('00000', StrToInt(dt) + 1 )
		else dt := '00001';
		Result  := dt;
end;

function GetNoTransaksi(ATab, ACol: String; QData: TZQuery): string;
var
  dt: String;
begin
	with QData do
		begin
			Close;
			SQl.Clear;
			SQL.Add(Format('Select TOP 1 * from %s Order By %s DESC', [ATab, ACol]));
			Open;
		end;

		dt := QData.Fields[0].AsString;
		if dt <> '' then dt := FormatFloat('0000000', StrToInt(dt) + 1 )
		else dt := '0000001';
		Result  := dt;
end;

procedure MyPrintDefault(AReport: TFrxReport);
var
  myini: TIniFile;
begin
  myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'config.inf');
  AReport.PrintOptions.Printer := myini.ReadString('configurasi', 'printers', '');
  myini.Free;
end;

procedure Suara(Index: Cardinal);
begin
  SystemParametersInfo(SPI_SETBEEP, Index, nil, SPIF_SENDWININICHANGE);
end;

end.
