unit frmRules;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TRuleForm = class(TForm)
    RichEdit1: TRichEdit;
    Panel1: TPanel;
    bbt33s7: TBitBtn;
    bbt21s5: TBitBtn;
    bbt2B: TBitBtn;
    bbt3D: TBitBtn;
    procedure bbt33s7Click(Sender: TObject);
    procedure bbt21s5Click(Sender: TObject);
    procedure bbt2BClick(Sender: TObject);
    procedure bbt3DClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure LoadRule(FileName: string);
  public
    { Public declarations }
  end;

var
  RuleForm: TRuleForm;

implementation

{$R *.dfm}

{ TRuleForm }

procedure TRuleForm.LoadRule(FileName: string);
begin
        FileName := ExtractFilePath(application.ExeName) + FileName;
    try
        RichEdit1.Lines.LoadFromFile(FileName);
    except
        showmessage('未找到本规则');
    end;
end;

procedure TRuleForm.bbt33s7Click(Sender: TObject);
begin
        LoadRule('rule\Rule33s7.rule');
end;

procedure TRuleForm.bbt21s5Click(Sender: TObject);
begin
        LoadRule('rule\Rule21s5.rule');
end;

procedure TRuleForm.bbt2BClick(Sender: TObject);
begin
        LoadRule('rule\Rule2C.rule');
end;

procedure TRuleForm.bbt3DClick(Sender: TObject);
begin
        LoadRule('rule\Rule3D.rule');
end;

procedure TRuleForm.FormResize(Sender: TObject);
var
  len: integer;
begin
        len := panel1.Width div 2;
        bbt21s5.Left := len - bbt21s5.Width - 10;
        bbt33s7.Left := bbt21s5.Left - bbt33s7.Width - 20;
        bbt2B.Left := len + 10;
        bbt3d.Left := bbt2b.Left + bbt2b.Width + 20;
end;

procedure TRuleForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        action := cafree;
end;

end.
