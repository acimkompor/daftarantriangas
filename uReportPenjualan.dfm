object frmReportPenjualan: TfrmReportPenjualan
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsSingle
  Caption = 'Report Penjualan'
  ClientHeight = 450
  ClientWidth = 580
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
    Left = 264
    Top = 32
    Width = 23
    Height = 13
    Caption = 'Kasir'
  end
  object Label2: TLabel
    Left = 24
    Top = 32
    Width = 38
    Height = 13
    Caption = 'Tanggal'
  end
  object lbTotal: TLabel
    Left = 24
    Top = 117
    Width = 32
    Height = 13
    Caption = 'lbTotal'
  end
  object cb1: TComboBox
    Left = 293
    Top = 29
    Width = 145
    Height = 22
    Style = csOwnerDrawFixed
    TabOrder = 0
  end
  object dtp1: TDateTimePicker
    Left = 80
    Top = 29
    Width = 153
    Height = 21
    Date = 43457.000000000000000000
    Format = 'dd MMMM yyyy'
    Time = 0.614906203700229500
    TabOrder = 1
    OnChange = dtp1Change
  end
  object Button1: TButton
    Left = 461
    Top = 27
    Width = 75
    Height = 25
    Caption = 'Tampil'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 461
    Top = 58
    Width = 75
    Height = 25
    Caption = 'Print'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Grid: TAdvStringGrid
    Left = 0
    Top = 136
    Width = 580
    Height = 314
    Cursor = crDefault
    Align = alBottom
    ColCount = 4
    DrawingStyle = gdsClassic
    FixedCols = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 4
    HoverRowCells = [hcNormal, hcSelected]
    ActiveCellFont.Charset = DEFAULT_CHARSET
    ActiveCellFont.Color = clWindowText
    ActiveCellFont.Height = -11
    ActiveCellFont.Name = 'Tahoma'
    ActiveCellFont.Style = [fsBold]
    ColumnHeaders.Strings = (
      'NO'
      'NAMA BARANG'
      'QTY'
      'JUMLAH')
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
    FixedColWidth = 45
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
      45
      290
      112
      69)
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
  object Button3: TButton
    Left = 461
    Top = 89
    Width = 75
    Height = 25
    Caption = 'Design'
    TabOrder = 5
    OnClick = Button3Click
  end
  object qry: TZQuery
    Connection = frmDepan.Conn
    Params = <>
    Left = 72
    Top = 64
  end
end
