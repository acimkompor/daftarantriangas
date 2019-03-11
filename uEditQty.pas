unit uEditQty;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmEditQty = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id: string;
    qty, harga: integer;
  end;

var
  frmEditQty: TfrmEditQty;

implementation

{$R *.dfm}

uses Config, uTransaksi_Manual;

procedure TfrmEditQty.Button1Click(Sender: TObject);
var
  total: integer;
  sql : string;
begin
  if (edit1.Text <> '') or (edit1.Text <> '0') then
  begin
    qty := strtoint(edit1.Text);

    total := qty * harga;
    sql := Format('UPDATE gas_temp SET qty = %d, jumlah = %d WHERE idgas = "%s"',
                [qty, total, id]);
    RunQuery(sql, frmTransaksi_Manual.qry);
    frmTransaksi_Manual.ambilData;
    frmTransaksi_Manual.qty := StrToInt(edit1.Text);
    self.Close;
  end;
end;

procedure TfrmEditQty.FormShow(Sender: TObject);
begin
  edit1.SetFocus;
end;

end.
