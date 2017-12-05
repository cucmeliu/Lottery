unit LotteryBuilder;

(*   基于如下格式的文件分析的类
 陕西风采33选7第2004134期开奖公告 (省福彩中心，2004年11月15日，1266)
 基本号码 06  13  16  19  20  29  32 
特别号码 01 

 陕西风采33选7第2004133期开奖公… (省福彩中心，2004年11月12日，633)
 基本号码 03  13  14  18  20  22  28 
特别号码 33 
 
 陕西风采33选7第2004132期开奖公… (省福彩中心，2004年11月10日，973)
 基本号码 05  15  21  24  29  30  33 
特别号码 04 

*)

interface

uses SysUtils, defineUnit, classes;

type

  TLotteryBuilder = class
  private
    procedure SetMaxCount(const Value: integer);

  protected
    function MyStrToInt(str: string): integer;
    function GetSpecNum(str: string): byte;
    function GetSundayNum(str: string): byte;
    procedure StringToArray(str: string; NumCnt: integer; var arr: TBufArray);virtual;
    procedure StringToStyle(AStr: string; NumCnt: integer; var ALotStyle: TLotteryStyle);
    function StatAllNumber(aLottery: TLotteryStyleArray; numCount: integer): TBufArray;

    procedure CountNumber;
    procedure QuickCount(para:TBufArray; var aNCRArray: TNumCntRecArray);
  public
    FLotteryStyle: TLotteryStyleArray;
    AllNumArray: TBufArray;
    fMaxCount: integer;
    fNumCount: TNumCount;
    fNCRArray: TNumCntRecArray;
    
    constructor Create;
    destructor Destroy; override;

    procedure BuildStyle(LotStrings: TLotterStringArray; NumberCount: integer); overload;// virtual;
    procedure BuildStyle(LotStrings: TLotterStringArray; NumCount: TNumCount); overload;
    procedure BuildStyle(LotStrList: TStringList; ANumCount: TNumCount); overload;

    property MaxCount: integer read FMaxCount write SetMaxCount;
  published 

  end;

implementation

{ TLotteryBuilder }

procedure TLotteryBuilder.BuildStyle(LotStrings: TLotterStringArray;
        NumberCount: integer);
var
  i, j: integer;
begin
        j := 0;
        setLength( FLotteryStyle, Length(LotStrings) );

        for i := Low( LotStrings ) to High( LotStrings ) do
        begin   
                FLotteryStyle[j].SerialID := Trim(LotStrings[i].SerialID);
                StringToArray(LotStrings[i].BaseNumber, NumberCount,
                        FLotteryStyle[j].BaseNumber);
                FLotteryStyle[j].SpecNumber := GetSpecNum(LotStrings[i].SpecNumber);
                FLotteryStyle[j].SundayNum := GetSundayNum(LotStrings[i].SundayNum);
                j := j + 1;
        end;

end;

procedure TLotteryBuilder.BuildStyle(LotStrings: TLotterStringArray;
  NumCount: TNumCount);
var
  i, j : integer;
begin
        fNumCount := NumCount;
        j := 0;
        setLength( FLotteryStyle, Length(LotStrings) );

        for i := Low( LotStrings ) to High( LotStrings ) do
        begin   
                FLotteryStyle[j].SerialID := Trim(LotStrings[i].SerialID);
                StringToArray(LotStrings[i].BaseNumber, NumCount.NumCount,
                        FLotteryStyle[j].BaseNumber);
                FLotteryStyle[j].SpecNumber := GetSpecNum(LotStrings[i].SpecNumber);
                FLotteryStyle[j].SundayNum := GetSundayNum(LotStrings[i].SundayNum);
                j := j + 1;
        end;
        AllNumArray := StatAllNumber(FLotteryStyle, NumCount.NumCount);
        CountNumber;
end;

procedure TLotteryBuilder.BuildStyle(LotStrList: TStringList;
  ANumCount: TNumCount);
var
  i: integer;
begin
        fNumCount := ANumCount;
        setLength(FLotteryStyle, LotStrList.Count);
        for i := 0 to LotStrList.Count-1 do
        begin
                StringToStyle(LotStrList[i], ANumCount.NumCount,
                        FLotteryStyle[i]);
        end;
        AllNumArray := StatAllNumber(FLotteryStyle, ANumCount.NumCount);
        CountNumber;        

end;

procedure TLotteryBuilder.CountNumber;
var
  i, aMaxCount: integer;
begin
        setLength(fNCRArray, fNumCount.TotalCount);
        for i:= 0 to fNumCount.TotalCount-1 do
        begin
                fNCRArray[i].Number := i+1;
                fNCRArray[i].Rcount := 0;
        end;
        QuickCount(AllNumArray, fNCRArray);
        aMaxCount := 0;       //数量最多号码的数量
        for i:=Low(fNCRArray) to High(fNCRArray) do
                if fNCRArray[i].Rcount > aMaxCount then
                        aMaxCount := fNCRArray[i].Rcount;
        self.fMaxCount := aMaxCount;
        
end;

constructor TLotteryBuilder.Create;
begin
        setLength(FLotteryStyle, 0);
        setLength(AllNumArray, 0);
        setLength(fNCRArray, 0);
end;

destructor TLotteryBuilder.Destroy;
begin
        FLotteryStyle := nil;
        AllNumArray := nil;
        fNCRArray := nil;
  inherited;
end;

(*********************************************************************
//  func：
//  Desc：
//  Parm：
//  Rslt：
//  Note：格式是： 特别号码 30
//  Auth：Loafer.Liu @ 2004.9.
//  Updt：
//********************************************************************)
function TLotteryBuilder.GetSpecNum(str: string): byte;
var
  aStr: string;
  p: integer;
begin
    aStr := Trim(str);
    //把 “特别号码”这几个字去掉
    p := pos(' ', aStr);
    aStr := trim(copy( aStr, p, Length(aStr)-p+1 ));
    try
    result := StrToInt(aStr);
    except
    result := 0;
    end;
end;

function TLotteryBuilder.GetSundayNum(str: string): byte;
var
  aStr: string;
  p: integer;
begin
    aStr := Trim(str);
    //把 “星期天”这几个字去掉
    p := pos(' ', aStr);
    aStr := trim(copy( aStr, p, Length(aStr)-p+1 ));
    try
    result := StrToInt(aStr);
    except
    result := 0;
    end;
end;

(*********************************************************************
//  func：
//  Desc：主要是把 01 -- 09 转成 0 - 9
//  Parm：
//  Rslt：
//  Note：
//  Auth：Loafer.Liu @ 2004.9.
//  Updt：
//********************************************************************)
function TLotteryBuilder.MyStrToInt(str: string): integer;
begin
        str := trim(str);
        if str[1] = '0' then
          str := copy(str, 2, 1);
        result := strToInt(str);
end;

(*********************************************************************
//  func：
//  Desc：从字符串中提取数字号码
//  Parm：
//  Note：格式是： 基本号码 03  06  08  12  13  19  20
//  Auth：Loafer.Liu @ 2004.9.
//  Updt：
//*******************************************************************)
procedure TLotteryBuilder.QuickCount(para: TBufArray;
  var aNCRArray: TNumCntRecArray);
var
  i: integer;
  NCnt: byte;  
begin
        NCnt := Length(aNCRArray);
        for i := Low(para) to High(para) do
        begin
            if ( para[i] > 0 ) and ( para[i] <= NCnt ) then 
                aNCRArray[para[i]-1].Rcount := aNCRArray[para[i]-1].Rcount + 1;
        end;
end;

procedure TLotteryBuilder.SetMaxCount(const Value: integer);
begin
  FMaxCount := Value;
end;

(*********************************************************************
//  func：StatAllNumber
//  Desc：将所有的基本号、特别号混合组成一个数组，用于统计每个号的次数
//  Parm： numCount 选出号的个数 33选7为7，21选5为5
//  Rslt：
//  Note：
//  Auth：Loafer.Liu @ 2004.9.
//  Updt：
//********************************************************************)
function TLotteryBuilder.StatAllNumber(aLottery: TLotteryStyleArray;
  numCount: integer): TBufArray;
var
  RCnt,
  i, j: integer;
begin
        RCnt := Length(aLottery);

        setLength(result, RCnt * (numCount+1+1)); //加上特别号 //加上星期天 
        for i := 0 to RCnt-1 do
        begin
                //基本号
                for j := 0 to numCount-1 do
                begin
                        result[ i*(numCount+1+1) + j ] := aLottery[i].BaseNumber[j];
                end;
                //特别号
                result[i*(numCount+1+1) + (numCount)] := aLottery[i].SpecNumber;
                //双色球的星期天号
                result[i*(numCount+1+1) + (numCount+1)] := aLottery[i].SundayNum; 
        end;
end;

procedure TLotteryBuilder.StringToArray(str: string; NumCnt: integer;
        var arr: TBufArray);
var
  aStr: string;
  i, p: integer;
begin
        setLength(arr, NumCnt);
        aStr := Trim(str);

        //先把 “基本号码”这几个字去掉
        p := pos(' ', aStr);
        aStr := copy( aStr, p, Length(aStr)-p+1 );

        for i := 0 to (NumCnt-2) do
        begin
          try
            aStr := Trim(astr);
            p := pos(' ', aStr);
            arr[i] := MyStrToInt(copy(aStr, 0, p-1));    //copy(aStr, 0, p);
            aStr := copy( aStr, p, Length(aStr)-p +1);
          except
            arr[i] := 0;
          end;
        end;
    
        try
            arr[NumCnt-1] := MyStrToInt(aStr);
        except
            arr[NumCnt-1] := 0;
        end;

end;

(*********************************************************************
//  func：
//  Desc：AStr 是类似 2002001 06 08 12 18 23 24 25 27 的一串字符
        NumCnt基本号的个数
//  Parm：
//  Rslt：
//  Note：
//  Auth：Loafer.Liu @ 2004.9.
//  Updt：
//********************************************************************)
procedure TLotteryBuilder.StringToStyle(AStr: string;
        NumCnt: integer; var ALotStyle: TLotteryStyle);
var
  i, p: integer;
  arr: TBufArray;
begin
        setLength(ALotStyle.BaseNumber, NumCnt);
        setLength(arr, NumCnt+2);
        aStr := Trim(Astr);

        //第一步，取出期号
        p := pos(' ', aStr);
        ALotStyle.SerialID := copy(aStr, 1, p-1);
        aStr := copy( aStr, p, Length(aStr)-p+1 );

        //第二步，取基本号
        for i := 0 to (NumCnt+1) do
        begin
          try
            aStr := Trim(astr);
            p := pos(' ', aStr);
            //后面的字符串中没有了空格' '
            //此时后面可能有一个数字，或者没有数字了
            if p = 0 then
            begin
              try
                arr[i] := MyStrToInt(aStr);
                aStr := '';
              except
                arr[i] := 0;
              end;
              continue;
            end;
            arr[i] := MyStrToInt(copy(aStr, 0, p-1));
            aStr := copy( aStr, p, Length(aStr)-p +1);
          except
            arr[i] := 0;
          end;
        end;

        for i := 0 to (NumCnt-1) do
                ALotStyle.BaseNumber[i] := arr[i];
        ALotStyle.SpecNumber := arr[NumCnt];
        ALotStyle.SundayNum  := arr[NumCnt+1];

end;

end.
