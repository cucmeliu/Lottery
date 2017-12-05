unit frmSBCToDBC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TSBCToDBCForm = class(TForm)
    eSBC: TEdit;
    Button1: TButton;
    eDBC: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    
  public
    { Public declarations }
  end;

var
  SBCToDBCForm: TSBCToDBCForm;

implementation

uses unitProtocol;

{$R *.dfm}

procedure TSBCToDBCForm.Button1Click(Sender: TObject);
begin
        eDBC.Text := ConvertQJ2BJ(eSBC.Text);
end;

procedure TSBCToDBCForm.Button2Click(Sender: TObject);
begin
        close;
end;

end.
