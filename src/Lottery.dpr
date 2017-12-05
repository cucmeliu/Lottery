program Lottery;

uses
  Forms,
  frmListAll in 'frmListAll.pas' {ListAllForm},
  lotteryReader in 'lotteryReader.pas',
  LotteryBuilder in 'LotteryBuilder.pas',
  defineUnit in 'defineUnit.pas',
  globalUnit in 'globalUnit.pas',
  frmResult in 'frmResult.pas' {ResultForm},
  frmGraphi in 'frmGraphi.pas' {GraphForm},
  frmMain in 'frmMain.pas' {MainForm},
  frmStat in 'frmStat.pas' {StatForm},
  StatGrid in 'StatGrid.pas',
  sgr_misc in 'sgr_misc.pas',
  frmRules in 'frmRules.pas' {RuleForm},
  frmAppDataBase in 'frmAppDataBase.pas' {AppDataForm},
  frmStatGraphi in 'frmStatGraphi.pas' {StatGraphiForm},
  MyGraphi in 'MyGraphi.pas',
  StatGraphiGrid in 'StatGraphiGrid.pas',
  Lottery2ColorReader in 'Lottery2ColorReader.pas',
  LotFileTypeUnit in 'LotFileTypeUnit.pas',
  frmSetting in 'frmSetting.pas' {Form1},
  frmAppendData in 'frmAppendData.pas' {AppendDataForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '≤ ∆±∑÷ŒˆœµÕ≥';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAppendDataForm, AppendDataForm);
  Application.Run;
end.
