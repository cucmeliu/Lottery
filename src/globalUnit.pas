unit globalUnit;

interface

uses Forms, SysUtils, defineUnit;

  procedure QuickCount(para:TBufArray; var aNCRArray: TNumCntRecArray);
  function FindCurWindows(myForm: string): Boolean;

//  function Calc33s7All(aLottery33S7: TLotteryStyleArray): TBufArray;
  function StatAllNumber(aLottery: TLotteryStyleArray; numCount: integer): TBufArray;
  procedure StringToArray(str: string; NumCnt: integer;
        var arr: TBufArray; subStr: char=',');
  function MyStrToInt(str: string): integer;
  function GetSpecNumOfNum(ASrcStr: string; SpecifyNum: integer): string;

implementation


(*********************************************************************
//  func��
//  Desc��
//  Parm��
//  Note��
        NCnt: ��������Ԫ�ظ�������Ҫ������ȥ�� 0 �����������
        ��33��7������Ӧ���� 1 - 33 ֮��
//  Auth��Loafer.Liu @ 2004.9.
//  Updt��
//*******************************************************************)
procedure QuickCount(para:TBufArray; var aNCRArray: TNumCntRecArray);
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

// ���ҵ�ǰ����ʱ���Ѿ�������,�������,������뵱ǰ����
function FindCurWindows(myForm: string): Boolean;
var
  i:integer;
begin
       Result:=False;
       for i:=0 to Screen.FormCount-1 do
       begin
                if  Screen.Forms[i].ClassName=myForm then
                begin
                       Result:=True;
                       Screen.Forms[i].BringToFront;
                       break;
                end;
       end;
end;
         {
function Calc33s7All(aLottery33S7: TLotteryStyleArray): TBufArray;
var
  RCnt,
  i, j: integer;
begin
        RCnt := Length(aLottery33S7);
        setLength(result, RCnt * 8);//33);
        for i:=0 to RCnt-1 do
        begin
                for j:=0 to 6 do
                begin
                        result[ i*8 + j ] := aLottery33S7[i].BaseNumber[j];
                end;
                result[ i*8 + 7 ] := aLottery33S7[i].SpecNumber;
        end;
end;          }

(*********************************************************************
//  func��
//  Desc�������еĻ����š��ر�Ż�����һ�����飬����ͳ��ÿ���ŵĴ���
//  Parm�� numCount ѡ���ŵĸ��� 33ѡ7Ϊ7��21ѡ5Ϊ5
//  Rslt��
//  Note��
//  Auth��Loafer.Liu @ 2004.9.
//  Updt��
//********************************************************************)
function StatAllNumber(aLottery: TLotteryStyleArray;
        numCount: integer): TBufArray;
var
  RCnt,
  i, j: integer;
begin
        RCnt := Length(aLottery);

        setLength(result, RCnt * (numCount+1)); //�����ر��
        for i := 0 to RCnt-1 do
        begin
                for j := 0 to numCount-1 do
                begin
                        result[ i*(numCount+1) + j ] := aLottery[i].BaseNumber[j];
                end;
                result[i*(numCount+1) + (numCount)] := aLottery[i].SpecNumber;
        end;
end;


(*********************************************************************
//  func��
//  Desc�����ַ�������ȡ���ֺ���
//  Parm��
//  Note����ʽ�ǣ�03  06  08  12  13  19  20
//  Auth��Loafer.Liu @ 2004.9.
//  Updt��
//*******************************************************************)
procedure StringToArray(str: string; NumCnt: integer;
        var arr: TBufArray; subStr: char=',');
var
  aStr: string;
  i, p: integer;
begin
        setLength(arr, NumCnt);
        aStr := Trim(str);

        for i := 0 to (NumCnt-2) do
        begin
          try
            aStr := Trim(astr);
            p := pos(subStr, aStr);
            arr[i] := MyStrToInt(copy(aStr, 0, p-1));    //copy(aStr, 0, p);
            aStr := copy( aStr, p+1, Length(aStr)-p +1);
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

function MyStrToInt(str: string): integer;
begin
        str := trim(str);
        if str[1] = '0' then
          str := copy(str, 2, 1);
        result := strToInt(str);
end;

function GetSpecNumOfNum(ASrcStr: string; SpecifyNum: integer): string;
begin

end;

end.
