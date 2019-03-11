object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsSingle
  Caption = 'Login'
  ClientHeight = 99
  ClientWidth = 315
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cb1: TComboBox
    Left = 40
    Top = 32
    Width = 145
    Height = 22
    Style = csOwnerDrawVariable
    TabOrder = 0
    Items.Strings = (
      'HALIFA'
      'LINTAN')
  end
  object Button1: TButton
    Left = 200
    Top = 30
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = Button1Click
  end
end
