program Bold;

uses
  System.StartUpCopy,
  Vcl.Forms,
  Winapi.Windows,
  Vcl.Dialogs,
  System.SysUtils,
  UITypes,
  UDepan in 'UDepan.pas' {frmDepan},
  uDataBaru in 'uDataBaru.pas' {frmDataBaru},
  Config in 'Config.pas',
  uAntrianGas in 'uAntrianGas.pas' {frmAntrian},
  Vcl.Themes,
  Vcl.Styles,
  uCarinama in 'uCarinama.pas' {frmCariNama},
  uSetting in 'uSetting.pas' {frmSetting},
  uDatabase in 'uDatabase.pas' {frmDatabase},
  uDatabarangManual in 'uDatabarangManual.pas' {frmDatabarangManual},
  uTransaksi_Manual in 'uTransaksi_Manual.pas' {frmTransaksi_Manual},
  uEditQty in 'uEditQty.pas' {frmEditQty},
  uConfig in 'uConfig.pas',
  uUDF_FR in 'uUDF_FR.pas',
  uListTransaksi in 'uListTransaksi.pas' {frmListTransaksi},
  uEditQtyListTransaksi in 'uEditQtyListTransaksi.pas' {frmEditQtyListTransaksi},
  uReportPenjualan in 'uReportPenjualan.pas' {frmReportPenjualan},
  uLogin in 'uLogin.pas' {frmLogin},
  uListUtang in 'uListUtang.pas' {frmListUtang},
  uEditnama in 'uEditnama.pas' {frmEditnama},
  uUtangDetail in 'uUtangDetail.pas' {frmUtangDetail};

{$R *.res}

begin
  CreateMutex(nil, True, PChar(ExtractFileName(ParamStr(0))));
  if GetLastError = ERROR_ALREADY_EXISTS then
  begin
    MessageDlg('Program Already Running..',mtError,[mbOK],0);
    Halt;
  end;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmDepan, frmDepan);
  Application.CreateForm(TfrmDataBaru, frmDataBaru);
  Application.CreateForm(TfrmAntrian, frmAntrian);
  Application.CreateForm(TfrmCariNama, frmCariNama);
  Application.CreateForm(TfrmSetting, frmSetting);
  Application.CreateForm(TfrmDatabase, frmDatabase);
  Application.CreateForm(TfrmDatabarangManual, frmDatabarangManual);
  Application.CreateForm(TfrmTransaksi_Manual, frmTransaksi_Manual);
  Application.CreateForm(TfrmEditQty, frmEditQty);
  Application.CreateForm(TfrmListTransaksi, frmListTransaksi);
  Application.CreateForm(TfrmEditQtyListTransaksi, frmEditQtyListTransaksi);
  Application.CreateForm(TfrmReportPenjualan, frmReportPenjualan);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmListUtang, frmListUtang);
  Application.CreateForm(TfrmEditnama, frmEditnama);
  Application.CreateForm(TfrmUtangDetail, frmUtangDetail);
  Application.Run;
end.
