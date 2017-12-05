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
    //ȫ������ת���ɰ��
    procedure SBC_To_DBC(ASrcList: TStringList; var ADstList: TStringList);
    function ConvertQJ2BJ(ObjString :string): string;

implementation

uses unitGlobal;


(*********************************************************************
//  func��
//  Desc��
�˹��̴���ĸ�ʽ�ǣ�
  [�������21ѡ5] �������21ѡ5��2003269�ڿ������� ��������� 01-02
  �������� 07  12  13  17  21
  <����>
  <����>
//  Parm��
//  Rslt��
//  Note��
//  Auth��Loafer.Liu @ 2004.9.
//  Updt��
//********************************************************************)
procedure Deal_sx_21s5(ASrcList: TStringList; var ADstList: TStringList);
var
  i, p: integer;
  dstCnt: integer;
  dstStr: string;
begin
        if (ASrcList.Count mod 4) <> 0 then exit;  //���������еı���
        dstCnt := ASrcList.Count div 4;
        for i := 0 to dstCnt-1 do
        begin
                dstStr := '';
                //�Ȱ��ں��ҳ���
                p := pos('200', ASrcList[4*i]);
                dstStr := Trim(copy(ASrcList[4*i], p, 7));
                //������
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
        if (ASrcList.Count mod 4) <> 0 then exit;  //���������еı���
        dstCnt := ASrcList.Count div 4;
        for i := 0 to dstCnt-1 do
        begin
                dstStr := '';
                //�Ȱ��ں��ҳ���
                p := pos('200', ASrcList[4*i]);
                dstStr := Trim(copy(ASrcList[4*i], p, 7));
                //������
                p := pos(' ', Trim(ASrcList[4*i+1]));          //���֣�ƫ��2�ֽ�
                dstStr := dstStr + ' ' + Trim(copy(ASrcList[4*i+1], p+2, Length(ASrcList[4*i+1])-p+1));
                //�ر��
                p := pos(' ', Trim(ASrcList[4*i+2]));          //Ӣ�ģ�ƫ��1�ֽ�
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
        if (ASrcList.Count mod 4) <> 0 then exit;  //���������еı���
        dstCnt := ASrcList.Count div 4;
        for i := 0 to dstCnt-1 do
        begin
                dstStr := '';
                //�Ȱ��ں��ҳ���
                p := pos('200', ASrcList[4*i]);
                dstStr := Trim(copy(ASrcList[4*i], p, 7));
                //��ɫ��
                p := pos(' ', Trim(ASrcList[4*i+1]));          //���֣�ƫ��2�ֽ�
                dstStr := dstStr + ' ' + Trim(copy(ASrcList[4*i+1], p+2, Length(ASrcList[4*i+1])-p+1));
                //��ɫ��
                p := pos(' ', Trim(ASrcList[4*i+2]));          //Ӣ�ģ�ƫ��1�ֽ�
                dstStr := dstStr + ' ' + Trim(copy(ASrcList[4*i+2], p+2, Length(ASrcList[4*i+2])-p+1));
                //�������
                p := pos(' ', Trim(ASrcList[4*i+3]));
                if p <> 0 then
                            dstStr := dstStr + ' '
                                    + Trim(copy(ASrcList[4*i+3], p+1, Length(ASrcList[4*i+3])-p+1));
                ADstList.Add(dstStr);
        end;
end;

(*********************************************************************
//  func��
//  Desc��ֻ�л����ŵ����
//  Parm��
//  Rslt��
//  Note��
//  Auth��Loafer.Liu @ 2004.9.
//  Updt��
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
        if (ASrcList.Count mod LineCycle) <> 0 then exit;  //������LineCycle�ı�������Ҫ������������
        dstCnt := ASrcList.Count div LineCycle;
        for i := 0 to dstCnt-1 do
        begin
                dstStr := '';
        //�Ȱ��ں��ҳ���
                curLine := LineCycle*i+SerialParam.LineNum-1;   //���㿪ʼ
                curStr := Trim(ASrcList[curLine]);
                p := pos(SerialParam.StartInde, curStr);
                dstStr := Trim(copy(curStr, p, SerialParam.NumCount));
        //������
                curLine := LineCycle*i+BaseParam.LineNum-1;
                curStr := Trim(ASrcList[curLine]);
                //���ҵ���־
                p := pos(BaseParam.StartInde, curStr);
                curStr := Trim(rightBStr(curStr, Length(curStr)-p));
                if BaseParam.StartInde <> '' then
            begin
                //��־֮��Ŀո�ʼ��Ϊ���������
                p := pos(' ', curStr);
                curStr := Trim(RightBStr(curStr, Length(curStr)-p));
                dstStr := dstStr + ' ' + GetSpecNumOfNum(curStr, BaseParam.NumCount);
            end else dstStr := dstStr + ' ' + curStr;
                //Trim(copy(ASrcList[curLine], p+2, Length(ASrcList[curLine])-p+1));
                ADstList.Add(dstStr);
        end;
end;

(*********************************************************************
//  func��
//  Desc���л����ź��ر�ŵ����
//  Parm��
//  Note��
//  Auth��Loafer.Liu @ 2004.9.
//  Updt��
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
        if (ASrcList.Count mod LineCycle) <> 0 then exit;  //������LineCycle�ı�������Ҫ������������
        dstCnt := ASrcList.Count div LineCycle;
        for i := 0 to dstCnt-1 do
        begin
                dstStr := '';
        //�Ȱ��ں��ҳ���
                curLine := LineCycle*i+SerialParam.LineNum-1;   //���㿪ʼ
                curStr := Trim(ASrcList[curLine]);
                p := pos(SerialParam.StartInde, curStr);
                dstStr := Trim(copy(curStr, p, SerialParam.NumCount));
        //������
                curLine := LineCycle*i+BaseParam.LineNum-1;
                curStr := Trim(ASrcList[curLine]);
                //���ҵ���־
                p := pos(BaseParam.StartInde, curStr);
                curStr := Trim(rightBStr(curStr, Length(curStr)-p));
                //��־֮��Ŀո�ʼ��Ϊ���������
                p := pos(' ', curStr);
                curStr := Trim(rightBStr(curStr, Length(curStr)-p));
                dstStr := dstStr + ' ' + GetSpecNumOfNum(curStr, BaseParam.NumCount);
        //�ر��
                curLine := LineCycle*i+SpecParam.LineNum-1;
                curStr := Trim(ASrcList[curLine]);
                //���ҵ���־
                p := pos(SpecParam.StartInde, curStr);
                curStr := Trim(rightBStr(curStr, Length(curStr)-p));
                //��־֮��Ŀո�ʼ��Ϊ���������
                p := pos(' ', curStr);
                curStr := Trim(RightBStr(curStr, Length(curStr)-p));
                //��ֻ����ֻ��һ���ر�ŵ����
                dstStr := dstStr + ' ' + GetSpecNumOfNum(curStr, 1); 
        //��ӵ�Ŀ��������
                ADstList.Add(dstStr);
        end;
  
end;

(*********************************************************************
//  func��
//  Desc���л����š��ر�ź�������ŵ����
//  Parm��
//  Note��
//  Auth��Loafer.Liu @ 2004.9.
//  Updt��
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
        if (ASrcList.Count mod LineCycle) <> 0 then exit;  //������LineCycle�ı�������Ҫ������������
        dstCnt := ASrcList.Count div LineCycle;
        for i := 0 to dstCnt-1 do
        begin
                dstStr := '';
        //�Ȱ��ں��ҳ���
                curLine := LineCycle*i+SerialParam.LineNum-1;   //���㿪ʼ
                curStr := Trim(ASrcList[curLine]);
                p := pos(SerialParam.StartInde, curStr);
                dstStr := Trim(copy(curStr, p, SerialParam.NumCount));
        //������
                curLine := LineCycle*i+BaseParam.LineNum-1;
                curStr := Trim(ASrcList[curLine]);
                //���ҵ���־
                p := pos(BaseParam.StartInde, curStr);
                curStr := Trim(rightBStr(curStr, Length(curStr)-p));
                //��־֮��Ŀո�ʼ��Ϊ���������
                p := pos(' ', curStr);
                curStr := Trim(RightBStr(curStr, Length(curStr)-p));
                dstStr := dstStr + ' ' + GetSpecNumOfNum(curStr, BaseParam.NumCount);
                //Trim(copy(ASrcList[curLine], p+2, Length(ASrcList[curLine])-p+1));
        //�ر��
                curLine := LineCycle*i+SpecParam.LineNum-1;
                curStr := Trim(ASrcList[curLine]);
                //���ҵ���־
                p := pos(SpecParam.StartInde, curStr);
                curStr := Trim(rightBStr(curStr, Length(curStr)-p));
                //��־֮��Ŀո�ʼ��Ϊ���������
                p := pos(' ', curStr);
                curStr := Trim(RightBStr(curStr, Length(curStr)-p));
                //��ֻ����ֻ��һ���ر�ŵ����
                dstStr := dstStr + ' ' + GetSpecNumOfNum(curStr, 1);
        //�������
                curLine := LineCycle*i+SundayParam.LineNum-1;
                curStr := Trim(ASrcList[curLine]);
                //���ҵ���־
                p := pos(SundayParam.StartInde, curStr);
                curStr := Trim(rightBStr(curStr, Length(curStr)-p));
                //��־֮��Ŀո�ʼ��Ϊ���������
                p := pos(' ', curStr);
                curStr := Trim(RightBStr(curStr, Length(curStr)-p));
                //��ֻ����ֻ��һ���ر�ŵ����
                dstStr := dstStr + ' ' + GetSpecNumOfNum(curStr, 1);  

        //��ӵ�Ŀ��������
                ADstList.Add(dstStr);
        end;

end;

(*********************************************************************
//  func��
//  Desc����ȫ�ǵ�����ת���ɰ��
//  Parm��
//  Note��
//  Auth��Loafer.Liu @ 2004.9.
//  Updt��
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
//  func��ConvertQJ2BJ
//  Desc��ȫ������ת���ɰ��
//  Parm��
//  Rslt��
//  Note������bmy Delphi��
//  Auth��Loafer.Liu @ 20045.
//  Updt��
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
    if c = '��'  THEN SW[I] := '1';
    if c = '��'  THEN SW[I] := '2';
    if c = '��'  THEN SW[I] := '3';
    if c = '��'  THEN SW[I] := '4';
    if c = '��'  THEN SW[I] := '5';
    if c = '��'  THEN SW[I] := '6';
    if c = '��'  THEN SW[I] := '7';
    if c = '��'  THEN SW[I] := '8';
    if c = '��'  THEN SW[I] := '9';
    if c = '��'  THEN SW[I] := '0';
    if c = '��'  THEN SW[I] := '.';
    if c = '��'  then SW[I] := ' ';
//    if c = '��'  then SW[I] := ': ';
  end;
  Result := sw;
end;

end.
