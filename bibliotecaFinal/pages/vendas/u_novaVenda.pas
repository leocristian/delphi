unit u_novaVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, MemDS, VirtualTable, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Uni;

type
  TNovaVendaForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    labelPreco: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    TituloInput: TEdit;
    ClienteInput: TEdit;
    RealizarVendaBtn: TButton;
    AddLivro: TButton;
    tb_livrosVenda: TVirtualTable;
    ds_livrosVenda: TDataSource;
    grid_livros: TDBGrid;
    procedure MostrarForm(Sender: TObject);
    procedure AtivarNavegacao(Sender: TObject; var Key: Char);
    procedure AddLivroClick(Sender: TObject);
    procedure CriarForm(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NovaVendaForm: TNovaVendaForm;
  q1: TUniQuery;

implementation

{$R *.dfm}

uses u_forms, u_dm1;

procedure TNovaVendaForm.AtivarNavegacao(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(wm_nextdlgctl, 0, 0);
  end
  else if key = #27 then close;
end;
procedure TNovaVendaForm.AddLivroClick(Sender: TObject);
begin
  if TituloInput.Text = '' then
  begin
    ShowMessage('Informe o título do livro!!');
  end
  else
  begin
    try
      q1.Close;
      q1.SQL.Clear;

      q1.SQL.Add('select * from livros where titulo like :titulo');
      q1.ParamByName('titulo').Value := '%' + TituloInput.Text + '%';

      q1.Open;

      if q1.RecordCount > 1 then
      begin
        ShowMessage('vários livros encontrados');
      end
      else if q1.RecordCount = 1 then
      begin
        with tb_livrosvenda do
        begin
          tb_livrosVenda.Append;
          tb_livrosVenda['codigo'] := q1.FieldByName('codigo').AsInteger;
          tb_livrosVenda['titulo'] := q1.FieldByName('titulo').AsString;
          tb_livrosVenda['anoPublicacao'] := q1.FieldByName('ano_publicacao').AsString;
          tb_livrosVenda['preco'] := q1.FieldByName('preco').AsFloat;
        end;

      end
      else
      begin
        ShowMessage('Livro não encontrado!');
      end;


    finally

    end;
  end;

end;

procedure TNovaVendaForm.CriarForm(Sender: TObject);
begin
  q1 := TUniQuery.Create(nil);
  q1.Connection := dm1.con1;
end;

procedure TNovaVendaForm.MostrarForm(Sender: TObject);
begin
  AbrirForm(NovaVendaForm);

  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top :=  (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
end;

end.
