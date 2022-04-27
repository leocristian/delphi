unit u_clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations,
  Data.DB, cxDBData, Vcl.Menus, MemDS, DBAccess, Uni, Vcl.StdCtrls, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Vcl.ExtCtrls, frame_busca, frxClass,
  frxDBSet, frame_grid;

type
  TFormClientes = class(TForm)
    PopupClientes: TPopupMenu;
    VisualizarCliente: TMenuItem;
    AlterarCliente: TMenuItem;
    N2: TMenuItem;
    ExcluirCliente: TMenuItem;
    tb_clientes: TUniTable;
    ds_clientes: TDataSource;
    AdicionarCliente: TMenuItem;
    RelatorioClientes: TMenuItem;
    FrameBusca1: TFrameBusca;
    grid_clientes: TcxGrid;
    grid_clientesDBTableView1: TcxGridDBTableView;
    grid_clientesDBTableView1codigo: TcxGridDBColumn;
    grid_clientesDBTableView1cpf: TcxGridDBColumn;
    grid_clientesDBTableView1nome_completo: TcxGridDBColumn;
    grid_clientesLevel1: TcxGridLevel;
//    frame_cxGrid1: Tframe_cxGrid;
    rel_clientes: TfrxReport;
    ds_rel_clientes: TfrxDBDataset;
    frame_estilo_grid1: Tframe_estilo_grid;
    procedure VisualizarClienteClick(Sender: TObject);
    procedure AlterarClienteClick(Sender: TObject);
    procedure ExcluirClienteClick(Sender: TObject);
    procedure bt_buscaClick(Sender: TObject);
    procedure AdicionarClienteClick(Sender: TObject);
    procedure bt_mostrarTudoClick(Sender: TObject);
    procedure BuscaInputClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure RelatorioClientesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormClientes: TFormClientes;

implementation

{$R *.dfm}

uses u_dm1, u_mostrarClientes, u_novoCliente, u_forms;

procedure TFormClientes.AdicionarClienteClick(Sender: TObject);
begin
  LimparInputs(ClienteForm);
  ClienteForm.ModoInput.Text := 'N';
  ClienteForm.ShowModal;
end;

procedure TFormClientes.VisualizarClienteClick(Sender: TObject);
var
  codCliente: Integer;
  indexCliente: Integer;

begin
  if not tb_clientes.Active then exit;
  if tb_clientes.RecordCount = 0 then exit;

  indexCliente := grid_clientesDBTableView1.DataController.GetSelectedRowIndex(0);
  codCliente := grid_clientesDBTableView1.ViewData.Records[indexCliente].Values[0];

  ClienteForm.CodigoInput.Text := codCliente.ToString;
  ClienteForm.ModoInput.Text := 'V';

  ClienteForm.ShowModal;
end;

procedure TFormClientes.AlterarClienteClick(Sender: TObject);
var
  codCliente: Integer;
  indexCliente: Integer;

begin
  if not tb_clientes.Active then exit;
  if tb_clientes.RecordCount = 0 then exit;

  indexCliente := grid_clientesDBTableView1.DataController.GetSelectedRowIndex(0);
  codCliente := grid_clientesDBTableView1.ViewData.Records[indexCliente].Values[0];

  ClienteForm.CodigoInput.Text := codCliente.ToString;
  ClienteForm.ModoInput.Text := 'A';

  ClienteForm.ShowModal;
end;

procedure TFormClientes.bt_buscaClick(Sender: TObject);
var
  buscaInfo: String;

begin

  buscaInfo := FrameBusca1.BuscaInput.Text;

  if buscaInfo = '' then
  begin
    aviso('Informe uma palavra-chave válida!');
    FrameBusca1.BuscaInput.SetFocus;
    exit;
  end;

  if FrameBusca1.SelecaoBusca.Text = 'CÓDIGO' then
  begin
    ds_clientes.DataSet.Filter := 'codigo = ' + buscaInfo;
  end
  else
  begin
    ds_clientes.DataSet.Filter := LowerCase(FrameBusca1.SelecaoBusca.Text) +  ' like ' + QuotedStr('%' + buscaInfo + '%');
  end;

  try
    ds_clientes.DataSet.Filtered := True;
    grid_clientesDBTableView1.DataController.RefreshExternalData;
    FrameBusca1.BuscaInput.Text := '';
    grid_clientesDBTableView1.OptionsView.NoDataToDisplayInfoText := '';
  except on E:Exception do
    if E.Message.Contains('not found') then
    begin
      erro('Digite apenas números para buscar por código!');
      FrameBusca1.BuscaInput.SetFocus;
    end;
  end;

end;

procedure TFormClientes.bt_mostrarTudoClick(Sender: TObject);
begin
  ds_clientes.DataSet.Filtered := False;
  grid_clientesDBTableView1.DataController.RefreshExternalData;
end;

procedure TFormClientes.BuscaInputClick(Sender: TObject);
begin
  FrameBusca1.BuscaInput.SetFocus;
end;

procedure TFormClientes.ExcluirClienteClick(Sender: TObject);
var
  q1: TUniQuery;
  indexCliente: Integer;
  codCliente: Integer;

begin

  if not tb_clientes.Active then exit;
  if tb_clientes.RecordCount = 0 then exit;

  try
    q1 := TUniQuery.Create(nil);
    q1.Connection := dm1.con1;

    q1.Close;
    q1.SQL.Clear;

    indexCliente := grid_clientesDBTableView1.DataController.GetSelectedRowIndex(0);
    codCliente := grid_clientesDBTableView1.ViewData.Records[indexCliente].Values[0];

    q1.SQL.Add('delete from clientes where codigo = :codigo');

    q1.ParamByName('codigo').Value := codCliente;

    try

      if confirma('Tem certeza qua deseja excluir permanentemente o cliente selecionado?') then
      begin
        q1.ExecSQL;
        mensagem('Cliente excluído com sucesso!');
        Self.grid_clientesDBTableView1.DataController.RefreshExternalData;
      end;

    except
      ShowMessage('Erro ao excluir cliente!');
    end;
  finally
    FreeAndNil(q1);
  end;
end;

procedure TFormClientes.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(wm_nextdlgctl, 0, 0);
  end
  else if key = #27 then close;
end;

procedure TFormClientes.FormShow(Sender: TObject);
begin
//  dm1.con1.Close;

  tb_clientes.Connection := dm1.con1;
  tb_clientes.TableName := 'clientes';
  ds_clientes.DataSet := tb_clientes;
  tb_clientes.Active := True;

//  dm1.con1.Open;
end;

procedure TFormClientes.RelatorioClientesClick(Sender: TObject);
begin
  ds_rel_clientes.DataSource := ds_clientes;
  rel_clientes.ShowReport;
end;
end.
