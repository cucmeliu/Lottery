unit frmAppDataBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, ComCtrls, StdCtrls, defineUnit, Buttons, Spin, IniFiles,
  ExtCtrls, LotFileTypeUnit;

type

//  TMsgArray = array of string;

  TAppDataForm = class(TForm)
    ClientDataSet1: TClientDataSet;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    SpinEdit4: TSpinEdit;
    SpinEdit5: TSpinEdit;
    SpinEdit6: TSpinEdit;
    SpinEdit7: TSpinEdit;
    ClientDataSet1SerialNo: TStringField;
    ClientDataSet1Lottery: TStringField;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Panel1: TPanel;
    EditAnalysis: TEdit;
    bbtAnalysis33s7: TBitBtn;
    cbbSep: TComboBox;
    Label10: TLabel;
    Panel2: TPanel;
    bbtAdd: TBitBtn;
    bbtClose: TBitBtn;
    Panel3: TPanel;
    Label1: TLabel;
    Label8: TLabel;
    EditSerialID: TEdit;
    SpinEdit8: TSpinEdit;
    procedure bbtAddClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure bbtAnalysis33s7Click(Sender: TObject);
  private
    { Private declarations }
    fCurLottory: byte;          //当前的类型 //0-337; 1-215; 2-2c; 3-3d
    fLotTypeInd: byte;          //添加的类型

    fFile33s7: TLotFileType;

    procedure Append33s7(aRecord: TLotteryStyle);
    procedure Append21s5(aRecord: TLotteryStyle);
    procedure Append2C(aRecord: TLotteryStyle);
    procedure Append3D(aRecord: TLotteryStyle);

    procedure Check33s7(var aRecord: TLotteryStyle);
    procedure Check21s5(var aRecord: TLotteryStyle);
    procedure Check2C(var aRecord: TLotteryStyle);
    procedure Check3D(var aRecord: TLotteryStyle);

    procedure FillSpins(aArray: TBufArray);
    procedure WriteIniFile(Sec, Ident, value: string);
    procedure ReadSerialID;

    procedure CreateDataSet(fileName: string);


  public
    { Public declarations }
  end;

var
  AppDataForm: TAppDataForm;

implementation

uses globalUnit;

{$R *.dfm}

{ TForm1 }

procedure TAppDataForm.Append21s5(aRecord: TLotteryStyle);
begin
        ClientDataSet1.Close;
        ClientDataSet1.FileName := 'data\s5.cds';
    try
        ClientDataSet1.Open;
    except
        showmessage('没有找到 21 选 5 的库文件！');
        exit;
    end;

    try                             
        ClientDataSet1.AppendRecord([aRecord.SerialID,
                                         aRecord.BaseNumber[0],
                                         aRecord.BaseNumber[1],
                                         aRecord.BaseNumber[2],
                                         aRecord.BaseNumber[3],
                                         aRecord.BaseNumber[4]]);
    except
    end;
end;

procedure TAppDataForm.Append2C(aRecord: TLotteryStyle);
begin

end;

procedure TAppDataForm.Append33s7(aRecord: TLotteryStyle);
var
  fileName: string;
begin
        fileName := ExtractFilePath(Application.ExeName) + 'data\s7.cds';
        if not FileExists(fileName) then
        begin
                CreateDataSet(fileName);
        end;
        ClientDataSet1.Close;
        ClientDataSet1.FileName := fileName;//'data\s7.cds';
        ClientDataSet1.CreateDataSet;
    try
        ClientDataSet1.Open;
        ClientDataSet1.Edit;
    except
        on e: exception do showmessage(e.Message);
    end;

    try                             
        ClientDataSet1.AppendRecord([aRecord.SerialID,
                                         IntToStr(aRecord.BaseNumber[0])+','
                                         +IntToStr(aRecord.BaseNumber[1])+','
                                         +IntToStr(aRecord.BaseNumber[2])+','
                                         +IntToStr(aRecord.BaseNumber[3])+','
                                         +IntToStr(aRecord.BaseNumber[4])+','
                                         +IntToStr(aRecord.BaseNumber[5])+','
                                         +IntToStr(aRecord.BaseNumber[6])+','
                                         +IntToStr(aRecord.SpecNumber)]);
        ClientDataSet1.Post;
    except on e: exception do showmessage(e.Message);
    end;
end;

procedure TAppDataForm.Append3D(aRecord: TLotteryStyle);
begin

end;

procedure TAppDataForm.Check21s5(var aRecord: TLotteryStyle);
begin

end;

procedure TAppDataForm.Check2C(var aRecord: TLotteryStyle);
begin

end;

procedure TAppDataForm.Check33s7(var aRecord: TLotteryStyle);
begin
        setLength(aRecord.BaseNumber, 7);
        aRecord.SerialID := Trim(EditSerialID.Text);
        aRecord.BaseNumber[0] := SpinEdit1.Value;
        aRecord.BaseNumber[1] := SpinEdit2.Value;
        aRecord.BaseNumber[2] := SpinEdit3.Value;
        aRecord.BaseNumber[3] := SpinEdit4.Value;
        aRecord.BaseNumber[4] := SpinEdit5.Value;
        aRecord.BaseNumber[5] := SpinEdit6.Value;
        aRecord.BaseNumber[6] := SpinEdit7.Value;
        aRecord.SpecNumber := SpinEdit8.Value;
end;

procedure TAppDataForm.Check3D(var aRecord: TLotteryStyle);
begin

end;

procedure TAppDataForm.bbtAddClick(Sender: TObject);
var
  aRecord: TLotteryStyle;
begin
        case fCurLottory of
          0:    //33选7的情况
                begin
                Check33s7(aRecord);
                Append33s7(aRecord);
                WriteIniFile('SerialNo', '33s7', aRecord.SerialID);
                end;
          1:
                begin
                Check21s5(aRecord);
                Append21s5(aRecord);
                end;
          2:
                begin
                Check2c(aRecord);
                Append2c(aRecord);
                end;
          3:
                begin
                Check3d(aRecord);
                Append3d(aRecord);
                end;
        else ;
        end;

end;

procedure TAppDataForm.FormCreate(Sender: TObject);
var
  iniF: string;
begin          
        PageControl1.TabIndex := 0;
        fCurLottory := 0;
        fLotTypeInd := 0;
        iniF := ExtractFilePath(Application.ExeName) + 'Lottery.Ini';
        fFile33s7 := TLotFileType.Create(iniF, '33s7');
        ReadSerialID;
end;

procedure TAppDataForm.PageControl1Change(Sender: TObject);
begin
        fCurLottory := PageControl1.ActivePageIndex;
end;

procedure TAppDataForm.bbtAnalysis33s7Click(Sender: TObject);
var
  aStr: string;
  ba: TBufArray;
  sep: char;
begin
        if cbbSep.ItemIndex = 0 then sep := ' '
        else sep := cbbSep.Text[1];

        aStr := Trim(EditAnalysis.Text);
        setLength(ba, 8);  //包括特别号
        StringToArray(aStr, 8, ba, sep);
        FillSpins(ba);
end;

procedure TAppDataForm.FillSpins(aArray: TBufArray);
begin
        SpinEdit1.Value := aArray[0];
        SpinEdit2.Value := aArray[1];
        SpinEdit3.Value := aArray[2];
        SpinEdit4.Value := aArray[3];
        SpinEdit5.Value := aArray[4];
        SpinEdit6.Value := aArray[5];
        SpinEdit7.Value := aArray[6];
        SpinEdit8.Value := aArray[7];        
end;

procedure TAppDataForm.WriteIniFile(Sec, Ident, value: string);
var
  IniFile: TIniFile;
begin
        IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Lottery.Ini');
        IniFile.WriteString(Sec, Ident, Value);
        IniFile.Free;
end;

procedure TAppDataForm.ReadSerialID;
var
  IniFile: TIniFile;
  SerialNo: integer;
begin
        IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Lottery.Ini');
    try
        SerialNo := IniFile.ReadInteger('SerialNo', '33s7', 2004001);
        SerialNo := SerialNo + 1;
        EditSerialID.Text := IntToStr(SerialNo);
        
    finally
        IniFile.Free;
    end;
    
end;

procedure TAppDataForm.CreateDataSet(fileName: string);
var
  cs: TClientDataSet;
begin
        FileCreate(fileName);
        cs := TClientDataSet.Create(nil);
    try
        cs.FileName := fileName;
        cs.FieldDefs.Clear;
        with cs.FieldDefs.AddFieldDef do
        begin
                Name := 'SerialNo';
                Size := 10;
                DataType := ftString;
        end;
        with cs.FieldDefs.AddFieldDef do
        begin
                Name := 'Lottery';
                Size := 30;
                DataType := ftString;
        end;
        cs.CreateDataSet;
        cs.Open;
    finally
        cs.Free;
    end;


end;

end.
