unit u_login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls;

type
  TUsuarioLogado = class
    codigo: Integer;
    nome_completo: String;
    email: String;
    login: String;
    senha: String;
  end;

  TLoginForm = class(TForm)
    Label1: TLabel;
    LabelNome: TLabel;
    LabelSenha: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Image1: TImage;
    LoginInput: TEdit;
    SenhaInput: TEdit;
    LoginBtn: TButton;
    ExitBtn: TButton;
    CadastrarBtn: TButton;

    procedure AbrirForm(Sender: TObject);
    procedure AtivaNavegacao(Sender: TObject; var Key: Char);
    procedure ExitBtnClick(Sender: TObject);
    procedure CadastrarBtnClick(Sender: TObject);
    procedure Finalizar(Sender: TObject; var CanClose: Boolean);
    procedure LoginBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LoginForm: TLoginForm;

implementation

{$R *.dfm}

uses u_dm1, u_cadastro, Uni, u_principal, u_forms, u_perfil;

procedure TLoginForm.AbrirForm(Sender: TObject);
begin

//  dm1.con1.Close;
//  dm1.con1.ProviderName := 'PostgreSQL';
//  dm1.con1.Port := 5432;
//  dm1.con1.Username := 'postgres';
//  dm1.con1.Password := 'admin';
//  dm1.con1.Database := 'bibliotecaDB';
//
//  try
//    dm1.con1.Open;
//  except
//    ShowMessage('Erro ao conectar no banco de dados!');
//    Application.Terminate;
//  end;

  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top :=  (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;

  LoginInput.SetFocus;
end;

procedure TLoginForm.AtivaNavegacao(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(wm_nextdlgctl, 0, 0);
  end
  else if key = #27 then close
end;

procedure TLoginForm.CadastrarBtnClick(Sender: TObject);
begin
  CadastroForm.Visible := true;
end;

procedure TLoginForm.ExitBtnClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TLoginForm.Finalizar(Sender: TObject; var CanClose: Boolean);
begin
  dm1.con1.Close;
end;

procedure TLoginForm.LoginBtnClick(Sender: TObject);
var
  q1: TUniQuery;
  nomeUsuario: String;

begin
  try
    q1 := TUniQuery.Create(nil);
    q1.Connection := dm1.con1;

    q1.Close;
    q1.SQL.Clear;

    q1.SQL.Add('select * from usuarios2 ');
    q1.SQL.Add('where login = :login and senha = md5(:senha)');

    q1.ParamByName('login').Value := LoginInput.Text;
    q1.ParamByName('senha').Value := 'segredo' + senhaInput.Text + 'segredo';

    q1.Open;

    if q1.RecordCount > 0  then
    begin
      nomeUsuario := q1.FieldByName('nome_completo').Value;
    end;
  finally
    if nomeUsuario = '' then
    begin
      ShowMessage('Usuário não encontrado!');
      LoginForm.LoginInput.SetFocus;
    end
    else
    begin
      LimparInputs(LoginForm);

      PerfilUsuario.CodigoInput.Text := q1.FieldByName('codigo').Value;
      PerfilUsuario.NomeInput.Text := q1.FieldByName('nome_completo').Value;
      PerfilUsuario.EmailInput.Text := q1.FieldByName('email').Value;
      PerfilUsuario.LoginInput.Text := q1.FieldByName('login').Value;

      showMessage('seja bem vindo: ' + nomeUsuario);

      FormPrincipal.Visible := True;
    end;
    FreeAndNil(q1);
  end;
end;

end.
