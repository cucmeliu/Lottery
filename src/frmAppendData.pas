unit frmAppendData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IniFiles;

type
  TAppendDataForm = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    gbDataType: TGroupBox;
    eSerial: TEdit;
    Label1: TLabel;
    eBase: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    eSpe1: TEdit;
    eSpe2: TEdit;
    Label5: TLabel;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    fCloseQue: boolean;

    procedure ReadSerialID;
    procedure WriteIniFile(Sec, Ident, value: string);    

  public
    { Public declarations }
    resultStr: string;
  end;

var
  AppendDataForm: TAppendDataForm;

implementation

{$R *.dfm}

procedure TAppendDataForm.BitBtn1Click(Sender: TObject);
begin
        fCloseQue := true;
        if (trim(eSerial.Text) = '') or (trim(eBase.Text)='') then
        begin
                fCloseQue := false;
                showmessage('期数和基本号都必须填写！');
                exit;
        end;
        WriteIniFile('SerialNo', 'LastNum', trim(eSerial.Text));
        resultStr := eSerial.Text
                + ' ' + eBase.Text
                + ' ' + eSpe1.Text
                + ' ' + eSpe2.Text;
end;

procedure TAppendDataForm.FormCreate(Sender: TObject);
begin
        ReadSerialID;
        fCloseQue := false;
end;

procedure TAppendDataForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
        CanClose := fCloseQue;
end;

procedure TAppendDataForm.BitBtn2Click(Sender: TObject);
begin
        fCloseQue := true;
end;

procedure TAppendDataForm.ReadSerialID;
var
  IniFile: TIniFile;
  SerialNo: integer;
begin
        IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Lottery.Ini');
    try
        SerialNo := IniFile.ReadInteger('SerialNo', 'LastNum', 2004001);
        SerialNo := SerialNo + 1;
        eSerial.Text := IntToStr(SerialNo);
        
    finally
        IniFile.Free;
    end;

end;

procedure TAppendDataForm.BitBtn3Click(Sender: TObject);
begin
//
end;

procedure TAppendDataForm.WriteIniFile(Sec, Ident, value: string);
var
  IniFile: TIniFile;
begin
        IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Lottery.Ini');
        IniFile.WriteString(Sec, Ident, Value);
        IniFile.Free;
end;

end.
