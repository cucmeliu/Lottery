unit frmStatGraphi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, StatGraphiGrid, LotteryBuilder, defineUnit,
  globalUnit;

type
  TStatGraphiForm = class(TForm)
    GroupBox1: TGroupBox;
    btnBase: TBitBtn;
    bbtSpec: TBitBtn;
    btnAll: TBitBtn;
    bbtSunday: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAllClick(Sender: TObject);
    procedure btnBaseClick(Sender: TObject);
    procedure bbtSpecClick(Sender: TObject);
    procedure bbtSundayClick(Sender: TObject);
  private
    { Private declarations }
    StatGraphiGrid: TStatGraphiGrid;
    fNumCount: TNumCount;
    AllNumArray: TBufArray;
    fListStyle: byte;  //列出方式  0: 全部 1：基本号 2: 特别号 3: 星期天号
    //    MaxCount: integer;
    procedure ListSel;
    procedure ListAll;
    procedure ListBase;
    procedure ListSpec;
    procedure ListSunday;
    
    procedure RebuildArray;
    procedure LoadGraph;
    procedure ResetGraphParam(ANumArray: TBufArray);
    procedure FileReLoadMsg(var message: TMessage); message WM_FILE_LOADED; //重新加载了文件
  public
    { Public declarations }
    fLotteryBuilder: TLotteryBuilder;

    procedure DrawGrid(NumCount: TNumCount);
  end;

var
  StatGraphiForm: TStatGraphiForm;

implementation

{$R *.dfm}

procedure TStatGraphiForm.FormCreate(Sender: TObject);
begin
        setLength(AllNumArray, 0);
        fListStyle := 0;//默认显示全部号
end;

procedure TStatGraphiForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        StatGraphiGrid.Free;
        action := cafree;
end;

procedure TStatGraphiForm.DrawGrid(NumCount: TNumCount);
begin
        fNumCount := NumCount;
        RebuildArray;
        LoadGraph;
        ListSel;//ResetGraphParam;
        StatGraphiGrid.Reset;
end;

procedure TStatGraphiForm.RebuildArray;
begin
        AllNumArray := StatAllNumber(fLotteryBuilder.FLotteryStyle, fNumCount.NumCount);
end;

procedure TStatGraphiForm.LoadGraph;
begin
        StatGraphiGrid := TStatGraphiGrid.Create(self);
        StatGraphiGrid.Align := alClient;
end;

procedure TStatGraphiForm.ResetGraphParam(ANumArray: TBufArray);
var
  i, aMaxCount: integer;
  aNCRArray: TNumCntRecArray;
begin
        setLength(aNCRArray, fNumCount.TotalCount);
        for i:= 0 to fNumCount.TotalCount-1 do
        begin
                aNCRArray[i].Number := i+1;
                aNCRArray[i].Rcount := 0;                
        end;
    try
        //QuickCount(AllNumArray, aNCRArray);
        QuickCount(ANumArray, aNCRArray);
        aMaxCount := 0;//aNCRArray[0].Rcount;        //数量最多号码的数量
        for i:=Low(aNCRArray) to High(aNCRArray) do
                if aNCRArray[i].Rcount > aMaxCount then
                        aMaxCount := aNCRArray[i].Rcount;

        StatGraphiGrid.MaxCount := aMaxCount;
        setLength(StatGraphiGrid.NumCountRecArray, Length(aNCRArray));
        CopyMemory(StatGraphiGrid.NumCountRecArray, aNCRArray,
                Length(aNCRArray)*8);
    finally
        setLength(aNCRArray, 0);
    end;
end;

procedure TStatGraphiForm.FileReLoadMsg(var message: TMessage);
begin
        fNumCount.TotalCount := message.WParam;
        fNumCount.NumCount := message.LParam;
        DrawGrid(fNumCount);
end;

procedure TStatGraphiForm.ListAll;
begin
        ResetGraphParam(AllNumArray);
end;

procedure TStatGraphiForm.ListBase;
var
  i: integer;
  BaseCnt: integer;
  BaseBuf: TBufArray;
begin
        BaseCnt := Length(fLotteryBuilder.AllNumArray) div (fNumCount.NumCount+1+1);
        setLength(BaseBuf, Length(fLotteryBuilder.AllNumArray));
        for i:= Low(fLotteryBuilder.AllNumArray) to High(fLotteryBuilder.AllNumArray) do
                BaseBuf[i] := fLotteryBuilder.AllNumArray[i];

        for i:= 0 to BaseCnt - 1 do
        begin
                BaseBuf[i*(fNumCount.NumCount+1+1)+fNumCount.NumCount] := 0;
                BaseBuf[i*(fNumCount.NumCount+1+1)+fNumCount.NumCount+1] := 0;
        end;

    try
        ResetGraphParam(BaseBuf);
    finally
        BaseBuf := nil;
    end;
end;

procedure TStatGraphiForm.ListSpec;
var
  i: integer;
  specCnt: integer;
  specBuf: TBufArray;
begin
        specCnt := Length(fLotteryBuilder.AllNumArray) div (fNumCount.NumCount+1+1);
        setLength(specBuf, specCnt);
        for i:= 0 to specCnt - 1 do
        begin
                specBuf[i] := fLotteryBuilder.AllNumArray[(fNumCount.NumCount+1+1)*i+fNumCount.NumCount];
        end;
    try
        ResetGraphParam(specBuf);
    finally
        specBuf := nil;
    end;
end;

procedure TStatGraphiForm.ListSunday;
var
  i: integer;
  SundayCnt: integer;
  SundayBuf: TBufArray;
begin
        SundayCnt := Length(fLotteryBuilder.AllNumArray) div (fNumCount.NumCount+1+1);
        setLength(SundayBuf, SundayCnt);
        for i:= 0 to SundayCnt - 1 do
        begin
                SundayBuf[i] := fLotteryBuilder.AllNumArray[(fNumCount.NumCount+1+1)*i+fNumCount.NumCount+1];
        end;
    try
        ResetGraphParam(SundayBuf);
    finally
        SundayBuf := nil;
    end;
end;

procedure TStatGraphiForm.ListSel;
begin
        case fListStyle of
          0: ListAll;
          1: ListBase;
          2: ListSpec;
          3: ListSunday;
        else ListAll;
        end;   
end;

procedure TStatGraphiForm.btnAllClick(Sender: TObject);
begin
        fListStyle := 0;
        DrawGrid(fNumCount);
end;

procedure TStatGraphiForm.btnBaseClick(Sender: TObject);
begin
        fListStyle := 1;
        DrawGrid(fNumCount);
end;

procedure TStatGraphiForm.bbtSpecClick(Sender: TObject);
begin
        fListStyle := 2;
        DrawGrid(fNumCount);
end;

procedure TStatGraphiForm.bbtSundayClick(Sender: TObject);
begin
        fListStyle := 3;
        DrawGrid(fNumCount);
end;

end.
