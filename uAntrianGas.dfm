object frmAntrian: TfrmAntrian
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Form Antrian Gas 3KG'
  ClientHeight = 647
  ClientWidth = 944
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  DesignSize = (
    944
    647)
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 600
    Width = 944
    Height = 47
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label8: TLabel
      Left = 8
      Top = 16
      Width = 93
      Height = 15
      Caption = 'TOTAL ANTRIAN:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbAntrian: TLabel
      Left = 109
      Top = 14
      Width = 9
      Height = 18
      Caption = '0'
    end
    object Label10: TLabel
      Left = 180
      Top = 16
      Width = 90
      Height = 15
      Caption = 'TOTAL DIAMBIL:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbambil: TLabel
      Left = 277
      Top = 14
      Width = 9
      Height = 18
      Caption = '0'
    end
    object Label12: TLabel
      Left = 376
      Top = 16
      Width = 93
      Height = 15
      Caption = 'BELUM DIAMBIL:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbBelum: TLabel
      Left = 477
      Top = 13
      Width = 9
      Height = 18
      Caption = '0'
    end
    object Label14: TLabel
      Left = 643
      Top = 16
      Width = 51
      Height = 15
      Caption = 'DICETAK:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbcetak: TLabel
      Left = 702
      Top = 13
      Width = 9
      Height = 18
      Caption = '0'
    end
  end
  object Grid: TAdvStringGrid
    Left = 0
    Top = 208
    Width = 944
    Height = 392
    Cursor = crDefault
    Align = alBottom
    DrawingStyle = gdsClassic
    FixedCols = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 1
    OnClick = GridClick
    OnDrawCell = GridDrawCell
    OnEnter = GridEnter
    OnExit = GridExit
    GridLineColor = 15527152
    GridFixedLineColor = 13947601
    HoverRowCells = [hcNormal, hcSelected]
    ActiveCellFont.Charset = DEFAULT_CHARSET
    ActiveCellFont.Color = clWindowText
    ActiveCellFont.Height = -11
    ActiveCellFont.Name = 'Tahoma'
    ActiveCellFont.Style = [fsBold]
    ActiveCellColor = 16575452
    ActiveCellColorTo = 16571329
    ControlLook.FixedGradientMirrorFrom = 16049884
    ControlLook.FixedGradientMirrorTo = 16247261
    ControlLook.FixedGradientHoverFrom = 16710648
    ControlLook.FixedGradientHoverTo = 16446189
    ControlLook.FixedGradientHoverMirrorFrom = 16049367
    ControlLook.FixedGradientHoverMirrorTo = 15258305
    ControlLook.FixedGradientDownFrom = 15853789
    ControlLook.FixedGradientDownTo = 15852760
    ControlLook.FixedGradientDownMirrorFrom = 15522767
    ControlLook.FixedGradientDownMirrorTo = 15588559
    ControlLook.FixedGradientDownBorder = 14007466
    ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
    ControlLook.DropDownHeader.Font.Color = clWindowText
    ControlLook.DropDownHeader.Font.Height = -11
    ControlLook.DropDownHeader.Font.Name = 'Tahoma'
    ControlLook.DropDownHeader.Font.Style = []
    ControlLook.DropDownHeader.Visible = True
    ControlLook.DropDownHeader.Buttons = <>
    ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
    ControlLook.DropDownFooter.Font.Color = clWindowText
    ControlLook.DropDownFooter.Font.Height = -11
    ControlLook.DropDownFooter.Font.Name = 'Tahoma'
    ControlLook.DropDownFooter.Font.Style = []
    ControlLook.DropDownFooter.Visible = True
    ControlLook.DropDownFooter.Buttons = <>
    DefaultAlignment = taCenter
    Filter = <>
    FilterDropDown.Font.Charset = DEFAULT_CHARSET
    FilterDropDown.Font.Color = clWindowText
    FilterDropDown.Font.Height = -11
    FilterDropDown.Font.Name = 'Tahoma'
    FilterDropDown.Font.Style = []
    FilterDropDown.TextChecked = 'Checked'
    FilterDropDown.TextUnChecked = 'Unchecked'
    FilterDropDownClear = '(All)'
    FilterEdit.TypeNames.Strings = (
      'Starts with'
      'Ends with'
      'Contains'
      'Not contains'
      'Equal'
      'Not equal'
      'Larger than'
      'Smaller than'
      'Clear')
    FixedRowHeight = 22
    FixedRowAlways = True
    FixedFont.Charset = DEFAULT_CHARSET
    FixedFont.Color = clBlack
    FixedFont.Height = -11
    FixedFont.Name = 'Tahoma'
    FixedFont.Style = [fsBold]
    FloatFormat = '%.2f'
    HoverButtons.Buttons = <>
    HoverButtons.Position = hbLeftFromColumnLeft
    HTMLSettings.ImageFolder = 'images'
    HTMLSettings.ImageBaseName = 'img'
    Look = glWin7
    PrintSettings.DateFormat = 'dd/mm/yyyy'
    PrintSettings.Font.Charset = DEFAULT_CHARSET
    PrintSettings.Font.Color = clWindowText
    PrintSettings.Font.Height = -11
    PrintSettings.Font.Name = 'Tahoma'
    PrintSettings.Font.Style = []
    PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
    PrintSettings.FixedFont.Color = clWindowText
    PrintSettings.FixedFont.Height = -11
    PrintSettings.FixedFont.Name = 'Tahoma'
    PrintSettings.FixedFont.Style = []
    PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
    PrintSettings.HeaderFont.Color = clWindowText
    PrintSettings.HeaderFont.Height = -11
    PrintSettings.HeaderFont.Name = 'Tahoma'
    PrintSettings.HeaderFont.Style = []
    PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
    PrintSettings.FooterFont.Color = clWindowText
    PrintSettings.FooterFont.Height = -11
    PrintSettings.FooterFont.Name = 'Tahoma'
    PrintSettings.FooterFont.Style = []
    PrintSettings.PageNumSep = '/'
    SearchFooter.Color = 16645370
    SearchFooter.ColorTo = 16247261
    SearchFooter.FindNextCaption = 'Find &next'
    SearchFooter.FindPrevCaption = 'Find &previous'
    SearchFooter.Font.Charset = DEFAULT_CHARSET
    SearchFooter.Font.Color = clWindowText
    SearchFooter.Font.Height = -11
    SearchFooter.Font.Name = 'Tahoma'
    SearchFooter.Font.Style = []
    SearchFooter.HighLightCaption = 'Highlight'
    SearchFooter.HintClose = 'Close'
    SearchFooter.HintFindNext = 'Find next occurrence'
    SearchFooter.HintFindPrev = 'Find previous occurrence'
    SearchFooter.HintHighlight = 'Highlight occurrences'
    SearchFooter.MatchCaseCaption = 'Match case'
    SortSettings.DefaultFormat = ssAutomatic
    SortSettings.HeaderColor = 16579058
    SortSettings.HeaderColorTo = 16579058
    SortSettings.HeaderMirrorColor = 16380385
    SortSettings.HeaderMirrorColorTo = 16182488
    Version = '8.1.3.0'
    ColWidths = (
      64
      64
      64
      64
      64)
    RowHeights = (
      22
      22
      22
      22
      22
      22
      22
      22
      22
      22)
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 152
    Width = 928
    Height = 50
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Search'
    TabOrder = 2
    object ecari: TEdit
      Left = 16
      Top = 18
      Width = 593
      Height = 23
      TabOrder = 0
      Text = 'eCari'
      OnChange = ecariChange
    end
    object dtpTgl: TDateTimePicker
      Left = 635
      Top = 18
      Width = 186
      Height = 23
      Date = 43413.018075497680000000
      Format = 'dd MMM yyyy'
      Time = 43413.018075497680000000
      TabOrder = 1
      OnChange = dtpTglChange
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 8
    Width = 505
    Height = 145
    Caption = 'Masukkan Antrian'
    TabOrder = 3
    object Label1: TLabel
      Left = 24
      Top = 40
      Width = 142
      Height = 15
      Caption = 'Masukkan No KTP  [Enter]'
    end
    object Label2: TLabel
      Left = 24
      Top = 69
      Width = 70
      Height = 15
      Caption = 'Tanggal Antri'
    end
    object Label3: TLabel
      Left = 24
      Top = 106
      Width = 133
      Height = 15
      Caption = 'Durasi Pengecekan hari'
    end
    object Label6: TLabel
      Left = 446
      Top = 106
      Width = 59
      Height = 32
      AutoSize = False
      OnDblClick = Label6DblClick
    end
    object RadioButton1: TRadioButton
      Left = 184
      Top = 106
      Width = 33
      Height = 17
      Caption = '1'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object RadioButton2: TRadioButton
      Left = 223
      Top = 106
      Width = 34
      Height = 17
      Caption = '2'
      TabOrder = 1
    end
    object RadioButton3: TRadioButton
      Left = 263
      Top = 106
      Width = 26
      Height = 17
      Caption = '3'
      TabOrder = 2
    end
    object RadioButton4: TRadioButton
      Left = 304
      Top = 106
      Width = 33
      Height = 17
      Caption = '4'
      TabOrder = 3
    end
    object dtpAntri: TDateTimePicker
      Left = 184
      Top = 61
      Width = 153
      Height = 23
      Date = 43412.999060173610000000
      Format = 'dd MMM yyyy'
      Time = 43412.999060173610000000
      TabOrder = 4
      OnChange = dtpAntriChange
    end
    object ektp: TEdit
      Left = 184
      Top = 32
      Width = 257
      Height = 23
      TabOrder = 5
      Text = 'ektp'
      OnKeyPress = ektpKeyPress
    end
    object btnAdd: TButton
      Left = 446
      Top = 31
      Width = 47
      Height = 25
      Caption = 'Add'
      TabOrder = 6
      OnClick = btnAddClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 519
    Top = 8
    Width = 417
    Height = 145
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Pengambilan Gas'
    TabOrder = 4
    object Label4: TLabel
      Left = 64
      Top = 35
      Width = 137
      Height = 15
      Caption = 'Masukkan Nomor Antrian'
    end
    object Label5: TLabel
      Left = 312
      Top = 35
      Width = 87
      Height = 15
      Caption = '5 Angka terakhir'
    end
    object Label7: TLabel
      Left = 368
      Top = 96
      Width = 49
      Height = 46
      AutoSize = False
      OnDblClick = Label7DblClick
    end
    object eNoantrian: TEdit
      Left = 216
      Top = 32
      Width = 90
      Height = 23
      MaxLength = 5
      TabOrder = 0
      Text = 'eNoantrian'
      OnKeyPress = eNoantrianKeyPress
    end
    object btnCetak_ulang: TButton
      Left = 21
      Top = 98
      Width = 97
      Height = 33
      Caption = 'Cetak Ulang'
      TabOrder = 1
      OnClick = btnCetak_ulangClick
    end
    object btnHapus: TButton
      Left = 124
      Top = 98
      Width = 97
      Height = 33
      Caption = 'Hapus'
      TabOrder = 2
      OnClick = btnHapusClick
    end
    object btnPrintReport: TButton
      Left = 227
      Top = 98
      Width = 97
      Height = 33
      Caption = 'Print Report'
      TabOrder = 3
      OnClick = btnPrintReportClick
    end
  end
  object qry: TZQuery
    Connection = frmDepan.Conn
    Params = <>
    Left = 344
    Top = 120
  end
  object frxReport1: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43413.919393865740000000
    ReportOptions.LastChange = 43413.926287800920000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 384
    Top = 112
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 76.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 2321
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object BarCode1: TfrxBarCodeView
        Left = 68.031540000000000000
        Top = 34.015770000000000000
        Width = 103.000000000000000000
        Height = 18.897650000000000000
        BarType = bcCodeEAN13
        Rotation = 0
        Text = '12345678'
        WideBarRatio = 2.000000000000000000
        Zoom = 1.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = qry
    BCDToCurrency = False
    Left = 464
    Top = 168
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    DataSet = qry
    BCDToCurrency = False
    Left = 536
    Top = 168
  end
end
