unit frmGraphi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, defineUnit, LotteryBuilder;

type
  TGraphForm = class(TForm)
    dgGraph: TDrawGrid;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    procedure FormResize(Sender: TObject);
    procedure dgGraphDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dgGraphMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
    fNumCount: TNumCount;

    procedure InitGrid(dg: TDrawGrid; colCnt, rowCnt: integer);
    procedure ResizeGrid(dg: TDrawGrid);
    procedure FillGrid(dg: TDrawGrid; aLotteryArray: TLotteryStyleArray);

    procedure FileReLoadMsg(var message: TMessage); message WM_FILE_LOADED; //重新加载了文件
  public
    { Public declarations }
    
    fLotteryBuilder: TLotteryBuilder;
    procedure DrawGrid(NumCount: TNumCount);
  end;

var
  GraphForm: TGraphForm;

implementation

{$R *.dfm}

{ TForm2 }

procedure TGraphForm.FormCreate(Sender: TObject);
begin
        fNumCount.TotalCount := 0;
        fNumCount.NumCount := 0;
end;

procedure TGraphForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        action := cafree;
end;

procedure TGraphForm.InitGrid(dg: TDrawGrid; colCnt, rowCnt: integer);
var
  i: integer;
  arect: TRect;
begin
        if colCnt < 2 then exit;
        if rowCnt < 2 then exit;
        dg.ColCount := colCnt;
        dg.RowCount := rowCnt;
        dg.FixedCols := 1;
        dg.FixedRows := 1;
        for i:=1 to colCnt-1 do
        begin
                aRect := dg.CellRect(i, 0);
                dg.Canvas.TextRect(aRect, 1, 1, IntToStr(i));
        end;

end;

procedure TGraphForm.ResizeGrid(dg: TDrawGrid);
var
  i: integer;
  wid: integer;
begin
        dg.ColWidths[0] := Canvas.TextWidth('风采');

        wid :=  (dg.Width - dg.ColWidths[0] - 50) div (dg.ColCount - 1);

        for i := 1 to dg.ColCount - 1 do
                dg.ColWidths[i] := wid;
end;

procedure TGraphForm.FormResize(Sender: TObject);
begin
        ResizeGrid(dgGraph);
end;

procedure TGraphForm.FillGrid(dg: TDrawGrid;
  aLotteryArray: TLotteryStyleArray);
var
  i, j: integer;
  curNum: byte;
  aRec: TRect;
begin
        for i := Low(aLotteryArray) to High(aLotteryArray) do
        begin
                for j := Low(aLotteryArray[i].BaseNumber) to
                        High(aLotteryArray[i].BaseNumber) do
                begin
                        curNum := aLotteryArray[i].BaseNumber[j];
                        aRec := dg.CellRect(curNum, i+1);
                        dg.Canvas.Brush.Color := clRed;
                        dg.Canvas.Ellipse(aRec);
                end;
                curNum := aLotteryArray[i].SpecNumber;
                aRec := dg.CellRect(curNum, i+1);
                dg.Canvas.Brush.Color := clGreen;
                dg.Canvas.Ellipse(aRec);
        end;
end;

procedure TGraphForm.dgGraphDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  i: integer;
  fitted: boolean;
//  arect: TRect;
begin
         {
        if (ARow=0) then
        begin
                aRect := dgGraph.CellRect(i, 0);
                dgGraph.Canvas.TextRect(aRect, 1, 1, IntToStr(aCol));
        end;     }

        fitted := false;
        if Length(fLotteryBuilder.FLotteryStyle) = 0 then exit;
        if (ARow < 1) or (ACol < 1) then exit;
         
        for i := Low(fLotteryBuilder.FLotteryStyle[ARow-1].BaseNumber) to
                High(fLotteryBuilder.FLotteryStyle[ARow-1].BaseNumber) do
        begin
                if fLotteryBuilder.FLotteryStyle[ARow-1].BaseNumber[i] = ACol then
                begin
                        fitted := true;
                        break;
                end;
        end;
        
        if  fitted then
        begin
                dgGraph.Canvas.Brush.Color := clRed;
                dgGraph.Canvas.Ellipse(Rect);
        end else if fLotteryBuilder.FLotteryStyle[ARow-1].SpecNumber = ACol then
                begin
                        dgGraph.Canvas.Brush.Color := clGreen;
                        dgGraph.Canvas.Ellipse(Rect);
                end;

end;

procedure TGraphForm.FileReLoadMsg(var message: TMessage);
begin
        fNumCount.TotalCount := message.WParam;
        fNumCount.NumCount := message.LParam;
        DrawGrid(fNumCount);
end;

procedure TGraphForm.DrawGrid(NumCount: TNumCount);
begin
        fNumCount := NumCount;
        InitGrid(dgGraph, NumCount.TotalCount+1, Length(fLotteryBuilder.FLotteryStyle)+1);
        ResizeGrid(dgGraph);
        FillGrid(dgGraph, fLotteryBuilder.FLotteryStyle);
end;

procedure TGraphForm.dgGraphMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  r, c: integer;
begin
        dgGraph.MouseToCell(x, y, c, r);
        if ( r > 1 ) then
        begin
                dgGraph.Hint := '祝君中奖^_^';//dgGraph.Cells[0, r];
        end;
end;

end.
