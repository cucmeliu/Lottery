unit frmSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IniFiles, ComCtrls, StrUtils, ExtCtrls;

type

  TTypeSet = record
    TypeName,
    FileExt: string;
    TotCnt,
    BaseCnt: integer;
  end;

  TSetForm = class(TForm)
    ListView1: TListView;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    editName: TEdit;
    editExt: TEdit;
    editRange: TEdit;
    editBaseNum: TEdit;
    bbtAdd: TBitBtn;
    Panel2: TPanel;
    bbtClose: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure bbtAddClick(Sender: TObject);
  private
    { Private declarations }
//    FTypeSet: TTypeSet;
    procedure AddFileType(ATypeSet: TTypeSet);
    procedure AddTypeSett(ATypeSet: TTypeSet);
    procedure LoadSett;

    function CheckTypeSet(ATypeSet: TTypeSet): boolean;

  public
    { Public declarations }
  end;

var
  SetForm: TSetForm;

implementation

{$R *.dfm}

{ TSetForm }

(*********************************************************************
//  func：AddFileType
//  Desc：添加一种类型，指定文件扩展名
//  Parm：
//  Note：
//  Auth：Loafer.Liu @ 2004.9.
//  Updt：
//*******************************************************************)
procedure TSetForm.AddFileType(ATypeSet: TTypeSet);
var
  f: TIniFile;
  s: widestring;
  p: integer;
begin
        f := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Lottery.ini');
        s := f.ReadString('Global','FileTypes', '所有识别类型|*.*');
        //添加这种类型  并 //添加这种类型到“所有彩票类型”
        p := pos('所有识别类型', s);
        p := p + Length('所有识别类型');
        s := copy(s, 1, p) + '*.' + ATypeSet.FileExt + ';' + RightStr(s, Length(s)-p);
        s := s + '|' + ATypeSet.TypeName + '|*.' + ATypeSet.FileExt  ;
        f.WriteString('Global','FileTypes', s);
        f.Free;  
end;

(*********************************************************************
//  func：AddTypeSett
//  Desc：设置一种新类型的基本情况(如33选7型)，包括待选号总数量，基本号数量
//  Parm：
//  Rslt：
//  Note：
//  Auth：Loafer.Liu @ 2004.9.
//  Updt：
//********************************************************************)
procedure TSetForm.AddTypeSett(ATypeSet: TTypeSet);
var
  f: TIniFile;
begin
        f := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Lottery.ini');
        f.WriteString(ATypeSet.FileExt, 'TypeName', ATypeSet.TypeName);
        f.WriteInteger(ATypeSet.FileExt,'TotCnt', ATypeSet.TotCnt);
        f.WriteInteger(ATypeSet.FileExt,'BaseCnt', ATypeSet.BaseCnt);
        f.Free;
        ListView1.Items.Add;
        ListView1.Items[ListView1.Items.Count-1].Caption := ATypeSet.TypeName;
        ListView1.Items[ListView1.Items.Count-1].SubItems.Add('*.'+ATypeSet.FileExt);
        ListView1.Items[ListView1.Items.Count-1].SubItems.Add(IntToStr(ATypeSet.TotCnt));
        ListView1.Items[ListView1.Items.Count-1].SubItems.Add(IntToStr(ATypeSet.BaseCnt));
        
end;

procedure TSetForm.LoadSett;
var
  f: TIniFile;
  s: widestring;
  ATypeSet: TTypeSet;
  p: integer;
begin
        ListView1.Clear;
        f := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Lottery.ini');
        s := f.ReadString('Global','FileTypes', '所有类型|*.*');
        //先去掉“所有识别类型|*.215;*.2c;*.337|”
        p := pos('|', s);
        s := rightStr(s, Length(s)-p);
        p := pos('|' ,s);
        s := rightStr(s, Length(s)-p);

        p := pos('|', s);           
        while p > 0 do
        begin
                //名称
                p := pos('|', s);
                ATypeSet.TypeName := copy(s, 1, p-1);
                //扩展
                s := rightstr(s, Length(s)-p);
                p := pos('|', s);
                if p = 0 then ATypeSet.FileExt := s
                else ATypeSet.FileExt := copy(s, 1, p-1);
                s := rightstr(s, Length(s)-p);
                //总数
                ATypeSet.TotCnt := f.ReadInteger(RightStr(ATypeSet.FileExt, Length(ATypeSet.FileExt)-2), 'TotCnt', 0);
                //基本号数
                ATypeSet.BaseCnt := f.ReadInteger(RightStr(ATypeSet.FileExt, Length(ATypeSet.FileExt)-2), 'BaseCnt', 0);

                ListView1.Items.Add;
                ListView1.Items[ListView1.Items.Count-1].Caption := ATypeSet.TypeName;
                ListView1.Items[ListView1.Items.Count-1].SubItems.Add(ATypeSet.FileExt);
                ListView1.Items[ListView1.Items.Count-1].SubItems.Add(IntToStr(ATypeSet.TotCnt));
                ListView1.Items[ListView1.Items.Count-1].SubItems.Add(IntToStr(ATypeSet.BaseCnt));

        end;

        
        f.Free;   
end;

procedure TSetForm.FormCreate(Sender: TObject);
begin
        LoadSett;
end;

procedure TSetForm.bbtAddClick(Sender: TObject);
var
  ATypeSet: TTypeSet;
begin
        if (editName.Text = '') or (editExt.Text = '')
                or (editRange.Text = '') or (editBaseNum.Text = '') then
        begin
                showmessage('请输入所有需要的信息');
                exit;
        end;

        aTypeSet.TypeName := editName.Text;
        aTypeSet.FileExt := editExt.Text;
        aTypeSet.TotCnt := strToInt(editRange.Text);
        aTypeSet.BaseCnt := strToInt(editBaseNum.Text);
        if CheckTypeSet(aTypeSet) then
        begin
                AddFileType(aTypeSet);
                AddTypeSett(aTypeSet);
        end else showmessage('所填扩展名已存在，请换用其他');

end;

function TSetForm.CheckTypeSet(ATypeSet: TTypeSet): boolean;
var
  f: TIniFile;
  s: integer;
begin
        result := true;
        f := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Lottery.ini');
        s := f.ReadInteger(ATypeSet.FileExt, 'TotCnt', 0);
        f.Free;
        if s > 0 then result := false;  //这种扩展名已经存在了
end;

end.
