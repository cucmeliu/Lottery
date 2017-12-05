unit defineUnit;

interface

uses Messages;

const
  WM_FILE_LOADED = WM_USER + 110;

type

  TNumCount = record
    TotalCount,         //待选数字数　33、21、．．
    NumCount: integer;  //选出数字数  7、 5、．．
  end;

  TBufArray = array of byte;
  PBufArray = ^TBufArray;
//  TMsgArray = array of string;

  TNumCntRec = record
    Number: byte;       //数字 (可以不要)
    Rcount: integer;    //数字出现的次数
  end;
  TNumCntRecArray = array of TNumCntRec;
  PNumCntRecArray = ^TNumCntRecArray;


  TLotterString = record
    SerialID: string;     //第几期
    BaseNumber: string;   //基本号
    SpecNumber: string;   //特别号
    SundayNum: string;    //双色球　快乐星期天号
  end;
  
  TLotterStringArray = array of TLotterString;
  PLotterStringArray = ^TLotterStringArray;


  TLotteryStyle = record
    SerialID: widestring;
    BaseNumber: TBufArray;
    SpecNumber: byte;
    SundayNum: byte;
  end;
  TLotteryStyleArray = array of TLotteryStyle;
  PLotteryStyleArray = ^TLotteryStyleArray;

  TStrRec = record
    Str: string[80];
  end;

implementation

end.
