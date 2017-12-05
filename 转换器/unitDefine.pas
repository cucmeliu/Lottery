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
    LineNum: integer;  //行号
    StartInde: string; //起始标志
    NumCount: integer; //数量（个数）
//    HaveIt: boolean;  //是否有此类型
  end;

  TStrRec = record
    Str: string[80];
  end;

implementation

end.
