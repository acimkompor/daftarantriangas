object frmEditdata: TfrmEditdata
  Left = 0
  Top = 0
  Caption = 'Edit data'
  ClientHeight = 431
  ClientWidth = 695
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    695
    431)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 64
    Width = 679
    Height = 359
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Title.Color = clLime
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'noAntrian'
        Title.Alignment = taCenter
        Title.Color = clLime
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'noktp'
        Title.Alignment = taCenter
        Title.Color = clLime
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 120
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Tgl'
        Title.Alignment = taCenter
        Title.Color = clLime
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'tgljam'
        Title.Alignment = taCenter
        Title.Color = clLime
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'jam'
        Title.Alignment = taCenter
        Title.Color = clLime
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'status'
        Title.Alignment = taCenter
        Title.Color = clLime
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'print'
        Title.Alignment = taCenter
        Title.Color = clLime
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end>
  end
  object Edit1: TEdit
    Left = 8
    Top = 10
    Width = 337
    Height = 21
    TabOrder = 1
  end
  object btnsrc: TButton
    Left = 351
    Top = 8
    Width = 50
    Height = 25
    Caption = 'src'
    TabOrder = 2
    OnClick = btnsrcClick
  end
  object btnConnect: TButton
    Left = 612
    Top = 8
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Connect'
    TabOrder = 3
    OnClick = btnConnectClick
  end
  object Conn: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    HostName = ''
    Port = 0
    Database = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=E:\MEGA\Antrian Gas' +
      ' 3kg Delphi\Win32\Release\database\db.mdb;Persist Security Info=' +
      'False;Jet OLEDB:Database Password=balikpapan'
    User = ''
    Password = ''
    Protocol = 'ado'
    Left = 24
    Top = 8
  end
  object qry: TZQuery
    Connection = Conn
    SQL.Strings = (
      'SELECT * FROM Antrigas_DtAntrian ORDER BY ID DESC')
    Params = <>
    Left = 72
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = qry
    Left = 128
    Top = 8
  end
  object OpenDialog1: TOpenDialog
    Left = 424
  end
end
