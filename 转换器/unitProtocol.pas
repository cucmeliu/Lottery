unit unitProtocol;

interface

uses classes, sysUtils, unitDefine, StrUtils;

    procedure Deal_sx_21s5(ASrcList: TStringList; var ADstList: TStringList);
    procedure Deal_sx_33s7(ASrcList: TStringList; var ADstList: TStringList);
    procedure Deal_sx_2col(ASrcList: TStringList; var ADstList: TStringList);

    procedure Deal_Global(LineCycle: integer; SerialParam, BaseParam: TDataParam;
        ASrcList: TStringList; var ADstList: TStringList); overload;
    procedure Deal_Global(LineCycle: integer; SerialParam, BaseParam, SpecParam: TDataParam;
        ASrcList: TStringList; var ADstList: TStringList); overload;
    procedure Deal_Global(LineCycle: integer; SerialParam, BaseParam, SpecParam, SundayParam: TDataParam;
        ASrcList: TStringList; var ADstList: TStringList); overload;
    //全角数字转换成半角
    procedure SBC_To_DBC(ASrcList: TStringList; var ADstList: TStringList);
    function ConvertQJ2BJ(ObjString :string): string;

implementation

uses unitGlobal;


(*********************************************************************
//  func：
//  Desc：
此过程处理的格式是：
  [陕西风采21选5] 陕西风采21选5第2003269期开奖公告 陕西风采网 01-02
  基本号码 07  12  13  17  21
  <空行>
  <空行>
//  Parm：
//  Rslt：
//  Note：
//  Auth：Loafer.Liu @ 2004.9.
//  Updt：
//********************************************************************)
procedure Deal_sx_21s5(ASrcList: TStringList; var ADstList: TStringList);
var
  i, p: integer;
  dstCnt: integer;
  dstStr: string;
begin
        if (ASrcList.Count mod 4) <> 0 then exit;  //必须是四行的倍数
        dstCnt := ASrcList.Count div 4;
        for i := 0 to dstCnt-1 do
        begin
                dstStr := '';
                //先把期号找出来
                p := pos('200', ASrcList[4*i]);
                dstStr := Trim(copy(ASrcList[4*i], p, 7));
                //基本号
                p := pos(' ', Trim(ASrcList[4*i+1]));
                dstStr := dstStr + ' ' + Trim(copy(ASrcList[4*i+1], p+2, Length(ASrcList[4*i+1])-p+1));
                ADstList.Add(dstStr);
        end;
end;


procedure Deal_sx_33s7(ASrcList: TStringList; var ADstList: TStringList);
var
  i, p: integer;
  dstCnt: integer;
  dstStr: string;
begin
        if (ASrcList.Count mod 4) <> 0 then exit;  //必须是四行的倍数
        dstCnt := ASrcList.Count div 4;
        for i := 0 to dstCnt-1 do
        begin
                dstStr := '';
                //先把期号找出来
                p := pos('200', ASrcList[4*i]);
                dstStr := Trim(copy(ASrcList[4*i], p, 7));
                //基本号
                p := pos(' ', Trim(ASrcList[4*i+1]));          //汉字，偏移2字节
                dstStr := dstStr + ' ' + Trim(copy(ASrcList[4*i+1], p+2, Length(ASrcList[4*i+1])-p+1));
                //特别号
                p := pos(' ', Trim(ASrcList[4*i+2]));          //英文，偏移1字节
                dstStr := dstStr + ' ' + Trim(copy(ASrcList[4*i+2], p+1, Length(ASrcList[4*i+2])-p+1));
                ADstList.Add(dstStr);
        end;
end;

procedure Deal_sx_2col(ASrcList: TStringList; var ADstList: TStringList);
var
  i, p: integer;
  dstCnt: integer;
  dstStr: string;
begin
        if (ASrcList.Count mod 4) <> 0 then exit;  //必须是四行的倍数
        dstCnt := ASrcList.Count div 4;
        for i := 0 to dstCnt-1 do
        begin
                dstStr := '';
                //先把期号找出来
                p := pos('200', ASrcList[4*i]);
                dstStr := Trim(copy(ASrcList[4*i], p, 7));
                //红色球
                p := pos(' ', Trim(ASrcList[4*i+1]));          //汉字，偏移2字节
                dstStr := dstStr + ' ' + Trim(copy(ASrcList[4*i+1], p+2, Length(ASrcList[4*i+1])-p+1));
                //蓝色球
                p := pos(' ', Trim(ASrcList[4*i+2]));          //英文，偏移1字节
                dstStr := dstStr + ' ' + Trim(copy(ASrcList[4*i+2], p+2, Length(ASrcList[4*i+2])-p+1));
                //星期天号
                p := pos(' ', Trim(ASrcList[4*i+3]));
                if p <> 0 then
                            dstStr := dstStr + ' '
                                    + Trim(copy(ASrcList[4*i+3], p+1, Length(ASrcList[4*i+3])-p+1));
                ADstList.Add(dstStr);
        end;
end;

(*********************************************************************
//  func：
//  Desc：只有基本号的情况
//  Parm：
//  Rslt：
//  Note：
//  Auth：Loafer.Liu @ 2004.9.
//  Updt：
//********************************************************************)
procedure Deal_Global(LineCycle: integer; SerialParam, BaseParam: TDataParam;
        ASrcList: TStringList; var ADstList: TStringList);
var
  i, p: integer;
  curStr: string;
  curLine,
  dstCnt: integer;
  dstStr: string;
begin
        if (ASrcList.Count mod LineCycle) <> 0 then exit;  //必须是LineCycle的倍数，即要是完整的周期
        dstCnt := ASrcList.Count div LineCycle;
        for i := 0 to dstCnt-1 do
        begin
                dstStr := '';
        //先把期号找出来
                curLine := LineCycle*i+SerialParam.LineNum-1;   //从零开始
                curStr := Trim(ASrcList[curLine]);
                p := pos(SerialParam.StartInde, curStr);
                dstStr := Trim(copy(curStr, p, SerialParam.NumCount));
        //基本号
                curLine := LineCycle*i+BaseParam.LineNum-1;
                curStr := Trim(ASrcList[curLine]);
                //先找到标志
                p := pos(BaseParam.StartInde, curStr);
                curStr := Trim(rightBStr(curStr, Length(curStr)-p));
                if BaseParam.StartInde <> '' then
            begin
                //标志之后的空格开始，为所需的数字
                p := pos(' ', curStr);
                curStr := Trim(RightBStr(curStr, Length(curStr)-p));
                dstStr := dstStr + ' ' + GetSpecNumOfNum(curStr, BaseParam.NumCount);
            end else dstStr := dstStr + ' ' + curStr;
                //Trim(copy(ASrcList[curLine], p+2, Length(ASrcList[curLine])-p+1));
                ADstList.Add(dstStr);
        end;
end;

(*********************************************************************
//  func：
//  Desc：有基本号和特别号的情况
//  Parm：
//  Note：
//  Auth：Loafer.Liu @ 2004.9.
//  Updt：
//*******************************************************************)
procedure Deal_Global(LineCycle: integer; SerialParam, BaseParam, SpecParam: TDataParam;
        ASrcList: TStringList; var ADstList: TStringList);
var
  i, p: integer;
  curStr: string;
  curLine,
  dstCnt: integer;
  dstStr: string;
begin
        if (ASrcList.Count mod LineCycle) <> 0 then exit;  //必须是LineCycle的倍数，即要是完整的周期
        dstCnt := ASrcList.Count div LineCycle;
        for i := 0 to dstCnt-1 do
        begin
                dstStr := '';
        //先把期号找出来
                curLine := LineCycle*i+SerialParam.LineNum-1;   //从零开始
                curStr := Trim(ASrcList[curLine]);
                p := pos(SerialParam.StartInde, curStr);
                dstStr := Trim(copy(curStr, p, SerialParam.NumCount));
        //基本号
                curLine := LineCycle*i+BaseParam.LineNum-1;
                curStr := Trim(ASrcList[curLine]);
                //先找到标志
                p := pos(BaseParam.StartInde, curStr);
                curStr := Trim(rightBStr(curStr, Length(curStr)-p));
                //标志之后的空格开始，为所需的数字
                p := pos(' ', curStr);
                curStr := Trim(rightBStr(curStr, Length(curStr)-p));
                dstStr := dstStr + ' ' + GetSpecNumOfNum(curStr, BaseParam.NumCount);
        //特别号
                curLine := LineCycle*i+SpecParam.LineNum-1;
                curStr := Trim(ASrcList[curLine]);
                //先找到标志
                p := pos(SpecParam.StartInde, curStr);
                curStr := Trim(rightBStr(curStr, Length(curStr)-p));
                //标志之后的空格开始，为所需的数字
                p := pos(' ', curStr);
                curStr := Trim(RightBStr(curStr, Length(curStr)-p));
                //现只处理只有一个特别号的情况
                dstStr := dstStr + ' ' + GetSpecNumOfNum(curStr, 1); 
        //添加到目标链表中
                ADstList.Add(dstStr);
        end;
  
end;

(*********************************************************************
//  func：
//  Desc：有基本号、特别号和星期天号的情况
//  Parm：
//  Note：
//  Auth：Loafer.Liu @ 2004.9.
//  Updt：
//*******************************************************************)
procedure Deal_Global(LineCycle: integer; SerialParam, BaseParam, SpecParam, SundayParam: TDataParam;
        ASrcList: TStringList; var ADstList: TStringList);
var
  i, p: integer;
  curStr: string;
  curLine,
  dstCnt: integer;
  dstStr: string;
begin
        if (ASrcList.Count mod LineCycle) <> 0 then exit;  //必须是LineCycle的倍数，即要是完整的周期
        dstCnt := ASrcList.Count div LineCycle;
        for i := 0 to dstCnt-1 do
        begin
                dstStr := '';
        //先把期号找出来
                curLine := LineCycle*i+SerialParam.LineNum-1;   //从零开始
                curStr := Trim(ASrcList[curLine]);
                p := pos(SerialParam.StartInde, curStr);
                dstStr := Trim(copy(curStr, p, SerialParam.NumCount));
        //基本号
                curLine := LineCycle*i+BaseParam.LineNum-1;
                curStr := Trim(ASrcList[curLine]);
                //先找到标志
                p := pos(BaseParam.StartInde, curStr);
                curStr := Trim(rightBStr(curStr, Length(curStr)-p));
                //标志之后的空格开始，为所需的数字
                p := pos(' ', curStr);
                curStr := Trim(RightBStr(curStr, Length(curStr)-p));
                dstStr := dstStr + ' ' + GetSpecNumOfNum(curStr, BaseParam.NumCount);
                //Trim(copy(ASrcList[curLine], p+2, Length(ASrcList[curLine])-p+1));
        //特别号
                curLine := LineCycle*i+SpecParam.LineNum-1;
                curStr := Trim(ASrcList[curLine]);
                //先找到标志
                p := pos(SpecParam.StartInde, curStr);
                curStr := Trim(rightBStr(curStr, Length(curStr)-p));
                //标志之后的空格开始，为所需的数字
                p := pos(' ', curStr);
                curStr := Trim(RightBStr(curStr, Length(curStr)-p));
                //现只处理只有一个特别号的情况
                dstStr := dstStr + ' ' + GetSpecNumOfNum(curStr, 1);
        //星期天号
                curLine := LineCycle*i+SundayParam.LineNum-1;
                curStr := Trim(ASrcList[curLine]);
                //先找到标志
                p := pos(SundayParam.StartInde, curStr);
                curStr := Trim(rightBStr(curStr, Length(curStr)-p));
                //标志之后的空格开始，为所需的数字
                p := pos(' ', curStr);
                curStr := Trim(RightBStr(curStr, Length(curStr)-p));
                //现只处理只有一个特别号的情况
                dstStr := dstStr + ' ' + GetSpecNumOfNum(curStr, 1);  

        //添加到目标链表中
                ADstList.Add(dstStr);
        end;

end;

(*********************************************************************
//  func：
//  Desc：将全角的数字转换成半角
//  Parm：
//  Note：
//  Auth：Loafer.Liu @ 2004.9.
//  Updt：
//*******************************************************************)
procedure SBC_To_DBC(ASrcList: TStringList; var ADstList: TStringList);
var
  i: integer;
begin
        for i := 0 to ASrcList.Count-1 do
        begin
                ADstList.Add(ConvertQJ2BJ(ASrcList[i]));
        end;
end;

(*********************************************************************
//  func：ConvertQJ2BJ
//  Desc：全角数字转换成半角
//  Parm：
//  Rslt：
//  Note：来自bmy Delphi版
//  Auth：Loafer.Liu @ 20045.
//  Updt：
//********************************************************************)
function ConvertQJ2BJ(ObjString: string):string;
var
  SW: WideString;
  i : smallint;
  c : string;
begin
  SW := ObjString;
  for i :=1 to Length(SW) do
  begin
    C := SW[i];
    if c = '１'  THEN SW[I] := '1';
    if c = '２'  THEN SW[I] := '2';
    if c = '３'  THEN SW[I] := '3';
    if c = '４'  THEN SW[I] := '4';
    if c = '５'  THEN SW[I] := '5';
    if c = '６'  THEN SW[I] := '6';
    if c = '７'  THEN SW[I] := '7';
    if c = '８'  THEN SW[I] := '8';
    if c = '９'  THEN SW[I] := '9';
    if c = '０'  THEN SW[I] := '0';
    if c = '．'  THEN SW[I] := '.';
    if c = '　'  then SW[I] := ' ';
//    if c = '：'  then SW[I] := ': ';
  end;
  Result := sw;
end;

end.
