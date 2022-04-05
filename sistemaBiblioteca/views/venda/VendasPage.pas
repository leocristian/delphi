unit VendasPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations,
  Data.DB, cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Menus;

type
  TVendasForm = class(TForm)
    Panel1: TPanel;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Button1: TButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    PopupMenu1: TPopupMenu;
    Visualizarselecionado1: TMenuItem;
    Visualizarselecionado2: TMenuItem;
    Alterarvendaselecionada1: TMenuItem;
    N1: TMenuItem;
    Excluirvendaselecionada1: TMenuItem;
    cxGrid1DBTableView1codigo: TcxGridDBColumn;
    cxGrid1DBTableView1vendedor: TcxGridDBColumn;
    cxGrid1DBTableView1livro: TcxGridDBColumn;
    cxGrid1DBTableView1cliente: TcxGridDBColumn;
    cxGrid1DBTableView1valor_total: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    procedure NovaVenda(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VendasForm: TVendasForm;

implementation

{$R *.dfm}

uses dmDatabase, NewVendaPage;

procedure TVendasForm.NovaVenda(Sender: TObject);
begin
  NewVendaPage.NewVendaForm.Visible := True;
end;

end.
