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
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button1: TButton;
    procedure OpenUserForm(Sender: TObject);
    procedure Adicionar(Sender: TObject);
    procedure LimparForms;
    procedure Cancelar(Sender: TObject);
    procedure EmularEnter(Sender: TObject; var Key: Char);
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
  formManipulation.LimparInputs(NewUserForm);
  formManipulation.AbrirForm(NewUserForm);
end;
procedure TNewUserForm.EmularEnter(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform (wm_nextdlgctl, 0, 0);
  end
  else if key = #27 then close;
end;
procedure TNewUserForm.Cancelar(Sender: TObject);
begin
  Self.Visible := False;
end;
procedure TNewUserForm.LimparForms;
begin
  formManipulation.LimparInputs(NewUserForm);
end;
procedure TNewUserForm.Adicionar(Sender: TObject);
var
  novoUsuario: TUsuario;
begin
  if FormManipulation.ExisteInputsVazios(NewUserForm) then
  begin
    ShowMessage('Preencha todos os campos!');
  end
  else
  begin
    if NewUserForm.senhaInput.Text <> NewUserForm.SenhaCheckInput.Text then
      begin
        ShowMessage('Senhas n?o s?o iguais!');
      end
    else
      begin
        novoUsuario := TUsuario.Create;
        try
          novoUsuario.nome_completo := NewUserForm.nome_completoInput.Text;
          novoUsuario.email := NewUserForm.emailInput.Text;
          novoUsuario.login := NewUserForm.loginInput.Text;
          novoUsuario.senha := NewUserForm.senhaInput.Text;
        finally
          Case
            MessageBox(Application.Handle, 'Confirmar inclus?o de registro?', 'Adicionar usu?rio', MB_YESNO) of
            idYes:
              begin
                novoUsuario.Insert(novoUsuario);
                ShowMessage('Usu?rio inserido com sucesso!');
                FreeAndNil(novoUsuario);
                NewUserForm.Visible := False;
              end;
            idNo:
              begin
                ShowMessage('Opera??o cancelada!');
              end;
          End;
        end;
      end;
  end;
end;
end.
