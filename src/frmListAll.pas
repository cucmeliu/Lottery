unit frmListAll;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, Menus, StdCtrls, Buttons, ExtCtrls, lotteryReader,
   defineUnit, ImgList, LotteryBuilder;

type
  TListAllForm = class(TForm)
    MainMenu1: TMainMenu;
    dg337: TStringGrid;
    Panel1: TPanel;
    bbtListBase: TBitBtn;
    bbtListSpec: TBitBtn;
    bbtListAll: TBitBtn;
    C1: TMenuItem;
    mnuCalAll: TMenuItem;
    mnuCalBase: TMenuItem;
    mnuCalSpec: TMenuItem;
    ImageList1: TImageList;
    bbtListSunday: TBitBtn;
    mnuCalcSunday: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mnuCalBaseClick(Sender: TObject);
    procedure mnuCalSpecClick(Sender: TObject);
    procedure mnuCalAllClick(Sender: TObject); 
    procedure FormResize(Sender: TObject);
    procedure dg337MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure E1Click(Sender: TObject);
    procedure mnuCalcSundayClick(Sender: TObject);
  private
    { Private declarations }
//    All33s7: TBufArray;   //33s7的所有值
//    AllNumArray: TBufArray;
    fNumCount: TNumCount;
//    fNCRArray: TNumCntRecArray;

    procedure ListAll;
    procedure ListBase;
    procedure ListSpec;
    procedure ListSunday;
    procedure ListPro(aNumArray: TBufArray);

    procedure FillListView(aNCRArray: TNumCntRecArray);

    procedure InitGrid(sg: TStringGrid; colCnt: integer);
    procedure ResizeGrid(sg: TStringGrid);
    procedure FillGrid;

//    procedure RebuildArray;
//    function StatAllNumber(aLottery: TLotteryStyleArray; numCount: integer): TBufArray;

    procedure FileReLoadMsg(var message: TMessage); message WM_FILE_LOADED; //重新加载了文件

  public
    { Public declarations }
//    Lot33s7: TLottery33S7;
    fLotteryBuilder: TLotteryBuilder;

    procedure DrawGrid(NumCount: TNumCount);
  end;

var
  ListAllForm: TListAllForm;

implementation

uses globalUnit, frmResult;


{$R *.dfm}

procedure TListAllForm.FormCreate(Sender: TObject);
begin
        fNumCount.TotalCount := 0;
        fNumCount.NumCount := 0;
        InitGrid(self.dg337, 9);

end;

procedure TListAllForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        Action := caFree;
end;

procedure TListAllForm.ListAll;
begin
        ListPro(fLotteryBuilder.AllNumArray);
end;  

procedure TListAllForm.ListBase;
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
        ListPro(BaseBuf);
    finally
        BaseBuf := nil;
    end;
end;

procedure TListAllForm.ListSpec;
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
        ListPro(specBuf);
    finally
        specBuf := nil;
    end;
    
end;  

procedure TListAllForm.ListSunday;
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
        ListPro(SundayBuf);
    finally
        SundayBuf := nil;
    end;
end;

procedure TListAllForm.ListPro(aNumArray: TBufArray);
var
  i: integer;
  aNCRArray: TNumCntRecArray;
begin
        setLength(aNCRArray, fNumCount.TotalCount);
        for i := 0 to (fNumCount.TotalCount-1) do
        begin
                aNCRArray[i].Number := i+1;
                aNCRArray[i].Rcount := 0;
        end;

    try
        QuickCount(aNumArray, aNCRArray);
        FillListView(aNCRArray);
    finally
        setLength(aNCRArray, 0);
        aNCRArray := nil;
    end;

end;

procedure TListAllForm.FillListView(aNCRArray: TNumCntRecArray);
var
  i: integer;
  frm: TResultForm;
  ListItem: TListItem;
begin
        frm := TResultForm.Create(self);
    try
        for i:=Low(aNCRArray) to High(aNCRArray) do
        begin
                ListItem := frm.ListView1.Items.Add;
                ListItem.Caption := IntToStr(aNCRArray[i].Number);
                ListItem.SubItems.Add(IntToStr(aNCRArray[i].Rcount));
        end;
        frm.ShowModal;
    finally
        frm.Free; 
    end;
end;

procedure TListAllForm.mnuCalBaseClick(Sender: TObject);
begin
        ListBase;
end;

procedure TListAllForm.mnuCalSpecClick(Sender: TObject);
begin
        ListSpec;
end;

procedure TListAllForm.mnuCalAllClick(Sender: TObject);
begin
        ListAll;
end;  
  
procedure TListAllForm.mnuCalcSundayClick(Sender: TObject);
begin
        ListSunday;
end;

(*********************************************************************
//  func：
//  Desc：
//  Parm：rowCnt: 所有的列，包括 fixCol
//  Note：
//  Auth：Loafer.Liu @ 2004.9.
//  Updt：
//*******************************************************************)
procedure TListAllForm.InitGrid(sg: TStringGrid; colCnt: integer);
var
  i: integer;
begin
        if colCnt < 4 then exit;
        sg.ColCount := colCnt;
        
        for i := 1 to colCnt - 2 - 1 do
                sg.Cells[i, 0] := '基本号';
        dg337.Cells[colCnt - 2, 0] := '特别号';
        dg337.Cells[colCnt - 1, 0] := '星期天';

end;

procedure TListAllForm.ResizeGrid(sg: TStringGrid);
var
  i: integer;
  wid: integer;
begin   
        sg.FixedCols := 1;
        sg.ColWidths[0] := Canvas.TextWidth('陕西风采'); 

        wid :=  (sg.Width - sg.ColWidths[0] - 30) div (sg.ColCount - 1);

        for i := 1 to sg.ColCount - 1 do
                sg.ColWidths[i] := wid; 
        
end;

procedure TListAllForm.FormResize(Sender: TObject);
begin
        ResizeGrid(self.dg337);
end;

procedure TListAllForm.dg337MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  r, c: integer;
begin
        dg337.MouseToCell(x, y, c, r); 
        if ( r > 1 ) then
        begin
                dg337.Hint := dg337.Cells[0, r];
        end;
end;

procedure TListAllForm.E1Click(Sender: TObject);
begin
        close;
end;

procedure TListAllForm.FileReLoadMsg(var message: TMessage);
begin
        fNumCount.TotalCount := message.WParam;
        fNumCount.NumCount := message.LParam;
        DrawGrid(fNumCount);
end;

procedure TListAllForm.FillGrid;
var 
  i, j: integer;
  LenArray: integer;
begin
        LenArray := Length(fLotteryBuilder.FLotteryStyle);
        if LenArray = 0 then exit;

        dg337.RowCount := LenArray + 1;

        for i := 0 to Length(fLotteryBuilder.FLotteryStyle) - 1 do
        begin
                dg337.Cells[0, i+1] := fLotteryBuilder.FLotteryStyle[i].SerialID;
                for j := 0 to (fNumCount.NumCount-1) do
                begin
                        dg337.Cells[j+1, i+1]
                           := IntToStr(fLotteryBuilder.FLotteryStyle[i].BaseNumber[j]);
                end;
                dg337.Cells[fNumCount.NumCount+1, i+1] := IntToStr(fLotteryBuilder.FLotteryStyle[i].SpecNumber);
                dg337.Cells[fNumCount.NumCount+2, i+1] := IntToStr(fLotteryBuilder.FLotteryStyle[i].SundayNum);
        end;
end;

procedure TListAllForm.DrawGrid(NumCount: TNumCount);
begin
        fNumCount := NumCount;
        InitGrid(dg337, NumCount.NumCount+2+1);//第一列+特别号+星期天
        FillGrid;
end;

end.
