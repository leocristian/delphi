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
  cxGrid, Vcl.ExtCtrls, frame_busca;

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
    procedure NovaVendaClick(Sender: TObject);
    procedure VisualizarVendaClick(Sender: TObject);
    procedure AlterarVendaClick(Sender: TObject);
    procedure ExcluirVendaClick(Sender: TObject);
    procedure bt_buscaClick(Sender: TObject);
    procedure MostrarTodasClick(Sender: TObject);
    procedure BuscaInputClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormVendas: TFormVendas;

implementation

{$R *.dfm}

uses u_dm1, u_novaVenda, u_mostrarVenda, u_forms;

procedure TFormVendas.AlterarVendaClick(Sender: TObject);
var
  indexVenda, codVenda: Integer;

begin
   MostrarVendaForm.vtb_livrosVenda.Clear;

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
    MostrarVendaForm.CodigoInput.Text := IntToStr(q1.FieldByName('codigo').Value);
    MostrarVendaForm.ClienteInput.Text := q1.FieldByName('cliente').Value;
    MostrarVendaForm.LabelPreco.Caption := q1.FieldByName('valor_total').Value;
  end;

  MostrarVendaForm.ModoInput.Text := 'A';
  MostrarVendaForm.ShowModal;
end;

procedure TFormVendas.bt_buscaClick(Sender: TObject);
var
  buscaInfo: String;

begin

  buscaInfo := FrameBusca1.BuscaInput.Text;

  if buscaInfo = '' then
  begin
    aviso('Informe uma palavra-chave válida!');
    FrameBusca1.BuscaInput.SetFocus;
    Exit;
  end;

  if FrameBusca1.SelecaoBusca.Text = 'CÓDIGO' then
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
  except on E:Exception do
    if E.Message.Contains('not found') then
    begin
      erro('Digite apenas números para buscar por código!');
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

  q1.SQL.Add('delete from livros_venda2 where numero_venda = :numero_venda');
  q1.ParamByName('numero_venda').Value := codVenda;

  q1.ExecSQL;

  q1.Close;
  q1.SQL.Clear;

  q1.SQL.Add('delete from vendas where codigo = :codigo');

  q1.ParamByName('codigo').Value := codVenda;

  case MessageBox(Application.Handle, 'Confirmar exclusão de venda?', 'Excluir venda', MB_YESNO) of
  idYes:
    begin
      try
        q1.ExecSQL;
        ShowMessage('Venda excluída com sucesso!');
        grid_vendasDBTableView1.DataController.RefreshExternalData;
      except
        ShowMessage('Erro ao excluir venda!');
      end;
    end;
  idNo: ShowMessage('Operação cancelada!');
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
  q1 := TUniQuery.Create(nil);
  q1.Connection := dm1.con1;

  q1.Close;
  q1.SQL.Clear;

  q1.SQL.Text := 'select nextval(''tb_vendas_cod_seq'') as codProximo';
  q1.Open;

  codVenda := q1.FieldByName('codProximo').AsInteger;

  MostrarVendaForm.CodigoInput.Text := IntToStr(codVenda);
  MostrarVendaForm.ModoInput.Text := 'N';
  MostrarVendaForm.ShowModal;

  FreeAndNil(q1);
end;

procedure TFormVendas.VisualizarVendaClick(Sender: TObject);
var
  q1: TUniQuery;
  indexVenda: Integer;
  codVenda: Integer;

begin
  MostrarVendaForm.vtb_livrosVenda.Clear;
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
      MostrarVendaForm.CodigoInput.Text := IntToStr(q1.FieldByName('codigo').Value);
      MostrarVendaForm.ClienteInput.Text := q1.FieldByName('cliente').Value;
      MostrarVendaForm.LabelPreco.Caption := q1.FieldByName('valor_total').Value;
    end;

  finally
    MostrarVendaForm.ModoInput.Text := 'V';
    MostrarVendaForm.ShowModal;

    FreeAndNil(q1);
  end;
end;

end.
