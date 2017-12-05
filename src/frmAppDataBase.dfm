object AppDataForm: TAppDataForm
  Left = 57
  Top = 183
  BorderStyle = bsDialog
  Caption = #22686#21152#35760#24405
  ClientHeight = 280
  ClientWidth = 287
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 287
    Height = 198
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = #28155#21152'33'#36873'7'
      object GroupBox1: TGroupBox
        Left = 0
        Top = 41
        Width = 279
        Height = 129
        Align = alTop
        Caption = #22522#26412#21495
        TabOrder = 0
        object Label2: TLabel
          Left = 16
          Top = 24
          Width = 57
          Height = 13
          AutoSize = False
          Caption = #22522#26412#21495'1'
        end
        object Label3: TLabel
          Left = 16
          Top = 72
          Width = 57
          Height = 13
          AutoSize = False
          Caption = #22522#26412#21495'3'
        end
        object Label4: TLabel
          Left = 16
          Top = 96
          Width = 57
          Height = 13
          AutoSize = False
          Caption = #22522#26412#21495'4'
        end
        object Label5: TLabel
          Left = 152
          Top = 24
          Width = 57
          Height = 13
          AutoSize = False
          Caption = #22522#26412#21495'5'
        end
        object Label6: TLabel
          Left = 152
          Top = 48
          Width = 57
          Height = 13
          AutoSize = False
          Caption = #22522#26412#21495'6'
        end
        object Label7: TLabel
          Left = 152
          Top = 72
          Width = 57
          Height = 13
          AutoSize = False
          Caption = #22522#26412#21495'7'
        end
        object Label9: TLabel
          Left = 16
          Top = 48
          Width = 57
          Height = 13
          AutoSize = False
          Caption = #22522#26412#21495'2'
        end
        object SpinEdit1: TSpinEdit
          Left = 72
          Top = 24
          Width = 57
          Height = 22
          MaxValue = 33
          MinValue = 0
          TabOrder = 0
          Value = 0
        end
        object SpinEdit2: TSpinEdit
          Left = 72
          Top = 48
          Width = 57
          Height = 22
          MaxValue = 33
          MinValue = 0
          TabOrder = 1
          Value = 0
        end
        object SpinEdit3: TSpinEdit
          Left = 72
          Top = 72
          Width = 57
          Height = 22
          MaxValue = 33
          MinValue = 0
          TabOrder = 2
          Value = 0
        end
        object SpinEdit4: TSpinEdit
          Left = 72
          Top = 96
          Width = 57
          Height = 22
          MaxValue = 33
          MinValue = 0
          TabOrder = 3
          Value = 0
        end
        object SpinEdit5: TSpinEdit
          Left = 208
          Top = 24
          Width = 57
          Height = 22
          MaxValue = 33
          MinValue = 0
          TabOrder = 4
          Value = 0
        end
        object SpinEdit6: TSpinEdit
          Left = 208
          Top = 48
          Width = 57
          Height = 22
          MaxValue = 33
          MinValue = 0
          TabOrder = 5
          Value = 0
        end
        object SpinEdit7: TSpinEdit
          Left = 208
          Top = 72
          Width = 57
          Height = 22
          MaxValue = 33
          MinValue = 0
          TabOrder = 6
          Value = 0
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 279
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Label1: TLabel
          Left = 8
          Top = 14
          Width = 57
          Height = 13
          AutoSize = False
          Caption = #26399#21495
        end
        object Label8: TLabel
          Left = 168
          Top = 16
          Width = 41
          Height = 13
          AutoSize = False
          Caption = #29305#21035#21495
        end
        object EditSerialID: TEdit
          Left = 40
          Top = 8
          Width = 113
          Height = 21
          TabOrder = 0
        end
        object SpinEdit8: TSpinEdit
          Left = 208
          Top = 8
          Width = 57
          Height = 22
          MaxValue = 33
          MinValue = 0
          TabOrder = 1
          Value = 0
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #28155#21152'21'#36873'5'
      ImageIndex = 1
    end
    object TabSheet3: TTabSheet
      Caption = #21452#33394#29699
      ImageIndex = 2
    end
    object TabSheet4: TTabSheet
      Caption = '3D'
      ImageIndex = 3
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 198
    Width = 287
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Label10: TLabel
      Left = 192
      Top = 16
      Width = 33
      Height = 13
      AutoSize = False
      Caption = #20998#38548
    end
    object EditAnalysis: TEdit
      Left = 8
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 0
      Text = '1 2 3 4 5 6 7 8'
    end
    object bbtAnalysis33s7: TBitBtn
      Left = 128
      Top = 8
      Width = 57
      Height = 25
      Caption = #20998#26512
      TabOrder = 1
      OnClick = bbtAnalysis33s7Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
        33333333333F8888883F33330000324334222222443333388F3833333388F333
        000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
        F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
        223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
        3338888300003AAAAAAA33333333333888888833333333330000333333333333
        333333333333333333FFFFFF000033333333333344444433FFFF333333888888
        00003A444333333A22222438888F333338F3333800003A2243333333A2222438
        F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
        22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
        33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
        3333333333338888883333330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object cbbSep: TComboBox
      Left = 216
      Top = 8
      Width = 49
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 2
      Text = ' '
      Items.Strings = (
        ' '
        ','
        ';')
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 239
    Width = 287
    Height = 41
    Align = alBottom
    TabOrder = 2
    object bbtAdd: TBitBtn
      Left = 56
      Top = 8
      Width = 75
      Height = 25
      Caption = #28155#21152'(&A)'
      Default = True
      TabOrder = 0
      OnClick = bbtAddClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object bbtClose: TBitBtn
      Left = 160
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object ClientDataSet1: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 16
    Data = {
      530000009619E0BD010000001800000002000000000003000000530008536572
      69616C4E6F0100490000000100055749445448020002000A00074C6F74746572
      790100490000000100055749445448020002001E000000}
    object ClientDataSet1SerialNo: TStringField
      FieldName = 'SerialNo'
      Size = 10
    end
    object ClientDataSet1Lottery: TStringField
      FieldName = 'Lottery'
      Size = 30
    end
  end
end
