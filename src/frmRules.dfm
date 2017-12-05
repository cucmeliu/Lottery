object RuleForm: TRuleForm
  Left = 328
  Top = 258
  Width = 696
  Height = 480
  Caption = #28216#25103#35268#21017
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
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object RichEdit1: TRichEdit
    Left = 0
    Top = 0
    Width = 688
    Height = 405
    Align = alClient
    Color = clBlack
    Font.Charset = GB2312_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 405
    Width = 688
    Height = 41
    Align = alBottom
    TabOrder = 1
    object bbt33s7: TBitBtn
      Left = 56
      Top = 8
      Width = 75
      Height = 25
      Caption = '33 '#36873' 7'
      TabOrder = 0
      OnClick = bbt33s7Click
    end
    object bbt21s5: TBitBtn
      Left = 152
      Top = 8
      Width = 75
      Height = 25
      Caption = '21 '#36873' 5'
      TabOrder = 1
      OnClick = bbt21s5Click
    end
    object bbt2B: TBitBtn
      Left = 240
      Top = 8
      Width = 75
      Height = 25
      Caption = #21452#33394#29699
      TabOrder = 2
      OnClick = bbt2BClick
    end
    object bbt3D: TBitBtn
      Left = 336
      Top = 8
      Width = 75
      Height = 25
      Caption = '3D'
      TabOrder = 3
      OnClick = bbt3DClick
    end
  end
end
