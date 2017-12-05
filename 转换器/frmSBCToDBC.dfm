object SBCToDBCForm: TSBCToDBCForm
  Left = 304
  Top = 272
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #20840#35282'/'#21322#35282#25968#23383#36716#25442
  ClientHeight = 122
  ClientWidth = 401
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 57
    Height = 13
    AutoSize = False
    Caption = #36716#25442#21069
  end
  object Label2: TLabel
    Left = 16
    Top = 56
    Width = 57
    Height = 13
    AutoSize = False
    Caption = #36716#25442#21518
  end
  object eSBC: TEdit
    Left = 64
    Top = 16
    Width = 321
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 152
    Top = 80
    Width = 75
    Height = 25
    Caption = #20840#65293#21322
    TabOrder = 1
    OnClick = Button1Click
  end
  object eDBC: TEdit
    Left = 64
    Top = 48
    Width = 321
    Height = 21
    Color = clMenuBar
    ReadOnly = True
    TabOrder = 2
  end
  object Button2: TButton
    Left = 304
    Top = 80
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 72
    Top = 80
    Width = 75
    Height = 25
    Caption = #21322#65293#20840
    TabOrder = 4
  end
end
