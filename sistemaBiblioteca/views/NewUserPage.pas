unit NewUserPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

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

implementation

{$R *.dfm}

uses Usuario;

procedure TNewUserForm.OpenUserForm(Sender: TObject);
var
  mousePointer: TPoint;
begin
  mousePointer := Mouse.CursorPos;
  NewUserForm.Left := mousePointer.X - 100;
  NewUserForm.Top := mousePointer.Y - 100;
end;

procedure TNewUserForm.Adicionar(Sender: TObject);
var
  novoUsuario: TUsuario;
begin

  if NewUserForm.senhaInput.Text <> NewUserForm.SenhaCheckInput.Text then
    begin
      ShowMessage('Senhas n�o s�o iguais!');
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
          MessageBox(Application.Handle, 'Confirmar inclus�o de registro?', 'Adicionar usu�rio', MB_YESNO) of
          idYes:
            begin
              ShowMessage('Usuario inserido com sucesso!');
            end;
          idNo:
            begin
              ShowMessage('Opera��o cancelada!');
            end;
        End;

        FreeAndNil(novoUsuario);
        NewUserForm.Visible := False;
        NewUserForm.LimparForms;
    end;
    end;
end;

procedure TNewUserForm.LimparForms;
begin
  NewUserForm.nome_completoInput.Clear;
  NewUserForm.emailInput.Clear;
  NewUserForm.loginInput.clear;
  NewUserForm.senhaInput.Clear;
  NewUserForm.SenhaCheckInput.Clear;
end;
end.
