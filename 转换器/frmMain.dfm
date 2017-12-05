object MainForm: TMainForm
  Left = 333
  Top = 132
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25968#25454#36716#25442
  ClientHeight = 536
  ClientWidth = 420
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RichEdit1: TRichEdit
    Left = 0
    Top = 113
    Width = 420
    Height = 404
    Align = alClient
    Color = clBtnFace
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu1
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
    OnChange = RichEdit1Change
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 420
    Height = 113
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 52
      Height = 13
      AutoSize = False
      Caption = #28304#25991#20214
    end
    object eInFile: TEdit
      Left = 56
      Top = 8
      Width = 217
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object PageControl1: TPageControl
      Left = 1
      Top = 39
      Width = 418
      Height = 73
      ActivePage = TabSheet3
      Align = alBottom
      TabOrder = 1
      object TabSheet4: TTabSheet
        Caption = #36890#29992#26041#27861
        ImageIndex = 3
        object Label4: TLabel
          Left = 0
          Top = 32
          Width = 144
          Height = 13
          Align = alBottom
          Caption = #20026#35268#21017#24490#29615#30340#25968#25454#25552#20379#36716#25442
        end
        object btnConvert: TButton
          Left = 8
          Top = 4
          Width = 75
          Height = 25
          Caption = #36716#25442
          TabOrder = 0
          OnClick = btnConvertClick
        end
      end
      object TabSheet2: TTabSheet
        Caption = #36890#29992#25805#20316
        ParentShowHint = False
        ShowHint = False
        object Label3: TLabel
          Left = 0
          Top = 32
          Width = 135
          Height = 13
          Align = alBottom
          Caption = #25552#20379#27604#36739#24120#29992#30340#22522#26412#25805#20316' '
        end
        object bbtTrimNoNum: TBitBtn
          Left = 168
          Top = 4
          Width = 75
          Height = 25
          Hint = #21435#25481#38750#25968#23383#30340#23383#31526'('#22914#20840#35282#30340#31354#26684')'#65292#29992#31354#26684#20195#26367
          Caption = #21435#38750#25968#23383
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object bbtReverse: TBitBtn
          Left = 88
          Top = 4
          Width = 75
          Height = 25
          Hint = #23558#26399#21495#30340#39034#24207#21453#36716
          Caption = #21453#24207
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
        object btnSBC2DBC: TButton
          Left = 8
          Top = 4
          Width = 75
          Height = 25
          Hint = #23558#20840#35282#25968#23383#36716#20026#21322#35282
          Caption = #20840#35282' - '#21322#35282
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = btnSBC2DBCClick
        end
        object Button4: TButton
          Left = 248
          Top = 4
          Width = 75
          Height = 25
          Caption = #25991#20214#21512#24182
          TabOrder = 3
        end
      end
      object TabSheet3: TTabSheet
        Caption = #23567#24037#20855
        ImageIndex = 3
        object btnQJ2BJ: TButton
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          Caption = #20840'/'#21322#35282
          TabOrder = 0
          OnClick = btnQJ2BJClick
        end
        object btnRandom: TButton
          Left = 96
          Top = 8
          Width = 75
          Height = 25
          Caption = #38543#26426#25968
          TabOrder = 1
          OnClick = btnRandomClick
        end
      end
      object TabSheet1: TTabSheet
        Caption = #27969#25805#20316
        ImageIndex = 3
        object btnStreamRead: TButton
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          Caption = #35835#27969
          TabOrder = 0
          OnClick = btnStreamReadClick
        end
        object btnStreamWrite: TButton
          Left = 96
          Top = 8
          Width = 75
          Height = 25
          Caption = #20889#27969
          TabOrder = 1
          OnClick = btnStreamWriteClick
        end
      end
    end
    object GroupBox1: TGroupBox
      Left = 280
      Top = 1
      Width = 139
      Height = 38
      Align = alRight
      TabOrder = 2
      object btnExit: TSpeedButton
        Left = 106
        Top = 11
        Width = 23
        Height = 22
        Hint = #36864#20986
        Caption = #36864
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btnExitClick
      end
      object btnClear: TSpeedButton
        Left = 82
        Top = 11
        Width = 23
        Height = 22
        Hint = #28165#31354#26174#31034#21306
        Caption = #28165
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btnClearClick
      end
      object btnSave: TSpeedButton
        Left = 34
        Top = 11
        Width = 23
        Height = 22
        Hint = #20445#23384
        Caption = #23384
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btnSaveClick
      end
      object sbIn: TSpeedButton
        Left = 10
        Top = 11
        Width = 23
        Height = 22
        Hint = #35835#21462
        Caption = #21462
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = sbInClick
      end
      object btnSaveAs: TSpeedButton
        Left = 57
        Top = 11
        Width = 23
        Height = 22
        Hint = #21478#23384#20026
        Caption = #21478
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Visible = False
        OnClick = btnSaveAsClick
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 517
    Width = 420
    Height = 19
    Panels = <
      item
        Width = 80
      end
      item
        Width = 80
      end
      item
        Width = 80
      end
      item
        Width = 50
      end>
  end
  object PopupMenu1: TPopupMenu
    Left = 40
    Top = 120
    object pmiSearch: TMenuItem
      Caption = #26597#25214
      OnClick = pmiSearchClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object pmiSelAll: TMenuItem
      Caption = #20840#36873
      OnClick = pmiSelAllClick
    end
    object pmiCopy: TMenuItem
      Caption = #22797#21046
      OnClick = pmiCopyClick
    end
  end
  object FindDialog1: TFindDialog
    OnFind = FindDialog1Find
    Left = 8
    Top = 120
  end
end
