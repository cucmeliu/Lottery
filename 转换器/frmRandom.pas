unit frmRandom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ExtCtrls, Buttons;

type
  TRandomForm = class(TForm)
    GroupBox1: TGroupBox;
    seEnd: TSpinEdit;
    seStart: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    seNum: TSpinEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    seSpecEnd: TSpinEdit;
    seSpecStart: TSpinEdit;
    ListBox1: TListBox;
    btnGenerate: TButton;
    Panel1: TPanel;
    Button3: TButton;
    Button4: TButton;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    seTimes: TSpinEdit;
    Button1: TButton;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btnGenerateClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    fBaseStr, fSpecStr: string;
    procedure GenOnce;
  public
    { Public declarations }
  end;

var
  RandomForm: TRandomForm;

implementation

{$R *.dfm}

procedure TRandomForm.FormCreate(Sender: TObject);
begin
        fBaseStr := '';
        fSpecStr := '';

end;

procedure TRandomForm.btnGenerateClick(Sender: TObject);
begin
        Randomize;
        GenOnce;
end;

procedure TRandomForm.Button4Click(Sender: TObject);
begin
close;
end;

procedure TRandomForm.Button3Click(Sender: TObject);
var
  sd: TSaveDialog;
begin
        sd := TSaveDialog.Create(nil);

        if not (ofExtensionDifferent in sd.Options) then
                sd.Options := sd.Options + [ofOverwritePrompt];

        if sd.Execute then
        begin
                ListBox1.Items.SaveToFile(sd.FileName);
        end;

end;

procedure TRandomForm.SpeedButton1Click(Sender: TObject);
begin
        listbox1.Clear;
end;

procedure TRandomForm.GenOnce;
var
  i: integer;
  ri: integer;
begin
        fBaseStr := '';
        for i:=0 to seNum.Value-1 do
        begin
                ri := seStart.Value + Random(seEnd.Value-seStart.Value);
                fBaseStr := fBaseStr + ' ' + IntToStr(ri);
        end;

        fSpecStr := '';
        fSpecStr := IntToStr(seSpecStart.Value + Random(seSpecEnd.Value-seSpecStart.Value));

        ListBox1.Items.Add('µÚ' + IntToStr(ListBox1.Items.Count+1) + '´Î'
                + ' ' + fBaseStr + '   ' + fSpecStr);

end;

procedure TRandomForm.Button1Click(Sender: TObject);
var
  I: integer;
begin
        Randomize;
        Listbox1.Items.BeginUpdate;
        for I:=1 to seTimes.Value do
                GenOnce;
       Listbox1.Items.EndUpdate;
end;

procedure TRandomForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        action := cafree;
end;

end.
