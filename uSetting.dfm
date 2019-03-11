object frmSetting: TfrmSetting
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Setting'
  ClientHeight = 347
  ClientWidth = 482
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 466
    Height = 89
    Caption = 'Setting Printer Default'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 35
      Width = 63
      Height = 15
      Caption = 'Pilih Printer'
    end
    object CbPrinter: TComboBox
      Left = 96
      Top = 32
      Width = 345
      Height = 23
      TabOrder = 0
      Text = '--- Select Printer ---'
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 103
    Width = 466
    Height = 82
    Caption = 'Setting Durasi Cek'
    TabOrder = 1
    object Label2: TLabel
      Left = 16
      Top = 35
      Width = 64
      Height = 15
      Caption = 'Pilih Durasi'
    end
    object cbDurasi: TComboBox
      Left = 96
      Top = 32
      Width = 65
      Height = 22
      Style = csOwnerDrawFixed
      TabOrder = 0
      Items.Strings = (
        '1'
        '2'
        '3')
    end
  end
  object btnSave: TButton
    Left = 368
    Top = 302
    Width = 106
    Height = 36
    Caption = 'Simpan && Close'
    TabOrder = 2
    OnClick = btnSaveClick
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 191
    Width = 466
    Height = 105
    Caption = 'Selogan'
    TabOrder = 3
    object Memo1: TMemo
      Left = 24
      Top = 21
      Width = 425
      Height = 68
      Lines.Strings = (
        'Memo1')
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
end
