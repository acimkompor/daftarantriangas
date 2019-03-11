unit uEditnama;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TfrmEditnama = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    qry: TZQuery;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    idn: integer;
    edt: boolean;

  end;

var
  frmEditnama: TfrmEditnama;

implementation

{$R *.dfm}

uses Config, uConfig, UDepan, uListUtang;

procedure TfrmEditnama.Button1Click(Sender: TObject);
var
  str: string;
begin
  if edit1.Text <> '' then
  begin
    str := Format('SELECT * FROM u_list_nama WHERE nama = "%s"', [edit1.Text]);
    RunQuery(str, qry);
    if Not qry.Eof then
    begin
      MessageBox(handle, 'Nama ditemukan sama...', 'program cek', 16);
      exit;
    end;
    if edt = true then
    begin
//      'UPDATE gas_Transaksi SET jumlah = %d WHERE nonota = "%s"';
      str := Format('UPDATE u_list_nama SET nama = "%s" WHERE id_nama = %d',
                [edit1.Text, idn]);
    end;
    if edt = false then
    begin
      str := Format('INSERT INTO u_list_nama (nama, qty) VALUES ("%s", "%s")',
                [edit1.Text, '0']);
    end;
    RunQuery(str, qry);
    frmListUtang.TampilData;
    self.Close;
  end;
end;

procedure TfrmEditnama.FormShow(Sender: TObject);
begin
  if edt = false then
  edit1.Text := '';
  edit1.SetFocus;
end;

end.
