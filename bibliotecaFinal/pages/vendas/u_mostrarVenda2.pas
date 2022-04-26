unit u_mostrarVenda2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  frame_grid, MemDS, VirtualTable, Uni, u_vendaControle, frxClass, frxDBSet,
  Vcl.Menus;

type
  TFormVenda = class(TForm)
    Panel1: TPanel;
    Label4: TLabel;
    Label7: TLabel;
    TituloPagina: TLabel;
    TituloLabel: TLabel;
    AddLivro: TButton;
    ClienteInput: TEdit;
    CodigoInput: TEdit;
    TituloInput: TEdit;
    ValorVenda: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    ModoInput: TEdit;
    grid_livros: TcxGrid;
    grid_livrosDBTableView1: TcxGridDBTableView;
    grid_livrosLevel1: TcxGridLevel;
    Label2: TLabel;
    frame_estilo_grid1: Tframe_estilo_grid;
    vtb_livrosVenda: TVirtualTable;
    vds_livrosVenda: TDataSource;
    grid_livrosDBTableView1codigo: TcxGridDBColumn;
    grid_livrosDBTableView1titulo: TcxGridDBColumn;
    grid_livrosDBTableView1editora: TcxGridDBColumn;
    grid_livrosDBTableView1ano_publicacao: TcxGridDBColumn;
    grid_livrosDBTableView1preco: TcxGridDBColumn;
    grid_livrosDBTableView1categoria: TcxGridDBColumn;
    grid_livrosDBTableView1qtdEscolhida: TcxGridDBColumn;
    ConfirmarBtn: TButton;
    ds_rel_livrosVenda: TfrxDBDataset;
    rel_comprovante: TfrxReport;
    PopupMenu1: TPopupMenu;
    removerLivro: TMenuItem;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure AddLivroClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ConfirmarBtnClick(Sender: TObject);
    procedure removerLivroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormVenda: TFormVenda;
  vendaControle: TVendaControle;

implementation

{$R *.dfm}

uses u_forms, u_escolhaLivro, u_dm1, u_vendas, u_perfil;

procedure TFormVenda.AddLivroClick(Sender: TObject);
var
  q1: TUniQuery;
begin
  if TituloInput.Text = '' then
  begin
    aviso('Informe o título do livro!!');
    TituloInput.SetFocus;
  end
  else
  begin
    try

      q1 := TUniQuery.Create(nil);
      q1.Connection := dm1.con1;

      q1.Close;
      q1.SQL.Clear;

      q1.SQL.Add('select * from livros where titulo like :titulo');
      q1.ParamByName('titulo').Value := '%' + TituloInput.Text + '%';

      q1.Open;

      if q1.RecordCount > 0 then
      begin
        EscolhaLivroForm.vtb_livrosEncontrados.Clear;
        q1.First;
        while not q1.Eof do
        begin
          EscolhaLivroForm.vtb_livrosEncontrados.Append;
          EscolhaLivroForm.vtb_livrosEncontrados['codigo'] := q1.FieldByName('codigo').AsInteger;
          EscolhaLivroForm.vtb_livrosEncontrados['titulo'] := q1.FieldByName('titulo').AsString;
          EscolhaLivroForm.vtb_livrosEncontrados['editora'] := q1.FieldByName('editora').AsString;
          EscolhaLivroForm.vtb_livrosEncontrados['anoPublicacao'] := q1.FieldByName('ano_publicacao').AsString;
          EscolhaLivroForm.vtb_livrosEncontrados['preco'] := q1.FieldByName('preco').AsFloat;
          EscolhaLivroForm.vtb_livrosEncontrados['categoria'] := q1.FieldByName('categoria').AsString;
          EscolhaLivroForm.vtb_livrosEncontrados['qtdEstoque'] := q1.FieldByName('qtd_estoque').AsInteger;

          q1.Next;
        end;

        EscolhaLivroForm.ShowModal;
      end
      else
      begin
        aviso('Livro não encontrado!');
      end;
    finally
      FreeAndNil(q1);
    end;
  end;
end;

procedure TFormVenda.ConfirmarBtnClick(Sender: TObject);
begin
    if ModoInput.Text = 'V' then
    begin
        rel_comprovante.Variables['numero_venda'] := CodigoInput.Text;
        rel_comprovante.Variables['vendedor'] := QuotedStr(PerfilUsuario.NomeInput.Text);
        rel_comprovante.Variables['cliente'] := quotedStr(ClienteInput.Text);
        rel_comprovante.Variables['valor'] := ValorVenda.Caption;
        rel_comprovante.Variables['data'] := quotedStr('14/07/1999');

        ds_rel_livrosVenda.DataSource := vds_livrosVenda;

        rel_comprovante.ShowReport(true);
    end
    else if ModoInput.Text = 'A' then
    begin
      q1.Close;
      q1.SQL.Clear;

      q1.SQL.Add('update vendas ');
      q1.SQL.Add('set cliente = :cliente, valor_total = :valor_total');
      q1.SQL.Add('where codigo = :codigo');

      q1.ParamByName('cliente').Value := ClienteInput.Text;
      q1.ParamByName('valor_total').Value := ValorVenda.Caption;
      q1.ParamByName('codigo').Value := StrToInt(CodigoInput.Text);

      if confirma('Confirmar alteração da venda?') then
      begin
        q1.ExecSQL;
        mensagem('Venda alterada com sucesso!');
        FormVendas.grid_vendasDBTableView1.DataController.RefreshExternalData;
        vendaControle.ZerarValor;
        Self.Close;
      end;
    end
    else if ModoInput.Text = 'N' then
    begin
      q1.Close;
      q1.SQL.Clear;

      q1.SQL.Add('select nome_completo from clientes where nome_completo like :nome');
      q1.ParamByName('nome').Value := '%' + ClienteInput.Text + '%';

      q1.ExecSQL;
      if q1.RecordCount = 1 then
      begin
        ClienteInput.Text := q1.FieldByName('nome_completo').Value;

        q1.Close;
        q1.SQL.Clear;

        q1.SQL.Add('insert into vendas ');
        q1.SQL.Add('values (:codigo, :vendedor, :cliente, :valor_total, :data )');

        q1.ParamByName('codigo').Value := CodigoInput.Text;
        q1.ParamByName('vendedor').Value := PerfilUsuario.NomeInput.Text;
        q1.ParamByName('cliente').Value := ClienteInput.Text;
        q1.ParamByName('valor_total').Value := ValorVenda.Caption;
        q1.ParamByName('data').Value := Now();

        if confirma('Confirmar nova venda?') then
        begin
          q1.ExecSQL;
          mensagem('Venda realizada com sucesso!');
          FormVendas.grid_vendasDBTableView1.DataController.RefreshExternalData;
          vendaControle.ZerarValor;
          Self.Close;
        end;
      end
      else
      begin
        erro('Cliente não encontrado!');
      end;
    end;
end;

procedure TFormVenda.FormCreate(Sender: TObject);
begin
  vendaControle := TVendaControle.Create;
end;

procedure TFormVenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(wm_nextdlgctl, 0, 0);
  end
  else if key = #27 then close
end;

procedure TFormVenda.FormShow(Sender: TObject);
begin
  AbrirForm(FormVenda);

  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top :=  (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;

  if ModoInput.Text = 'V' then
  begin
    panel1.Enabled := False;
    TituloLabel.Visible := False;
    TituloInput.Visible := False;
    TituloPagina.Caption := 'Venda selecionada';
    ConfirmarBtn.Caption := 'Ver comprovante';
    AddLivro.Visible := False;
  end
  else if ModoInput.Text = 'N' then
  begin
    panel1.Enabled := True;
    TituloLabel.Visible := True;
    TituloInput.Visible := True;
    AddLivro.Visible := True;
    TituloPagina.Caption := 'Realizar nova venda';
    ConfirmarBtn.Caption := 'Confirmar venda';
    VendaControle.ZerarValor;
    ValorVenda.Caption := FloatToStr(VendaControle.valorAtual);
    vtb_livrosVenda.Clear;
    ClienteInput.SetFocus;
  end
  else if ModoInput.Text = 'A' then
  begin
    panel1.Enabled := True;
    TituloLabel.Visible := True;
    TituloInput.Visible := True;
    AddLivro.Visible := True;
    TituloPagina.Caption := 'Alterar venda seecionada';
    ConfirmarBtn.Caption := 'Salvar alterações';
    VendaControle.valorAtual := StrToInt(ValorVenda.Caption);
    ClienteInput.SetFocus;
  end;
end;

procedure TFormVenda.removerLivroClick(Sender: TObject);
var
  indexLivro: Integer;
  tituloLivro: String;
  precoLivro: String;
  qtdEscolhida: String;
  valorAtualizado: Float32;

begin
  vds_livrosVenda.edit;
  indexLivro := grid_livrosDBTableView1.DataController.GetSelectedRowIndex(0);
  tituloLivro := grid_livrosDBTableView1.ViewData.Records[indexLivro].Values[1];
  precoLivro := grid_livrosDBTableView1.ViewData.Records[indexLivro].Values[4];
  qtdEscolhida := grid_livrosDBTableView1.ViewData.Records[indexLivro].Values[6];

  try
    q1.Close;
    q1.SQL.Clear;

    q1.SQL.Add('delete from livros_venda ');
    q1.SQL.Add('where titulo = :titulo');
    q1.ParamByName('titulo').Value := tituloLivro;

    if confirma('Confirmar remoção de livro da venda?') then
    begin
      try
        q1.ExecSQL;
      except on e:Exception do
        erro(e.Message);
      end;
    end;

  finally
    vtb_livrosVenda.FieldByName('titulo').AsString := tituloLivro;
    vtb_livrosVenda.Delete;

    mensagem('Livro removido com sucesso!');

    valorAtualizado := StrToFloat(ValorVenda.Caption) - (StrToFloat(precoLivro) * StrToInt(qtdEscolhida));
    ValorVenda.Caption := FloatToStr(valorAtualizado);
    vendaControle.valorAtual := StrToInt(ValorVenda.Caption);
  end;
end;

end.
