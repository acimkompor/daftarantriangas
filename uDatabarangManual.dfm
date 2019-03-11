object frmDatabarangManual: TfrmDatabarangManual
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Daftar Barang'
  ClientHeight = 541
  ClientWidth = 795
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
    Width = 777
    Height = 129
    Caption = 'Form Data Barang'
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 32
      Width = 55
      Height = 15
      Caption = 'ID Barang'
    end
    object Label2: TLabel
      Left = 24
      Top = 61
      Width = 46
      Height = 15
      Caption = 'Barcode'
    end
    object Label3: TLabel
      Left = 248
      Top = 32
      Width = 77
      Height = 15
      Caption = 'Nama Barang'
    end
    object Label4: TLabel
      Left = 248
      Top = 61
      Width = 34
      Height = 15
      Caption = 'Harga'
    end
    object eid: TEdit
      Left = 96
      Top = 29
      Width = 137
      Height = 23
      TabOrder = 0
      Text = 'eid'
    end
    object ebarcode: TEdit
      Left = 96
      Top = 58
      Width = 137
      Height = 23
      TabOrder = 1
      Text = 'ebarcode'
    end
    object enamabarang: TEdit
      Left = 331
      Top = 29
      Width = 374
      Height = 23
      TabOrder = 2
      Text = 'enamabarang'
    end
    object eharga: TEdit
      Left = 331
      Top = 58
      Width = 110
      Height = 23
      Alignment = taRightJustify
      TabOrder = 3
      Text = 'eharga'
      OnChange = ehargaChange
    end
    object btnSimpan: TButton
      Left = 606
      Top = 88
      Width = 75
      Height = 31
      Caption = 'Simpan'
      TabOrder = 4
      OnClick = btnSimpanClick
    end
    object btnHapus: TButton
      Left = 687
      Top = 88
      Width = 75
      Height = 31
      Caption = 'Hapus'
      TabOrder = 5
    end
  end
  object ecari: TEdit
    Left = 8
    Top = 143
    Width = 779
    Height = 23
    TabOrder = 1
    Text = 'ecari'
    OnChange = ecariChange
  end
  object Grid: TAdvStringGrid
    Left = 0
    Top = 172
    Width = 795
    Height = 369
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
    TabOrder = 2
    OnClick = GridClick
    OnDblClick = GridDblClick
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
  object qry: TZQuery
    Connection = frmDepan.Conn
    Params = <>
    Left = 384
    Top = 180
  end
end
