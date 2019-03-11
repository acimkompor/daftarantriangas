unit uReportPenjualan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, AdvUtil, Vcl.Grids, AdvObj,
  BaseGrid, AdvGrid;

type
  TfrmReportPenjualan = class(TForm)
    cb1: TComboBox;
    dtp1: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    qry: TZQuery;
    Grid: TAdvStringGrid;
    lbTotal: TLabel;
    Button3: TButton;
    procedure FormShow(Sender: TObject);
    procedure dtp1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    procedure TampilCombo;
    procedure TampilData;
  public
    { Public declarations }
  end;

var
  frmReportPenjualan: TfrmReportPenjualan;

implementation

{$R *.dfm}

uses Config, uConfig, UDepan, uUDF_FR;

procedure TfrmReportPenjualan.Button1Click(Sender: TObject);
begin
  TampilData; 
end;

procedure TfrmReportPenjualan.Button2Click(Sender: TObject);
begin
  ReportGrid := Grid;
  ReportForm := self;
  if Grid.RowCount > 1  then
  begin
    LiveReport('Laporan_Jualan');
  end else
  begin
    ShowMessage('Data tidak ditemukan');
  end;
end;

procedure TfrmReportPenjualan.Button3Click(Sender: TObject);
begin
  ReportGrid := Grid;
  ReportForm := self;
  DesignReport('Laporan_Jualan');
end;

procedure TfrmReportPenjualan.dtp1Change(Sender: TObject);
begin
  TampilCombo;
end;

procedure TfrmReportPenjualan.FormShow(Sender: TObject);
begin
  dtp1.Date := Now();
  TampilCombo;
  TampilData;
end;

procedure TfrmReportPenjualan.TampilCombo;
var
  str: String;
  tgl: string;
begin
  tgl := FormatDateTime('yyyy-mm-dd', dtp1.Date);
  str := 'SELECT DISTINCT(kasir) FROM gas_Transaksi WHERE tgl = :tgl ORDER BY kasir ASC';
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(str);
  qry.ParamByName('tgl').AsString := tgl;
  qry.Open;

  cb1.Clear;
  While Not qry.Eof do
  begin
    cb1.Items.Add(qry.FieldByName('kasir').AsString);
    qry.Next;
  end;
end;

procedure TfrmReportPenjualan.TampilData;
var
  str: string;
  i  : integer;
  tgl: string;
begin
  tgl := FormatDateTime('yyyy-mm-dd', dtp1.Date);
  str := Format('SELECT namagas, SUM(qty) AS qty, SUM(jumlah) AS jumlah FROM gas_transaksiDetail '
       + 'WHERE tgl = :tgl AND kasir = "%s" GROUP BY namagas',
        [cb1.Text]);
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(str);
  qry.ParamByName('tgl').AsString := tgl;
  qry.Open;
  
  if qry.RecordCount = 0 then
  begin
    Grid.RowCount := 1;
  end else
  if qry.RecordCount <> 0 then
  begin
    Grid.RowCount := qry.RecordCount+1;
    for i := 0 to qry.RecordCount -1 do
    begin
     Grid.Cells[0, i + 1] := IntToStr(i + 1) + '.';
     Grid.Cells[1, i + 1] := qry.FieldByName('namagas').AsString;
     Grid.Cells[2, i + 1] := qry.FieldByName('qty').AsString;
     Grid.Cells[3, i + 1] := FormatFloat('#,#0', qry.FieldByName('jumlah').AsInteger);

     Grid.Alignments[1, i + 1] := taLeftJustify;
     qry.Next;
    end;
  end;

  str :=  Format('SELECT SUM(jumlah) AS jumlah FROM gas_transaksiDetail WHERE '
              + 'tgl = :tgl AND kasir = "%s"', [cb1.Text]);
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(str);
  qry.ParamByName('tgl').AsString := tgl;
  qry.Open;

  lbTotal.Caption := RibuanStr(qry.FieldByName('jumlah').AsString);
end;

end.
