unit u_mostrarLivro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Uni;

type
  TMostrarLivroForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    TituloInput: TEdit;
    EditoraInput: TEdit;
    AnoPublicacao: TDateTimePicker;
    Label5: TLabel;
    PrecoInput: TEdit;
    SalvarBtn: TButton;
    Label6: TLabel;
    CodigoInput: TEdit;
    ModoInput: TEdit;
    CategoriaInput: TComboBox;
    Label7: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SalvarBtnClick(Sender: TObject);
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

  ShowMessage(ModoInput.Text);

  if ModoInput.Text = 'V' then
  begin
    TituloInput.Enabled := False;
    EditoraInput.Enabled := False;
    AnoPublicacao.Enabled := False;
    PrecoInput.Enabled := False;
    CategoriaInput.Enabled := False;
    SalvarBtn.Visible := False;
  end
  else if ModoInput.Text = 'A' then
       
  begin
    TituloInput.Enabled := True;
    EditoraInput.Enabled := True;
    AnoPublicacao.Enabled := True;
    PrecoInput.Enabled := True;
    CategoriaInput.Enabled := True;
    SalvarBtn.Visible := True;
  end;

end;
procedure TMostrarLivroForm.SalvarBtnClick(Sender: TObject);
var
  q1: TUniQuery;
  categoria: String;

begin
  try
    q1 := TUniQuery.Create(nil);
    q1.Connection := dm1.con1;

    q1.Close;
    q1.SQL.Clear;
    q1.SQl.Add('update livros set');
    q1.SQL.Add(' titulo = :titulo, editora = :editora, ano_publicacao = :anoPublicacao, preco = :preco, categoria = :categoria');
    q1.SQL.Add('where codigo = :codigo');

    q1.ParamByName('codigo').Value := CodigoInput.Text;
    q1.ParamByName('titulo').Value := TituloInput.Text;
    q1.ParamByName('editora').Value := EditoraInput.Text;
    q1.ParamByName('anoPublicacao').Value := AnoPublicacao.Date;
    q1.ParamByName('preco').Value := PrecoInput.Text;
    q1.ParamByName('categoria').Value := CategoriaInput.Text;

    try
      q1.ExecSQL;
      ShowMessage('Livro alterado com sucesso!');
      Self.Close;
      FormLivros.grid_livrosDBTableView1.DataController.RefreshExternalData;
    except
      ShowMessage('Erro ao alterar livro!');
    end;
  finally
    FreeAndNil(q1);
  end;
end;

end.
