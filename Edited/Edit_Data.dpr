program Edit_Data;

uses
  Vcl.Forms,
  Udepan in 'Udepan.pas' {frmEditdata};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmEditdata, frmEditdata);
  Application.Run;
end.
