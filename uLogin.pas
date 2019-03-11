unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmLogin = class(TForm)
    cb1: TComboBox;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses UDepan;

procedure TfrmLogin.Button1Click(Sender: TObject);
begin
  if cb1.Text <> '' then
  begin
    frmDepan.kasir := cb1.Text;
    frmDepan.Buka;
    self.Close;
  end;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  cb1.ItemIndex := -1;
end;

end.
