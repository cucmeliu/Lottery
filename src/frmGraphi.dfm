object GraphForm: TGraphForm
  Left = 251
  Top = 194
  Width = 696
  Height = 480
  Caption = #22270#24418#21015#34920
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
  object dgGraph: TDrawGrid
    Left = 0
    Top = 0
    Width = 688
    Height = 408
    Align = alClient
    Color = clActiveCaption
    ColCount = 10
    FixedColor = clGreen
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnDrawCell = dgGraphDrawCell
    OnMouseMove = dgGraphMouseMove
  end
  object Panel1: TPanel
    Left = 0
    Top = 408
    Width = 688
    Height = 38
    Align = alBottom
    TabOrder = 1
    Visible = False
    object BitBtn1: TBitBtn
      Left = 72
      Top = 8
      Width = 75
      Height = 25
      Caption = #22635#20805'(&F)'
      TabOrder = 0
    end
  end
end
