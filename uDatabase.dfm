object frmDatabase: TfrmDatabase
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Setting Database'
  ClientHeight = 147
  ClientWidth = 455
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 15
  object Edit1: TEdit
    Left = 32
    Top = 32
    Width = 345
    Height = 23
    TabOrder = 0
  end
  object Button1: TButton
    Left = 383
    Top = 30
    Width = 54
    Height = 25
    Caption = 'Search'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 362
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 2
    OnClick = Button2Click
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Database Access|*.mdb'
    Left = 248
    Top = 64
  end
end
