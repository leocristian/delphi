unit ClientPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MenuFrame, Vcl.Menus, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid;

type
  TClientForm = class(TForm)
    PopupMenu1: TPopupMenu;
    Visualizarclienteselecionado1: TMenuItem;
    Acidionarnovocliente1: TMenuItem;
    N1: TMenuItem;
    Excluirclienteselecionado1: TMenuItem;
    BuscaPessoa1: TBuscaPessoa;
    Inserirnovocliente1: TMenuItem;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1codigo: TcxGridDBColumn;
    cxGrid1DBTableView1nome_completo: TcxGridDBColumn;
    cxGrid1DBTableView1email: TcxGridDBColumn;
    cxGrid1DBTableView1telefone: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;

    procedure SetFocus(Sender: TObject);
    procedure BuscaPessoa1Button1Click(Sender: TObject);
    procedure CreateClient(Sender: TObject);
    procedure DeletarCliente(Sender: TObject);
    procedure ShowClienteInfo(Sender: TObject);
    procedure ShowEditClienteForm(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ClientForm: TClientForm;

implementation

{$R *.dfm}

uses NewClientPage, dmDatabase, Cliente, ShowClientePage, EditClientePage;

procedure TClientForm.BuscaPessoa1Button1Click(Sender: TObject);
begin
  ShowMessage('Pesquisando cliente ' + ClientForm.BuscaPessoa1.Edit1.Text);
end;

procedure TClientForm.CreateClient(Sender: TObject);
begin
  NewClientPage.NewClientForm.Visible := True;
end;

procedure TClientForm.DeletarCliente(Sender: TObject);
var
  codDelete: Integer;
  colunaSelected: Integer;
  clienteDelete: TCliente;

begin
  Case
    MessageBox(Application.Handle, 'Confirmar exclusão de cliente', 'Excluir cliente', MB_YESNO) of
    idYes:
      begin

        colunaSelected := ClientForm.cxGrid1DBTableView1.ViewData.DataController.GetSelectedRowIndex(0);
        codDelete := ClientForm.cxGrid1DBTableView1.ViewData.Records[colunaSelected].Values[ClientForm.cxGrid1DBTableView1.GetColumnByFieldName('codigo').Index];

        clienteDelete := TCliente.Create;

        try
          clienteDelete.Delete(codDelete);
        finally
          ShowMessage('Cliente excluido com sucesso, codigo: ' + IntToStr(codDelete));
        end;

      end;
    idNo: ShowMessage('Operação cancelada');
  end;
end;

procedure TClientForm.SetFocus(Sender: TObject);
begin
  ClientForm.BuscaPessoa1.Edit1.SetFocus;
end;

procedure TClientForm.ShowClienteInfo(Sender: TObject);
var
  colunaSelected: Integer;
  clienteSelecionado: TCliente;

begin

  colunaSelected := Self.cxGrid1DBTableView1.ViewData.DataController.GetSelectedRowIndex(0);

  try

    clienteSelecionado := TCliente.Create;
    clienteSelecionado.cod := Self.cxGrid1DBTableView1.ViewData.Records[colunaSelected].Values[Self.cxGrid1DBTableView1.GetColumnByFieldName('codigo').Index];
    clienteSelecionado.Read(clienteSelecionado);

  finally
    ShowClientePage.ShowClienteForm.PreencherInputs(clienteSelecionado);
    ShowClienteForm.visible := True;
  end;
end;

procedure TClientForm.ShowEditClienteForm(Sender: TObject);
var
  colunaSelected: Integer;
  clienteSelecionado: TCliente;

begin

  colunaSelected := ClientForm.cxGrid1DBTableView1.ViewData.DataController.GetSelectedRowIndex(0);
  try

    clienteSelecionado := TCliente.Create;
    clienteSelecionado.cod := ClientForm.cxGrid1DBTableView1.ViewData.Records[colunaSelected].Values[ClientForm.cxGrid1DBTableView1.GetColumnByFieldName('codigo').Index];
    clienteSelecionado.Read(clienteSelecionado);

  finally
    EditClientePage.EditClienteForm.PreencherInputs(clienteSelecionado);
    EditClientePage.EditClienteForm.Visible := True;
  end;
end;

end.
