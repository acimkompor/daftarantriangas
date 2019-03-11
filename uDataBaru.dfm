object frmDataBaru: TfrmDataBaru
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Input Data Baru'
  ClientHeight = 603
  ClientWidth = 957
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
    Width = 941
    Height = 177
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 23
      Width = 42
      Height = 15
      Caption = 'No KTP'
    end
    object Label2: TLabel
      Left = 32
      Top = 52
      Width = 34
      Height = 15
      Caption = 'Nama'
    end
    object Label3: TLabel
      Left = 32
      Top = 82
      Width = 72
      Height = 15
      Caption = 'Tempat Lahir'
    end
    object Label4: TLabel
      Left = 32
      Top = 111
      Width = 75
      Height = 15
      Caption = 'Tanggal Lahir'
    end
    object Label5: TLabel
      Left = 32
      Top = 139
      Width = 38
      Height = 15
      Caption = 'Alamat'
    end
    object Label6: TLabel
      Left = 439
      Top = 139
      Width = 15
      Height = 15
      Caption = 'Rt.'
    end
    object btnSimpan: TButton
      Left = 560
      Top = 7
      Width = 86
      Height = 30
      Caption = 'Simpan'
      TabOrder = 0
      OnClick = btnSimpanClick
    end
    object ektp: TEdit
      Left = 144
      Top = 20
      Width = 194
      Height = 23
      CharCase = ecUpperCase
      TabOrder = 1
      Text = 'EKTP'
    end
    object enama: TEdit
      Left = 144
      Top = 49
      Width = 329
      Height = 23
      CharCase = ecUpperCase
      TabOrder = 2
      Text = 'ENAMA'
    end
    object etempatlahir: TEdit
      Left = 144
      Top = 78
      Width = 194
      Height = 23
      CharCase = ecUpperCase
      TabOrder = 3
      Text = 'ETEMPATLAHIR'
    end
    object dtpLahir: TDateTimePicker
      Left = 144
      Top = 107
      Width = 186
      Height = 23
      Date = 43412.870183043980000000
      Format = 'dd-MMM-yyyy'
      Time = 43412.870183043980000000
      TabOrder = 4
    end
    object ealamat: TEdit
      Left = 144
      Top = 136
      Width = 289
      Height = 23
      CharCase = ecUpperCase
      TabOrder = 5
      Text = 'EALAMAT'
    end
    object ert: TEdit
      Left = 460
      Top = 136
      Width = 45
      Height = 23
      TabOrder = 6
      Text = 'ert'
    end
    object btnHapus: TButton
      Left = 560
      Top = 43
      Width = 86
      Height = 30
      Caption = 'Delete'
      TabOrder = 7
      OnClick = btnHapusClick
    end
    object btnExit: TButton
      Left = 560
      Top = 133
      Width = 86
      Height = 30
      Caption = 'Keluar'
      TabOrder = 8
      OnClick = btnExitClick
    end
    object Button1: TButton
      Left = 560
      Top = 79
      Width = 86
      Height = 30
      Caption = 'Refresh'
      TabOrder = 9
      OnClick = Button1Click
    end
  end
  object Grid: TAdvStringGrid
    Left = 0
    Top = 224
    Width = 957
    Height = 379
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
    OnDblClick = GridDblClick
    OnEnter = GridEnter
    OnExit = GridExit
    GridLineColor = 15855083
    GridFixedLineColor = 13745060
    HoverRowCells = [hcNormal, hcSelected]
    ActiveCellFont.Charset = DEFAULT_CHARSET
    ActiveCellFont.Color = clWindowText
    ActiveCellFont.Height = -11
    ActiveCellFont.Name = 'Tahoma'
    ActiveCellFont.Style = [fsBold]
    ActiveCellColor = 10344697
    ActiveCellColorTo = 6210033
    ControlLook.FixedGradientFrom = 16513526
    ControlLook.FixedGradientTo = 15260626
    ControlLook.FixedGradientHoverFrom = 15000287
    ControlLook.FixedGradientHoverTo = 14406605
    ControlLook.FixedGradientHoverMirrorFrom = 14406605
    ControlLook.FixedGradientHoverMirrorTo = 13813180
    ControlLook.FixedGradientHoverBorder = 12033927
    ControlLook.FixedGradientDownFrom = 14991773
    ControlLook.FixedGradientDownTo = 14991773
    ControlLook.FixedGradientDownMirrorFrom = 14991773
    ControlLook.FixedGradientDownMirrorTo = 14991773
    ControlLook.FixedGradientDownBorder = 14991773
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
    Look = glOffice2007
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
    SearchFooter.Color = 16513526
    SearchFooter.ColorTo = clNone
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
    SelectionColor = 6210033
    SortSettings.DefaultFormat = ssAutomatic
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
  object eCari: TEdit
    Left = 8
    Top = 194
    Width = 941
    Height = 23
    TabOrder = 2
    Text = 'eCari'
    OnChange = eCariChange
  end
  object qry: TZQuery
    Connection = frmDepan.Conn
    Params = <>
    Left = 160
    Top = 248
  end
end
