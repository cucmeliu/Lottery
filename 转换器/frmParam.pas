unit frmParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, unitDefine, IniFiles, Spin;

type
  TParamForm = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    eSStart: TEdit;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    eBStart: TEdit;
    Label6: TLabel;
    cbHaveSpec: TCheckBox;
    gbSpec: TGroupBox;
    gbSunday: TGroupBox;
    cbHaveSunday: TCheckBox;
    Label7: TLabel;
    Label8: TLabel;
    eSpStart: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    eSuStart: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label9: TLabel;
    eLineCycle: TSpinEdit;
    eSLine: TSpinEdit;
    eBLine: TSpinEdit;
    eSNumber: TSpinEdit;
    eBNumber: TSpinEdit;
    eSpLine: TSpinEdit;
    eSuLine: TSpinEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure cbHaveSpecClick(Sender: TObject);
    procedure cbHaveSundayClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure LoadIniFile;
    procedure WriteIniFile;
    procedure InitUI;
  public
    { Public declarations }
    SerialParam, BaseParam, SpecParam, SundayParam: TDataParam;
    HaveSpec, HaveSunday: boolean;
    LineCycle: integer;
  end;

var
  ParamForm: TParamForm;

implementation

{$R *.dfm}

procedure TParamForm.BitBtn1Click(Sender: TObject);
begin
        LineCycle := StrToInt(eLineCycle.Text);

        SerialParam.LineNum := StrToInt(self.eSLine.Text);
        SerialParam.StartInde := self.eSStart.Text;
        SerialParam.NumCount := StrToInt(self.eSNumber.Text);

        BaseParam.LineNum := StrToInt(self.eBLine.Text);
        BaseParam.StartInde := self.eBStart.Text;
        BaseParam.NumCount := StrToInt(self.eBNumber.Text);

        HaveSpec := cbHaveSpec.Checked;
        if HaveSpec then
        begin
              SpecParam.LineNum := StrToInt(self.eSpLine.Text);
              SpecParam.StartInde := self.eSpStart.Text;
        end;

        HaveSunday := cbHaveSunday.Checked;
        if HaveSunday then
        begin
              SundayParam.LineNum := StrToInt(self.eSuLine.Text);
              SundayParam.StartInde := self.eSuStart.Text;
        end;

        WriteIniFile;
end;

procedure TParamForm.cbHaveSpecClick(Sender: TObject);
begin
        if cbHaveSpec.Checked then gbSpec.Enabled := true
        else gbSpec.Enabled := false;
end;

procedure TParamForm.cbHaveSundayClick(Sender: TObject);
begin
        if cbHaveSunday.Checked then gbSunday.Enabled := true
        else gbSunday.Enabled := false;
end;

procedure TParamForm.LoadIniFile;
var
  f: TIniFile;
begin
        f := TIniFile.Create(ExtractFilePath(Application.ExeName)+'LotteryDataConvert.ini');
        LineCycle := f.ReadInteger('GlobalParam', 'LineCycle', 4);
        
        SerialParam.LineNum := f.ReadInteger('SerialParam', 'LineNum', 1);
        SerialParam.StartInde := f.ReadString('SerialParam', 'StartInde', '200');
        SerialParam.NumCount := f.ReadInteger('SerialParam', 'NumCount', 7);

        BaseParam.LineNum := f.ReadInteger('BaseParam', 'LineNum', 2);
        BaseParam.StartInde := f.ReadString('BaseParam', 'StartInde', '基本号');
        BaseParam.NumCount := f.ReadInteger('BaseParam', 'NumCount', 5);

        SpecParam.LineNum := f.ReadInteger('SpecParam', 'LineNum', 3);
        SpecParam.StartInde := f.ReadString('SpecParam', 'StartInde', '特别号');
        HaveSpec := f.ReadBool('SpecParam', 'HaveSpec', false);

        SundayParam.LineNum := f.ReadInteger('SundayParam', 'LineNum', 4);
        SundayParam.StartInde := f.ReadString('SundayParam', 'StartInde', '星期天');
        HaveSunday := f.ReadBool('SundayParam', 'HaveSunday', false);
        f.Free;
end;

procedure TParamForm.WriteIniFile;
var
  f: TIniFile;
begin
        f := TIniFile.Create(ExtractFilePath(Application.ExeName)+'LotteryDataConvert.ini');
        f.WriteInteger('GlobalParam', 'LineCycle', LineCycle);

        f.WriteInteger('SerialParam', 'LineNum', SerialParam.LineNum);
        f.WriteString('SerialParam', 'StartInde', SerialParam.StartInde);
        f.WriteInteger('SerialParam', 'NumCount', SerialParam.NumCount);

        f.WriteInteger('BaseParam', 'LineNum', BaseParam.LineNum);
        f.WriteString('BaseParam', 'StartInde', BaseParam.StartInde);
        f.WriteInteger('BaseParam', 'NumCount', BaseParam.NumCount);

        f.WriteInteger('SpecParam', 'LineNum', SpecParam.LineNum);
        f.WriteString('SpecParam', 'StartInde', SpecParam.StartInde);
        f.WriteBool('SpecParam', 'HaveSpec', HaveSpec);

        f.WriteInteger('SundayParam', 'LineNum', SundayParam.LineNum);
        f.WriteString('SundayParam', 'StartInde', SundayParam.StartInde);
        f.WriteBool('SundayParam', 'HaveSunday', HaveSunday);

        f.Free;
end;

procedure TParamForm.FormCreate(Sender: TObject);
begin
        LoadIniFile;
        InitUI;
end;

procedure TParamForm.InitUI;
begin
        eLineCycle.Text  := IntToStr(LineCycle);
        eSLine.Text := IntToStr(SerialParam.LineNum);
        eSStart.Text := SerialParam.StartInde;
        eSNumber.Text := IntToStr(SerialParam.NumCount);

        eBLine.Text :=  IntToStr(BaseParam.LineNum);
        eBStart.Text := BaseParam.StartInde;
        eBNumber.Text := IntToStr(BaseParam.NumCount);

        cbHaveSpec.Checked := HaveSpec;
        eSpLine.Text := IntToStr(SpecParam.LineNum);
        eSpStart.Text := SpecParam.StartInde;

        cbHaveSunday.Checked := HaveSunday;
        eSuLine.Text := IntToStr(SundayParam.LineNum);
        eSuStart.Text := SundayParam.StartInde;

end;

end.
