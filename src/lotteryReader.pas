unit lotteryReader;

(*   �������¸�ʽ���ļ���ȡ����
 �������33ѡ7��2004134�ڿ������� (ʡ�������ģ�2004��11��15�գ�1266)
 �������� 06  13  16  19  20  29  32 
�ر���� 01 

 �������33ѡ7��2004133�ڿ������� (ʡ�������ģ�2004��11��12�գ�633)
 �������� 03  13  14  18  20  22  28 
�ر���� 33 
 
 �������33ѡ7��2004132�ڿ������� (ʡ�������ģ�2004��11��10�գ�973)
 �������� 05  15  21  24  29  30  33 
�ر���� 04 

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
//  func��
//  Desc�����ļ��ṹΪ���µ�����
    �ں�  ������1....������n  [�ر��] [�������]
//  Parm��
//  Note��
//  Auth��Loafer.Liu @ 2004.9.
//  Updt��
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
                ReadLn(F1, FLotterString[RcdCnt-1].SundayNum); //������
            except
                exit;
            end;
        end;
    finally
        CloseFile(F1);
    end;

end;


(*********************************************************************
//  func��
//  Desc�����ַ�����  [�������21ѡ5] �������21ѡ5��2003269�ڿ������� ��������� 01-02
        ��ȡ���ں� 

//  Parm��
//  Rslt��
//  Note��
//  Auth��Loafer.Liu @ 2004.9.
//  Updt��
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
