unit UDepan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, Vcl.StdCtrls, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, INIFiles,
  FireDAC.Comp.Client, AdvUtil, Vcl.Grids, AdvObj, BaseGrid, AdvGrid;

type
  TfrmDepan = class(TForm)
    MainMenu1: TMainMenu;
    FILE1: TMenuItem;
    ExitAltF41: TMenuItem;
    MASTER1: TMenuItem;
    Report1: TMenuItem;
    Conn: TZConnection;
    N2: TMenuItem;
    Setting1: TMenuItem;
    Database1: TMenuItem;
    AntrianGas3KG1: TMenuItem;
    AntrianGas2: TMenuItem;
    ambahNamaBaru1: TMenuItem;
    N1: TMenuItem;
    DaftarUtang1: TMenuItem;
    N3: TMenuItem;
    ransaksiManual1: TMenuItem;
    ransaksi1: TMenuItem;
    ambahBarangBaru1: TMenuItem;
    N4: TMenuItem;
    Login1: TMenuItem;
    Logout1: TMenuItem;
    procedure Setting1Click(Sender: TObject);
    procedure Database1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AntrianGas2Click(Sender: TObject);
    procedure ambahNamaBaru1Click(Sender: TObject);
    procedure ExitAltF41Click(Sender: TObject);
    procedure ambahBarangBaru1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ransaksi1Click(Sender: TObject);
    procedure Logout1Click(Sender: TObject);
    procedure Login1Click(Sender: TObject);
    procedure DaftarUtang1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    kasir: string;
    procedure Buka;
    procedure Kunci;
  end;

var
  frmDepan: TfrmDepan;

implementation

{$R *.dfm}

uses uDataBaru, uAntrianGas, uSetting, uDatabase, uDatabarangManual, Config,
  uTransaksi_Manual, uLogin, uListUtang;



procedure TfrmDepan.ambahBarangBaru1Click(Sender: TObject);
begin
  frmDatabarangManual.ShowModal;
end;

procedure TfrmDepan.ambahNamaBaru1Click(Sender: TObject);
begin
  frmDataBaru.ShowModal;
end;

procedure TfrmDepan.AntrianGas2Click(Sender: TObject);
begin
  frmAntrian.ShowModal;
end;

procedure TfrmDepan.Buka;
begin
  Login1.Visible  := false;
  Logout1.Visible := true;
  MASTER1.Visible := true;
  Report1.Visible := true;
  frmDepan.Caption := 'ANTRIAN GAS LPG 3KG [' + kasir + ']';
end;

procedure TfrmDepan.DaftarUtang1Click(Sender: TObject);
begin
  frmListUtang.ShowModal;
end;

procedure TfrmDepan.Database1Click(Sender: TObject);
begin
  frmDatabase.ShowModal;
end;

procedure TfrmDepan.ExitAltF41Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmDepan.FormCreate(Sender: TObject);
var
  myini: TIniFile;
  link: string;
begin
  Kunci;
  myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'config.inf');
  link := myini.ReadString('configurasi', 'database', '');
  myini.Free;
  if link.IsEmpty then
  ShowMessage('Database belum di seting') else
  begin
    Conn.Protocol := 'ado';
    Conn.Database := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' + link + ';Persist Security Info=False;Jet OLEDB:Database Password=balikpapan';
    try
      Conn.Connect;
    except
      ShowMessage('Setting database tidak sesuai, cek kembali');
    end;
  end;
end;

procedure TfrmDepan.FormShow(Sender: TObject);
begin
  Suara(0);
end;

procedure TfrmDepan.Kunci;
begin
  Login1.Visible  := true;
  Logout1.Visible := false;
  MASTER1.Visible := false;
  Report1.Visible := false;
  frmDepan.Caption := 'ANTRIAN GAS LPG 3KG';
end;

procedure TfrmDepan.Login1Click(Sender: TObject);
begin
 frmLogin.ShowModal;
end;

procedure TfrmDepan.Logout1Click(Sender: TObject);
begin
  Kunci;
end;

procedure TfrmDepan.ransaksi1Click(Sender: TObject);
begin
  frmTransaksi_Manual.ShowModal;
end;

procedure TfrmDepan.Setting1Click(Sender: TObject);
begin
  frmSetting.ShowModal;
end;

end.
