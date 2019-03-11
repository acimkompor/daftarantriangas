object frmUtangDetail: TfrmUtangDetail
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsSingle
  Caption = 'List utang detail'
  ClientHeight = 475
  ClientWidth = 768
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 752
    Height = 145
    Caption = 'Option'
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 54
      Height = 23
      Caption = 'Label1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 24
      Top = 54
      Width = 64
      Height = 13
      Caption = 'Nama Barang'
    end
    object Label3: TLabel
      Left = 408
      Top = 54
      Width = 18
      Height = 13
      Caption = 'Qty'
    end
    object Label4: TLabel
      Left = 576
      Top = 54
      Width = 38
      Height = 13
      Caption = 'Tanggal'
    end
    object Label5: TLabel
      Left = 24
      Top = 81
      Width = 16
      Height = 13
      Caption = 'Ket'
    end
    object Label6: TLabel
      Left = 32
      Top = 120
      Width = 52
      Height = 13
      Caption = 'Total Qty :'
      OnDblClick = Label6DblClick
    end
    object Label7: TLabel
      Left = 90
      Top = 120
      Width = 30
      Height = 13
      Caption = 'lbtotal'
    end
    object Edit2: TEdit
      Left = 448
      Top = 51
      Width = 49
      Height = 21
      NumbersOnly = True
      TabOrder = 0
      Text = '1'
    end
    object DateTimePicker1: TDateTimePicker
      Left = 624
      Top = 51
      Width = 114
      Height = 21
      Date = 43458.000000000000000000
      Format = 'dd/MM/yyyy'
      Time = 0.968358854166581200
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 102
      Top = 78
      Width = 275
      Height = 21
      TabOrder = 2
      Text = 'Edit3'
    end
    object Button1: TButton
      Left = 422
      Top = 96
      Width = 75
      Height = 25
      Caption = 'Simpan'
      TabOrder = 3
      OnClick = Button1Click
    end
    object Button3: TButton
      Left = 584
      Top = 96
      Width = 75
      Height = 25
      Caption = 'Print'
      TabOrder = 4
      OnClick = Button3Click
    end
    object Button2: TButton
      Left = 665
      Top = 96
      Width = 75
      Height = 25
      Caption = 'Bayar'
      TabOrder = 5
      OnClick = Button2Click
    end
    object Button4: TButton
      Left = 503
      Top = 96
      Width = 75
      Height = 25
      Caption = 'Hapus'
      Enabled = False
      TabOrder = 6
      OnClick = Button4Click
    end
  end
  object Grid: TAdvStringGrid
    Left = 0
    Top = 159
    Width = 768
    Height = 316
    Cursor = crDefault
    Align = alBottom
    ColCount = 6
    DrawingStyle = gdsClassic
    FixedCols = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 1
    OnDblClick = GridDblClick
    OnEnter = GridEnter
    OnExit = GridExit
    HoverRowCells = [hcNormal, hcSelected]
    ActiveCellFont.Charset = DEFAULT_CHARSET
    ActiveCellFont.Color = clWindowText
    ActiveCellFont.Height = -11
    ActiveCellFont.Name = 'Tahoma'
    ActiveCellFont.Style = [fsBold]
    ColumnHeaders.Strings = (
      'NO'
      'id'
      'NAMA BARANG'
      'QTY'
      'TANGGAL'
      'KETERANGAN')
    ControlLook.FixedGradientHoverFrom = 13619409
    ControlLook.FixedGradientHoverTo = 12502728
    ControlLook.FixedGradientHoverMirrorFrom = 12502728
    ControlLook.FixedGradientHoverMirrorTo = 11254975
    ControlLook.FixedGradientDownFrom = 8816520
    ControlLook.FixedGradientDownTo = 7568510
    ControlLook.FixedGradientDownMirrorFrom = 7568510
    ControlLook.FixedGradientDownMirrorTo = 6452086
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
    FixedColWidth = 52
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
    Look = glStandard
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
    SearchFooter.Color = clBtnFace
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
    SearchFooter.ResultFormat = '(%d of %d)'
    SelectionColor = clHighlight
    SelectionTextColor = clHighlightText
    SortSettings.DefaultFormat = ssAutomatic
    SortSettings.HeaderColorTo = 16579058
    SortSettings.HeaderMirrorColor = 16380385
    SortSettings.HeaderMirrorColorTo = 16182488
    VAlignment = vtaCenter
    Version = '8.2.4.1'
    ColWidths = (
      52
      3
      292
      57
      114
      133)
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
  object Edit1: TEdit
    Left = 110
    Top = 59
    Width = 275
    Height = 21
    TabOrder = 2
    Text = 'Edit1'
    OnChange = Edit1Change
    OnKeyDown = Edit1KeyDown
  end
  object GridSrc: TAdvStringGrid
    Left = 102
    Top = 81
    Width = 355
    Height = 104
    Cursor = crDefault
    ColCount = 2
    DrawingStyle = gdsClassic
    FixedCols = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 3
    Visible = False
    OnDblClick = GridSrcDblClick
    OnEnter = GridSrcEnter
    OnExit = GridSrcExit
    OnKeyDown = GridSrcKeyDown
    HoverRowCells = [hcNormal, hcSelected]
    ActiveCellFont.Charset = DEFAULT_CHARSET
    ActiveCellFont.Color = clWindowText
    ActiveCellFont.Height = -11
    ActiveCellFont.Name = 'Tahoma'
    ActiveCellFont.Style = [fsBold]
    ColumnHeaders.Strings = (
      'NO'
      'NAMA BARANG')
    ControlLook.FixedGradientHoverFrom = 13619409
    ControlLook.FixedGradientHoverTo = 12502728
    ControlLook.FixedGradientHoverMirrorFrom = 12502728
    ControlLook.FixedGradientHoverMirrorTo = 11254975
    ControlLook.FixedGradientDownFrom = 8816520
    ControlLook.FixedGradientDownTo = 7568510
    ControlLook.FixedGradientDownMirrorFrom = 7568510
    ControlLook.FixedGradientDownMirrorTo = 6452086
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
    FixedColWidth = 36
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
    Look = glStandard
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
    SearchFooter.Color = clBtnFace
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
    SearchFooter.ResultFormat = '(%d of %d)'
    SelectionColor = clHighlight
    SelectionTextColor = clHighlightText
    SortSettings.DefaultFormat = ssAutomatic
    SortSettings.HeaderColorTo = 16579058
    SortSettings.HeaderMirrorColor = 16380385
    SortSettings.HeaderMirrorColorTo = 16182488
    VAlignment = vtaCenter
    Version = '8.2.4.1'
    WordWrap = False
    ColWidths = (
      36
      293)
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
  object qry: TZQuery
    Connection = frmDepan.Conn
    Params = <>
    Left = 424
    Top = 295
  end
  object frxReport1: TfrxReport
    Version = '6.2.11'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43455.681995289300000000
    ReportOptions.LastChange = 43459.445920092600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 392
    Top = 359
    Datasets = <
      item
        DataSet = ListUtang
        DataSetName = 'ListUtang'
      end>
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
      TopMargin = 5.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 86.929190000000000000
        Top = 18.897650000000000000
        Width = 249.448980000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 7.559060000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'NAMA')
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 64.252010000000000000
          Top = 7.559060000000000000
          Width = 7.559060000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            ':')
        end
        object CompoProperty: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 71.811070000000000000
          Top = 7.559060000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[CompoProperty('#39'Label1'#39','#39'caption'#39')]')
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 26.456710000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Tanggal')
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 64.252010000000000000
          Top = 26.456710000000000000
          Width = 7.559060000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            ':')
        end
        object Memo7: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 71.811070000000000000
          Top = 26.456710000000000000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd MMMM yyyy'
          DisplayFormat.Kind = fkDateTime
          Frame.Typ = []
          Memo.UTF8W = (
            '[CompoProperty('#39'DateTimePicker1'#39','#39'Date'#39')]')
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 60.472480000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'QTY')
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Top = 56.692950000000000000
          Width = 249.448980000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 45.354360000000000000
          Top = 60.472480000000000000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'NAMA BARANG')
          ParentFont = False
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Top = 83.149660000000000000
          Width = 249.448980000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 166.299320000000000000
        Width = 249.448980000000000000
        RowCount = 0
        object ListUtangNama_brng: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 45.354360000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Nama_brng'
          DataSet = ListUtang
          DataSetName = 'ListUtang'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ListUtang."Nama_brng"]')
          ParentFont = False
        end
        object ListUtangqty: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 7.559060000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          DataField = 'qty'
          DataSet = ListUtang
          DataSetName = 'ListUtang'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[ListUtang."qty"]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 41.574830000000000000
        Top = 211.653680000000000000
        Width = 249.448980000000000000
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 241.889920000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 26.456710000000000000
          Top = 7.559060000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'TOTAL')
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 120.944960000000000000
          Top = 7.559060000000000000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            ':')
        end
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 132.283550000000000000
          Top = 7.559060000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[SUM(<ListUtang."qty">,MasterData1)] PCS')
          ParentFont = False
        end
      end
    end
  end
  object ListUtang: TfrxDBDataset
    UserName = 'ListUtang'
    CloseDataSource = False
    BCDToCurrency = False
    Left = 440
    Top = 359
  end
end
