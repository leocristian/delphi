unit u_perfil;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Uni, u_dm1, Vcl.ExtCtrls;

type
  TPerfilUsuario = class(TForm)
    Panel1: TPanel;
    SalvarBtn: TButton;
    CancelarBtn: TButton;
    ModoInput: TEdit;
    AlterarSenhaBtn: TButton;
    panel_perfil: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    NomeInput: TEdit;
    EmailInput: TEdit;
    LoginInput: TEdit;
    CodigoInput: TEdit;
    procedure MostrarPerfil(Sender: TObject);
    procedure AbrirForm(Sender: TObject; var Key: Char);
    procedure SalvarBtnClick(Sender: TObject);
    procedure CancelarBtnClick(Sender: TObject);
    procedure AlterarSenhaBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PerfilUsuario: TPerfilUsuario;

implementation

{$R *.dfm}

uses u_forms, u_usuarios, u_alterarSenha;

procedure TPerfilUsuario.AbrirForm(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(wm_nextdlgctl, 0, 0);
  end
  else if key = #27 then close
end;

procedure TPerfilUsuario.AlterarSenhaBtnClick(Sender: TObject);
begin
  codUsuario := StrToInt(codigoInput.Text);
  AlterarSenhaForm.ShowModal;
end;

procedure TPerfilUsuario.CancelarBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPerfilUsuario.MostrarPerfil(Sender: TObject);
begin
  if ModoInput.Text = 'V' then
  begin
    panel_perfil.Enabled := False;
    Panel1.Visible := False;
  end
  else
  begin
    panel_perfil.Enabled := True;
    Panel1.Visible := True;
    NomeInput.SetFocus;
  end;
end;

procedure TPerfilUsuario.SalvarBtnClick(Sender: TObject);
var
  q1: TUniQuery;

begin
  if ExisteInputsVazios(PerfilUsuario) then
  begin
    aviso('Preencha todos os campos!');
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
      q1.SQL.Clear;

      q1.SQL.Add('update usuarios set nome_completo = :nome_completo, email = :email, login = :login');
      q1.SQL.Add(' where codigo = :codigo');

      q1.ParamByName('nome_completo').Value := NomeInput.Text;
      q1.ParamByName('email').Value := EmailInput.Text;
      q1.ParamByName('login').Value := LoginInput.Text;
      q1.ParamByName('codigo').Value := CodigoInput.Text;

      try
        if confirma('Confirmar alteração?') then
        begin
          q1.ExecSQL;
          mensagem('Perfil alterado com sucesso!');
          Self.Close;
          FormUsuarios.grid_usuariosDBTableView1.DataController.RefreshExternalData;
        end;

       except on E: Exception do
        begin
          if E.Message.Contains('usuarios2_pkey') then
          begin
            erro('Usuário já existe!');
            LoginInput.SetFocus;
          end
          else
          begin
            erro(E.Message);
          end;
        end;
        end;
    finally
      FreeAndNil(q1);
    end;
  end;
end;

end.
