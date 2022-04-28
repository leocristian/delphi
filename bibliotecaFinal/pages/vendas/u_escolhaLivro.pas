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
    procedure FormShow(Sender: TObject);
    procedure AtivaNavegacao(Sender: TObject; var Key: Char);
    procedure ConfirmarClick(Sender: TObject);
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
var
  q1: TUniQuery;

begin
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top :=  (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;

   try
      q1 := TUniQuery.Create(nil);
      q1.Connection := dm1.con1;

      q1.Close;
      q1.SQL.Clear;

      q1.SQL.Add('select * from livros where titulo like :titulo');
      q1.ParamByName('titulo').Value := '%' + MostrarVendaForm.TituloInput.Text + '%';

      q1.Open;

      if q1.RecordCount > 0 then
      begin
        EscolhaLivroForm.vtb_livrosEncontrados.Clear;
        q1.First;
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
      end
      else
      begin
        aviso('Livro não encontrado!');
        MostrarVendaForm.TituloInput.SetFocus;
      end;
    finally
      q1.Close;
      FreeAndNil(q1);
    end;
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

begin

  indexLivro := cxGrid1DBTableView1.DataController.GetSelectedRowIndex(0);

  codLivro := cxGrid1DBTableView1.ViewData.Records[indexLivro].Values[0];
  titulo := cxGrid1DBTableView1.ViewData.Records[indexLivro].Values[1];
  editora := cxGrid1DBTableView1.ViewData.Records[indexLivro].Values[2];
  anoPublicacao := cxGrid1DBTableView1.ViewData.Records[indexLivro].Values[3];
  precoLivro := cxGrid1DBTableView1.ViewData.Records[indexLivro].Values[4];
  categoria := cxGrid1DBTableView1.ViewData.Records[indexLivro].Values[5];
  qtdEstoque := cxGrid1DBTableView1.ViewData.Records[indexLivro].Values[6];

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
      FormVenda.vtb_livrosvenda.Append;
      FormVenda.vtb_livrosvenda['codigo'] := codLivro;
      FormVenda.vtb_livrosvenda['titulo'] := titulo;
      FormVenda.vtb_livrosvenda['editora'] := editora;
      FormVenda.vtb_livrosvenda['ano_publicacao'] := anoPublicacao;
      FormVenda.vtb_livrosvenda['preco'] :=  FormatFloat('#,##0.00', precoLivro);
      FormVenda.vtb_livrosvenda['categoria'] := categoria;
      FormVenda.vtb_livrosvenda['qtdEscolhida'] := qtdEscolhida;
      try
        q1 := TUniQuery.Create(nil);
        q1.Connection := dm1.con1;

        q1.Close;
        q1.SQL.Clear;

        // Atualizar estoque do livro
        q1.SQL.Add('update livros set qtd_estoque = :qtdFinal where titulo = :titulo');
        q1.ParamByName('qtdFinal').Value := (qtdEstoque - qtdEscolhida);
        q1.ParamByName('titulo').Value := titulo;

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
        q1.ParamByName('preco').Value := precoLivro;
        q1.ParamByName('categoria').Value := categoria;
        q1.ParamByName('numero_venda').Value := FormVenda.CodigoInput.Text;
        q1.ParamByName('qtd_escolhida').Value := qtdEscolhida;

        q1.ExecSQL;

        q1.Close;
        q1.SQL.Text := 'update vendas set valor_total = :valor_total where codigo = :codigo';

        novoValor :=  StrToFloat(FormatFloat('#,##0.00', precoLivro)) * qtdEscolhida;
        vendaControle.IncrementaValor(novoValor);

        FormVenda.ValorVenda.Caption := FormatFloat('#,##0.00', vendaControle.valorAtual);

        ShowMessage(FormatFloat('#,##0.00', vendaControle.valorAtual));
        q1.ParamByName('valor_total').Value := vendaControle.valorAtual;
        q1.ParamByName('codigo').Value := FormVenda.CodigoInput.Text;

        q1.ExecSQL;

      finally
        EscolhaLivroForm.Close;
        FormVenda.TituloInput.SetFocus;

        q1.Close;
        FreeAndNil(q1);
      end;
    end;
  end;
end;

end.
