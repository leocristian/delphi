unit u_escolhaLivro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, MemDS, VirtualTable, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, Uni, Vcl.Buttons, frame_grid,
  Vcl.ExtCtrls, frame_imagens;

type
  TEscolhaLivroForm = class(TForm)
    vtb_livrosEncontrados: TVirtualTable;
    vds_livrosEncontrados: TDataSource;
    grid_livrosDBTableView1: TcxGridDBTableView;
    grid_livrosLevel1: TcxGridLevel;
    grid_livros: TcxGrid;
    grid_livrosDBTableView1codigo: TcxGridDBColumn;
    grid_livrosDBTableView1titulo: TcxGridDBColumn;
    grid_livrosDBTableView1editora: TcxGridDBColumn;
    grid_livrosDBTableView1anoPublicacao: TcxGridDBColumn;
    grid_livrosDBTableView1preco: TcxGridDBColumn;
    grid_livrosDBTableView1categoria: TcxGridDBColumn;
    grid_livrosDBTableView1qtdEstoque: TcxGridDBColumn;
    BuscaLivro: TPanel;
    BuscaBtn: TSpeedButton;
    SelecaoBusca: TComboBox;
    BuscaInput: TEdit;
    PanelConfirma: TPanel;
    CancelarBtn: TSpeedButton;
    FrameImagens1: TFrameImagens;
    Confirmar: TButton;
    frame_estilo_grid1: Tframe_estilo_grid;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure AtivaNavegacao(Sender: TObject; var Key: Char);
    procedure ConfirmarClick(Sender: TObject);
    procedure BuscaBtnClick(Sender: TObject);
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

procedure TEscolhaLivroForm.FormShow(Sender: TObject);
begin
  BuscaInput.SetFocus;
  grid_livrosDBTableView1.OptionsView.NoDataToDisplayInfoText := '';
  LimparInputs(EscolhaLivroForm);
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

procedure TEscolhaLivroForm.BuscaBtnClick(Sender: TObject);
var
  q1: TUniQuery;
begin
  vtb_livrosEncontrados.Clear;
  try
    q1 := TUniQuery.Create(nil);
    q1.Connection := dm1.con1;

    q1.Close;
    q1.SQL.Clear;

    q1.SQL.Add('select * from livros where titulo like :titulo');
    q1.ParamByName('titulo').Value := '%' + MostrarVendaForm.TituloInput.Text + '%';

    q1.Open;

    while not q1.Eof do
    begin
      vtb_livrosEncontrados.Append;
      vtb_livrosEncontrados['codigo'] := q1.FieldByName('codigo').AsInteger;
      vtb_livrosEncontrados['titulo'] := q1.FieldByName('titulo').AsString;
      vtb_livrosEncontrados['editora'] := q1.FieldByName('editora').AsString;
      vtb_livrosEncontrados['anoPublicacao'] := q1.FieldByName('ano_publicacao').AsString;
      vtb_livrosEncontrados['preco'] := FormatFloat('#,##0.00', q1.FieldByName('preco').AsFloat);
      vtb_livrosEncontrados['categoria'] := q1.FieldByName('categoria').AsString;
      vtb_livrosEncontrados['qtdEstoque'] := q1.FieldByName('qtd_estoque').AsInteger;

      q1.Next;
    end;
  finally
    q1.Close;
    FreeAndNil(q1);
   end;
end;

procedure TEscolhaLivroForm.ConfirmarClick(Sender: TObject);
var
  indexLivro: Integer;
  q1: TUniQuery;
  codLivro: Integer;
  titulo: String;
  editora: String;
  anoPublicacao: String;
  precoLivro: Float32;
  categoria: String;
  qtdEstoque: Integer;
  qtdEscolhida: integer;
  novoValor: Float32;
  codLivroVenda: Integer;

begin

  indexLivro := grid_livrosDBTableView1.DataController.GetSelectedRowIndex(0);

  codLivro := grid_livrosDBTableView1.ViewData.Records[indexLivro].Values[0];
  titulo := grid_livrosDBTableView1.ViewData.Records[indexLivro].Values[1];
  editora := grid_livrosDBTableView1.ViewData.Records[indexLivro].Values[2];
  anoPublicacao := grid_livrosDBTableView1.ViewData.Records[indexLivro].Values[3];
  precoLivro := grid_livrosDBTableView1.ViewData.Records[indexLivro].Values[4];
  categoria := grid_livrosDBTableView1.ViewData.Records[indexLivro].Values[5];
  qtdEstoque := grid_livrosDBTableView1.ViewData.Records[indexLivro].Values[6];

  try
    qtdEscolhida := StrToInt(inputBox('Escolher quantidade.', 'Digite a quantidade de livros.', '1'));
  except on e:Exception do
  begin
    erro('Digite uma quantidade válida de livros!');
    exit;
  end;
  end;

  if qtdEscolhida > qtdEstoque then
  begin
    aviso('Estoque insuficiente!');
  end
  else
  begin

    if confirma('Adicionar livro na venda?') then
    begin
      try
        q1 := TUniQuery.Create(nil);
        q1.Connection := dm1.con1;

        q1.Close;
        q1.SQL.Clear;

        // Atualizar estoque do livro
        q1.SQL.Add('update livros set qtd_estoque = :qtdFinal where codigo = :codigo');
        q1.ParamByName('qtdFinal').Value := (qtdEstoque - qtdEscolhida);
        q1.ParamByName('codigo').Value := codLivro;

        q1.ExecSQL;

        q1.Close;
        q1.SQL.Clear;

        q1.SQL.Text := 'select nextval(''tb_livrosVenda_cod_seq'') as codProximo';
        q1.Open;

        codLivroVenda := q1.FieldByName('codProximo').AsInteger;

        q1.Close;
        q1.SQL.Clear;

//        q1.SQL.Add('insert into livros_venda (codigo, titulo, editora, ano_publicacao, preco_unitario, categoria, numero_venda, qtd_escolhida) ');
//        q1.SQL.Add('values ');
//        q1.SQL.Add('(:codigo, :titulo, :editora, :ano_publicacao, :preco, :categoria, :numero_venda, :qtd_escolhida)');
//
//        q1.ParamByName('codigo').Value := codLivro;
//        q1.ParamByName('titulo').Value := titulo;
//        q1.ParamByName('editora').Value := editora;
//        q1.ParamByName('ano_publicacao').Value := anoPublicacao;
//        q1.ParamByName('preco').Value := precoLivro;
//        q1.ParamByName('categoria').Value := categoria;
//        q1.ParamByName('numero_venda').Value := FormVenda.CodigoInput.Text;
//        q1.ParamByName('qtd_escolhida').Value := qtdEscolhida;

        q1.SQL.Add('insert into livros_venda (codigo, cod_livro, cod_venda, preco_unitario, qtd_escolhida)');
        q1.SQl.Add('values ');
        q1.SQL.Add('(:codigo, :cod_livro, :cod_venda, :preco_unitario, :qtd_escolhida)');

        q1.ParamByName('codigo').Value := codLivroVenda;
        q1.ParamByName('cod_livro').Value := codLivro;
        q1.ParamByName('cod_venda').Value := Formvenda.CodigoInput.Text;
        q1.ParamByName('preco_unitario').Value := precoLivro;
        q1.ParamByName('qtd_escolhida').Value := qtdEscolhida;

        q1.ExecSQL;

        q1.Close;
        q1.SQL.Text := 'update vendas set valor_total = :valor_total where codigo = :codigo';

        novoValor :=  precoLivro * qtdEscolhida;
        vendaControle.IncrementaValor(novoValor);

        FormVenda.ValorVenda.Value := vendaControle.valorAtual;

        q1.ParamByName('valor_total').Value := vendaControle.valorAtual;
        q1.ParamByName('codigo').Value := FormVenda.CodigoInput.Text;

        q1.ExecSQL;

      finally
        EscolhaLivroForm.Close;
        q1.Close;
        q1.SQL.Text := 'select livros_venda.codigo, livros.titulo, livros.editora, livros.ano_publicacao, livros.preco, livros.categoria,livros_venda.qtd_escolhida, livros_venda.preco_total from livros inner join livros_venda on livros_venda.cod_venda = :cod_venda';
        q1.ParamByName('cod_venda').Value := FormVenda.CodigoInput.Text;

        q1.ExecSQL;

        FormVenda.vtb_livrosVenda.Clear;
        while not q1.Eof do
        begin
          FormVenda.vtb_livrosVenda.Append;
          FormVenda.vtb_livrosvenda['codigo'] := q1.FieldByName('codigo').Value;
          FormVenda.vtb_livrosvenda['titulo'] := q1.FieldByName('titulo').Value;
          FormVenda.vtb_livrosvenda['editora'] := q1.FieldByName('editora').Value;
          FormVenda.vtb_livrosvenda['ano_publicacao'] := q1.FieldByName('ano_publicacao').Value;
          FormVenda.vtb_livrosvenda['preco_unitario'] := FormatFloat('#,##0.00', q1.FieldByName('preco').Value);
          FormVenda.vtb_livrosvenda['categoria'] := q1.FieldByName('categoria').Value;
          FormVenda.vtb_livrosvenda['qtdEscolhida'] := q1.FieldByName('qtd_escolhida').Value;
          FormVenda.vtb_livrosvenda['preco_final'] := FormatFloat('#,##0.00', q1.FieldByName('preco_total').Value);

          q1.Next;
        end;
        FormVenda.TituloInput.SetFocus;
        q1.Close;
        FreeAndNil(q1);
      end;
    end;
  end;
end;

end.
