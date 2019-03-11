unit uUDF_FR;

interface

uses
  system.sysutils, fs_iinterpreter, Grids, Forms, System.Classes, AdvGrid;

type
  TTSFastReportFunction = class(TfsRTTIModule)
  private
    function CallMethod(Instance: TObject; ClassType: TClass;
                        const MethodName: String;
                        var Params: Variant): Variant;
    function GridRowCount:Integer;
    function GridCells(ACol, ARow:Integer):String;
    function Terbilang(x: Integer): String;
    function CompoProperty(AName, AProp: string): Variant;
  public
    constructor Create(AScript: TfsScript); override;
  end;

var
  ReportGrid: TAdvStringGrid;
  ReportForm: TForm;

implementation

uses System.TypInfo;

const
  Cat : string = 'Acime';

constructor TTSFastReportFunction.Create;
begin
  inherited Create(AScript);
  with AScript do
  begin
    AddMethod('function Terbilang(AValue: Integer): String', CallMethod, Cat, ' Terbilang');
    AddMethod('function GridRowCount:Integer', CallMethod, cat, ' GridRowCount');
    AddMethod('function GridCells(ACol, ARow:integer): String', CallMethod, cat, ' GridCells');
    AddMethod('function CompoProperty(AName, AProp: string): Variant', CallMethod, cat, ' GridCellsCompoProperty');
  end;
end;

function TTSFastReportFunction.GridCells(ACol, ARow: Integer): String;
begin
  Result := ReportGrid.Cells[ACol, ARow];
end;

function TTSFastReportFunction.GridRowCount: Integer;
begin
  Result := ReportGrid.RowCount;
end;

function TTSFastReportFunction.CallMethod(Instance: TObject; ClassType: TClass;
         const MethodName: string; var Params: Variant): Variant;
begin
  if UpperCase(MethodName) = 'TERBILANG' then
  Result := Terbilang(params[0]);

  if UpperCase(MethodName) = 'GRIDROWCOUNT' then
  Result := GridRowCount;

  if UpperCase(MethodName) = 'GRIDCELLS' then
  Result := GridCells(Params[0], Params[1]);

  if UpperCase(MethodName) = 'COMPOPROPERTY' then
  Result := CompoProperty(Params[0], Params[1]);
end;

function TTSFastReportFunction.Terbilang(x: Integer): String;
const
  ABil : array[0..11] of string[10]
       = ('', 'satu', 'dua', 'tiga', 'empat', 'lima', 'enam', 'tujuh',
          'delapan', 'sembilan', 'sepuluh', 'sebelas');

begin
  if (x<12) then
  Result := ' ' + abil[x]
  else if (x < 20) then
  Result := Terbilang(x - 10) + ' belas'
  else if (x < 100) then
  Result := Terbilang(x div 10) + ' puluh' + Terbilang(x mod 10)
  else if (x < 200) then
  Result := ' seratus' + Terbilang(x - 100)
  else if (x < 1000) then
  Result := Terbilang(x div 100) + ' ratus' + Terbilang(x mod 100)
  else if (x < 2000) then
  Result := ' seribu' + Terbilang(x - 1000)
  else if (x < 1000000) then
  Result := Terbilang(x div 1000) + ' ribu' + Terbilang(x mod 1000)
  else if (x < 1000000000) then
  Result := Terbilang(x div 1000000) + ' juta' + Terbilang(x mod 1000000);
end;

function TTSFastReportFunction.CompoProperty(AName, AProp: string): Variant;
var
  com: TComponent;
begin
  if ReportForm = nil then
  begin
    Result := 'Report Form Not be Assigned';
    exit;
  end;

  com := ReportForm.FindComponent(AName);
  if com = nil then
  begin
    Result := Format('Component ''%s'' Not Found', [AName]);
    exit;
  end;

  if IsPublishedProp(com, AProp) then
  begin
    Result := GetPropValue(com, AProp);
  end else
  begin
    Result := Format('Component ''%s'' Not Found', [AName]);
  end;
end;

initialization
  fsRTTIModules.Add(TTSFastReportFunction);

end.
