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
  Vcl.Menus, cxContainer, cxTextEdit, cxCurrencyEdit, Vcl.WinXCtrls,
  System.ImageList, Vcl.ImgList, Vcl.Buttons, frame_seleciona_item,
  frame_imagens;

type
  TFormVenda = class(TForm)
    Panel1: TPanel;
    Label4: TLabel;
    Label7: TLabel;
    TituloPagina: TLabel;
    TituloLabel: TLabel;
    CodigoInput: TEdit;
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
    ConfirmarBtn: TButton;
    ds_rel_livrosVenda: TfrxDBDataset;
    rel_comprovante: TfrxReport;
    PopupMenu1: TPopupMenu;
    removerLivro: TMenuItem;
    DataPanel: TPanel;
    DataTituloLabel: TLabel;
    DataLabel: TLabel;
    VendedorTituloLabel: TLabel;
    VendedorLabel: TLabel;
    Label1: TLabel;
    TipoPagamento: TComboBox;
    QtdParcelas: TEdit;
    Label6: TLabel;
    Label8: TLabel;
    ValorVenda: TcxCurrencyEdit;
    grid_livrosDBTableView1qtdEscolhida: TcxGridDBColumn;
    grid_livrosDBTableView1preco_final: TcxGridDBColumn;
    BalloonHint1: TBalloonHint;
    SpeedButton2: TSpeedButton;
    FrameImagens1: TFrameImagens;
    ClienteInput: TEdit;
    BuscaClienteBtn: TSpeedButton;
    TituloInput: TEdit;
    BuscaLivroBtn: TSpeedButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure AddLivroClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ConfirmarBtnClick(Sender: TObject);
    procedure removerLivroClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BuscaClienteClick(Sender: TObject);
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

uses u_forms, u_escolhaLivro, u_dm1, u_vendas, u_perfil, u_selecionaCliente;

procedure TFormVenda.AddLivroClick(Sender: TObject);
begin
  EscolhaLivroForm.vtb_livrosEncontrados.Clear;
  EscolhaLivroForm.ShowModal;
end;

procedure TFormVenda.ConfirmarBtnClick(Sender: TObject);
var
  q1: TUniQuery;

begin

  // BOTÃO ASSUME A FUNÇÃO DE VER COMPROVANTE
  if ModoInput.Text = 'V' then
  begin
      rel_comprovante.Variables['numero_venda'] := CodigoInput.Text;
      rel_comprovante.Variables['vendedor'] := QuotedStr(PerfilUsuario.NomeInput.Text);
      rel_comprovante.Variables['cliente'] := quotedStr(ClienteInput.Text);
      rel_comprovante.Variables['valor'] := ValorVenda.Value;
      rel_comprovante.Variables['tipo_pagamento'] := QuotedStr(TipoPagamento.Text);
      rel_comprovante.Variables['qtd_parcelas'] := QtdParcelas.Text;
      rel_comprovante.Variables['data'] := QuotedStr(DataLabel.Caption);

      ds_rel_livrosVenda.DataSource := vds_livrosVenda;

      rel_comprovante.ShowReport;
  end
  else
  begin
    if (ClienteInput.Text = '') or (QtdParcelas.Text = '') then
    begin
      aviso('Preencha todos os campos!');
      ClienteInput.SetFocus;
      exit;
    end;
    try
      q1 := TUniQuery.Create(nil);
      q1.Connection := dm1.con1;

      q1.Close;
      q1.SQL.Clear;
      // VALIDAR CLIENTE DA VENDA
      q1.SQL.Text := 'select cpf from clientes where cpf like :cpf';
      q1.ParamByName('cpf').Value := '%' + ClienteInput.Text + '%';

      q1.Open;

      if q1.RecordCount = 1 then
      begin
        ClienteInput.Text := q1.FieldByName('cpf').AsString;
      end
      else
      begin
        aviso('Cliente não encontrado!');
        ClienteInput.SetFocus;
        exit;
      end;

      q1.Close;
      q1.SQL.Clear;

      if ModoInput.Text = 'A' then
      begin
        q1.SQL.Add('update vendas ');
        q1.SQL.Add('set cliente = :cliente, valor_total = :valor_total, tipo_pagamento = :tipo, qtd_parcelas = :qtd_parcelas');
        q1.SQL.Add('where codigo = :codigo');
      end
      else if ModoInput.Text = 'N' then
      begin
        q1.SQL.Add('insert into vendas ');
        q1.SQL.Add('values (:codigo, :vendedor, :cliente, :valor_total, :data, :tipo, :qtd_parcelas )');

        q1.ParamByName('data').Value := Now();
        q1.ParamByName('vendedor').Value := PerfilUsuario.NomeInput.Text;
      end;

      q1.ParamByName('codigo').Value := CodigoInput.Text;
      q1.ParamByName('cliente').Value := ClienteInput.Text;
      q1.ParamByName('valor_total').Value := ValorVenda.Value;
      q1.ParamByName('tipo').Value := TipoPagamento.Text;
      q1.ParamByName('qtd_parcelas').Value := QtdParcelas.Text;

      if ValorVenda.Value = 0 then
      begin
        aviso('Venda deve ter pelo menos um livro!');
        TituloInput.SetFocus;
        Exit;
      end;
      if (QtdParcelas.Text = '0') or (StrToInt(Qtdparcelas.Text) > 12) then
      begin
        aviso('Parcelamento inválido! Qtd máxima: 12 parcelas');
        QtdParcelas.SetFocus;
        exit;
      end;
      if confirma('Confirmar operação?') then
      begin
        q1.ExecSQL;
        mensagem('Operação concluída!');
        FormVendas.grid_vendasDBTableView1.DataController.RefreshExternalData;
        vendaControle.ZerarValor;
        ModoInput.Text := 'V';
        Self.Close;
      end;

    finally
      q1.Close;
      FreeAndNil(q1);
    end;
  end;
end;

procedure TFormVenda.FormClose(Sender: TObject; var Action: TCloseAction);
var
  q1: TUniQuery;

begin
  if ModoInput.Text = 'N' then
  begin
    try
      q1 := TUniQuery.Create(nil);
      q1.Connection := dm1.con1;

      q1.Close;
      q1.SQL.Text := 'delete from livros_venda where cod_venda = :cod_venda';
      q1.ParamByName('cod_venda').Value := CodigoInput.Text;

      q1.ExecSQL;
    finally
      q1.Close;
      FreeAndNil(q1);
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
var
  q1: TUniQuery;
  qtdLivros: Integer;

begin
  AbrirForm(FormVenda);

  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top :=  (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;

  if (ModoInput.Text = 'V') or (ModoInput.Text = 'A') then
  begin
    try
      q1 := TUniQuery.Create(nil);
      q1.Connection := dm1.con1;

      q1.Close;

      q1.SQL.Text := 'select * from vendas where codigo = :codigo';
      q1.ParamByName('codigo').Value := CodigoInput.Text;

      q1.Open;

      if q1.RecordCount > 0 then
      begin
        ClienteInput.Text := q1.FieldByName('cliente').AsString;
        ValorVenda.Value := q1.FieldByName('valor_total').AsFloat;
        DataLabel.Caption := q1.FieldByName('data_venda').AsString;
        VendedorLabel.Caption := q1.FieldByName('vendedor').AsString;
        TipoPagamento.Text := q1.FieldByName('tipo_pagamento').AsString;
        QtdParcelas.Text := q1.FieldByName('qtd_parcelas').AsString;
      end;

      // LIMPAR E PREENCHER GRADE COM OS LIVROS DA VENDA SELECIONADA
      FormVenda.vtb_livrosVenda.Clear;

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
    finally
      q1.Close;
      FreeAndNil(q1);
    end;

    if ModoInput.Text = 'V' then
    begin
      panel1.Enabled := False;
      TituloLabel.Visible := False;
      TituloInput.Visible := False;
      TituloPagina.Caption := 'Venda selecionada';
      ConfirmarBtn.Caption := 'Ver comprovante';
      BuscaClienteBtn.Visible := False;
      BuscaLivroBtn.Visible := False;
    end
    else if ModoInput.Text = 'A' then
    begin
      panel1.Enabled := True;
      BuscaClienteBtn.Visible := False;
      BuscaLivroBtn.Visible := False;
      TituloLabel.Visible := True;
      TituloInput.Visible := True;
      TituloPagina.Caption := 'Alterar venda selecionada';
      ConfirmarBtn.Caption := 'Salvar alterações';
      VendaControle.valorAtual := ValorVenda.Value;
      ClienteInput.SetFocus;
      BuscaClienteBtn.Visible := True;
      BuscaLivroBtn.Visible := True;
    end;
  end
  else if ModoInput.Text = 'N' then
  begin

    panel1.Enabled := True;
    TituloLabel.Visible := True;
    BuscaClienteBtn.Visible := True;
    BuscaLivroBtn.Visible := True;
    TituloInput.Visible := True;
    TituloPagina.Caption := 'Realizar nova venda';
    ConfirmarBtn.Caption := 'Confirmar venda';
    VendaControle.ZerarValor;
    ValorVenda.Value := VendaControle.valorAtual;
    DataLabel.Caption := DateToStr(Now);
    VendedorLabel.Caption := PerfilUsuario.LoginInput.Text;
    vtb_livrosVenda.Clear;
    ClienteInput.SetFocus;

    // DEFINIR UM CÓDIGO PARA A NOVA VENDA
    try
      q1 := TUniQuery.Create(nil);
      q1.Connection := dm1.con1;

      q1.Close;
      q1.SQL.Text := 'select nextval(''tb_clientes_cod_seq'') as codProximo';
      q1.Open;

      CodigoInput.Text := q1.FieldByName('codProximo').AsString;

    finally
      q1.Close;
      FreeAndNil(q1);
    end;
  end

end;

procedure TFormVenda.removerLivroClick(Sender: TObject);
var
  indexLivro: Integer;
  tituloLivro: String;
  precoLivro: Currency;
  qtdEscolhida: Integer;
  valorAtualizado: Float32;
  codLivro: Integer;
  q1: TUniQuery;
  precoFinal: Currency;

begin
  vds_livrosVenda.edit;
  indexLivro := grid_livrosDBTableView1.DataController.GetSelectedRowIndex(0);
  codLivro := grid_livrosDBTableView1.ViewData.Records[indexLivro].Values[0];
  precoFinal := grid_livrosDBTableView1.ViewData.Records[indexLivro].Values[7];

  try
    q1 := TUniQuery.Create(nil);
    q1.Connection := dm1.con1;

    q1.Close;
    q1.SQL.Clear;


    q1.SQL.Add('delete from livros_venda ');
    q1.SQL.Add('where codigo = :codigo');
    q1.ParamByName('codigo').Value := codLivro;

    if confirma('Confirmar remoção de livro da venda?') then
    begin
      try
        q1.ExecSQL;
        // REMOVER LIVRO DA TABLE
        vtb_livrosVenda.FieldByName('codigo').AsInteger := codLivro;
        vtb_livrosVenda.Delete;

         // ATUALIZAR VALOR DA VENDA
        valorAtualizado := ValorVenda.Value - precoFinal;
        ValorVenda.Value := valorAtualizado; // FormatFloat('#,##0.00', valorAtualizado); //    FloatToStr(valorAtualizado);
        vendaControle.valorAtual := ValorVenda.Value;

        // ATUALIZAR VALOR NO BD
        q1.Close;

        q1.SQL.Text := 'update vendas set valor_total = :valor_total where codigo = :codigo';
        q1.ParamByName('valor_total').Value := vendaControle.valorAtual;
        q1.ParamByName('codigo').Value := CodigoInput.Text;

        try
          q1.ExecSQL;
        finally
          mensagem('Livro removido com sucesso!');
        end;
      except on e:Exception do
        erro(e.Message);
      end;
    end;

  finally
    q1.Close;
    FreeAndNil(q1);
  end;
end;

procedure TFormVenda.BuscaClienteClick(Sender: TObject);
begin
//  BuscaClienteForm.vtb_clientesEncontrados.Clear;
  showmessage('oi');
  BuscaClienteForm.Show;
end;

end.
