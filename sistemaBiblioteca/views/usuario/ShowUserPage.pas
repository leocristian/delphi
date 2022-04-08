unit ShowUserPage;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Usuario, FormManipulation;
type
  TShowUsuarioForm = class(TForm)
    Label1: TLabel;
    codigoEdit: TEdit;
    nameEdit: TEdit;
    emailEdit: TEdit;
    loginEdit: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure PreencherInputs(const objUsuario: TUsuario);
    procedure OpenForm(Sender: TObject);
    procedure EmularEnter(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  ShowUsuarioForm: TShowUsuarioForm;
  formManipulation: TFormManipulation;
implementation
{$R *.dfm}
procedure TShowUsuarioForm.EmularEnter(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform (wm_nextdlgctl, 0, 0);
  end
  else if key = #27 then close;
end;

procedure TShowUsuarioForm.OpenForm(Sender: TObject);
begin
  formManipulation.AbrirForm(ShowUsuarioForm);
end;
procedure TShowUsuarioForm.PreencherInputs(const objUsuario: TUsuario);
begin
  ShowUsuarioForm.codigoEdit.Text := IntToStr(objUsuario.cod);
  ShowUsuarioForm.nameEdit.Text := objUsuario.nome_completo;
  ShowUsuarioForm.emailEdit.Text := objUsuario.email;
  ShowUsuarioForm.loginEdit.Text := objUsuario.login;
end;
end.

