unit frmAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, jpeg;

type
  TAboutForm = class(TForm)
    Image1: TImage;
    labelAuthor: TLabel;
    labelCopyRight: TLabel;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    LabelAppName: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutForm: TAboutForm;
//  procedure MyAboutWin(appName, appAuthor, appCopyRight: string);

implementation

{$R *.dfm}
  {
procedure MyAboutWin(appName, appAuthor, appCopyRight: string);
begin
        AboutForm := TAboutForm.Create(nil);
        AboutForm.Caption := '关于 ' + appName;
        AboutForm.LabelAppName.Caption := appName;
        AboutForm.labelCopyRight.Caption := '版权所有(C) ' + appCopyRight;
        AboutForm.labelAuthor.Caption := appAuthor + ' 设计';
        AboutForm.ShowModal;
        
end;    }

end.
