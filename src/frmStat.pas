unit frmStat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus,
  StatGrid, LotteryBuilder, defineUnit, ExtCtrls;

type
  TStatForm = class(TForm)
    GroupBox1: TGroupBox;
    PopupMenu1: TPopupMenu;
    piPan: TMenuItem;
    piZoomIn: TMenuItem;
    piZoomOut: TMenuItem;
    piZoomMin: TMenuItem;
    piZoomMax: TMenuItem;
    Memo1: TMemo;
    Panel1: TPanel;
    cbbStatType: TComboBox;
    Label2: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    lbStatList: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure piZoomInClick(Sender: TObject);
    procedure piZoomOutClick(Sender: TObject);
    procedure piPanClick(Sender: TObject);
    procedure piZoomMinClick(Sender: TObject);
    procedure piZoomMaxClick(Sender: TObject);
    procedure lbStatListDblClick(Sender: TObject);
    procedure lbStatListMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cbbStatTypeChange(Sender: TObject);
  private
    { Private declarations }
    fNumCount: TNumCount;
    MouseInList: TPoint;

    StatGrid: TStatGrid;       

    procedure LoadGraph;
    procedure FileReLoadMsg(var message: TMessage); message WM_FILE_LOADED; //重新加载了文件
  public
    { Public declarations } 
    fLotteryBuilder: TLotteryBuilder;

    procedure DrawGrid(NumCount: TNumCount);
  end;

var
  StatForm: TStatForm;

implementation

{$R *.dfm}

procedure TStatForm.FormCreate(Sender: TObject);
begin          
        fNumCount.TotalCount := 0;
        fNumCount.NumCount := 0;
end;

procedure TStatForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
        action := cafree;
end;

procedure TStatForm.piZoomInClick(Sender: TObject);
begin
        StatGrid.SetZoomIn;
end;

procedure TStatForm.piZoomOutClick(Sender: TObject);
begin
        StatGrid.SetZoomOut;
end;

procedure TStatForm.piPanClick(Sender: TObject);
begin
        StatGrid.SetZoomPan;
end;

procedure TStatForm.piZoomMinClick(Sender: TObject);
begin
        StatGrid.Reset;
end;

procedure TStatForm.piZoomMaxClick(Sender: TObject);
begin
        StatGrid.Maxam;
end;

procedure TStatForm.LoadGraph;
begin
        if not assigned(StatGrid) then
                StatGrid := TStatGrid.Create(self);
        StatGrid.fLotteryBuilder := self.fLotteryBuilder;
        statGrid.NumCount := fNumCount;
        StatGrid.Align := alClient;
        StatGrid.MaxCount := fLotteryBuilder.MaxCount;
        StatGrid.Reset;
end;

procedure TStatForm.DrawGrid(NumCount: TNumCount);
var
  i: integer;
begin
        fNumCount := NumCount;
        lbStatList.Items.Clear;
        for i:=1 to NumCount.TotalCount do
                lbStatList.Items.Add(IntToStr(i));
        LoadGraph;
end;

procedure TStatForm.lbStatListDblClick(Sender: TObject);
var
  idx: integer;
begin
        try
                idx := lbStatList.ItemAtPos(MouseInList, true)+1;
        except
                idx := 0;
        end;
        StatGrid.BaseNumber := idx;

end;

procedure TStatForm.lbStatListMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
        MouseInList.X := x;
        MouseInList.Y := y;
end;

procedure TStatForm.FileReLoadMsg(var message: TMessage);
begin
        FNumCount.TotalCount := message.WParam;
        FNumCount.NumCount := message.LParam;
        DrawGrid(FNumCount);
end;

procedure TStatForm.cbbStatTypeChange(Sender: TObject);
begin
        case cbbStatType.ItemIndex of
          0: StatGrid.BaseOnly := false;
          else StatGrid.BaseOnly := true;
        end;
        StatGrid.Reset;

end;

end.
