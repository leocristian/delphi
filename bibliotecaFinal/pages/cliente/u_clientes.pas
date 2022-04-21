unit u_clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations,
  Data.DB, cxDBData, Vcl.Menus, MemDS, DBAccess, Uni, Vcl.StdCtrls, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Vcl.ExtCtrls, frame_busca;

type
  TFormClientes = class(TForm)
    grid_clientes: TcxGrid;
    grid_clientesDBTableView1: TcxGridDBTableView;
    grid_clientesLevel1: TcxGridLevel;
    PopupClientes: TPopupMenu;
    VisualizarCliente: TMenuItem;
    AlterarCliente: TMenuItem;
    N2: TMenuItem;
    ExcluirCliente: TMenuItem;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    tb_clientes: TUniTable;
    ds_clientes: TDataSource;
    grid_clientesDBTableView1codigo: TcxGridDBColumn;
    grid_clientesDBTableView1cpf: TcxGridDBColumn;
    grid_clientesDBTableView1nome_completo: TcxGridDBColumn;
    AdicionarCliente: TMenuItem;
    RelatorioClientes: TMenuItem;
    FrameBusca1: TFrameBusca;
    procedure VisualizarClienteClick(Sender: TObject);
    procedure AlterarClienteClick(Sender: TObject);
    procedure ExcluirClienteClick(Sender: TObject);
    procedure bt_buscaClick(Sender: TObject);
    procedure AdicionarClienteClick(Sender: TObject);
    procedure bt_mostrarTudoClick(Sender: TObject);
    procedure BuscaInputClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
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
  NovoCliente.ShowModal;
end;

procedure TFormClientes.AlterarClienteClick(Sender: TObject);
var
  q1: TUniQuery;
  codCliente: Integer;
  indexCliente: Integer;

begin
  try
    q1 := TUniQuery.Create(nil);
    q1.Connection := dm1.con1;

    q1.Close;
    q1.SQL.Clear;

    indexCliente := grid_clientesDBTableView1.DataController.GetSelectedRowIndex(0);
    codCliente := grid_clientesDBTableView1.ViewData.Records[indexCliente].Values[0];

    q1.SQL.Add('select * from clientes2 ');
    q1.SQL.Add('where ');
    q1.SQL.Add('codigo = :codigo');

    q1.ParamByName('codigo').Value := codCliente;

    q1.Open;

    if q1.RecordCount > 0 then
    begin
      MostrarClientesForm.CodigoInput.Text := q1.FieldByName('codigo').Value;
      MostrarClientesForm.CpfInput.Text := q1.FieldByName('cpf').Value;
      MostrarClientesForm.NomeInput.Text :=  q1.FieldByName('nome_completo').Value;
      MostrarClientesForm.EmailInput.Text := q1.FieldByName('email').Value;
      MostrarClientesForm.TelefoneInput.Text := q1.FieldByName('telefone').Value;

      MostrarClientesForm.ModoInput.Text := 'A';
    end;

  finally
    MostrarClientesForm.ShowModal;
    FreeAndNil(q1);
  end;
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
  msgExcluir: String;

begin
  try
    q1 := TUniQuery.Create(nil);
    q1.Connection := dm1.con1;

    q1.Close;
    q1.SQL.Clear;

    indexCliente := grid_clientesDBTableView1.DataController.GetSelectedRowIndex(0);
    codCliente := grid_clientesDBTableView1.ViewData.Records[indexCliente].Values[0];

    q1.SQL.Add('delete from clientes2 where codigo = :codigo');

    q1.ParamByName('codigo').Value := codCliente;

    msgExcluir := 'Confirmar exclusão do usuário ' + IntToStr(codCliente) + '?';

    try

      case
        MessageBox(Application.Handle, 'Confirmar exclusão de cliente?', 'Excluir cliente', MB_YESNO) of
        idYes:
          begin
            q1.ExecSQL;
            ShowMessage('Cliente excluído com sucesso! código: ' + IntToStr(codCliente));
            Self.grid_clientesDBTableView1.DataController.RefreshExternalData;
          end;
        idNo: ShowMessage('Operação cancelada!');
      end;

    except
      ShowMessage('Erro ao excluir cliente!');
    end;
  finally
    FreeAndNil(q1);
  end;
end;


procedure TFormClientes.FormCreate(Sender: TObject);
begin
  if dm1.con1.Connected = True then
  begin
    tb_clientes.Connection := dm1.con1;
    tb_clientes.TableName := 'clientes2';
    tb_clientes.Active := True;
  end
  else
  begin
    dm1.con1.Connect;

    tb_clientes.Connection := dm1.con1;
    tb_clientes.TableName := 'clientes2';
    tb_clientes.Active := True;
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

procedure TFormClientes.VisualizarClienteClick(Sender: TObject);
var
  q1: TUniQuery;
  codCliente: Integer;
  indexCliente: Integer;

begin
  try
    q1 := TUniQuery.Create(nil);
    q1.Connection := dm1.con1;

    q1.Close;
    q1.SQL.Clear;

    indexCliente := grid_clientesDBTableView1.DataController.GetSelectedRowIndex(0);
    codCliente := grid_clientesDBTableView1.ViewData.Records[indexCliente].Values[0];

    q1.SQL.Add('select * from clientes2 ');
    q1.SQL.Add('where ');
    q1.SQL.Add('codigo = :codigo');

    q1.ParamByName('codigo').Value := codCliente;

    q1.Open;

    if q1.RecordCount > 0 then
    begin
      MostrarClientesForm.CodigoInput.Text := q1.FieldByName('codigo').Value;
      MostrarClientesForm.CpfInput.Text := q1.FieldByName('cpf').Value;
      MostrarClientesForm.NomeInput.Text :=  q1.FieldByName('nome_completo').Value;
      MostrarClientesForm.EmailInput.Text := q1.FieldByName('email').Value;
      MostrarClientesForm.TelefoneInput.Text := q1.FieldByName('telefone').Value;

      MostrarClientesForm.ModoInput.Text := 'V';
    end;

  finally
    MostrarClientesForm.ShowModal;
    FreeAndNil(q1);
  end;
end;


end.
