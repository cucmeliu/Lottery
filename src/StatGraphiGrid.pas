unit StatGraphiGrid;

interface

uses
    Classes, Graphics, Windows, SysUtils,
    MyGraphi, defineUnit;
    
type

  TStatGraphiGrid = class(TMyGraph)
  private
    FMaxCount: integer;
    FXDistence, FYDistence: double;
    procedure DrawCord(myCanvas: TCanvas; originPoint, termPoint: TPoint;
        xCordCnt, yCordCnt: integer);
    procedure DrawContent(myCanvas: TCanvas; originPoint, termPoint: TPoint);
    procedure DrawRectangle(myCanvas: TCanvas; basePoint: TPoint; rCount: integer);

    procedure SetMaxCount(const Value: integer); //画坐标
                
  protected
    procedure DrawMap(MyCanvas: TCanvas; DrawRect: TRect); override;
  public
    NumCountRecArray: TNumCntRecArray;
    
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
//    procedure Paint; override;

    property MaxCount: integer read FMaxCount write SetMaxCount;
  published 

  end;


implementation

{ TStatGraphiGrid }

constructor TStatGraphiGrid.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
        FMaxCount := 10;
        setLength(NumCountRecArray, 0);
        FXDistence := 0;
        FYDistence := 0;

end;

destructor TStatGraphiGrid.Destroy;
begin

  inherited;
end;

procedure TStatGraphiGrid.DrawContent(myCanvas: TCanvas; originPoint,
  termPoint: TPoint);
var
  i: integer;
  bPoint: TPoint;
begin
        for i:= Low(NumCountRecArray) to High(NumCountRecArray) do
        begin
                bPoint.X := originPoint.X + Trunc(FXDistence*(i+1));
                bPoint.Y := originPoint.Y;
                DrawRectangle(myCanvas, bPoint,
                        NumCountRecArray[i].Rcount);
        end;

end;

procedure TStatGraphiGrid.DrawCord(myCanvas: TCanvas; originPoint,
  termPoint: TPoint; xCordCnt, yCordCnt: integer);
var
  i: integer;
  distance: double;//integer;
  txtPoint, sPoint, ePoint: TPoint;
begin
        with myCanvas.Pen do
        begin
                Color := clGreen;
                Style := psSolid;
                Width := 1;
        end;
        myCanvas.MoveTo(originPoint.X, termPoint.Y);
        myCanvas.LineTo(originPoint.X, originPoint.Y);
        myCanvas.LineTo(termPoint.X, originPoint.Y);
        
        myCanvas.Brush.Color := clBlack;
        with myCanvas.Font do
        begin
                Color := clBlue;
                Size  := 5;//Trunc(5 * FScale);
        end;
        //画x方向坐标值
        distance := (termPoint.X - originPoint.X)/(xCordCnt);//+1); //加1是为了留点空间
        FXDistence := distance;
        sPoint.Y := originPoint.Y;
        ePoint.Y := termPoint.Y;
        txtPoint.Y := originPoint.Y + canvas.TextHeight('1') div 2;
        for i := 0 to xCordCnt do
        begin
                sPoint.X := originPoint.X + Trunc(i*distance);
                ePoint.X := sPoint.X;
                myCanvas.MoveTo(sPoint.X, sPoint.Y);
                myCanvas.LineTo(ePoint.X, ePoint.Y);
                txtPoint.X := originPoint.X + Trunc(i*distance);
                myCanvas.TextOut(txtPoint.X, txtPoint.Y, IntToStr(i));
        end;
        //画y方向坐标值
        distance := (originPoint.Y - termPoint.Y)/(yCordCnt);//+1); //加1是为了留点空间
        FYDistence := distance;
        sPoint.X := originPoint.X;
        ePoint.X := termPoint.X;
        txtPoint.X := originPoint.X - canvas.TextWidth('100');
        for i:=1 to yCordCnt do
        begin
                sPoint.Y := originPoint.Y - Trunc(i*distance);
                ePoint.Y := sPoint.Y;
                myCanvas.MoveTo(sPoint.X, sPoint.Y);
                myCanvas.LineTo(ePoint.X, ePoint.Y);
                txtPoint.Y := originPoint.Y - Trunc(i*distance);
                myCanvas.TextOut(txtPoint.X, txtPoint.Y, IntToStr(i));
        end; 
end;

procedure TStatGraphiGrid.DrawMap(MyCanvas: TCanvas; DrawRect: TRect);
var
  aPoint, bPoint: TPoint;
  xCnt, yCnt: integer;
begin
        if (not assigned(NumCountRecArray) or (fMaxCount = 0)) then
        begin
                xCnt := 10;
                yCnt := 10;
        end else
                begin
                xCnt := Length(NumCountRecArray)+1;
                yCnt := fMaxCount+1;
                end;

        aPoint.X := DrawRect.Left+20;          //       bPoint .
        aPoint.Y := DrawRect.Bottom-20;
        bPoint.X := DrawRect.Right-20;
        bPoint.Y := DrawRect.Top+20;           //aPoint .
        DrawCord(myCanvas, aPoint, bPoint, xCnt, yCnt);
        if assigned(NumCountRecArray) then
                DrawContent(myCanvas, aPoint, bPoint);
end;

procedure TStatGraphiGrid.DrawRectangle(myCanvas: TCanvas;
        basePoint: TPoint; rCount: integer);
var
  aRect: TRect;
  xd: integer;
begin
        xd := Trunc(FXDistence/3);
        aRect.Left := basePoint.X - xd;
        aRect.Right := basePoint.X + xd;
        aRect.Bottom := basePoint.Y;
        aRect.Top := aRect.Bottom - Trunc(FYDistence*rCount);

        myCanvas.Brush.Color := clBlue;
        myCanvas.FillRect(aRect);
end;
         {
procedure TStatGraphiGrid.Paint;
begin
  inherited Paint;

end;    }

procedure TStatGraphiGrid.SetMaxCount(const Value: integer);
begin
        FMaxCount := Value;
end;

end.
