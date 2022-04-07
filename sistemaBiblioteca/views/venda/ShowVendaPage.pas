unit ShowVendaPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Generics.Collections, MemDS, VirtualTable;

type
  TShowVendaForm = class(TForm)
    Label1: TLabel;
    codVendaLabel: TLabel;
    Label2: TLabel;
    vendedorLabel: TLabel;
    Label3: TLabel;
    clienteLabel: TLabel;
    LivrosGrid: TDBGrid;
    Label4: TLabel;
    Label5: TLabel;
    valorTotalLabel: TLabel;
    tbLivrosVenda: TVirtualTable;
    dsLivrosVenda: TDataSource;
    procedure CriarForm(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ShowVendaForm: TShowVendaForm;

implementation

{$R *.dfm}

uses livroVenda, Livro, Venda;

procedure TShowVendaForm.CriarForm(Sender: TObject);
var
  codVenda: Integer;
  vendaAtual: TVenda;
  listaTitulos: TList<String>;
  livroVenda: TLivroVenda;
  count: Integer;

  livro: TLivro;

begin
  count := 0;

  Self.tbLivrosVenda.Clear;
  codVenda := StrToInt(Self.codVendaLabel.Caption);

  vendaAtual := TVenda.Create;

  vendaAtual.cod := codVenda;
  vendaAtual.Read(vendaAtual);

  livroVenda := TLivroVenda.Create;

  listaTitulos := livroVenda.FindAllByCodVenda(vendaAtual.cod);

  livro := TLivro.Create;

  while count < listaTitulos.Count  do
  begin
    Self.tbLivrosVenda.Append;

    livro := livro.FindByTitulo(listaTitulos.Items[count]);

    Self.tbLivrosVenda['codigo'] := livro.cod;
    Self.tbLivrosVenda['titulo'] := livro.titulo;
    Self.tbLivrosVenda['editora'] := livro.editora;
    Self.tbLivrosVenda['anoPublicacao'] := livro.anoPublicacao;
    Self.tbLivrosVenda['preco'] := livro.preco;

    count := count + 1;
  end;

end;

end.
