unit Udepan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection;

type
  TfrmEditdata = class(TForm)
    Conn: TZConnection;
    qry: TZQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    btnsrc: TButton;
    btnConnect: TButton;
    OpenDialog1: TOpenDialog;
    procedure btnsrcClick(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditdata: TfrmEditdata;

implementation

{$R *.dfm}

procedure TfrmEditdata.btnConnectClick(Sender: TObject);
begin
  if edit1.Text <> '' then
  begin
    Conn.Protocol := 'ado';
    Conn.Database := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' + edit1.Text + ';Persist Security Info=False;Jet OLEDB:Database Password=balikpapan';
    try
      Conn.Connect;
      qry.SQL.Text := 'SELECT * FROM Antrigas_DtAntrian ORDER BY ID DESC';
      qry.Active   := true;
    except
      ShowMessage('Database not Connected');
    end;
  end;
end;

procedure TfrmEditdata.btnsrcClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    edit1.Text := OpenDialog1.FileName;
end;

end.
