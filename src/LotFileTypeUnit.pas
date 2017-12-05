unit LotFileTypeUnit;

interface

uses IniFiles, defineUnit;

type

  TLotFileType = class
  private
    FSerialID: integer;
    FFileName: string;
    procedure SetFileName(const Value: string);
    procedure SetSerialID(const Value: integer);

  protected

  public
    constructor Create(FileName, ItemName: string);
    destructor Destroy; override;

    procedure IncSerialID;
    procedure AppendRecord(aRecord: TLotteryStyle);

    property FileName: string read FFileName write SetFileName;
    property SerialID: integer read FSerialID write SetSerialID;

  published 

  end;


implementation

{ TLotFileType }

procedure TLotFileType.AppendRecord(aRecord: TLotteryStyle);
var
  LotFile: TextFile;
  i: integer;
  baseStr: string;
begin
        AssignFile(LotFile, fFileName);
        Reset(LotFile);
        //期数          aRecord.SerialID
        //基本号
        baseStr := '';
        for i:=Low(aRecord.BaseNumber) to High(aRecord.BaseNumber)-1 do
        begin
//                baseStr := baseStr + IntToStr(aRecord.BaseNumber[i]) + ' ';
        end;
//        baseStr := baseStr + IntToStr(aRecord.BaseNumber[Length(aRecord.BaseNumber)-1]);

{
        (                                IntToStr(aRecord.BaseNumber[0])+','
                                         +IntToStr(aRecord.BaseNumber[1])+','
                                         +IntToStr(aRecord.BaseNumber[2])+','
                                         +IntToStr(aRecord.BaseNumber[3])+','
                                         +IntToStr(aRecord.BaseNumber[4])+','
                                         +IntToStr(aRecord.BaseNumber[5])+','
                                         +IntToStr(aRecord.BaseNumber[6]));
        }
        //特别号        IntToStr(aRecord.SpecNumber)

        //快乐星期天    IntToStr(aRecord.SundayNum)

        CloseFile(LotFile);

end;

constructor TLotFileType.Create(FileName, ItemName: string);
var
  IniFile: TIniFile;
begin
        IniFile := TIniFile.Create(FileName);
    try
        FSerialID := IniFile.ReadInteger('SerialNo', ItemName, 2004001);
        FFileName := IniFile.ReadString('FileName', ItemName, '');;
        Inc(FSerialID);
    finally
        IniFile.Free;
    end;
end;

destructor TLotFileType.Destroy;
begin

  inherited;
end;

procedure TLotFileType.IncSerialID;
begin
        inc(FSerialID);
end;

procedure TLotFileType.SetFileName(const Value: string);
begin
  FFileName := Value;
end;

procedure TLotFileType.SetSerialID(const Value: integer);
begin
  FSerialID := Value;
end;

end.
