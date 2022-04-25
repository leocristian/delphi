unit u_mostrarVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, MemDS, VirtualTable,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, Vcl.Menus, Uni, u_vendaControle,
  frxClass, frxDBSet, Vcl.ExtCtrls, frame_grid;

type
  TMostrarVendaForm = class(TForm)
    Label2: TLabel;
    labelPreco: TLabel;
    Label4: TLabel;
    ClienteInput: TEdit;
    SalvarBtn: TButton;
    AddLivro: TButton;
    Label7: TLabel;
    CodigoInput: TEdit;
    ModoInput: TEdit;
    grid_livrosDBTableView1: TcxGridDBTableView;
    grid_livrosLevel1: TcxGridLevel;
    grid_livros: TcxGrid;
    ComprovanteBtn: TButton;
    rel_comprovante: TfrxReport;
    ds_rel_livrosVenda: TfrxDBDataset;
    Panel1: TPanel;
    Label5: TLabel;
    Label3: TLabel;
    TituloPagina: TLabel;
    TituloLabel: TLabel;
    TituloInput: TEdit;
    PopupMenu1: TPopupMenu;
    removerLivro: TMenuItem;
    vtb_livrosVenda: TVirtualTable;
    vds_livrosVenda: TDataSource;
    frame_estilo_grid1: Tframe_estilo_grid;
    grid_livrosDBTableView1codigo: TcxGridDBColumn;
    grid_livrosDBTableView1titulo: TcxGridDBColumn;
    grid_livrosDBTableView1editora: TcxGridDBColumn;
    grid_livrosDBTableView1ano_publicacao: TcxGridDBColumn;
    grid_livrosDBTableView1preco: TcxGridDBColumn;
    grid_livrosDBTableView1categoria: TcxGridDBColumn;
    grid_livrosDBTableView1qtdEscolhida: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure removerLivroClick(Sender: TObject);
    procedure SalvarBtnClick(Sender: TObject);
    procedure AddLivroClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComprovanteBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormVenda: TMostrarVendaForm;
  q1: TUniQuery;
  vendaControle: TVendaControle;

implementation

{$R *.dfm}

uses u_forms, u_dm1, u_vendas, u_escolhaLivro, u_perfil;

procedure TMostrarVendaForm.AddLivroClick(Sender: TObject);
begin
  if TituloInput.Text = '' then
  begin
    ShowMessage('Informe o título do livro!!');
  end
  else
  begin
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
      ShowMessage('Livro não encontrado!');
    end;
  end;
end;

procedure TMostrarVendaForm.ComprovanteBtnClick(Sender: TObject);
begin
  rel_comprovante.Variables['numero_venda'] := CodigoInput.Text;
  rel_comprovante.Variables['vendedor'] := QuotedStr(PerfilUsuario.NomeInput.Text);
  rel_comprovante.Variables['cliente'] := quotedStr(ClienteInput.Text);
  rel_comprovante.Variables['valor'] := labelPreco.Caption;
  rel_comprovante.Variables['data'] := quotedStr('14/07/1999');

  ds_rel_livrosVenda.DataSource := vds_livrosVenda;

  rel_comprovante.ShowReport(true);
end;

procedure TMostrarVendaForm.FormCreate(Sender: TObject);
begin
  q1 := TUniquery.Create(nil);
  q1.Connection := dm1.con1;

  vendaControle := TVendaControle.Create;
end;

procedure TMostrarVendaForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(wm_nextdlgctl, 0, 0);
  end
  else if key = #27 then close
end;

procedure TMostrarVendaForm.FormShow(Sender: TObject);
begin
  AbrirForm(FormVenda);

  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top :=  (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;

  if ModoInput.Text = 'N' then
  begin
    panel1.Enabled := True;
    TituloInput.Visible := True;
    ClienteInput.SetFocus;
    AddLivro.Visible := True;
    SalvarBtn.Caption := 'Realizar venda';
    SalvarBtn.Visible := True;
    TituloLabel.Visible := True;
    vendaControle.ZerarValor;
    LabelPreco.Caption := vendaControle.valorAtual.ToString;
    vds_livrosVenda.edit;
    vtb_livrosVenda.Clear;
    ComprovanteBtn.Visible := False;
  end
  else if ModoInput.Text = 'V' then
    begin

      q1.Close;
      q1.SQL.Clear;

      q1.SQL.Add('select * from livros_venda ');
      q1.SQL.Add('where numero_venda = :numero_venda');

      q1.ParamByName('numero_venda').Value := StrToInt(CodigoInput.Text);

      q1.Open;
      q1.First;
      while not q1.Eof do
      begin
        vtb_livrosVenda.Append;
        vtb_livrosvenda['codigo'] := q1.FieldByName('codigo').Value;
        vtb_livrosvenda['titulo'] := q1.FieldByName('titulo').Value;
        vtb_livrosvenda['editora'] := q1.FieldByName('editora').Value;
        vtb_livrosvenda['ano_publicacao'] := q1.FieldByName('ano_publicacao').Value;
        vtb_livrosvenda['preco'] := q1.FieldByName('preco').Value;
        vtb_livrosvenda['categoria'] := q1.FieldByName('categoria').Value;
        vtb_livrosvenda['qtdEscolhida'] := q1.FieldByName('qtd_escolhida').Value;

        q1.Next;
      end;
      Panel1.Enabled := False;
      TituloPagina.Caption := 'Venda selecionada';
      TituloInput.Visible := False;
      AddLivro.Visible := False;
      SalvarBtn.visible := False;
      TituloLabel.Visible := False;
      ComprovanteBtn.Visible := True;
    end
    else if ModoInput.Text = 'A' then
    begin
      q1.Close;
      q1.SQL.Clear;

      q1.SQL.Add('select * from livros_venda ');
      q1.SQL.Add('where numero_venda = :numero_venda');

      q1.ParamByName('numero_venda').Value := StrToInt(CodigoInput.Text);

      q1.Open;
      q1.First;
      while not q1.Eof do
      begin
        vtb_livrosVenda.Append;
        vtb_livrosvenda['codigo'] := q1.FieldByName('codigo').Value;
        vtb_livrosvenda['titulo'] := q1.FieldByName('titulo').Value;
        vtb_livrosvenda['editora'] := q1.FieldByName('editora').Value;
        vtb_livrosvenda['ano_publicacao'] := q1.FieldByName('ano_publicacao').Value;
        vtb_livrosvenda['preco'] := q1.FieldByName('preco').Value;
        vtb_livrosvenda['categoria'] := q1.FieldByName('categoria').Value;
        vtb_livrosvenda['qtdEscolhida'] := q1.FieldByName('qtd_escolhida').Value;

        q1.Next;
      end;
      Panel1.Enabled := True;
      TituloPagina.Caption := 'Alterar venda selecionada';
      TituloInput.Visible := True;
      AddLivro.Visible := True;
      SalvarBtn.Caption := 'Salvar alterações';
      vds_livrosVenda.edit;
      SalvarBtn.Visible := True;
      TituloLabel.Visible := True;
      ComprovanteBtn.Visible := False;
      vendaControle.valorAtual := StrToInt(labelPreco.Caption);
    end;
end;

procedure TMostrarVendaForm.removerLivroClick(Sender: TObject);
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

    valorAtualizado := StrToFloat(labelPreco.Caption) - (StrToFloat(precoLivro) * StrToInt(qtdEscolhida));
    labelPreco.Caption := FloatToStr(valorAtualizado);
    vendaControle.valorAtual := StrToInt(labelPreco.Caption);
  end;

end;
procedure TMostrarVendaForm.SalvarBtnClick(Sender: TObject);
begin


    if ModoInput.Text = 'A' then
    begin
      q1.Close;
      q1.SQL.Clear;

      q1.SQL.Add('update vendas ');
      q1.SQL.Add('set cliente = :cliente, valor_total = :valor_total');
      q1.SQL.Add('where codigo = :codigo');

      q1.ParamByName('cliente').Value := ClienteInput.Text;
      q1.ParamByName('valor_total').Value := labelPreco.Caption;
      q1.ParamByName('codigo').Value := StrToInt(CodigoInput.Text);

      if confirma('Confirmar nova venda?') then
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
        q1.ParamByName('valor_total').Value := labelPreco.Caption;
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

end.
