object frmEditQtyListTransaksi: TfrmEditQtyListTransaksi
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Change QTY'
  ClientHeight = 119
  ClientWidth = 357
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
    Top = 30
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object Edit1: TEdit
    Left = 16
    Top = 62
    Width = 233
    Height = 21
    NumbersOnly = True
    TabOrder = 0
    Text = 'Edit1'
  end
  object Button1: TButton
    Left = 264
    Top = 60
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = Button1Click
  end
  object qry: TZQuery
    Connection = frmDepan.Conn
    Params = <>
    Left = 184
    Top = 16
  end
end
