object StatGraphiForm: TStatGraphiForm
  Left = 225
  Top = 162
  Width = 696
  Height = 480
  Caption = #26465#24418#32479#35745#22270
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
    Width = 105
    Height = 446
    Align = alLeft
    TabOrder = 0
    object btnBase: TBitBtn
      Left = 16
      Top = 88
      Width = 75
      Height = 25
      Caption = #22522#26412
      TabOrder = 0
      OnClick = btnBaseClick
    end
    object bbtSpec: TBitBtn
      Left = 16
      Top = 120
      Width = 75
      Height = 25
      Caption = #29305#21035
      TabOrder = 1
      OnClick = bbtSpecClick
    end
    object btnAll: TBitBtn
      Left = 16
      Top = 56
      Width = 75
      Height = 25
      Caption = #20840#37096
      TabOrder = 2
      OnClick = btnAllClick
    end
    object bbtSunday: TBitBtn
      Left = 16
      Top = 152
      Width = 75
      Height = 25
      Caption = #26143#26399#22825
      TabOrder = 3
      OnClick = bbtSundayClick
    end
  end
end
