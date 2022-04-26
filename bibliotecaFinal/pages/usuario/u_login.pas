unit u_login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, IniFiles;

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

    procedure FormShow(Sender: TObject);
    procedure AtivaNavegacao(Sender: TObject; var Key: Char);
    procedure ExitBtnClick(Sender: TObject);
    procedure CadastrarBtnClick(Sender: TObject);
    procedure Finalizar(Sender: TObject; var CanClose: Boolean);
    procedure LoginBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
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

procedure TLoginForm.FormShow(Sender: TObject);
var
  i: TIniFile;
  NomeArquivoIni: String;

begin
  // ABRIR FORM CENTRALIZADO;
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top :=  (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;

  // FECHAR CONEXÃO COM BD!!!
  dm1.con1.Close;
  NomeArquivoIni := ExtractFilePath(Application.ExeName) + 'login.ini';

  if FileExists(NomeArquivoIni) then
  begin
    i := TIniFile.Create(NomeArquivoIni);
    try
      dm1.con1.ProviderName := i.ReadString('conexao', 'provider', '');
      dm1.con1.Port := i.ReadInteger('conexao', 'port', 5432);
      dm1.con1.Username := i.ReadString('conexao', 'username', '');
      dm1.con1.Password := i.ReadString('conexao', 'password', '');
      dm1.con1.Database := i.ReadString('conexao', 'database', '');

      if i.ReadString('usuario', 'login', '' ) = '' then
      begin
        LoginInput.SetFocus;
      end
      else
      begin
        LoginInput.Text := i.ReadString('usuario', 'login', '' );
        SenhaInput.SetFocus;
      end;
    finally
      i.Free;
    end;

    try
      dm1.con1.Open;
    except on E: Exception do
      begin
        erro('Erro ao conectar no banco de dados!' + #13 + E.Message);
        Application.Terminate;
      end;
    end;
  end;
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

procedure TLoginForm.FormActivate(Sender: TObject);
begin
  LoginInput.SetFocus;
end;

procedure TLoginForm.LoginBtnClick(Sender: TObject);
var
  q1: TUniQuery;
  nomeUsuario: String;
  i: TIniFile;
  NomeArquivoIni: String;

begin
  if ExisteInputsVazios(LoginForm) then
  begin
    aviso('Preencha todos os campos!');
    LoginInput.SetFocus;
    Exit;
  end;

  try
    q1 := TUniQuery.Create(nil);
    q1.Connection := dm1.con1;

    q1.Close;
    q1.SQL.Clear;

    q1.SQL.Add('select codigo, nome_completo, email, login from usuarios ');
    q1.SQL.Add('where login = :login and senha = md5(:senha)');

    q1.ParamByName('login').Value := LoginInput.Text;
    q1.ParamByName('senha').Value := 'segredo' + senhaInput.Text + 'segredo';

    q1.Open;

    nomeUsuario := q1.FieldByName('nome_completo').AsString;

    if nomeUsuario = '' then
    begin
      aviso('Usuário não encontrado!');
      LoginForm.LoginInput.SetFocus;
    end
    else
    begin
      // PREENCHER FORM PERIL DO USUARIO
      PerfilUsuario.CodigoInput.Text := q1.FieldByName('codigo').AsString;
      PerfilUsuario.NomeInput.Text := q1.FieldByName('nome_completo').AsString;
      PerfilUsuario.EmailInput.Text := q1.FieldByName('email').AsString;
      PerfilUsuario.LoginInput.Text := q1.FieldByName('login').AsString;

      // ABRIR ARQUIVO INI E PREENCHER CAMPO LOGIN
      NomeArquivoIni := ExtractFilePath(Application.ExeName) + 'login.ini';

      i := TIniFile.Create(NomeArquivoIni);
      i.WriteString('usuario', 'login', LoginInput.Text);
      i.Free;
      mensagem('Seja bem vindo: ' + nomeUsuario);
      SenhaInput.Clear;
      FormPrincipal.Visible := True;
    end;
  finally
    FreeAndNil(q1);
  end;
end;

end.
