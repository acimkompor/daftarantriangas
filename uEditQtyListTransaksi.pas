unit uEditQtyListTransaksi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TfrmEditQtyListTransaksi = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
    qry: TZQuery;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    harga: integer;
    iditem, nonota: string;
  end;

var
  frmEditQtyListTransaksi: TfrmEditQtyListTransaksi;

implementation

{$R *.dfm}

uses UDepan, uConfig, uListTransaksi;

procedure TfrmEditQtyListTransaksi.Button1Click(Sender: TObject);
var
  jumlah, total: integer;
  str : string;
  qty : integer;
begin
  if (edit1.Text = '') or (Edit1.Text = '0') then exit;
  qty    := StrToIntDef(edit1.Text, 1);
  jumlah := harga * qty;
  str := Format('UPDATE gas_TransaksiDetail SET qty = %d, jumlah = %d WHERE nonota = "%s" AND idgas = "%s"',
              [qty, jumlah, nonota, iditem]);
  RunQuery(str, qry);

  str := Format('SELECT SUM(jumlah) AS total FROM gas_TransaksiDetail WHERE nonota = "%s"',
                [nonota]);
  RunQuery(str, qry);
  total := qry.FieldByName('total').AsInteger;

  str := Format('UPDATE gas_Transaksi SET jumlah = %d WHERE nonota = "%s"',
                [total, nonota]);
  RunQuery(str, qry);
  frmListTransaksi.tampilData1;
  frmListTransaksi.Grid2.RowCount := 1;
  self.Close;
end;

procedure TfrmEditQtyListTransaksi.FormShow(Sender: TObject);
begin
  edit1.SetFocus;
end;

end.
