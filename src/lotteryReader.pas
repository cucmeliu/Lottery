unit lotteryReader;

(*   基于如下格式的文件读取的类
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

uses defineUnit, classes;

type

  TLotteryReader = class
  private
    FFileName: string;
//    function TrimSerialID(srcSerial: string): string;
  protected

  public
    FLotterString: TLotterStringArray;
    fLotStrList: TStringList;

    constructor Create;
    destructor Destroy; override;

    procedure ReadFile(FileName: string);
    procedure ReadMe(FileName: string);
    procedure SaveMe(FileName: string);
    
  published

  end;


implementation

uses SysUtils;

{ TLotteryReader }

constructor TLotteryReader.Create;
begin
        FFileName := '';
        setLength(FLotterString, 0);
        fLotStrList := TStringList.Create;
end;

destructor TLotteryReader.Destroy;
begin
        FLotterString := nil;
        fLotStrList.Free;
  inherited;
end;

(*********************************************************************
//  func：
//  Desc：读文件结构为如下的数据
    期号  基本号1....基本号n  [特别号] [星期天号]
//  Parm：
//  Note：
//  Auth：Loafer.Liu @ 2004.9.
//  Updt：
//*******************************************************************)
procedure TLotteryReader.ReadMe(FileName: string);
var
  r: TStrRec;
  f: file of TStrRec;
begin
        //fLotStrList.LoadFromFile(FileName); 
        fLotStrList.Clear;
        AssignFile(f, FileName);
        Reset(f);
        while not eof(f) do
        begin
                read(f, r);
                fLotStrList.Add(r.Str);
        end;
        CloseFile(f);
end;

procedure TLotteryReader.ReadFile(FileName: string);
var
  F1: TextFile;
  RcdCnt: integer;
begin
    try
        setLength(FLotterString, 0);
        RcdCnt := 0;
        AssignFile(F1, Filename);
        Reset(F1);
        while not Eof(F1) do
        begin
            try
                RcdCnt := RcdCnt + 1;
                setLength(FLotterString, RcdCnt);
                ReadLn(F1, FLotterString[RcdCnt-1].SerialID );
                ReadLn(F1, FLotterString[RcdCnt-1].BaseNumber );
                ReadLn(F1, FLotterString[RcdCnt-1].SpecNumber );
                ReadLn(F1, FLotterString[RcdCnt-1].SundayNum); //读空行
            except
                exit;
            end;
        end;
    finally
        CloseFile(F1);
    end;

end;


(*********************************************************************
//  func：
//  Desc：从字符串：  [陕西风采21选5] 陕西风采21选5第2003269期开奖公告 陕西风采网 01-02
        中取出期号 

//  Parm：
//  Rslt：
//  Note：
//  Auth：Loafer.Liu @ 2004.9.
//  Updt：
//********************************************************************)
//function TLotteryReader.TrimSerialID(srcSerial: string): string;
//begin

//end;

procedure TLotteryReader.SaveMe(FileName: string);
var
  r: TStrRec;
  f: file of TStrRec;
  i: integer;
begin  
        AssignFile(f, FileName);
        Rewrite(f);
        for i:=0 to fLotStrList.Count-1 do
        begin
                r.Str := fLotStrList[i];
                write(f, r);
        end;
        CloseFile(f);
end;

end.
