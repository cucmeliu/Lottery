unit frmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, Menus;

type
  TMainForm = class(TForm)
    RichEdit1: TRichEdit;
    Panel1: TPanel;
    Label1: TLabel;
    eInFile: TEdit;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    bbtTrimNoNum: TBitBtn;
    bbtReverse: TBitBtn;
    Label3: TLabel;
    btnSBC2DBC: TButton;
    TabSheet4: TTabSheet;
    btnConvert: TButton;
    Label4: TLabel;
    Button4: TButton;
    PopupMenu1: TPopupMenu;
    pmiSearch: TMenuItem;
    N2: TMenuItem;
    pmiSelAll: TMenuItem;
    pmiCopy: TMenuItem;
    FindDialog1: TFindDialog;
    GroupBox1: TGroupBox;
    btnExit: TSpeedButton;
    btnClear: TSpeedButton;
    btnSave: TSpeedButton;
    sbIn: TSpeedButton;
    StatusBar1: TStatusBar;
    TabSheet3: TTabSheet;
    btnQJ2BJ: TButton;
    btnRandom: TButton;
    btnSaveAs: TSpeedButton;
    TabSheet1: TTabSheet;
    btnStreamRead: TButton;
    btnStreamWrite: TButton;
    procedure sbInClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnClearClick(Sender: TObject);
    procedure btnConvertClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure pmiSearchClick(Sender: TObject);
    procedure FindDialog1Find(Sender: TObject);
    procedure pmiSelAllClick(Sender: TObject);
    procedure pmiCopyClick(Sender: TObject);
    procedure RichEdit1Change(Sender: TObject);
    procedure btnSBC2DBCClick(Sender: TObject);
    procedure btnQJ2BJClick(Sender: TObject);
    procedure btnSaveAsClick(Sender: TObject);
    procedure btnStreamReadClick(Sender: TObject);
    procedure btnStreamWriteClick(Sender: TObject);
    procedure btnRandomClick(Sender: TObject);
  private
    { Private declarations }
    fInputFile, fOutputFile: widestring;
//    FSrcList,
    FDestList: TStringList;
    
    function CheckSrcFile(AFileName: string): boolean; overload;
    function CheckSrcFile: boolean; overload;

  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses unitDefine, unitProtocol, frmParam, frmSBCToDBC, frmRandom;

{$R *.dfm}

procedure TMainForm.sbInClick(Sender: TObject);
var
  od: TOpenDialog;
begin
        od := TOpenDialog.Create(nil);
        od.InitialDir := 'E:\Project\My Dev\彩票分析\bin\data';
    try
        if od.Execute then
        begin
        fInputFile := od.FileName;
        RichEdit1.Clear;
        RichEdit1.Lines.LoadFromFile(fInputFile);
        end;
    finally
        od.Free;
    end;
        eInFile.Text := ExtractFileName(fInputFile);
end;    

procedure TMainForm.btnClearClick(Sender: TObject);
begin
        richedit1.Clear;
end;

procedure TMainForm.btnExitClick(Sender: TObject);
begin
        close;
end;

procedure TMainForm.btnSaveClick(Sender: TObject);
var
  FileHandle: Integer;
  sd: TSaveDialog;
begin
//        if fOutputFile = '' then
        begin
                sd := TSaveDialog.Create(nil);
                sd.FileName := ExtractFileName(fInputFile);

                if not (ofExtensionDifferent in sd.Options) then
                        sd.Options := sd.Options + [ofOverwritePrompt];
                if sd.Execute then fOutputFile := sd.FileName;
                sd.Free;

                if fOutputFile = '' then exit;
                if not FileExists(fOutputFile) then
                begin
                      FileHandle := FileCreate(fOutputFile);
                      FileClose(FileHandle);
                end;
        end;
        FDestList.SaveToFile(fOutputFile);
        fInputFile := FOutputFile;
        eInFile.Text := ExtractFileName(fInputFile);
end;

procedure TMainForm.btnSaveAsClick(Sender: TObject);
var
  FileHandle: Integer;
  sd: TSaveDialog;
begin
        sd := TSaveDialog.Create(nil);
        if sd.Execute then fOutputFile := sd.FileName;
        sd.Free;

        if fOutputFile = '' then exit;
        if not FileExists(fOutputFile) then
        begin
              FileHandle := FileCreate(fOutputFile);
              FileClose(FileHandle);
        end;
        
        FDestList.SaveToFile(fOutputFile);
end;


procedure TMainForm.FormCreate(Sender: TObject);
begin
        fOutputFile := '';
        fInputFile := '';
//        FSrcList := TStringList.Create;
        FDestList := TStringList.Create;
        self.PageControl1.ActivePageIndex := 0;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//        FSrcList.Free;
        FDestList.Free;
        action := cafree;
end;   

procedure TMainForm.btnConvertClick(Sender: TObject);
var
  frm: TParamForm;
  FSrcList: TStringList;
begin
        if not CheckSrcFile(fInputFile) then exit;
        FDestList.Clear;
        FSrcList := TStringList.Create;
        frm := TParamForm.Create(nil);
    try
        frm.ShowModal;
        if frm.ModalResult <> mrOk then exit;

        FSrcList.LoadFromFile(fInputFile);
        if (frm.HaveSpec and frm.HaveSunday) then
        begin //即有特别号又有星期天号
                Deal_Global(frm.LineCycle ,frm.SerialParam, frm.BaseParam,
                        frm.SpecParam, frm.SundayParam, FSrcList, FDestList);
        end
        else if frm.HaveSpec then
        begin //有特别号
                Deal_Global(frm.LineCycle ,frm.SerialParam, frm.BaseParam,
                        frm.SpecParam, FSrcList, FDestList);
        end
        else if not (frm.HaveSpec and frm.HaveSunday) then
        begin //只有基本号
                Deal_Global(frm.LineCycle ,frm.SerialParam, frm.BaseParam,
                        FSrcList, FDestList);
        end;

        RichEdit1.Lines := FDestList;
    finally
        frm.Free;
        FSrcList.Free;
    end;
end;

procedure TMainForm.btnSBC2DBCClick(Sender: TObject);
var
  FSrcList: TStringList;
begin
        if not CheckSrcFile(fInputFile) then exit;
        FDestList.Clear;
        FSrcList := TStringList.Create;

        FSrcList.LoadFromFile(fInputFile);
        SBC_To_DBC(FSrcList, FDestList);

        RichEdit1.Lines := FDestList;

        FSrcList.Free;
end;

function TMainForm.CheckSrcFile(AFileName: string): boolean;
begin
        result := true;
        if not FileExists(AFileName) then
        begin
                showmessage('未指定文件或指定文件不存在');
                result := false;
        end;
end;


function TMainForm.CheckSrcFile: boolean;
begin
        result := true;
    {    if not Assigned(FSrcList) then
        begin
                showmessage('未指定文件或指定文件不存在');
                result := false;
        end;    }
end;

procedure TMainForm.pmiSearchClick(Sender: TObject);
begin
        FindDialog1.Position :=
                Point(RichEdit1.Left + RichEdit1.Width, RichEdit1.Top);

        FindDialog1.Execute;
end;

procedure TMainForm.FindDialog1Find(Sender: TObject);
var
  FoundAt: LongInt;
  StartPos, ToEnd: Integer;
begin
        with RichEdit1 do
        begin
                { begin the search after the current selection if there is one }
                { otherwise, begin at the start of the text }
                if SelLength <> 0 then
                        StartPos := SelStart + SelLength
                else
                        StartPos := 0;

                { ToEnd is the length from StartPos to the end of the text in the rich edit control }

                ToEnd := Length(Text) - StartPos;

                FoundAt := FindText(FindDialog1.FindText, StartPos, ToEnd, [stMatchCase]);
                if FoundAt <> -1 then
                begin
                        SetFocus;
                        SelStart := FoundAt;
                        SelLength := Length(FindDialog1.FindText);
                end;
        end;

end;

procedure TMainForm.pmiSelAllClick(Sender: TObject);
begin
        richedit1.SelectAll;
end;

procedure TMainForm.pmiCopyClick(Sender: TObject);
begin
        RichEdit1.CopyToClipboard;
end;

procedure TMainForm.RichEdit1Change(Sender: TObject);
begin
        StatusBar1.Panels[0].Text := '共 ' + IntToStr(RichEdit1.Lines.Count) + ' 行';
end;

procedure TMainForm.btnQJ2BJClick(Sender: TObject);
var
  frm: TSBCToDBCForm;
begin
        frm := TSBCToDBCForm.Create(nil);
    try
        frm.ShowModal;
    finally
        frm.Free;
    end;
end;


procedure TMainForm.btnStreamReadClick(Sender: TObject);
var
  od: TOpenDialog;
  r: TStrRec;
  f: file of TStrRec;
begin
        od := TOpenDialog.Create(nil);
    try
        if od.Execute then
        begin
                richedit1.Clear;
                fInputFile := od.FileName;
                AssignFile(f, fInputFile);
                Reset(f);
                while not eof(f) do
                begin
                        read(f, r);
                        richedit1.Lines.Add(r.Str);
                end;
                CloseFile(f);
        end;
    finally
        od.Free;
    end;
        eInFile.Text := ExtractFileName(fInputFile);
end;

procedure TMainForm.btnStreamWriteClick(Sender: TObject);
var
  FileHandle: Integer;
  sd: TSaveDialog;
  r: TStrRec;
  f: file of TStrRec;
  i: integer;
begin
                sd := TSaveDialog.Create(nil);
                sd.InitialDir := 'E:\Project\My Dev\彩票分析\bin\data\rfile';
                sd.FileName := ExtractFileName(fInputFile);

                if not (ofExtensionDifferent in sd.Options) then
                        sd.Options := sd.Options + [ofOverwritePrompt];
                if sd.Execute then fOutputFile := sd.FileName;
                sd.Free;

                if fOutputFile = '' then exit;
                if not FileExists(fOutputFile) then
                begin
                      FileHandle := FileCreate(fOutputFile);
                      FileClose(FileHandle);
                end;
                
        FDestList.LoadFromFile(fInputFile);

        AssignFile(f, fOutputFile);
        Rewrite(f);
        for i:=0 to FDestList.Count-1 do
        begin
                r.Str := FDestList[i];
                write(f, r);
        end;
        CloseFile(f);
        
end;

procedure TMainForm.btnRandomClick(Sender: TObject);
var
  frm: TRandomForm;
begin
        frm := TRandomForm.Create(nil);
        frm.ShowModal;
        frm.Free;
end;

end.
