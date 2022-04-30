unit u_selecionaCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, frame_busca, Vcl.StdCtrls,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.Buttons, frame_imagens, MemDS,
  VirtualTable, frame_grid, Uni;

type
  TBuscaClienteForm = class(TForm)
    PanelConfirma: TPanel;
    grid_clientesDBTableView1: TcxGridDBTableView;
    grid_clientesLevel1: TcxGridLevel;
    grid_clientes: TcxGrid;
    BuscaCliente: TPanel;
    SelecaoBusca: TComboBox;
    BuscaInput: TEdit;
    BuscaBtn: TSpeedButton;
    FrameImagens1: TFrameImagens;
    SelecionarBtn: TSpeedButton;
    CancelarBtn: TSpeedButton;
    vtb_clientesEncontrados: TVirtualTable;
    vds_clientesEncontrados: TDataSource;
    frame_estilo_grid1: Tframe_estilo_grid;
    grid_clientesDBTableView1codigo: TcxGridDBColumn;
    grid_clientesDBTableView1cpf: TcxGridDBColumn;
    grid_clientesDBTableView1nome_completo: TcxGridDBColumn;
    grid_clientesDBTableView1email: TcxGridDBColumn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BuscaBtnClick(Sender: TObject);
    procedure CancelarBtnClick(Sender: TObject);
    procedure SelecionarBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BuscaClienteForm: TBuscaClienteForm;

implementation

{$R *.dfm}

uses u_forms, u_dm1, u_mostrarVenda2;

procedure TBuscaClienteForm.BuscaBtnClick(Sender: TObject);
var
  q1: TUniQuery;
begin
  vtb_clientesEncontrados.Clear;
  try
    q1 := TUniQuery.Create(nil);
    q1.Connection := dm1.con1;

    q1.Close;
    q1.SQL.Text := 'select codigo, cpf, nome_completo, email from clientes where cpf like :cpf';
    q1.ParamByName('cpf').Value := '%' + BuscaInput.Text + '%';

    q1.Open;
    q1.First;

    while not q1.Eof do
    begin
      vtb_clientesEncontrados.Append;
      vtb_clientesEncontrados['codigo'] := q1.FieldByName('codigo').Value;
      vtb_clientesEncontrados['cpf'] := q1.FieldByName('cpf').Value;
      vtb_clientesEncontrados['nome_completo'] := q1.FieldByName('nome_completo').Value;
      vtb_clientesEncontrados['email'] := q1.FieldByName('email').Value;
      q1.Next;
    end;

  finally
    q1.Close;
    FreeAndNil(q1);
  end;
end;

procedure TBuscaClienteForm.CancelarBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TBuscaClienteForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(wm_nextdlgctl, 0, 0);
  end
  else if key = #27 then close
end;
procedure TBuscaClienteForm.FormShow(Sender: TObject);
begin
  BuscaInput.SetFocus;
  grid_clientesDBTableView1.OptionsView.NoDataToDisplayInfoText := '';
  LimparInputs(BuscaClienteForm);
end;

procedure TBuscaClienteForm.SelecionarBtnClick(Sender: TObject);
var
  indexCliente: Integer;
  cpfCliente: String;
begin
  indexCliente := grid_clientesDBTableView1.DataController.GetSelectedRowIndex(0);
  cpfCliente := grid_clientesDBTableView1.ViewData.Records[indexCliente].Values[1];

  FormVenda.ClienteInput.Text := cpfCliente;

  Close;
end;

end.
