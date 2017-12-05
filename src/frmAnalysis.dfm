object Form1: TForm1
  Left = 342
  Top = 106
  Width = 683
  Height = 599
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 675
    Height = 519
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'TS337'
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 667
        Height = 491
        Align = alClient
        Caption = 'GroupBox1'
        TabOrder = 0
        object Splitter1: TSplitter
          Left = 25
          Top = 15
          Width = 6
          Height = 474
        end
        object dg337: TStringGrid
          Left = 31
          Top = 15
          Width = 634
          Height = 474
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
          TabOrder = 0
          RowHeights = (
            24
            24
            24
            25
            24)
        end
        object RichEdit1: TRichEdit
          Left = 2
          Top = 15
          Width = 23
          Height = 474
          Align = alLeft
          Color = clCream
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 1
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 519
    Width = 675
    Height = 46
    Align = alBottom
    BevelInner = bvSpace
    TabOrder = 1
    object bbtListBase: TBitBtn
      Left = 192
      Top = 8
      Width = 75
      Height = 25
      Caption = #22522#26412#21495
      TabOrder = 0
    end
    object bbtListSpec: TBitBtn
      Left = 288
      Top = 8
      Width = 75
      Height = 25
      Caption = #29305#21035#21495
      TabOrder = 1
    end
    object bbtListAll: TBitBtn
      Left = 104
      Top = 8
      Width = 75
      Height = 25
      Caption = #25152#26377#21495
      TabOrder = 2
    end
    object editCmd: TEdit
      Left = 400
      Top = 0
      Width = 225
      Height = 21
      TabOrder = 3
    end
    object cbbCommand: TComboBox
      Left = 400
      Top = 24
      Width = 225
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 4
      Text = 'load'
      Items.Strings = (
        'load'
        'all'
        'base'
        'spec')
    end
    object BitBtn1: TBitBtn
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = #35835#35760#24405
      TabOrder = 5
    end
  end
end
