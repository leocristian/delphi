unit u_mostrarLivro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Uni;

type
  TMostrarLivroForm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    TituloInput: TEdit;
    EditoraInput: TEdit;
    AnoPublicacao: TDateTimePicker;
    CodigoInput: TEdit;
    CategoriaInput: TComboBox;
    SalvarBtn: TButton;
    ModoInput: TEdit;
    CancelarBtn: TButton;
    Label5: TLabel;
    PrecoInput: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    QtdEstoqueInput: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SalvarBtnClick(Sender: TObject);
    procedure CancelarBtnClick(Sender: TObject);
    procedure PrecoInputKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MostrarLivroForm: TMostrarLivroForm;

implementation

{$R *.dfm}

uses u_forms, u_dm1, u_livros;

procedure TMostrarLivroForm.CancelarBtnClick(Sender: TObject);
begin
  close;
end;

procedure TMostrarLivroForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(wm_nextdlgctl, 0, 0);
  end
  else if key = #27 then close;
end;

procedure TMostrarLivroForm.FormShow(Sender: TObject);
begin
  AbrirForm(MostrarLivroForm);

  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top :=  (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;

  if ModoInput.Text = 'V' then
  begin
    panel1.Enabled := False;
    SalvarBtn.Visible := False;
    CancelarBtn.Visible := False;
  end
  else if ModoInput.Text = 'A' then
  begin
    panel1.Enabled := True;
    SalvarBtn.Visible := True;
    CancelarBtn.Visible := True;
  end;

end;
procedure TMostrarLivroForm.PrecoInputKeyPress(Sender: TObject; var Key: Char);
begin
  FormatarComoMoeda(PrecoInput, Key);
end;

procedure TMostrarLivroForm.SalvarBtnClick(Sender: TObject);
var
  q1: TUniQuery;
  categoria: String;

begin
  if ExisteInputsVazios(MostrarLivroForm) then
  begin
    aviso('Preencha todos os campos!');
  end
  else
  begin
    try
      q1 := TUniQuery.Create(nil);
      q1.Connection := dm1.con1;

      q1.Close;
      q1.SQL.Clear;

      q1.SQl.Add('update livros set');
      q1.SQL.Add(' titulo = :titulo, editora = :editora, ano_publicacao = :anoPublicacao, preco = :preco, categoria = :categoria, qtd_estoque = :qtdEstoque');
      q1.SQL.Add('where codigo = :codigo');

      mensagem(datetostr(AnoPublicacao.Date));
      q1.ParamByName('codigo').Value := CodigoInput.Text;
      q1.ParamByName('titulo').Value := TituloInput.Text;
      q1.ParamByName('editora').Value := EditoraInput.Text;
      q1.ParamByName('anoPublicacao').Value := AnoPublicacao.Date;
      q1.ParamByName('preco').Value := PrecoInput.Text;
      q1.ParamByName('categoria').Value := CategoriaInput.Text;
      q1.ParamByName('qtdEstoque').Value := QtdEstoqueInput.Text;

      if confirma('Confirmar alteração de livro?') then
      begin
        try
          q1.ExecSQL;
          mensagem('Livro alterado com sucesso!');
          Self.Close;
          FormLivros.grid_livrosDBTableView1.DataController.RefreshExternalData;
        except on e:exception do
          if e.Message.Contains('livros_pkey') then
          begin
            erro('Livro já existe');
          end
          else
          begin
            erro(e.Message);
          end;
        end;
      end;

    finally
      FreeAndNil(q1);
    end;
  end;
end;

end.
