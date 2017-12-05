unit Lottery21S5;

interface

uses LotteryBuilder;


type
  TLottery21S5 = class(TLotteryBuilder)
  private

  protected
//    procedure StringToArray(str: string; var arr: TBufArray);override;

  public
    constructor Create;
    destructor Destroy; override;
  published 

  end;


implementation

{ TLottery21S5 }

constructor TLottery21S5.Create;
begin

end;

destructor TLottery21S5.Destroy;
begin

  inherited;
end;
            {
procedure TLottery21S5.StringToArray(str: string; var arr: TBufArray);
var
  aStr: string;
  i, p: integer;
begin
  inherited;        
        setLength(arr, 5);
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
