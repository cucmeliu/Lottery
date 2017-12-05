unit frmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Lottery33S7, defineUnit, ComCtrls, ToolWin, ImgList, SHellApi,
  LotteryBuilder, ActnList, IniFiles, StrUtils, lotteryReader;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    S1: TMenuItem;
    mnuLoadFile: TMenuItem;
    N1: TMenuItem;
    E1: TMenuItem;
    R1: TMenuItem;
    mnuRule33s7: TMenuItem;
    mnuRule21s5: TMenuItem;
    mnuRule3D: TMenuItem;
    mnuRule2C: TMenuItem;
    N3: TMenuItem;
    mnuRuleClear: TMenuItem;
    H1: TMenuItem;
    mnuAbout: TMenuItem;
    N4: TMenuItem;
    mnuListAll: TMenuItem;
    mnuGraph: TMenuItem;
    mnuStat: TMenuItem;
    W1: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    StatusBar1: TStatusBar;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    mnuRule: TMenuItem;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    ImageList1: TImageList;
    ToolButton9: TToolButton;
    N2: TMenuItem;
    N5: TMenuItem;
    A1: TMenuItem;
    mnuBar: TMenuItem;
    ToolButton7: TToolButton;
    ActionList1: TActionList;
    ActionReadFile: TAction;
    ActionListAll: TAction;
    ActionGraphi: TAction;
    ActionStatic: TAction;
    ActionBar: TAction;
    ActionRule: TAction;
    ActionAbout: TAction;
    ActionExit: TAction;
    ActionCascade: TAction;
    ActionTileHor: TAction;
    N6: TMenuItem;
    N7: TMenuItem;
    N11: TMenuItem;
    ActionStatus: TAction;
    ActionToolBar: TAction;
    N12: TMenuItem;
    N13: TMenuItem;
    ActionTypeSet: TAction;
    ActionDataConvert: TAction;
    ActionTileVer: TAction;
    V1: TMenuItem;
    ActionAppendData: TAction;
    ActionSave: TAction;
    N14: TMenuItem;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure A1Click(Sender: TObject);
    procedure ActionReadFileExecute(Sender: TObject);
    procedure ActionListAllExecute(Sender: TObject);
    procedure ActionGraphiExecute(Sender: TObject);
    procedure ActionStaticExecute(Sender: TObject);
    procedure ActionBarExecute(Sender: TObject);
    procedure ActionRuleExecute(Sender: TObject);
    procedure ActionAboutExecute(Sender: TObject);
    procedure ActionExitExecute(Sender: TObject);
    procedure ActionTileHorExecute(Sender: TObject);
    procedure ActionCascadeExecute(Sender: TObject);
    procedure ActionToolBarExecute(Sender: TObject);
    procedure ActionStatusExecute(Sender: TObject);
    procedure ActionTypeSetExecute(Sender: TObject);
    procedure ActionDataConvertExecute(Sender: TObject);
    procedure ActionTileVerExecute(Sender: TObject);
    procedure ActionAppendDataExecute(Sender: TObject);
    procedure ActionSaveExecute(Sender: TObject);
  private
    { Private declarations }


    FLotteryReader: TLotteryReader;
    FLotteryBuilder: TLotteryBuilder;
    fLotName: string;

    procedure LoadFile;
    procedure PostFileReLoadMsg;

    function GetTypeFilter: widestring;
    function GetNumCnts(AExtName: string): boolean;
    procedure FileReLoadMsg(var message: TMessage); message WM_FILE_LOADED;
  public
    { Public declarations }
    fNumCount: TNumCount;

  end;

function MyMessageBox(TitleName, MsgMsg, YesBtnCap, NoBtnCap: string): TModalResult; stdcall; external 'myCommDialogs.dll';// names 'MyMessageBox';
procedure MyAboutWin(appName, appAuthor, appCopyRight, appEmail: string); stdcall; external 'myCommDialogs.dll';// names 'MyAboutWin';
procedure ShowSetForm(AHandle: THandle); stdcall; external 'FileSet.dll';
procedure ShowConvertForm(AHandle: THandle); stdcall; external 'LotteryDataConverter.dll';

var
  MainForm: TMainForm;

implementation

uses frmListAll, frmGraphi, globalUnit, frmStat, frmRules,
  frmAbout, frmAppDataBase, frmStatGraphi, frmAppendData;

{$R *.dfm}

{ TMainForm }


procedure TMainForm.FormCreate(Sender: TObject);
begin
        fNumCount.TotalCount := 0;
        fNumCount.NumCount := 0;
        fLotName := '类型';
        FLotteryBuilder := TLotteryBuilder.Create;
        FLotteryReader := TLotteryReader.Create;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        FLotteryBuilder.Free;
        FLotteryReader.Free;
        
        Action := caFree;
end;

procedure TMainForm.LoadFile;
var
  fileName: string;
  openDlg: TOpenDialog;
//  aLotteryReader: TLotteryReader;
  FileExt: string;
begin
        FileName := '';
        openDlg := TOpenDialog.Create(nil);

        openDlg.Filter := GetTypeFilter;
        if ( openDlg.Execute ) then
                FileName := openDlg.FileName;
        openDlg.Free;
        
        if FileName = '' then exit;
        self.StatusBar1.Panels[3].Text := ExtractFileName(FileName);
        FileExt := ExtractFileExt(FileName);
        //去掉 .  
        FileExt := RightStr(FileExt, Length(FileExt)-1);
        if not GetNumCnts(FileExt) then
        begin
                showmessage('无法识别的类型');
                exit;
        end;
        
        //aLotteryReader := TLotteryReader.Create;
        
        //FileExt := ExtractFileExt(FileName)[2];
    try
         //aLotteryReader.ReadFile(FileName);

        fLotteryReader.ReadMe(FileName);

        //FLotteryBuilder.BuildStyle(aLotteryReader.FLotterString, fNumCount);
        FLotteryBuilder.BuildStyle(fLotteryReader.fLotStrList, fNumCount);
        PostFileReLoadMsg;
    finally
        //aLotteryReader.Free;
    end;       
end;

procedure TMainForm.PostFileReLoadMsg;
var
  i: integer;
begin
       for i:=0 to Screen.FormCount-1 do
       begin
                SendMessage(Screen.Forms[i].Handle, WM_FILE_LOADED,
                        fNumCount.TotalCount, fNumCount.NumCount);
       end;    
end;

procedure TMainForm.FileReLoadMsg(var message: TMessage);
begin          
        self.StatusBar1.Panels[0].Text := fLotName;//LotteryType;
        self.StatusBar1.Panels[1].Text := '共有 '
                + IntToStr(Length(FLotteryBuilder.FLotteryStyle)) + '条记录';
        self.StatusBar1.Panels[2].Text := '最多数量 ' + IntToStr(FLotteryBuilder.MaxCount);
end;

procedure TMainForm.A1Click(Sender: TObject);
var
  frm: TAppDataForm;
begin
        frm := TAppDataForm.Create(nil);
        try
        frm.ShowModal;
        finally
        frm.Free;
        end;
end;  

procedure TMainForm.ActionReadFileExecute(Sender: TObject);
begin
        LoadFile;
end;

procedure TMainForm.ActionListAllExecute(Sender: TObject);
begin
        if not FindCurWindows('TListAllForm') then
        begin
                ListAllForm := TListAllForm.Create(nil);
                ListAllForm.fLotteryBuilder := self.FLotteryBuilder;
                ListAllForm.DrawGrid(fNumCount);
        end;
end;

procedure TMainForm.ActionGraphiExecute(Sender: TObject);
begin
        if not FindCurWindows('TGraphForm') then
        begin
                GraphForm := TGraphForm.Create(nil);
                GraphForm.fLotteryBuilder := self.FLotteryBuilder;
                GraphForm.DrawGrid(fNumCount);
        end;
end;

procedure TMainForm.ActionStaticExecute(Sender: TObject);
begin
        if not FindCurWindows('TStatForm') then
        begin
                StatForm := TStatForm.Create(nil);
                StatForm.fLotteryBuilder := self.FLotteryBuilder;
                StatForm.DrawGrid(FNumCount);
        end;
end;

procedure TMainForm.ActionBarExecute(Sender: TObject);
begin
        if not FindCurWindows('TStatGraphiForm') then
        begin
                StatGraphiForm := TStatGraphiForm.Create(nil);
                StatGraphiForm.fLotteryBuilder := self.FLotteryBuilder;
                StatGraphiForm.DrawGrid(FNumCount);
        end;
end;

procedure TMainForm.ActionRuleExecute(Sender: TObject);
begin
        if not FindCurWindows('TRuleForm') then
        begin
                RuleForm := TRuleForm.Create(nil);
        end;
end;

procedure TMainForm.ActionAboutExecute(Sender: TObject);
begin
        MyAboutWin('彩票分析系统', '刘春明', '西北狼工作室', 'Email: cucme@163.com');
end;

procedure TMainForm.ActionExitExecute(Sender: TObject);
begin
        close;
end;

procedure TMainForm.ActionTileHorExecute(Sender: TObject);
begin
        TileMode := tbHorizontal;
        Tile;
end;

procedure TMainForm.ActionTileVerExecute(Sender: TObject);
begin
        TileMode := tbVertical;
        Tile;
end;

procedure TMainForm.ActionCascadeExecute(Sender: TObject);
begin
        Cascade;
end;

procedure TMainForm.ActionToolBarExecute(Sender: TObject);
begin
        ToolBar1.Visible := not ToolBar1.Visible;
        ActionToolBar.Checked := ToolBar1.Visible;
end;

procedure TMainForm.ActionStatusExecute(Sender: TObject);
begin
        StatusBar1.Visible := not StatusBar1.Visible;
        ActionStatus.Checked := StatusBar1.Visible;
end;

function TMainForm.GetNumCnts(AExtName: string): boolean;
var
  f: TIniFile;
begin
        result := false;
        f := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Lottery.ini');
        fNumCount.TotalCount := f.ReadInteger(AExtName, 'TotCnt', 0);
        fNumCount.NumCount := f.ReadInteger(AExtName, 'BaseCnt', 0);
        fLotName := '类型 ' + f.ReadString(AExtName, 'TypeName', '未知');
        if (fNumCount.NumCount <> 0) and (fNumCount.TotalCount <> 0) then
                result := true;
        f.Free;
end;

function TMainForm.GetTypeFilter: widestring;
var
  f: TIniFile;
begin
        f := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Lottery.ini');
        result := f.ReadString('Global','FileTypes', '所有类型|*.*');
        f.Free;
end;

procedure TMainForm.ActionTypeSetExecute(Sender: TObject);
begin
        ShowSetForm(Application.Handle);
end;

procedure TMainForm.ActionDataConvertExecute(Sender: TObject);
begin
          ShellExecute(handle,'open', Pchar(ExtractFilePath(Application.ExeName)
                +'\LotteryDataConverter.exe'),nil,nil,SW_SHOW);
end;

procedure TMainForm.ActionAppendDataExecute(Sender: TObject);
var
  frm: TAppendDataForm;
begin
        frm := TAppendDataForm.Create(nil);

    try
        frm.gbDataType.Caption := fLotName;
        if frm.ShowModal = mrOk then
        begin
                FLotteryReader.fLotStrList.Insert(0, frm.resultStr);
        end;
    finally
        frm.Free;
    end;
end;

procedure TMainForm.ActionSaveExecute(Sender: TObject);
var
  FileHandle: Integer;
  sd: TSaveDialog;
  aFileName: string;
begin 
        sd := TSaveDialog.Create(nil);

        if not (ofExtensionDifferent in sd.Options) then
                sd.Options := sd.Options + [ofOverwritePrompt];
        if sd.Execute then
        begin
                aFileName := sd.FileName;
                sd.Free;

                if aFileName = '' then exit;
                if not FileExists(aFileName) then
                begin
                      FileHandle := FileCreate(aFileName);
                      FileClose(FileHandle);
                end; 

                FLotteryReader.SaveMe(aFileName); //.fLotStrList.SaveToFile(aFileName);
        end;


end;

end.
