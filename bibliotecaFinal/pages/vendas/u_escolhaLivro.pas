unit u_escolhaLivro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, MemDS, VirtualTable, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, Uni, Vcl.Buttons;

type
  TEscolhaLivroForm = class(TForm)
    Label1: TLabel;
    Confirmar: TButton;
    vtb_livrosEncontrados: TVirtualTable;
    vds_livrosEncontrados: TDataSource;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1codigo: TcxGridDBColumn;
    cxGrid1DBTableView1titulo: TcxGridDBColumn;
    cxGrid1DBTableView1anoPublicacao: TcxGridDBColumn;
    cxGrid1DBTableView1preco: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    procedure AbrirForm(Sender: TObject);
    procedure AtivaNavegacao(Sender: TObject; var Key: Char);
    procedure ConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EscolhaLivroForm: TEscolhaLivroForm;
  q1: TUniQuery;

implementation

{$R *.dfm}

uses u_forms, u_dm1, u_novaVenda, u_mostrarVenda;

procedure TEscolhaLivroForm.AbrirForm(Sender: TObject);
begin
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top :=  (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;

  Confirmar.SetFocus;
end;

procedure TEscolhaLivroForm.AtivaNavegacao(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(wm_nextdlgctl, 0, 0);
  end
  else if key = #27 then close;
end;

procedure TEscolhaLivroForm.ConfirmarClick(Sender: TObject);
var
  indexLivro: Integer;

  titulo: String;
  anoPublicacao: String;
  codLivro: Integer;
  precoLivro: Float32;

begin

  indexLivro := cxGrid1DBTableView1.DataController.GetSelectedRowIndex(0);

  codLivro := cxGrid1DBTableView1.ViewData.Records[indexLivro].Values[0];
  titulo := cxGrid1DBTableView1.ViewData.Records[indexLivro].Values[1];
  anoPublicacao := cxGrid1DBTableView1.ViewData.Records[indexLivro].Values[2];
  precoLivro := cxGrid1DBTableView1.ViewData.Records[indexLivro].Values[3];

  vendaControle.IncrementaValor(precoLivro);

  MostrarVendaForm.vtb_livrosvenda.Append;
  MostrarVendaForm.vtb_livrosvenda['codigo'] := codLivro;
  MostrarVendaForm.vtb_livrosvenda['titulo'] := titulo;
  MostrarVendaForm.vtb_livrosvenda['ano_publicacao'] := anoPublicacao;
  MostrarVendaForm.vtb_livrosvenda['preco'] := precoLivro;

  q1.Close;
  q1.SQL.Clear;
  q1.SQL.Text := 'select nextval(''tb_livrosVenda_cod_seq'') as codProximo';
  q1.Open;

  codLivro := q1.FieldByName('codProximo').AsInteger;

  q1.Close;
  q1.SQL.Clear;

  q1.SQL.Add('insert into livros_venda2 (titulo, ano_publicacao, preco, numero_venda, codigo) ');
  q1.SQL.Add('values ');
  q1.SQL.Add('(:titulo, :ano_publicacao, :preco, :numero_venda, :codigo)');

  q1.ParamByName('titulo').Value := titulo;
  q1.ParamByName('ano_publicacao').Value := anoPublicacao;
  q1.ParamByName('preco').Value := precoLivro;
  q1.ParamByName('numero_venda').Value := codVenda;
  q1.ParamByName('codigo').Value := codLivro;

  q1.ExecSQL;
  qtdLivros := qtdLivros + 1;

  MostrarVendaForm.labelPreco.Caption := FloatToStr(vendaControle.valorAtual);
  EscolhaLivroForm.Close;
  MostrarVendaForm.TituloInput.SetFocus;
end;

procedure TEscolhaLivroForm.FormCreate(Sender: TObject);
begin
  q1 := TUniQuery.Create(nil);
  q1.Connection := dm1.con1;
end;

end.
