unit u_cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Uni, Vcl.ExtCtrls;

type
  TCadastroForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    nome_completoInput: TEdit;
    emailInput: TEdit;
    loginInput: TEdit;
    senhaInput: TEdit;
    SenhaCheckInput: TEdit;
    Panel2: TPanel;
    AdicionarUsuarioBtn: TButton;
    Button1: TButton;
    procedure AtivaNavegacao(Sender: TObject; var Key: Char);
    procedure AbrirForm(Sender: TObject);
    procedure AdicionarUsuarioBtnClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadastroForm: TCadastroForm;

implementation

{$R *.dfm}

uses u_dm1, u_forms, u_login;

procedure TCadastroForm.AbrirForm(Sender: TObject);
var
  mousePointer: TPoint;
begin

  mousePointer := Mouse.CursorPos;
  CadastroForm.Left := mousePointer.X - 100;
  CadastroForm.Top := mousePointer.Y - 100;

  nome_completoInput.SetFocus;
end;

procedure TCadastroForm.AdicionarUsuarioBtnClick(Sender: TObject);
var
  q1: TUniQuery;
  codUsuario: Integer;

begin
  if ExisteInputsVazios(CadastroForm) then
  begin
    ShowMessage('Preencha todos os campos!');
    nome_completoInput.SetFocus;
  end
  else
  begin
    try

      if not testaemail(emailInput.Text) then
      begin
        ShowMessage('Email inválido!');
        emailInput.SetFocus;
        Exit;
      end;

      q1 := TUniQuery.Create(nil);
      q1.Connection := dm1.con1;

      q1.Close;
      q1.SQL.Text := 'select nextval(''tb_usuarios_cod_seq'') as codProximo';
      q1.Open;

      codUsuario := q1.FieldByName('codProximo').AsInteger;

      q1.Close;
      q1.SQL.Clear;

      q1.SQL.Add('insert into usuarios2 ');
      q1.SQL.Add('values');
      q1.SQL.Add('(:codigo, :nome_completo, :email, :login, md5(:senha))');

      q1.ParamByName('codigo').Value := codUsuario;
      q1.ParamByName('nome_completo').Value := nome_completoInput.Text;
      q1.ParamByName('email').Value := emailInput.Text;
      q1.ParamByName('login').Value := loginInput.Text;

      if senhaInput.Text <> SenhaCheckInput.Text then
      begin
        ShowMessage('Senhas não são iguais!');
      end
      else
      begin
        q1.ParamByName('senha').Value := 'segredo' + senhaInput.Text + 'segredo';
        try
          q1.ExecSQL;
          ShowMessage('Usuário cadastrado com sucesso!');
          Self.Close;
          LimparInputs(CadastroForm);
        except on E: Exception do
        begin
          ShowMessage('Erro! ' + #13 + E.Message);
        end;
        end;
      end;
    finally
      FreeAndNil(q1);
    end;
  end;
end;

procedure TCadastroForm.AtivaNavegacao(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(wm_nextdlgctl, 0, 0);
  end
  else if key = #27 then close;
end;

procedure TCadastroForm.Button1Click(Sender: TObject);
begin
  LimparInputs(CadastroForm);
  Close;
end;

procedure TCadastroForm.FormActivate(Sender: TObject);
begin
  nome_completoInput.SetFocus;
end;

end.
