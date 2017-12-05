object StatForm: TStatForm
  Left = 244
  Top = 151
  Width = 696
  Height = 480
  Caption = #35268#24459#32479#35745
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
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 97
    Height = 446
    Align = alLeft
    TabOrder = 0
    object Memo1: TMemo
      Left = 2
      Top = 355
      Width = 93
      Height = 89
      Align = alBottom
      Color = clMenuBar
      Lines.Strings = (
        #25552#31034#65306#20174#19978#38754#30340
        #25968#23383#21015#34920#20013#36873#25321
        #35201#35266#23519#30340#25968#23383#65292
        #21452#20987#21363#21487#26174#31034#20986
        #35813#25968#23383#30340#25240#32447#22270)
      ReadOnly = True
      TabOrder = 0
    end
    object Panel1: TPanel
      Left = 2
      Top = 15
      Width = 93
      Height = 50
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Label2: TLabel
        Left = 0
        Top = 0
        Width = 93
        Height = 13
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = #32479#35745#31867#22411
      end
      object cbbStatType: TComboBox
        Left = 0
        Top = 20
        Width = 89
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 0
        Text = #25152#26377#21495
        OnChange = cbbStatTypeChange
        Items.Strings = (
          #25152#26377#21495
          #22522#26412#21495)
      end
    end
    object Panel2: TPanel
      Left = 2
      Top = 65
      Width = 93
      Height = 290
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object Label1: TLabel
        Left = 0
        Top = 0
        Width = 93
        Height = 13
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = #25968#23383#21015#34920
      end
      object lbStatList: TListBox
        Left = 0
        Top = 13
        Width = 93
        Height = 277
        Align = alClient
        ItemHeight = 13
        TabOrder = 0
        OnDblClick = lbStatListDblClick
        OnMouseMove = lbStatListMouseMove
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 296
    Top = 88
    object piPan: TMenuItem
      Caption = #24179#31227'(&M)'
      OnClick = piPanClick
    end
    object piZoomIn: TMenuItem
      Caption = #25918#22823'(&Z)'
      OnClick = piZoomInClick
    end
    object piZoomOut: TMenuItem
      Caption = #32553#23567'(&O)'
      OnClick = piZoomOutClick
    end
    object piZoomMin: TMenuItem
      Caption = #26368#23567
      OnClick = piZoomMinClick
    end
    object piZoomMax: TMenuItem
      Caption = #26368#22823
      OnClick = piZoomMaxClick
    end
  end
end
