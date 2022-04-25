unit u_vendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, MemDS, VirtualTable, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations,
  cxDBData, cxClasses, Vcl.Menus, DBAccess, Uni, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, Vcl.ExtCtrls, frame_busca, frxClass, frxDBSet, frame_grid;

type
  TFormVendas = class(TForm)
    tb_vendas: TUniTable;
    PopupVendas: TPopupMenu;
    VisualizarVenda: TMenuItem;
    AlterarVenda: TMenuItem;
    N2: TMenuItem;
    ExcluirVenda: TMenuItem;
    ds_vendas: TDataSource;
    NovaVenda: TMenuItem;
    grid_vendas: TcxGrid;
    grid_vendasDBTableView1: TcxGridDBTableView;
    grid_vendasDBTableView1codigo: TcxGridDBColumn;
    grid_vendasDBTableView1vendedor: TcxGridDBColumn;
    grid_vendasDBTableView1cliente: TcxGridDBColumn;
    grid_vendasDBTableView1valor_total: TcxGridDBColumn;
    grid_vendasDBTableView1data_venda: TcxGridDBColumn;
    grid_vendasLevel1: TcxGridLevel;
    RelatorioVendas: TMenuItem;
    FrameBusca1: TFrameBusca;
    rel_vendas: TfrxReport;
    ds_rel_vendas: TfrxDBDataset;
    frame_estilo_grid1: Tframe_estilo_grid;
    procedure NovaVendaClick(Sender: TObject);
    procedure VisualizarVendaClick(Sender: TObject);
    procedure AlterarVendaClick(Sender: TObject);
    procedure ExcluirVendaClick(Sender: TObject);
    procedure bt_buscaClick(Sender: TObject);
    procedure MostrarTodasClick(Sender: TObject);
    procedure BuscaInputClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RelatorioVendasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormVendas: TFormVendas;

implementation

{$R *.dfm}

uses u_dm1, u_novaVenda, u_mostrarVenda, u_forms, u_mostrarVenda2;

procedure TFormVendas.AlterarVendaClick(Sender: TObject);
var
  indexVenda, codVenda: Integer;

begin
   FormVenda.vtb_livrosVenda.Clear;

  q1.Close;
  q1.SQL.Clear;

  q1.SQL.Add('select * from vendas ');
  q1.SQL.Add('where codigo = :codigo');

  indexVenda := grid_vendasDBTableView1.DataController.GetSelectedRowIndex(0);
  codVenda := grid_vendasDBTableView1.ViewData.Records[indexVenda].Values[0];

  q1.ParamByName('codigo').Value := codVenda;

  q1.Open;

  if q1.RecordCount > 0 then
  begin
    FormVenda.CodigoInput.Text := IntToStr(q1.FieldByName('codigo').Value);
    FormVenda.ClienteInput.Text := q1.FieldByName('cliente').Value;
    FormVenda.ValorVenda.Caption := q1.FieldByName('valor_total').Value;
  end;

  FormVenda.ModoInput.Text := 'A';
  FormVenda.ShowModal;
end;

procedure TFormVendas.bt_buscaClick(Sender: TObject);
var
  buscaInfo: String;

begin

  buscaInfo := FrameBusca1.BuscaInput.Text;

  if buscaInfo = '' then
  begin
    aviso('Informe uma palavra-chave v�lida!');
    FrameBusca1.BuscaInput.SetFocus;
    Exit;
  end;

  if FrameBusca1.SelecaoBusca.Text = 'C�DIGO' then
  begin
    ds_vendas.DataSet.Filter := 'codigo = ' + buscaInfo;
  end
  else if FrameBusca1.SelecaoBusca.Text = 'CLIENTE' then
  begin
    ds_vendas.DataSet.Filter := 'cliente like ' + QuotedStr('%' + buscaInfo + '%');
  end
  else if FrameBusca1.SelecaoBusca.Text = 'DATA' then
  begin
    ds_vendas.DataSet.Filter := 'data_venda like ' + QuotedStr('%' + buscaInfo + '%');
  end
  else;

  try
    ds_vendas.DataSet.Filtered := True;
    grid_vendasDBTableView1.DataController.RefreshExternalData;
    FrameBusca1.BuscaInput.Text := '';
    grid_vendasDBTableView1.OptionsView.NoDataToDisplayInfoText := '';
  except on E:Exception do
    if E.Message.Contains('not found') then
    begin
      erro('Digite apenas n�meros para buscar por c�digo!');
      FrameBusca1.BuscaInput.SetFocus;
    end;
  end;

end;

procedure TFormVendas.BuscaInputClick(Sender: TObject);
begin
  FrameBusca1.BuscaInput.SetFocus;
end;

procedure TFormVendas.ExcluirVendaClick(Sender: TObject);
var
  indexVenda, codVenda: Integer;

begin
  q1.Close;
  q1.SQL.Clear;

  indexVenda := grid_vendasDBTableView1.DataController.GetSelectedRowIndex(0);
  codVenda := grid_vendasDBTableView1.ViewData.Records[indexVenda].Values[0];

  q1.SQL.Add('delete from livros_venda where numero_venda = :numero_venda');
  q1.ParamByName('numero_venda').Value := codVenda;

  q1.ExecSQL;

  q1.Close;
  q1.SQL.Clear;

  q1.SQL.Add('delete from vendas where codigo = :codigo');

  q1.ParamByName('codigo').Value := codVenda;

  if confirma('Confirmar exclus�o de venda?') then
  begin
    try
      q1.ExecSQL;
      mensagem('Venda exclu�da com sucesso!');
      grid_vendasDBTableView1.DataController.RefreshExternalData;
    except on e:Exception do
      Erro(e.Message);
    end;
  end;
end;

procedure TFormVendas.FormCreate(Sender: TObject);
begin
  if dm1.con1.Connected = True then
  begin
    tb_vendas.Connection := dm1.con1;
    tb_vendas.TableName := 'vendas';
    tb_vendas.Active := True;
  end
  else
  begin
    dm1.con1.Connect;

    tb_vendas.Connection := dm1.con1;
    tb_vendas.TableName := 'vendas';
    tb_vendas.Active := True;
  end;
end;

procedure TFormVendas.MostrarTodasClick(Sender: TObject);
begin
  ds_vendas.DataSet.Filtered := False;
  grid_vendasDBTableView1.DataController.RefreshExternalData;
end;

procedure TFormVendas.NovaVendaClick(Sender: TObject);
var
  q1: TUniQuery;

begin

  try
    q1 := TUniQuery.Create(nil);
    q1.Connection := dm1.con1;

    q1.Close;
    q1.SQL.Clear;

    q1.SQL.Text := 'select nextval(''tb_vendas_cod_seq'') as codProximo';
    q1.Open;

    LimparInputs(FormVenda);

    FormVenda.CodigoInput.Text := q1.FieldByName('codProximo').AsString;
    FormVenda.ModoInput.Text := 'N';

    FormVenda.ShowModal;

  finally
    FreeAndNil(q1);
  end;
end;

procedure TFormVendas.RelatorioVendasClick(Sender: TObject);
begin
  ds_rel_vendas.DataSource := ds_vendas;
  rel_vendas.ShowReport;
end;

procedure TFormVendas.VisualizarVendaClick(Sender: TObject);
var
  q1: TUniQuery;
  indexVenda: Integer;
  codVenda: Integer;

begin
  try
    q1 := TUniQuery.Create(nil);
    q1.Connection := dm1.con1;

    q1.Close;
    q1.SQL.Clear;

    q1.SQL.Add('select * from vendas ');
    q1.SQL.Add('where codigo = :codigo');

    indexVenda := grid_vendasDBTableView1.DataController.GetSelectedRowIndex(0);
    codVenda := grid_vendasDBTableView1.ViewData.Records[indexVenda].Values[0];

    q1.ParamByName('codigo').Value := codVenda;

    q1.Open;

    if q1.RecordCount > 0 then
    begin
      FormVenda.CodigoInput.Text := IntTostr(q1.FieldByName('codigo').Value);
      FormVenda.ClienteInput.Text := q1.FieldByName('cliente').Value;
      FormVenda.ValorVenda.Caption := q1.FieldByName('valor_total').Value;
      FormVenda.ModoInput.Text := 'V';

      q1.Close;
      q1.SQL.Clear;

      q1.SQL.Add('select * from livros_venda ');
      q1.SQL.Add('where numero_venda = :numero_venda');

      q1.Open;
      q1.First;

      while not q1.Eof do
      begin
        FormVenda.vtb_livrosVenda.Append;
        FormVenda.vtb_livrosvenda['codigo'] := q1.FieldByName('codigo').Value;
        FormVenda.vtb_livrosvenda['titulo'] := q1.FieldByName('titulo').Value;
        FormVenda.vtb_livrosvenda['editora'] := q1.FieldByName('editora').Value;
        FormVenda.vtb_livrosvenda['ano_publicacao'] := q1.FieldByName('ano_publicacao').Value;
        FormVenda.vtb_livrosvenda['preco'] := q1.FieldByName('preco').Value;
        FormVenda.vtb_livrosvenda['categoria'] := q1.FieldByName('categoria').Value;
        FormVenda.vtb_livrosvenda['qtdEscolhida'] := q1.FieldByName('qtd_escolhida').Value;

        q1.Next;
      end;
    end;
  finally

    FormVenda.ShowModal;
    FreeAndNil(q1);
  end;
end;

end.
