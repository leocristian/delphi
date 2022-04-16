unit u_mostrarVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, MemDS, VirtualTable,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, Vcl.Menus, Uni;

type
  TMostrarVendaForm = class(TForm)
    vtb_livrosVenda: TVirtualTable;
    Label2: TLabel;
    Label3: TLabel;
    labelPreco: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    TituloLabel: TLabel;
    TituloInput: TEdit;
    ClienteInput: TEdit;
    SalvarBtn: TButton;
    AddLivro: TButton;
    Label1: TLabel;
    Label7: TLabel;
    CodigoInput: TEdit;
    ModoInput: TEdit;
    vds_livrosVenda: TDataSource;
    grid_livrosDBTableView1: TcxGridDBTableView;
    grid_livrosLevel1: TcxGridLevel;
    grid_livros: TcxGrid;
    PopupMenu1: TPopupMenu;
    removerLivro: TMenuItem;
    grid_livrosDBTableView1titulo: TcxGridDBColumn;
    grid_livrosDBTableView1editora: TcxGridDBColumn;
    grid_livrosDBTableView1ano_publicacao: TcxGridDBColumn;
    grid_livrosDBTableView1preco: TcxGridDBColumn;
    grid_livrosDBTableView1numero_venda: TcxGridDBColumn;
    grid_livrosDBTableView1codigo: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure removerLivroClick(Sender: TObject);
    procedure SalvarBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MostrarVendaForm: TMostrarVendaForm;

implementation

{$R *.dfm}

uses u_forms, u_dm1, u_vendas;

procedure TMostrarVendaForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(wm_nextdlgctl, 0, 0);
  end
  else if key = #27 then close
end;

procedure TMostrarVendaForm.FormShow(Sender: TObject);
var
  q1: TUniQuery;
begin
  AbrirForm(MostrarVendaForm);

  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top :=  (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
  q1 := TUniQuery.Create(nil);
  q1.Connection := dm1.con1;

  q1.Close;
  q1.SQL.Clear;
  q1.SQL.Add('select * from livros_venda2 ');
  q1.SQL.Add('where numero_venda = :numero_venda');

  q1.ParamByName('numero_venda').Value := CodigoInput.Text;

  q1.Open;
  q1.First;
  while not q1.Eof do
  begin
    MostrarVendaForm.vtb_livrosVenda.Append;
    MostrarVendaForm.vtb_livrosvenda['titulo'] := q1.FieldByName('titulo').Value;
    MostrarVendaForm.vtb_livrosvenda['editora'] := q1.FieldByName('editora').Value;
    MostrarVendaForm.vtb_livrosvenda['ano_publicacao'] := q1.FieldByName('ano_publicacao').Value;
    MostrarVendaForm.vtb_livrosvenda['preco'] := q1.FieldByName('preco').Value;
    MostrarVendaForm.vtb_livrosvenda['numero_venda'] := q1.FieldByName('numero_venda').Value;

    q1.Next;
  end;

  if ModoInput.Text = 'V' then
  begin
    TituloInput.Visible := False;
    ClienteInput.Enabled := False;
    AddLivro.Visible := False;
    SalvarBtn.visible := False;
    grid_livros.Enabled := False;
    TituloLabel.Visible := False;
  end
  else
  begin
    TituloInput.Visible := True;
    ClienteInput.Enabled := True;
    AddLivro.Visible := True;
    SalvarBtn.Visible := True;
    TituloLabel.Visible := True;
    grid_livros.Enabled := True;
  end;
end;

procedure TMostrarVendaForm.removerLivroClick(Sender: TObject);
var
  q1: TUniQuery;
  indexLivro: Integer;
  tituloLivro: String;
  precoLivro: String;

begin
  try

    indexLivro := grid_livrosDBTableView1.DataController.GetSelectedRowIndex(0);
    tituloLivro := grid_livrosDBTableView1.ViewData.Records[indexLivro].Values[0];
    precoLivro := grid_livrosDBTableView1.ViewData.Records[indexLivro].Values[3];

    q1 := TUniQuery.Create(nil);
    q1.Connection := dm1.con1;

    q1.Close;
    q1.SQL.Clear;

    q1.SQL.Add('delete from livros_venda2 ');
    q1.SQL.Add('where titulo = :titulo');

    q1.ParamByName('titulo').Value := tituloLivro;

    q1.ExecSQL;

    labelPreco.Caption := IntToStr(StrToInt(labelPreco.Caption) - StrToInt(precoLivro));
  finally
    FreeAndNil(q1);
  end;
end;
procedure TMostrarVendaForm.SalvarBtnClick(Sender: TObject);
var
  q1: TUniQuery;

begin
  try
    q1 := TUniQuery.Create(nil);
    q1.Connection := dm1.con1;
    q1.Close;
    q1.SQL.Clear;

    q1.SQL.Add('update vendas ');
    q1.SQL.Add('set cliente = :cliente, valor_total = :valor_total');
    q1.SQL.Add('where codigo = :codigo');

    q1.ParamByName('cliente').Value := ClienteInput.Text;
    q1.ParamByName('valor_total').Value := labelPreco.Caption;
    q1.ParamByName('codigo').Value := StrToInt(CodigoInput.Text);

    q1.execSQL;
    ShowMessage('Venda alterada com sucesso!');
    Self.Close;

    FormVendas.grid_vendasDBTableView1.DataController.RefreshExternalData;

  finally
    FreeAndNil(q1);
  end;
end;

end.
