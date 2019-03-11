unit uCarinama;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvUtil, Vcl.Grids, AdvObj, BaseGrid,
  AdvGrid, Vcl.StdCtrls, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TfrmCariNama = class(TForm)
    GroupBox1: TGroupBox;
    ecari: TEdit;
    Grid: TAdvStringGrid;
    qry: TZQuery;
    procedure ecariChange(Sender: TObject);
    procedure ecariKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure GridEnter(Sender: TObject);
    procedure GridExit(Sender: TObject);
    procedure GridKeyPress(Sender: TObject; var Key: Char);
    procedure GridDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure AturKolom;
    procedure AmbilData;
  public
    { Public declarations }
  end;

var
  frmCariNama: TfrmCariNama;

implementation

{$R *.dfm}

uses Config, uAntrianGas, UDepan;

{ TfrmCariNama }

procedure TfrmCariNama.AmbilData;
var
  iii: integer;
  str: String;
begin
  str := Format('SELECT * FROM antrigas_dataorang WHERE nama LIKE "%s%%"', [ecari.text]);
  qry.SQL.text := str;
  qry.Open;

  iii := 1;
  if qry.RecordCount < 1 then
   Grid.RowCount := 1
   else
   begin
     Grid.RowCount := qry.RecordCount + 1;
     Grid.FixedRows := 1;
     while Not qry.Eof do
     begin
      with Grid do
      begin
        Cells[0, iii] := Format('%d.', [iii]);
        Cells[1, iii] := qry.FieldByName('noktp').AsString;
        Cells[2, iii] := qry.FieldByName('nama').AsString;
        Cells[3, iii] := qry.FieldByName('alamat').AsString + ' ' + qry.FieldByName('rt').AsString;

        Alignments[2, iii] := taLeftJustify;
        Alignments[3, iii] := taLeftJustify;
        inc(iii);
        qry.Next;
      end;
     end;
   end;
end;

procedure TfrmCariNama.AturKolom;
begin
  with Grid do
  begin
    RowCount := 1;
    DefaultRowHeight := 25;
    ColCount := 4;
    Options  := [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect];
    ShowSelection := false;
    Cells[0,0] := 'NO';
    Cells[1,0] := 'NO KTP';
    Cells[2,0] := 'NAMA LENGKAP';
    Cells[3,0] := 'ALAMAT';
    ColWidths[0] := 50;
    ColWidths[1] := 130;
    ColWidths[2] := 200;
    ColWidths[3] := 200;
  end;
end;

procedure TfrmCariNama.ecariChange(Sender: TObject);
begin
  AmbilData;
end;

procedure TfrmCariNama.ecariKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_DOWN: Grid.SetFocus;
  end;
end;

procedure TfrmCariNama.FormShow(Sender: TObject);
begin
  ecari.Text := '';
  ecari.SetFocus;
  AturKolom;
  AmbilData;
end;

procedure TfrmCariNama.GridDblClick(Sender: TObject);
begin
  if Grid.RowCount > 1 then
  begin
    frmAntrian.ektp.Text := Grid.Cells[1, Grid.Row];
    frmAntrian.InsertAntrian(Grid.Cells[1, Grid.Row]);
    ecari.Text := '';
    ecari.SetFocus;
  end;
end;

procedure TfrmCariNama.GridEnter(Sender: TObject);
begin
  Grid.ShowSelection := true;
end;

procedure TfrmCariNama.GridExit(Sender: TObject);
begin
  Grid.ShowSelection := false;
end;

procedure TfrmCariNama.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Grid.Row = 1 then
  begin
    case key of
      VK_UP: ecari.SetFocus;
    end;
  end;
end;

procedure TfrmCariNama.GridKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    frmAntrian.ektp.Text := Grid.Cells[1, Grid.Row];
    frmAntrian.InsertAntrian(Grid.Cells[1, Grid.Row]);
    ecari.Text := '';
    ecari.SetFocus;
  end;
end;

end.
