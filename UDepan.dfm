object frmDepan: TfrmDepan
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'ANTRIAN GAS LPG 3KG'
  ClientHeight = 627
  ClientWidth = 1100
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object MainMenu1: TMainMenu
    Left = 40
    Top = 8
    object FILE1: TMenuItem
      Caption = 'FILE'
      object Login1: TMenuItem
        Caption = 'Login'
        OnClick = Login1Click
      end
      object Logout1: TMenuItem
        Caption = 'Logout'
        Visible = False
        OnClick = Logout1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Setting1: TMenuItem
        Caption = 'Setting'
        OnClick = Setting1Click
      end
      object Database1: TMenuItem
        Caption = 'Database'
        OnClick = Database1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object ExitAltF41: TMenuItem
        Caption = 'Exit                             Alt+F4'
        OnClick = ExitAltF41Click
      end
    end
    object MASTER1: TMenuItem
      Caption = 'MASTER'
      Visible = False
      object AntrianGas3KG1: TMenuItem
        Caption = 'Antrian Gas 3KG'
        object AntrianGas2: TMenuItem
          Caption = 'Antrian Gas'
          OnClick = AntrianGas2Click
        end
        object ambahNamaBaru1: TMenuItem
          Caption = 'Tambah Nama Baru'
          OnClick = ambahNamaBaru1Click
        end
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object DaftarUtang1: TMenuItem
        Caption = 'Daftar Utang'
        OnClick = DaftarUtang1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object ransaksiManual1: TMenuItem
        Caption = 'Transaksi Manual'
        object ransaksi1: TMenuItem
          Caption = 'Transaksi'
          OnClick = ransaksi1Click
        end
        object ambahBarangBaru1: TMenuItem
          Caption = 'Tambah Barang Baru'
          OnClick = ambahBarangBaru1Click
        end
      end
    end
    object Report1: TMenuItem
      Caption = 'REPORT'
      Visible = False
    end
  end
  object Conn: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    HostName = ''
    Port = 0
    Database = ''
    User = ''
    Password = ''
    Protocol = 'ado'
    Left = 96
    Top = 8
  end
end
