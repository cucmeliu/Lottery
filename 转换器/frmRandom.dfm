object RandomForm: TRandomForm
  Left = 390
  Top = 108
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #38543#26426#25968#29983#25104
  ClientHeight = 478
  ClientWidth = 234
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 234
    Height = 49
    Align = alTop
    Caption = #22522#26412#21495
    TabOrder = 0
    object Label1: TLabel
      Left = 88
      Top = 24
      Width = 17
      Height = 13
      AutoSize = False
      Caption = #21040
    end
    object Label2: TLabel
      Left = 16
      Top = 24
      Width = 33
      Height = 13
      AutoSize = False
      Caption = #33539#22260
    end
    object Label3: TLabel
      Left = 160
      Top = 24
      Width = 32
      Height = 13
      AutoSize = False
      Caption = #20010#25968
    end
    object seEnd: TSpinEdit
      Left = 104
      Top = 16
      Width = 49
      Height = 22
      MaxValue = 100
      MinValue = 0
      TabOrder = 0
      Value = 33
    end
    object seStart: TSpinEdit
      Left = 40
      Top = 16
      Width = 49
      Height = 22
      MaxValue = 100
      MinValue = 0
      TabOrder = 1
      Value = 1
    end
    object seNum: TSpinEdit
      Left = 184
      Top = 16
      Width = 41
      Height = 22
      MaxValue = 100
      MinValue = 0
      TabOrder = 2
      Value = 7
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 49
    Width = 234
    Height = 49
    Align = alTop
    Caption = #29305#21035#21495
    TabOrder = 1
    object Label4: TLabel
      Left = 88
      Top = 24
      Width = 25
      Height = 13
      AutoSize = False
      Caption = #21040
    end
    object Label5: TLabel
      Left = 16
      Top = 24
      Width = 41
      Height = 13
      AutoSize = False
      Caption = #33539#22260
    end
    object seSpecEnd: TSpinEdit
      Left = 104
      Top = 16
      Width = 49
      Height = 22
      MaxValue = 100
      MinValue = 0
      TabOrder = 0
      Value = 16
    end
    object seSpecStart: TSpinEdit
      Left = 40
      Top = 16
      Width = 49
      Height = 22
      MaxValue = 100
      MinValue = 0
      TabOrder = 1
      Value = 1
    end
    object btnGenerate: TButton
      Left = 160
      Top = 16
      Width = 65
      Height = 25
      Caption = #29983#25104#19968#27425
      TabOrder = 2
      OnClick = btnGenerateClick
    end
  end
  object ListBox1: TListBox
    Left = 0
    Top = 145
    Width = 234
    Height = 292
    Align = alClient
    ItemHeight = 13
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 0
    Top = 437
    Width = 234
    Height = 41
    Align = alBottom
    TabOrder = 3
    object Button3: TButton
      Left = 72
      Top = 8
      Width = 75
      Height = 25
      Caption = #20445#23384
      TabOrder = 0
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 152
      Top = 8
      Width = 75
      Height = 25
      Caption = #20851#38381
      TabOrder = 1
      OnClick = Button4Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 98
    Width = 234
    Height = 47
    Align = alTop
    TabOrder = 4
    object Label6: TLabel
      Left = 16
      Top = 24
      Width = 32
      Height = 13
      AutoSize = False
      Caption = #27425#25968
    end
    object SpeedButton1: TSpeedButton
      Left = 200
      Top = 16
      Width = 23
      Height = 22
      Caption = #28165
      OnClick = SpeedButton1Click
    end
    object seTimes: TSpinEdit
      Left = 40
      Top = 16
      Width = 73
      Height = 22
      MaxValue = 100000
      MinValue = 1
      TabOrder = 0
      Value = 10
    end
    object Button1: TButton
      Left = 120
      Top = 16
      Width = 75
      Height = 25
      Caption = #29983#25104
      TabOrder = 1
      OnClick = Button1Click
    end
  end
end
