object ParamForm: TParamForm
  Left = 324
  Top = 210
  BorderStyle = bsDialog
  Caption = #21442#25968#35774#32622
  ClientHeight = 290
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label9: TLabel
    Left = 16
    Top = 16
    Width = 113
    Height = 13
    AutoSize = False
    Caption = #27599#20010#24490#29615#30340#34892#25968
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 40
    Width = 185
    Height = 97
    Caption = #26399#21495
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 49
      Height = 13
      AutoSize = False
      Caption = #25152#22312#34892
    end
    object Label2: TLabel
      Left = 16
      Top = 48
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #36215#22987#26631#24535
    end
    object Label3: TLabel
      Left = 16
      Top = 72
      Width = 49
      Height = 13
      AutoSize = False
      Caption = #20301#25968
    end
    object eSStart: TEdit
      Left = 80
      Top = 40
      Width = 81
      Height = 21
      TabOrder = 0
      Text = '2004'
    end
    object eSLine: TSpinEdit
      Left = 80
      Top = 16
      Width = 81
      Height = 22
      MaxValue = 1000
      MinValue = 1
      TabOrder = 1
      Value = 1
    end
    object eSNumber: TSpinEdit
      Left = 80
      Top = 64
      Width = 81
      Height = 22
      MaxValue = 1000
      MinValue = 1
      TabOrder = 2
      Value = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 200
    Top = 40
    Width = 185
    Height = 97
    Caption = #22522#21495
    TabOrder = 1
    object Label4: TLabel
      Left = 16
      Top = 24
      Width = 49
      Height = 13
      AutoSize = False
      Caption = #25152#22312#34892
    end
    object Label5: TLabel
      Left = 16
      Top = 48
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #36215#22987#26631#24535
    end
    object Label6: TLabel
      Left = 16
      Top = 72
      Width = 49
      Height = 13
      AutoSize = False
      Caption = #20010#25968
    end
    object eBStart: TEdit
      Left = 80
      Top = 40
      Width = 81
      Height = 21
      TabOrder = 0
      Text = #22522#26412#21495
    end
    object eBLine: TSpinEdit
      Left = 80
      Top = 16
      Width = 81
      Height = 22
      MaxValue = 1000
      MinValue = 1
      TabOrder = 1
      Value = 1
    end
    object eBNumber: TSpinEdit
      Left = 80
      Top = 64
      Width = 81
      Height = 22
      MaxValue = 1000
      MinValue = 1
      TabOrder = 2
      Value = 1
    end
  end
  object cbHaveSpec: TCheckBox
    Left = 16
    Top = 152
    Width = 121
    Height = 17
    Caption = #26159#21542#26377#29305#21035#21495
    TabOrder = 2
    OnClick = cbHaveSpecClick
  end
  object gbSpec: TGroupBox
    Left = 8
    Top = 168
    Width = 185
    Height = 73
    Caption = #29305#21035#21495
    Enabled = False
    TabOrder = 3
    object Label7: TLabel
      Left = 16
      Top = 24
      Width = 49
      Height = 13
      AutoSize = False
      Caption = #25152#22312#34892
    end
    object Label8: TLabel
      Left = 16
      Top = 48
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #36215#22987#26631#24535
    end
    object eSpStart: TEdit
      Left = 80
      Top = 40
      Width = 81
      Height = 21
      TabOrder = 0
      Text = #29305#21035#21495
    end
    object eSpLine: TSpinEdit
      Left = 80
      Top = 16
      Width = 81
      Height = 22
      MaxValue = 1000
      MinValue = 1
      TabOrder = 1
      Value = 1
    end
  end
  object gbSunday: TGroupBox
    Left = 200
    Top = 168
    Width = 185
    Height = 73
    Caption = #26143#26399#22825#21495
    Enabled = False
    TabOrder = 5
    object Label10: TLabel
      Left = 16
      Top = 24
      Width = 49
      Height = 13
      AutoSize = False
      Caption = #25152#22312#34892
    end
    object Label11: TLabel
      Left = 16
      Top = 48
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #36215#22987#26631#24535
    end
    object eSuStart: TEdit
      Left = 80
      Top = 40
      Width = 81
      Height = 21
      TabOrder = 0
      Text = #26143#26399#22825
    end
    object eSuLine: TSpinEdit
      Left = 80
      Top = 16
      Width = 81
      Height = 22
      MaxValue = 1000
      MinValue = 1
      TabOrder = 1
      Value = 1
    end
  end
  object cbHaveSunday: TCheckBox
    Left = 208
    Top = 152
    Width = 129
    Height = 17
    Caption = #26159#21542#26377#26143#26399#22825#21495
    TabOrder = 4
    OnClick = cbHaveSundayClick
  end
  object BitBtn1: TBitBtn
    Left = 104
    Top = 256
    Width = 75
    Height = 25
    TabOrder = 6
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 208
    Top = 256
    Width = 75
    Height = 25
    TabOrder = 7
    Kind = bkCancel
  end
  object eLineCycle: TSpinEdit
    Left = 120
    Top = 8
    Width = 121
    Height = 22
    MaxValue = 1000
    MinValue = 1
    TabOrder = 8
    Value = 1
  end
end
