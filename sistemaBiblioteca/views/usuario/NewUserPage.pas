unit NewUserPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FormManipulation;

type
  TNewUserForm = class(TForm)
    Label1: TLabel;
    nome_completoInput: TEdit;
    emailInput: TEdit;
    loginInput: TEdit;
    senhaInput: TEdit;
    SenhaCheckInput: TEdit;
    AdicionarUsuarioBtn: TButton;

    procedure OpenUserForm(Sender: TObject);
    procedure Adicionar(Sender: TObject);
    procedure LimparForms;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewUserForm: TNewUserForm;
  formManipulation: TFormManipulation;

implementation

{$R *.dfm}

uses Usuario;

procedure TNewUserForm.OpenUserForm(Sender: TObject);
begin
  formManipulation.AbrirForm(NewUserForm);
end;

procedure TNewUserForm.LimparForms;
begin
  formManipulation.LimparInputs(NewUserForm);
end;

procedure TNewUserForm.Adicionar(Sender: TObject);
var
  novoUsuario: TUsuario;
begin

  if NewUserForm.senhaInput.Text <> NewUserForm.SenhaCheckInput.Text then
    begin
      ShowMessage('Senhas não são iguais!');
    end
  else
    begin

      novoUsuario := TUsuario.Create;

      try
        novoUsuario.nome_completo := NewUserForm.nome_completoInput.Text;
        novoUsuario.email := NewUserForm.emailInput.Text;
        novoUsuario.login := NewUserForm.loginInput.Text;
        novoUsuario.senha := NewUserForm.senhaInput.Text;

        novoUsuario.Insert(novoUsuario);

      finally

        Case
          MessageBox(Application.Handle, 'Confirmar inclusão de registro?', 'Adicionar usuário', MB_YESNO) of
          idYes:
            begin
              ShowMessage('Usuario inserido com sucesso!');
            end;
          idNo:
            begin
              ShowMessage('Operação cancelada!');
            end;
        End;

        FreeAndNil(novoUsuario);
        NewUserForm.Visible := False;
        NewUserForm.LimparForms;
    end;
    end;
end;


end.
