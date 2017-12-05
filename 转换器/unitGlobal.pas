unit UnitGlobal;

interface

uses Forms, SysUtils;

  function MyStrToInt(str: string): integer;
  function MyIntToStr(AInt: integer): string; overload;
  function MyIntToStr(AStr: string): string; overload;
  function GetSpecNumOfNum(ASrcStr: string; SpecifyNum: integer): string;

implementation

(*********************************************************************
//  func��MyStrToInt
//  Desc��ת��������������0��ͷ��ȥ��0
//  Parm��
//  Rslt��
//  Note��
//  Auth��Loafer.Liu @ 2004.9.
//  Updt��
//********************************************************************)
function MyStrToInt(str: string): integer;
begin
        str := trim(str);
        if str[1] = '0' then
                str := copy(str, 2, 1);
        result := strToInt(str);
end;

function MyIntToStr(AInt: integer): string;
begin
        result := '';
end;

(*********************************************************************
//  func��MyIntToStr
//  Desc��������ת���������ַ���С��10��ǰ��0
//  Parm��
//  Rslt��
//  Note��
//  Auth��Loafer.Liu @ 2004.9.
//  Updt��
//********************************************************************)
function MyIntToStr(AStr: string): string;
var
  aInt: integer;
begin
    try
        aInt := StrToInt(AStr);
    except
        aInt := 0;
    end;
        if aInt < 10 then result := '0'+IntToStr(aInt)
        else result := IntToStr(aInt);

end;

(*********************************************************************
//  func��
//  Desc���Ӵ�����ȡָ�����������֣���������0���棬�ÿո�ֿ�
//  Parm��
//  Rslt��
//  Note��
//  Auth��Loafer.Liu @ 2004.9.
//  Updt��
//********************************************************************)
function GetSpecNumOfNum(ASrcStr: string; SpecifyNum: integer): string;
var
  i, p: integer;
begin
        result := '';
        for i := 0 to (SpecifyNum-1) do
        begin
            try
                ASrcStr := Trim(ASrcStr);
                p := pos(' ', ASrcStr);
                if p = 0 then
                begin
                        result := result + ' ' + MyIntToStr(ASrcStr);
                end else
                    begin
                    result := result + ' ' + MyIntToStr(Trim(copy(ASrcStr, 0, p-1)));
                    ASrcStr := copy(ASrcStr, p+1, Length(ASrcStr)-p +1);
                    end;
            except
                result := result + ' 00';
            end;
        end;

end;

end.
