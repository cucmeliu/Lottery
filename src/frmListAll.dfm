object ListAllForm: TListAllForm
  Left = 198
  Top = 104
  Width = 768
  Height = 599
  Caption = #25968#23383#21015#34920
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 519
    Width = 760
    Height = 46
    Align = alBottom
    BevelInner = bvSpace
    TabOrder = 0
    object bbtListBase: TBitBtn
      Left = 120
      Top = 8
      Width = 75
      Height = 25
      Caption = #22522#26412#21495
      TabOrder = 0
      OnClick = mnuCalBaseClick
    end
    object bbtListSpec: TBitBtn
      Left = 216
      Top = 8
      Width = 75
      Height = 25
      Caption = #29305#21035#21495
      TabOrder = 1
      OnClick = mnuCalSpecClick
    end
    object bbtListAll: TBitBtn
      Left = 32
      Top = 8
      Width = 75
      Height = 25
      Caption = #25152#26377#21495
      TabOrder = 2
      OnClick = mnuCalAllClick
    end
    object bbtListSunday: TBitBtn
      Left = 304
      Top = 8
      Width = 75
      Height = 25
      Caption = #26143#26399#22825
      TabOrder = 3
      OnClick = mnuCalcSundayClick
    end
  end
  object dg337: TStringGrid
    Left = 0
    Top = 0
    Width = 760
    Height = 519
    Align = alClient
    Color = clActiveCaption
    ColCount = 9
    FixedColor = clGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnMouseMove = dg337MouseMove
    RowHeights = (
      24
      24
      24
      25
      24)
  end
  object MainMenu1: TMainMenu
    Left = 216
    Top = 104
    object C1: TMenuItem
      Caption = #32479#35745'(&C)'
      GroupIndex = 1
      object mnuCalAll: TMenuItem
        Caption = #25152#26377#21495
        OnClick = mnuCalAllClick
      end
      object mnuCalBase: TMenuItem
        Caption = #22522#26412#21495
        OnClick = mnuCalBaseClick
      end
      object mnuCalSpec: TMenuItem
        Caption = #29305#21035#21495
        OnClick = mnuCalSpecClick
      end
      object mnuCalcSunday: TMenuItem
        Caption = #26143#26399#22825
        OnClick = mnuCalcSundayClick
      end
    end
  end
  object ImageList1: TImageList
    Left = 236
    Top = 208
  end
end
