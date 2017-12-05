unit lotteryList;

interface

uses Classes;

type

  TLotteryStyle = record
    SerialID: widestring;
    BaseNumber: array[1..7] of byte;
    SpecNumber: byte;
  end;

  TLotteryList = class(TList)
  private

  protected

  public
    constructor Create;
    destructor Destroy; override;
  published 

  end;


implementation

{ TLotteryList }

constructor TLotteryList.Create;
begin

end;

destructor TLotteryList.Destroy;
begin

  inherited;
end;

end.
