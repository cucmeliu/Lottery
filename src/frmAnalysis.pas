unit frmAnalysis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Grids;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Splitter1: TSplitter;
    dg337: TStringGrid;
    RichEdit1: TRichEdit;
    Panel1: TPanel;
    bbtListBase: TBitBtn;
    bbtListSpec: TBitBtn;
    bbtListAll: TBitBtn;
    editCmd: TEdit;
    cbbCommand: TComboBox;
    BitBtn1: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
