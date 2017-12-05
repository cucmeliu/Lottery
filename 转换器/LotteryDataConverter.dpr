(*
library LotteryDataConverter;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  Classes,
  Forms,
  frmMain in 'frmMain.pas' {MainForm},
  unitDefine in 'unitDefine.pas',
  unitProtocol in 'unitProtocol.pas',
  frmParam in 'frmParam.pas' {ParamForm},
  unitGlobal in 'unitGlobal.pas';

{$R *.res}

procedure ShowConvertForm(AHandle: THandle);
var
  frm: TMainForm;
begin
  Application.Handle := AHandle;
  frm := TMainForm.Create(nil);
  try
  frm.ShowModal;
  finally
  frm.Free;
  end;
end;

exports
  ShowConvertForm;

begin
end.
       *)

// 这里是生成Exe要用的
program LotteryDataConverter;

uses
  Forms,
  frmMain in 'frmMain.pas' {MainForm},
  unitDefine in 'unitDefine.pas',
  unitProtocol in 'unitProtocol.pas',
  frmParam in 'frmParam.pas' {ParamForm},
  unitGlobal in 'unitGlobal.pas',
  frmSBCToDBC in 'frmSBCToDBC.pas' {SBCToDBCForm},
  frmRandom in 'frmRandom.pas' {RandomForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '转换器';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
