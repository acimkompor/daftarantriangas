object frmEditnama: TfrmEditnama
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biHelp]
  Caption = 'Edit nama'
  ClientHeight = 83
  ClientWidth = 353
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
  object Edit1: TEdit
    Left = 32
    Top = 24
    Width = 217
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object Button1: TButton
    Left = 259
    Top = 22
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 1
    OnClick = Button1Click
  end
  object qry: TZQuery
    Connection = frmDepan.Conn
    Params = <>
    Left = 168
    Top = 72
  end
end
