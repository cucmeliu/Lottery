unit defineUnit;

interface

uses Messages;

const
  WM_FILE_LOADED = WM_USER + 110;

type

  TNumCount = record
    TotalCount,         //��ѡ��������33��21������
    NumCount: integer;  //ѡ��������  7�� 5������
  end;

  TBufArray = array of byte;
  PBufArray = ^TBufArray;
//  TMsgArray = array of string;

  TNumCntRec = record
    Number: byte;       //���� (���Բ�Ҫ)
    Rcount: integer;    //���ֳ��ֵĴ���
  end;
  TNumCntRecArray = array of TNumCntRec;
  PNumCntRecArray = ^TNumCntRecArray;


  TLotterString = record
    SerialID: string;     //�ڼ���
    BaseNumber: string;   //������
    SpecNumber: string;   //�ر��
    SundayNum: string;    //˫ɫ�򡡿����������
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