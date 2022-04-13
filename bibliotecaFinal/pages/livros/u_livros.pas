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
    grid_livros: TcxGrid;
    grid_livrosDBTableView1: TcxGridDBTableView;
    grid_livrosLevel1: TcxGridLevel;
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
    grid_livrosDBTableView1codigo: TcxGridDBColumn;
    grid_livrosDBTableView1titulo: TcxGridDBColumn;
    grid_livrosDBTableView1editora: TcxGridDBColumn;
    grid_livrosDBTableView1preco: TcxGridDBColumn;
    grid_livrosDBTableView1categoria: TcxGridDBColumn;
    bt_mostrarTudo: TButton;
    procedure NovoLivroClick(Sender: TObject);
    procedure bt_buscaClick(Sender: TObject);
    procedure bt_mostrarTudoClick(Sender: TObject);
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

procedure TFormLivros.bt_buscaClick(Sender: TObject);
var
  buscaInfo: String;

begin

  buscaInfo := BuscaInput.Text;

  if Self.SelecaoBusca.Text = 'CÓDIGO' then
  begin

    ds_livros.DataSet.Filter := 'codigo = ' + buscaInfo;
    ds_livros.DataSet.Filtered := True;
  end
  else if Self.SelecaoBusca.Text = 'CATEGORIA' then
  begin

    ds_livros.DataSet.Filter := 'categoria like ' + QuotedStr('%' + buscaInfo + '%');
    ds_livros.DataSet.Filtered := True;
  end
  else if Self.SelecaoBusca.Text = 'EDITORA' then
  begin

    ds_livros.DataSet.Filter := 'editora like ' + QuotedStr('%' + buscaInfo + '%');
    ds_livros.DataSet.Filtered := True;
  end
  else if Self.SelecaoBusca.Text = 'TITULO' then
  begin

    ds_livros.DataSet.Filter := 'titulo like ' + QuotedStr('%' + buscaInfo + '%');
    ds_livros.DataSet.Filtered := True;
  end
  else ShowMessage('Campo de busca inválido');

  grid_livrosDBTableView1.DataController.RefreshExternalData;
  buscaInput.Text := '';

end;

procedure TFormLivros.bt_mostrarTudoClick(Sender: TObject);
begin
  ds_livros.DataSet.Filtered := False;
  grid_livrosDBTableView1.DataController.RefreshExternalData;
end;

procedure TFormLivros.NovoLivroClick(Sender: TObject);
begin
  NovoLivroForm.ShowModal;
end;

end.
