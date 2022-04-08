unit VendasPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations,
  Data.DB, cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Menus;

type
  TVendasForm = class(TForm)
    Panel1: TPanel;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Button1: TButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    PopupMenu1: TPopupMenu;
    Visualizarselecionado1: TMenuItem;
    Visualizarselecionado2: TMenuItem;
    Alterarvendaselecionada1: TMenuItem;
    N1: TMenuItem;
    Excluirvendaselecionada1: TMenuItem;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxGrid1DBTableView1codigo: TcxGridDBColumn;
    cxGrid1DBTableView1vendedor: TcxGridDBColumn;
    cxGrid1DBTableView1cliente: TcxGridDBColumn;
    cxGrid1DBTableView1valor_total: TcxGridDBColumn;
    procedure NovaVenda(Sender: TObject);
    procedure VisualizarVenda(Sender: TObject);
    procedure ExcluirVenda(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VendasForm: TVendasForm;

implementation

{$R *.dfm}

uses dmDatabase, NewVendaPage, FormManipulation, Venda, ShowVendaPage;

procedure TVendasForm.NovaVenda(Sender: TObject);
var
  formManipulation: TFormManipulation;
begin
  formManipulation.MostrarForm(NewVendaForm);
end;

procedure TVendasForm.Excluirvenda(Sender: TObject);
var
  colunaSelecionada: Integer;
  vendaSelecionada: TVenda;
  codDelete: Integer;

begin

  colunaSelecionada := Self.cxGrid1DBTableView1.ViewData.DataController.GetSelectedRowIndex(0);

  try

    vendaSelecionada := TVenda.Create;
    vendaSelecionada.cod := Self.cxGrid1DBTableView1.ViewData.Records[colunaSelecionada].Values[Self.cxGrid1DBTableView1.GetColumnByFieldName('codigo').Index];
    vendaSelecionada.Read(vendaSelecionada);

  finally
    Case
    MessageBox(Application.Handle, 'Confirmar exclusão da venda?', 'Excluir venda', MB_YESNO) of
    idYes:
      begin
        colunaSelecionada := Self.cxGrid1DBTableView1.ViewData.DataController.GetSelectedRowIndex(0);
        codDelete := Self.cxGrid1DBTableView1.ViewData.Records[colunaSelecionada].Values[Self.cxGrid1DBTableView1.GetColumnByFieldName('codigo').Index];

        vendaSelecionada := TVenda.Create;
        try
          vendaSelecionada.Delete(codDelete);
        finally
          ShowMessage('Venda excluída com sucesso, código: ' + IntToStr(codDelete));
        end;
      end;
    idNo: ShowMessage('Operação cancelada');
  End;
  end;
end;

procedure TVendasForm.VisualizarVenda(Sender: TObject);
var
  colunaSelecionada: Integer;
  vendaSelecionada: TVenda;

begin

  colunaSelecionada := Self.cxGrid1DBTableView1.ViewData.DataController.GetSelectedRowIndex(0);

  try

    vendaSelecionada := TVenda.Create;
    vendaSelecionada.cod := Self.cxGrid1DBTableView1.ViewData.Records[colunaSelecionada].Values[Self.cxGrid1DBTableView1.GetColumnByFieldName('codigo').Index];
    vendaSelecionada.Read(vendaSelecionada);

  finally
    ShowVendaForm.codVendaLabel.Caption := IntToStr(vendaSelecionada.cod);
    ShowVendaForm.vendedorLabel.Caption := vendaSelecionada.vendedor;
    ShowVendaForm.clienteLabel.Caption := vendaSelecionada.cliente;
    ShowVendaForm.valorTotalLabel.Caption := vendaSelecionada.valorTotal;

    ShowVendaForm.Visible := True;
  end;
end;

end.
