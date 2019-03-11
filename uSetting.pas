unit uSetting;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, INIFiles, Printers;

type
  TfrmSetting = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    CbPrinter: TComboBox;
    cbDurasi: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    btnSave: TButton;
    GroupBox3: TGroupBox;
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
    procedure CekINI;
  public
    { Public declarations }
  end;

var
  frmSetting: TfrmSetting;

implementation

{$R *.dfm}

{ TfrmSetting }

var
  myini: TIniFile;

procedure TfrmSetting.btnSaveClick(Sender: TObject);
begin
  if CbPrinter.Text = '--- Select Printer ---' then exit;

  myIni.WriteString('configurasi', 'printers', CbPrinter.Text);
  myIni.WriteInteger('configurasi', 'index', CbPrinter.ItemIndex);

  myini.WriteString('configurasi', 'cek_dur', cbDurasi.Text);

  myini.WriteString('slogan', 'slg', Memo1.Text);

  ShowMessage('Konfigurasi di simpan.');
  self.Close;
end;

procedure TfrmSetting.CekINI;
var
  dur: integer;
  printdef: string;
begin
  dur := myini.ReadInteger('configurasi', 'cek_dur', 2);
  cbDurasi.ItemIndex := dur - 1;

  // menampilkan list printer
  CbPrinter.Items.Assign(Printer.Printers);
//
  CbPrinter.ItemIndex := myini.ReadInteger('configurasi', 'index', -1);

  Memo1.Text := myini.ReadString('slogan', 'slg', '');
end;

procedure TfrmSetting.FormShow(Sender: TObject);
begin
  CekINI;
end;

initialization
  myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'config.inf');

finalization
  myini.Free;

end.
