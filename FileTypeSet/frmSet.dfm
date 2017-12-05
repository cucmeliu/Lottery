object SetForm: TSetForm
  Left = 325
  Top = 167
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #24425#31080#25968#25454#31867#22411#35774#32622
  ClientHeight = 394
  ClientWidth = 319
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ListView1: TListView
    Left = 0
    Top = 89
    Width = 319
    Height = 263
    Align = alClient
    Columns = <
      item
        Caption = #24425#31080#31867#22411
        Width = 120
      end
      item
        Caption = #25193#23637#21517
        Width = 80
      end
      item
        Caption = #24453#36873#21495#25968#37327
      end
      item
        Caption = #22522#26412#21495#25968#37327
      end>
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 319
    Height = 89
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #26174#31034#21517
    end
    object Label2: TLabel
      Left = 16
      Top = 40
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #25193#23637#21517
    end
    object Label3: TLabel
      Left = 152
      Top = 16
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #21495#30721#33539#22260
    end
    object Label4: TLabel
      Left = 152
      Top = 40
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #22522#26412#21495#25968#37327
    end
    object Label5: TLabel
      Left = 16
      Top = 72
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #29616#26377#31867#22411
    end
    object editName: TEdit
      Left = 64
      Top = 8
      Width = 81
      Height = 21
      TabOrder = 0
    end
    object editExt: TEdit
      Left = 64
      Top = 32
      Width = 81
      Height = 21
      TabOrder = 1
    end
    object editRange: TEdit
      Left = 216
      Top = 8
      Width = 81
      Height = 21
      TabOrder = 2
    end
    object editBaseNum: TEdit
      Left = 216
      Top = 32
      Width = 81
      Height = 21
      TabOrder = 3
    end
    object bbtAdd: TBitBtn
      Left = 240
      Top = 56
      Width = 57
      Height = 25
      Caption = #28155#21152
      TabOrder = 4
      OnClick = bbtAddClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 352
    Width = 319
    Height = 42
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object bbtClose: TBitBtn
      Left = 214
      Top = 8
      Width = 75
      Height = 25
      Caption = #20851#38381
      TabOrder = 0
      Kind = bkCancel
    end
  end
end
