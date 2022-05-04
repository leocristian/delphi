unit u_escolhaCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, MemDS, VirtualTable, frame_imagens, frame_grid, Uni,
  System.ImageList, Vcl.ImgList;

type
  TEscolhaClienteForm = class(TForm)
    BuscaCliente: TPanel;
    BuscaBtn: TSpeedButton;
    SelecaoBusca: TComboBox;
    BuscaInput: TEdit;
    grid_clientes: TcxGrid;
    grid_clientesDBTableView1: TcxGridDBTableView;
    grid_clientesDBTableView1codigo: TcxGridDBColumn;
    grid_clientesDBTableView1cpf: TcxGridDBColumn;
    grid_clientesDBTableView1nome_completo: TcxGridDBColumn;
    grid_clientesDBTableView1email: TcxGridDBColumn;
    grid_clientesLevel1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    vds_clientesEncontrados: TDataSource;
    vtb_clientesEncontrados: TVirtualTable;
    PanelConfirma: TPanel;
    SelecionarBtn: TSpeedButton;
    CancelarBtn: TSpeedButton;
    frame_estilo_grid1: Tframe_estilo_grid;
    ImageList1: TImageList;
    procedure BuscaBtnClick(Sender: TObject);
    procedure CancelarBtnClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure SelecionarBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EscolhaClienteForm: TEscolhaClienteForm;

implementation

{$R *.dfm}

uses u_dm1, u_forms, u_mostrarVenda2;

procedure TEscolhaClienteForm.BuscaBtnClick(Sender: TObject);
var
  q1: TUniQuery;
  buscaInfo: String;
begin
//  vtb_clientesEncontrados.Clear;
  try
    q1 := TUniQuery.Create(nil);
    q1.Connection := dm1.con1;

    q1.Close;

    if SelecaoBusca.Text = 'CPF' then
    begin
      q1.SQL.Text := 'select * from clientes where cpf like :info';
      buscaInfo := '%' + BuscaInput.Text + '%';
    end
    else if SelecaoBusca.Text = 'CÓDIGO' then
    begin
      q1.SQL.Text := 'select * from clientes where codigo = :info';
      buscaInfo := BuscaInput.Text;
    end
    else if SelecaoBusca.Text = 'NOME COMPLETO' then
    begin
      q1.SQL.Text := 'select * from clientes where nome_completo like :info';
      buscaInfo := '%' + BuscaInput.Text + '%';
    end
    else if SelecaoBusca.Text = 'EMAIL' then
    begin
      q1.SQL.Text := 'select * from clientes where email like :info';
      buscaInfo := '%' + BuscaInput.Text + '%';
    end;
    q1.ParamByName('info').Value := buscaInfo;

    try
      q1.Open;
    except
      aviso('Informe uma palavra-chave válida!');
      exit;
    end;

    q1.First;

    vtb_clientesEncontrados.Clear;

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

procedure TEscolhaClienteForm.CancelarBtnClick(Sender: TObject);
begin
  close;
end;

procedure TEscolhaClienteForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(wm_nextdlgctl, 0, 0);
  end
  else if key = #27 then close
end;

procedure TEscolhaClienteForm.FormShow(Sender: TObject);
begin
  BuscaInput.SetFocus;
  cxGridDBTableView1.OptionsView.NoDataToDisplayInfoText := '';
  LimparInputs(EscolhaClienteForm);
end;

procedure TEscolhaClienteForm.SelecionarBtnClick(Sender: TObject);
var
  indexCliente: Integer;
  nomeCliente: String;
begin
  indexCliente := cxGridDBTableView1.DataController.GetSelectedRowIndex(0);
  nomeCliente := cxGridDBTableView1.ViewData.Records[indexCliente].Values[2];

  FormVenda.ClienteInput.Text := nomeCliente;

  Close;
end;

end.
