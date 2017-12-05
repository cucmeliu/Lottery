unit unitDefine;

interface

type

  TChrArray = array of char;

  TBufArray = array of byte;
  
  TDataType = record
    SerialId: string;
    BaseNum: TBufArray;
    SpecNum: byte;
    SundNum: byte;
  end;

  TDataParam = record
    LineNum: integer;  //�к�
    StartInde: string; //��ʼ��־
    NumCount: integer; //������������
//    HaveIt: boolean;  //�Ƿ��д�����
  end;

  TStrRec = record
    Str: string[80];
  end;

implementation

end.
