unit LoginPage;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Usuario,
  Vcl.ExtCtrls, Vcl.Imaging.jpeg;
type
  TFormUsuario = class(TForm)
    LoginInput: TEdit;
    SenhaInput: TEdit;
    Button1: TButton;
    Label1: TLabel;
    LabelNome: TLabel;
    LabelSenha: TLabel;
    ExitBtn: TButton;
    Label2: TLabel;
    Button2: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Image1: TImage;
    procedure Login(Sender: TObject);
    procedure Sair(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CadastrarUsuario(Sender: TObject);
    function GetUsuarioLogado: TUsuario;
    procedure SetUsuarioLogado(objUsuario: TUsuario);

    procedure EmularEnter(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  FormUsuario: TFormUsuario;
  usuarioLogado: TUsuario;
implementation
{$R *.dfm}
uses MainPage, FormManipulation, NewUserPage;

procedure TFormUsuario.EmularEnter(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform (wm_nextdlgctl, 0, 0);
  end
  else if key = #27 then close;
end;

function TFormUsuario.GetUsuarioLogado: TUsuario;
begin
  Result := usuarioLogado;
end;
procedure TFormUsuario.SetUsuarioLogado(objUsuario: TUsuario);
begin
  usuarioLogado := objUsuario;
end;
procedure TFormUsuario.CadastrarUsuario(Sender: TObject);
begin
  NewUserPage.NewUserForm.Visible := True;
end;

procedure TFormUsuario.FormCreate(Sender: TObject);
begin
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top :=  (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
end;
procedure TFormUsuario.Sair(Sender: TObject);
begin
  Application.Terminate;
end;
procedure TFormUsuario.Login(Sender: TObject);
var
  login, senha: String;
  formManipulation: TFormManipulation;
begin
  formManipulation := TFormManipulation.Create;
  if formManipulation.ExisteInputsVazios(FormUsuario) then
    begin
      ShowMessage('Preencha todos os campos!');
    end
  else
    begin
      try
        login := FormUsuario.LoginInput.Text;
        senha := FormUsuario.SenhaInput.Text;
        usuarioLogado := TUsuario.Create;
        usuarioLogado := usuarioLogado.FindByNomeAndSenha(login, senha);
      finally
        if usuarioLogado.login = login then
          begin
            ShowMessage('Seja bem vindo ' + usuarioLogado.nome_completo);
            Self.SetUsuarioLogado(usuarioLogado);
            FormUsuario.Visible := False;
            MainPage.FormPrincipal.Visible := True;
          end
        else
          begin
            ShowMessage('Usuário não encontrado!');
          end;
      end;
    end;
end;
end.
