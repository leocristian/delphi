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
  cxGrid, Vcl.ExtCtrls;

type
  TFormVendas = class(TForm)
    Panel1: TPanel;
    BuscaInput: TEdit;
    bt_busca: TButton;
    grid_vendas: TcxGrid;
    grid_vendasDBTableView1: TcxGridDBTableView;
    grid_vendasLevel1: TcxGridLevel;
    SelecaoBusca: TComboBox;
    tb_vendas: TUniTable;
    PopupVendas: TPopupMenu;
    VisualizarVenda: TMenuItem;
    AlterarVenda: TMenuItem;
    N2: TMenuItem;
    EstornarVenda: TMenuItem;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    ds_vendas: TDataSource;
    NovaVenda: TMenuItem;
    grid_vendasDBTableView1codigo: TcxGridDBColumn;
    grid_vendasDBTableView1vendedor: TcxGridDBColumn;
    grid_vendasDBTableView1cliente: TcxGridDBColumn;
    grid_vendasDBTableView1valor_total: TcxGridDBColumn;
    grid_vendasDBTableView1data_venda: TcxGridDBColumn;
    procedure NovaVendaClick(Sender: TObject);
    procedure VisualizarVendaClick(Sender: TObject);
    procedure AlterarVendaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormVendas: TFormVendas;

implementation

{$R *.dfm}

uses u_dm1, u_novaVenda, u_mostrarVenda;

procedure TFormVendas.AlterarVendaClick(Sender: TObject);
var
  indexVenda, codVenda: Integer;

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
    MostrarVendaForm.ModoInput.Text := 'A';
    MostrarVendaForm.ShowModal;

    FreeAndNil(q1);
  end;
end;

procedure TFormVendas.NovaVendaClick(Sender: TObject);
begin
  NovaVendaForm.ShowModal;
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
