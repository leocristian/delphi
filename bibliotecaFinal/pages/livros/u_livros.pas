unit u_livros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations,
  Data.DB, cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, Vcl.Menus, MemDS, DBAccess, Uni, Vcl.StdCtrls, cxGridLevel,
  cxGridCustomView, cxGrid, Vcl.ExtCtrls;

type
  TFormLivros = class(TForm)
    Panel1: TPanel;
    BuscaInput: TEdit;
    bt_busca: TButton;
    grid_vendas: TcxGrid;
    grid_vendasDBTableView1: TcxGridDBTableView;
    grid_vendasLevel1: TcxGridLevel;
    SelecaoBusca: TComboBox;
    tb_livros: TUniTable;
    PopupLivros: TPopupMenu;
    VisualizarLivro: TMenuItem;
    NovoLivro: TMenuItem;
    AlterarLivro: TMenuItem;
    N2: TMenuItem;
    ExcluirLivro: TMenuItem;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    ds_livros: TDataSource;
    grid_vendasDBTableView1codigo: TcxGridDBColumn;
    grid_vendasDBTableView1titulo: TcxGridDBColumn;
    grid_vendasDBTableView1editora: TcxGridDBColumn;
    grid_vendasDBTableView1ano_publicacao: TcxGridDBColumn;
    grid_vendasDBTableView1preco: TcxGridDBColumn;
    grid_vendasDBTableView1categoria: TcxGridDBColumn;
    procedure NovoLivroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLivros: TFormLivros;

implementation

{$R *.dfm}

uses u_novoLivro;

procedure TFormLivros.NovoLivroClick(Sender: TObject);
begin
  NovoLivroForm.ShowModal;
end;

end.
