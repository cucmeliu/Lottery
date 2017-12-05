object ResultForm: TResultForm
  Left = 300
  Top = 98
  Width = 229
  Height = 407
  BorderIcons = []
  Caption = #20998#26512#32467#26524
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ListView1: TListView
    Left = 0
    Top = 0
    Width = 221
    Height = 335
    Align = alClient
    Color = clCream
    Columns = <
      item
        Caption = #25968#23383
        Width = 100
      end
      item
        Caption = #27425#25968
        Width = 100
      end>
    FlatScrollBars = True
    ReadOnly = True
    RowSelect = True
    SortType = stData
    TabOrder = 0
    ViewStyle = vsReport
    OnColumnClick = ListView1ColumnClick
    OnCompare = ListView1Compare
  end
  object Panel1: TPanel
    Left = 0
    Top = 335
    Width = 221
    Height = 38
    Align = alBottom
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 64
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830#23450'(&C)'
      TabOrder = 0
      Kind = bkOK
    end
  end
end
