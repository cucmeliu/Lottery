unit Lottery2ColorReader;

interface

uses lotteryReader;

type

  TLottery2ColorReader = class(TLotteryReader)
  private

  protected

  public
    procedure ReadFile(FileName: string);
  published 

  end;


implementation

{ TLottery2ColorReader }

procedure TLottery2ColorReader.ReadFile(FileName: string);
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
                ReadLn(F1, FLotterString[RcdCnt-1].SerialID);
                ReadLn(F1, FLotterString[RcdCnt-1].BaseNumber);
                ReadLn(F1, FLotterString[RcdCnt-1].SpecNumber);
                ReadLn(F1, FLotterString[RcdCnt-1].SundayNum); //¶Á¿ÕÐÐ
            except
                exit;
            end;
        end;
    finally
        CloseFile(F1);
    end;
end;

end.
