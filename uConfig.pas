unit uConfig;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.StrUtils, DateUtils, Vcl.StdCtrls, System.Math, ZDataset,
  frxClass, uAcimWSQuery, Vcl.ComCtrls;


  function AZEncrypt(AText: string): String;
  function AZDecrypt(AText: string): String;
  function AZChar: String;
  function IntToAZ(AInt: Integer): String;
  function AZToInt(AText: String): Integer;
  procedure Hari;
  procedure Bulan;
  procedure BulanShort;
  procedure Setingan;
  procedure RunQuery(ASql: String; AQry: TZQuery);
  procedure SettingKoneksi(Alokasi: string; AConn: TACConnection);
  procedure ShowReport(ANamaFile: String);
  procedure LiveReport(ANamaFile: String);
  procedure DesignReport(ANamaFile: String);
  function Explode(delimiter: String; sString: String):TStringList;
  function TglIndo(AStr: String):String;
  function RibuanStr(AStr: String): String;
  function Ribuan(Edit: TEdit): String;
  function HapusRibuan(AStr: String): String;
  function GetNoFaktur(ATab, AKol: string; ADate: TDateTimePicker): String;

implementation

uses INIFiles, uUDF_FR, uDepan, Config;

var
  NamaHari: array[1..7] of string = ('Minggu,','Senin,','Selasa,','Rabu,','Kamis,','Jum'+char(39)+'at,','Sabtu,');
  NamaBulan: array[1..12] of string = ('Januari','Februari','Maret','April','Mei','Juni','Juli','Agustus','September','Oktober','Nopember','Desember');
  BulanS: array[1..12] of string = ('Jan','Feb','Mar','Apr','Mei','Jun','Jul','Agst','Sep','Okt','Nop','Des');
  myini: TIniFile;
  frxReport: TfrxReport;

function Randomstring(strLen: Integer): string;
var
  str: string;
begin
  Randomize;

  str := 'ABCDEFGHIJKLMNOPRSTUVWY123456789';
  Result := '';
  repeat
    Result := Result + str[Random(Length(str)) + 1];
  until (Length(Result) = strLen)
end;

function AZEncrypt(AText: string): String;
var
  xxx: Integer;
  yyy: Integer;
  key: String;
  iii: Integer;
  sss: String;
begin
  RandSeed := (SecondOf(Now));
  xxx := Random(255);
  key := IntToAZ(xxx);
  sss := Key;
  for iii := 1 to Length(AText) do
    begin
      yyy := xxx + Ord(AText[iii]);
      sss := sss + IntToAZ(yyy);
    end;
    result := sss;
end;

function AZDecrypt(AText: string): String;
var
  xxx: Integer;
  yyy: Integer;
  key: Integer;
  iii: Integer;
  sss: String;
  ddd: Integer;
begin
  key := AZToInt(copy(AText, 1, 2));
  xxx := (Length(AText) - 2) div 2;
  sss := '';
  for iii := 1 to xxx do
  begin
    ddd := iii * 2 + 1;
    yyy := AZToInt(Copy(AText, ddd, 2)) - key;
    sss := sss + Char(yyy);
  end;
  result := sss;
end;

function AZChar: String;
begin
  result := '0123456789AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz!@#$%^&*()+';
end;

function CharLength: Integer;
begin
  result := Length(AZChar);
end;

function IntToAZ(AInt: Integer): String;
var
  has: Integer;
  sis: Integer;
  sss: String;
begin
  sis := AInt mod  CharLength;
  has := AInt div CharLength;
  sss := AZChar[sis + 1];
  while has > 0 do
    begin
      sis := has mod  CharLength;
      has := has div CharLength;
      sss := AZChar[sis + 1] + sss;
    end;
    result := RightStr('00' + sss, 2);
end;


function AZToInt(AText: String): Integer;
var
  xxx: Integer;
  iii: Integer;
  sss: String;
  ppp: Integer;
  eee: Integer;
  kkk: Integer;
begin
  sss := Trim(AText);
  xxx := 0;
  for iii := Length(sss) downto 1 do
    begin
      ppp := pos(sss[iii], AZChar);
      eee := Length(sss) - iii;
      kkk := Trunc(Power(CharLength, eee));
      if ppp = 0 then
      begin
        result := -1;
      exit;
      end;
      xxx := xxx + (ppp - 1)  * kkk;
    end;
    result := xxx;
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
  FormatSettings.DecimalSeparator  := ',';
  FormatSettings.ThousandSeparator := '.';
  FormatSettings.ShortDateFormat   := 'dd-MMM-yy';
  FormatSettings.LongDateFormat    := 'dd mmmm yyyy';
  FormatSettings.CurrencyString    := 'Rp.';
end;

procedure RunQuery(ASql: String; AQry: TZQuery);
var
  Cek: String;
begin
  with AQry do
  begin
    Close;
    SQL.Clear;
    Cek := Copy(ASql, 1, 3);
    SQL.Add(ASql);
    if UpperCase(Cek) = 'SEL' then
    Open else ExecSQL;
  end;
end;

procedure SettingKoneksi(Alokasi: string; AConn: TACConnection);
begin
  AConn.LinkUrl  := AZDecrypt(myini.ReadString(Alokasi, 'link', ''));
  AConn.User     := AZDecrypt(myini.ReadString(Alokasi, 'user', ''));
  AConn.Password := AZDecrypt(myini.ReadString(Alokasi, 'pass', ''));
  AConn.Database := AZDecrypt(myini.ReadString(Alokasi, 'database', ''));
  AConn.Host     := AZDecrypt(myini.ReadString(Alokasi, 'host', ''));
end;

procedure ShowReport(ANamaFile: String);
var
  fil: String;
  dir: string;
begin
  dir := ExtractFileDir(ParamStr(0));
  fil := Format(dir + '/report/%s.fr3', [ANamaFile]);
  frxReport.LoadFromFile(fil);
  frxReport.ShowReport;
end;

procedure LiveReport(ANamaFile: String);
var
  fil: String;
  dir: string;
begin
  dir := ExtractFileDir(ParamStr(0));
  fil := Format(dir + '/report/%s.fr3', [ANamaFile]);
  frxReport.LoadFromFile(fil);
  MyPrintDefault(frxReport);
  frxReport.PrepareReport;
  frxReport.PrintOptions.ShowDialog := false;
  frxReport.Print;
end;

procedure DesignReport(ANamaFile: String);
var
  fil: String;
  dir: String;
begin
  dir := ExtractFileDir(ParamStr(0));
  fil := Format(dir + '\report\%s.fr3', [ANamaFile]);

  if not FileExists(fil) then
  begin
    ForceDirectories(dir + '\report');
    FileCreate(fil);
  end;
  frxReport.LoadFromFile(fil);
  frxReport.DesignReport;
end;

function Explode(delimiter: String; sString: String):TStringList;
var
 c: word;
begin
  Result := TStringList.Create;
  c := 0;
  while sString <> '' do begin
    if Pos(delimiter, sString) > 0
    then begin
      Result.Add(Copy(sString, 1, Pos(delimiter, sString)-1));
      Delete(sString, 1, Length(Result[c]) + Length(delimiter));
    end
    else begin
      Result.Add(sString);
      sString:= '';
    end;
    inc(c);
  end;
end;

function TglIndo(AStr: String):String;
var
  fs: TFormatSettings;
  dt: TDate;
begin
  fs := TFormatSettings.Create;
  fs.DateSeparator := '-';
  fs.ShortDateFormat := 'yyyy-MM-dd';
  dt := StrToDateTime(AStr, fs);
  Result := FormatDateTime('dd MMM yyyy', dt);
end;

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

function GetNoFaktur(ATab, AKol: string; ADate: TDateTimePicker): String;
var
  str, hsl, kode, tgl: String;
  qry: TZQuery;
begin
  kode := Randomstring(5);
  tgl  := FormatDateTime('yyyyMMdd', ADate.Date);
  qry  := TZQuery.Create(nil);
  qry.Connection := frmDepan.Conn;
  str  := Format('Select %s as kode From %s Order By id DESC',
              [AKol, ATab]);
  RunQuery(str, qry);

  //20180822ABCDE000001
  //1234567890123456789

  if (qry.FieldByName('kode').AsString = '') OR (qry.IsEmpty) then
    Result := tgl + kode + '00341' else
  begin
    hsl := qry.FieldByName('kode').AsString;
    hsl := Copy(hsl, 14, 6);
    hsl := FormatFloat('000000', StrToInt(hsl) + 1);
    Result := tgl + kode + hsl;
  end;
end;


initialization
  myini := TINIFile.Create(ExtractFilePath(ParamStr(0)) + 'koneksi.conf');
  frxReport := TfrxReport.Create(nil)

finalization
  myini.Free;
  frxReport.free;

end.
