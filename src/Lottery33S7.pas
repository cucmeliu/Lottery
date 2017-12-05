unit Lottery33S7;

interface

uses SysUtils, defineUnit, LotteryBuilder;

type

  TLottery33S7 = class(TLotteryBuilder)
  private

  protected
//     procedure StringToArray(str: string; var arr: TBufArray); override;
  public
    FLottery33S7: TLotteryStyleArray;

    constructor Create;
    destructor Destroy; override;
    procedure BuildStyle(LotStrings: TLotterStringArray); //override;

  published

  end;


implementation

{ TLottery33S7 }

procedure TLottery33S7.BuildStyle(LotStrings: TLotterStringArray);
var
  i, j: integer;
begin
        j := 0;
        setLength( FLottery33S7, Length(LotStrings) );

        for i := Low( LotStrings ) to High( LotStrings ) do
        begin   
                FLottery33S7[j].SerialID := Trim(LotStrings[i].SerialID);
                StringToArray(LotStrings[i].BaseNumber, 7, FLottery33S7[j].BaseNumber);
                FLottery33S7[j].SpecNumber := GetSpecNum(LotStrings[i].SpecNumber);
                j := j + 1;
        end;

end;

constructor TLottery33S7.Create;
begin
        setLength(FLottery33S7, 0);
end;

destructor TLottery33S7.Destroy;
begin
        FLottery33S7 := nil;
  inherited;
end;
               {
(*********************************************************************
//  func：
//  Desc：
//  Parm：
//  Note：格式是： 基本号码 03  06  08  12  13  19  20
//  Auth：Loafer.Liu @ 2004.9.
//  Updt：
//*******************************************************************)
procedure TLottery33S7.StringToArray(str: string; var arr: TBufArray);//TMsgArray);
var
  aStr: string;
  i, p: integer;
begin
        setLength(arr, 7);
        aStr := Trim(str);

        //先把 “基本号码”这几个字去掉
        p := pos(' ', aStr);
        aStr := copy( aStr, p, Length(aStr)-p+1 );

        for i := 0 to 5 do
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
            arr[6] := MyStrToInt(aStr);
        except
            arr[6] := 0;
        end;

end;
         }
end.
