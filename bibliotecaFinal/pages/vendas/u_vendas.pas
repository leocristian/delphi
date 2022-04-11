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
    ExcluirCliente: TMenuItem;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    ds_vendas: TDataSource;
    grid_vendasDBTableView1codigo: TcxGridDBColumn;
    grid_vendasDBTableView1vendedor: TcxGridDBColumn;
    grid_vendasDBTableView1cliente: TcxGridDBColumn;
    grid_vendasDBTableView1valor_total: TcxGridDBColumn;
    NovaVenda: TMenuItem;
    procedure NovaVendaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormVendas: TFormVendas;

implementation

{$R *.dfm}

uses u_dm1, u_novaVenda;

procedure TFormVendas.NovaVendaClick(Sender: TObject);
begin
  NovaVendaForm.ShowModal;
end;

end.
