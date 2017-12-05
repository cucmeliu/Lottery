unit frmResult;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls;

type
  TResultForm = class(TForm)
    ListView1: TListView;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    procedure ListView1ColumnClick(Sender: TObject; Column: TListColumn);
    procedure ListView1Compare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    ColumnToSort: Integer;
  public
    { Public declarations }
  end;

var
  ResultForm: TResultForm;

implementation

{$R *.dfm}

procedure TResultForm.ListView1ColumnClick(Sender: TObject;
  Column: TListColumn);
//var
//  Sort:byte;//0:Ä¬ÈÏÅÅÐò;1:ÕýÐò;2:ÄæÐò
begin
  ColumnToSort := Column.Index;
  (Sender as TCustomListView).AlphaSort;
end;

procedure TResultForm.ListView1Compare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
var
  ix: Integer;
begin
  if ColumnToSort = 0 then
    Compare := CompareText(Item1.Caption,Item2.Caption)
  else begin
   ix := ColumnToSort - 1;
   Compare :=  AnsiCompareText(Item1.SubItems[ix],Item2.SubItems[ix]);
  end;
end;

procedure TResultForm.FormShow(Sender: TObject);
begin
//        self.Height := ListView1.Items.Count * ListView1
end;

end.
