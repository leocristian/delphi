unit u_escolhaLivro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, MemDS, VirtualTable, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, Uni, Vcl.Buttons, frame_grid;

type
  TEscolhaLivroForm = class(TForm)
    Label1: TLabel;
    Confirmar: TButton;
    vtb_livrosEncontrados: TVirtualTable;
    vds_livrosEncontrados: TDataSource;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1codigo: TcxGridDBColumn;
    cxGrid1DBTableView1titulo: TcxGridDBColumn;
    cxGrid1DBTableView1editora: TcxGridDBColumn;
    cxGrid1DBTableView1anoPublicacao: TcxGridDBColumn;
    cxGrid1DBTableView1preco: TcxGridDBColumn;
    cxGrid1DBTableView1categoria: TcxGridDBColumn;
    cxGrid1DBTableView1qtdEstoque: TcxGridDBColumn;
    frame_estilo_grid1: Tframe_estilo_grid;
    procedure AbrirForm(Sender: TObject);
    procedure AtivaNavegacao(Sender: TObject; var Key: Char);
    procedure ConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EscolhaLivroForm: TEscolhaLivroForm;
  q1: TUniQuery;

implementation

{$R *.dfm}

uses u_forms, u_dm1, u_novaVenda, u_mostrarVenda, u_mostrarVenda2;

procedure TEscolhaLivroForm.AbrirForm(Sender: TObject);
begin
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top :=  (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;

  Confirmar.SetFocus;
end;

procedure TEscolhaLivroForm.AtivaNavegacao(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(wm_nextdlgctl, 0, 0);
  end
  else if key = #27 then close;
end;

procedure TEscolhaLivroForm.ConfirmarClick(Sender: TObject);
var
  indexLivro: Integer;

  codLivro: Integer;
  titulo: String;
  editora: String;
  anoPublicacao: String;
  precoLivro: Float32;
  categoria: String;
  qtdEstoque: Integer;
  qtdEscolhida: integer;
  novoValor: Float32;

begin

  indexLivro := cxGrid1DBTableView1.DataController.GetSelectedRowIndex(0);

  codLivro := cxGrid1DBTableView1.ViewData.Records[indexLivro].Values[0];
  titulo := cxGrid1DBTableView1.ViewData.Records[indexLivro].Values[1];
  editora := cxGrid1DBTableView1.ViewData.Records[indexLivro].Values[2];
  anoPublicacao := cxGrid1DBTableView1.ViewData.Records[indexLivro].Values[3];
  precoLivro := cxGrid1DBTableView1.ViewData.Records[indexLivro].Values[4];
  categoria := cxGrid1DBTableView1.ViewData.Records[indexLivro].Values[5];
  qtdEstoque := cxGrid1DBTableView1.ViewData.Records[indexLivro].Values[6];

  qtdEscolhida := StrToInt(inputBox('Escolher quantidade.', 'Digite a quantidade de livros.', '1'));

  if qtdEscolhida > qtdEstoque then
  begin
    aviso('Estoque insuficiente!');
  end
  else
  begin

    FormVenda.vtb_livrosvenda.Append;
    FormVenda.vtb_livrosvenda['codigo'] := codLivro;
    FormVenda.vtb_livrosvenda['titulo'] := titulo;
    FormVenda.vtb_livrosvenda['editora'] := editora;
    FormVenda.vtb_livrosvenda['ano_publicacao'] := anoPublicacao;
    FormVenda.vtb_livrosvenda['preco'] := FormatFloat('0,00', precoLivro);
    FormVenda.vtb_livrosvenda['categoria'] := categoria;
    FormVenda.vtb_livrosvenda['qtdEscolhida'] := qtdEscolhida;

    q1.Close;
    q1.SQL.Clear;

    // Atualizar estoque do livro
    q1.SQL.Add('update livros set qtd_estoque = :qtdFinal where titulo = :titulo');
    q1.ParamByName('qtdFinal').Value := (qtdEstoque - qtdEscolhida);
    q1.ParamByName('titulo').Value := titulo;

    if confirma('Adicionar livro na venda?') then
    begin
      q1.ExecSQL;

      q1.Close;
      q1.SQL.Clear;

      q1.SQL.Text := 'select nextval(''tb_livrosVenda_cod_seq'') as codProximo';
      q1.Open;

      codLivro := q1.FieldByName('codProximo').AsInteger;

      q1.Close;
      q1.SQL.Clear;

      q1.SQL.Add('insert into livros_venda (codigo, titulo, editora, ano_publicacao, preco, categoria, numero_venda, qtd_escolhida) ');
      q1.SQL.Add('values ');
      q1.SQL.Add('(:codigo, :titulo, :editora, :ano_publicacao, :preco, :categoria, :numero_venda, :qtd_escolhida)');

      q1.ParamByName('codigo').Value := codLivro;
      q1.ParamByName('titulo').Value := titulo;
      q1.ParamByName('editora').Value := editora;
      q1.ParamByName('ano_publicacao').Value := anoPublicacao;
      q1.ParamByName('preco').Value := FormatFloat('0,00', precoLivro);
      q1.ParamByName('categoria').Value := categoria;
      q1.ParamByName('numero_venda').Value := FormVenda.CodigoInput.Text;
      q1.ParamByName('qtd_escolhida').Value := qtdEscolhida;

      q1.ExecSQL;
      qtdLivros := qtdLivros + 1;

      novoValor := StrToFloat(FormatFloat('0,00', precoLivro)) * qtdEscolhida;

      vendaControle.IncrementaValor(novoValor);

      FormVenda.ValorVenda.Caption := FloatToStr(vendaControle.valorAtual);
      EscolhaLivroForm.Close;
      FormVenda.TituloInput.SetFocus;
    end;
  end;
end;

procedure TEscolhaLivroForm.FormCreate(Sender: TObject);
begin
  q1 := TUniQuery.Create(nil);
  q1.Connection := dm1.con1;
end;

end.
