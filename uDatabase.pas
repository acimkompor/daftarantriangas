unit uDatabase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, INIFiles;

type
  TfrmDatabase = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    OpenDialog1: TOpenDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDatabase: TfrmDatabase;

implementation

{$R *.dfm}

uses UDepan;

procedure TfrmDatabase.Button1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    edit1.Text := OpenDialog1.FileName;
  end;

end;

procedure TfrmDatabase.Button2Click(Sender: TObject);
var
  myini : TIniFile;
begin
  myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'config.inf');
  if edit1.Text <> '' then
  myini.WriteString('configurasi', 'database', edit1.Text);
  myini.Free;

  frmDepan.Conn.Connected := false;
  frmDepan.Conn.Protocol := 'ado';
  frmDepan.Conn.Database := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' + edit1.Text + ';Persist Security Info=False;Jet OLEDB:Database Password=balikpapan';
  try
    frmDepan.Conn.Connect;
    self.Close;
  except
    ShowMessage('Database not Connected');
  end;
end;

end.
