unit LoginPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus;

type
  TFormUsuario = class(TForm)
    LoginInput: TEdit;
    SenhaInput: TEdit;
    Button1: TButton;
    Label1: TLabel;
    LabelNome: TLabel;
    LabelSenha: TLabel;

    procedure Login(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormUsuario: TFormUsuario;

implementation

{$R *.dfm}

uses MainPage, Usuario, FormManipulation;

procedure TFormUsuario.FormCreate(Sender: TObject);
begin
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top :=  (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
end;

procedure TFormUsuario.Login(Sender: TObject);
var
  usuarioLogado: TUsuario;
  login, senha: String;
  formManipulation: TFormManipulation;

begin
  if formManipulation.ExisteInputsVazios(FormUsuario) then
    begin
      ShowMessage('Preencha todos os campos!');
    end
  else
    begin
      try
        usuarioLogado := TUsuario.Create;

        login := FormUsuario.LoginInput.Text;
        senha := FormUsuario.SenhaInput.Text;

        usuarioLogado := usuarioLogado.FindByNomeAndSenha(login, senha);
      finally
        if usuarioLogado.login = login then
          begin
            ShowMessage('Seja bem vindo ' + usuarioLogado.nome_completo);

            FormUsuario.Visible := False;
            MainPage.FormPrincipal.Visible := True;

            FreeAndNil(usuarioLogado);
          end
        else
          begin
            ShowMessage('Usuário não encontrado!');
          end;
      end;


    end;

end;
end.
