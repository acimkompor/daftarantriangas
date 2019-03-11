object frmEditQty: TfrmEditQty
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Edit QTY'
  ClientHeight = 115
  ClientWidth = 359
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
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 335
    Height = 34
    AutoSize = False
    Caption = 'Label1'
    WordWrap = True
  end
  object Edit1: TEdit
    Left = 16
    Top = 48
    Width = 239
    Height = 21
    NumbersOnly = True
    TabOrder = 0
  end
  object Button1: TButton
    Left = 261
    Top = 46
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = Button1Click
  end
end
