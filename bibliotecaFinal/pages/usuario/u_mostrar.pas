unit u_mostrar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TUsuarioForm = class(TForm)
    panel_usuarioSelecionado: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    NomeInput: TEdit;
    EmailInput: TEdit;
    LoginInput: TEdit;
    ModoInput: TEdit;
    SalvarBtn: TButton;
    CodigoInput: TEdit;
    CancelarBtn: TButton;
    procedure MostrarForm(Sender: TObject);
    procedure AtivaNavegacao(Sender: TObject; var Key: Char);
    procedure SalvarBtnClick(Sender: TObject);
    procedure CancelarBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UsuarioForm: TUsuarioForm;

implementation

{$R *.dfm}

uses u_forms, Uni, u_dm1, u_usuarios;

procedure TUsuarioForm.AtivaNavegacao(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(wm_nextdlgctl, 0, 0);
  end
  else if key = #27 then close
end;

procedure TUsuarioForm.CancelarBtnClick(Sender: TObject);
begin
  close;
end;

procedure TUsuarioForm.MostrarForm(Sender: TObject);
begin
  AbrirForm(UsuarioForm);

  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top :=  (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;

  if ModoInput.Text = 'V' then
  begin
    panel_usuarioSelecionado.Enabled := False;
    SalvarBtn.Visible := False;
    CancelarBtn.Visible := False;
  end
  else
  begin
    panel_usuarioSelecionado.Enabled := True;
    SalvarBtn.Visible := True;
    CancelarBtn.Visible := True;
    LoginInput.SetFocus;
  end;
end;

procedure TUsuarioForm.SalvarBtnClick(Sender: TObject);
var
  q1: TUniQuery;

begin

  if ExisteInputsVazios(UsuarioForm) then
  begin
    aviso('Preencha todos os campos!');
    LoginInput.SetFocus;
  end
  else
  begin
    try
      if not testaemail(EmailInput.Text) then
      begin
        aviso('Email inválido!');
        EmailInput.SetFocus;
        Exit;
      end;

      q1 := TUniQuery.Create(nil);
      q1.Connection := dm1.con1;

      q1.Close;
      q1.SQL.Clear;

      q1.SQL.Add('update usuarios2 set nome_completo = :nome_completo, email = :email, login = :login');
      q1.SQL.Add(' where codigo = :codigo');

      q1.ParamByName('nome_completo').Value := NomeInput.Text;
      q1.ParamByName('email').Value := EmailInput.Text;
      q1.ParamByName('login').Value := LoginInput.Text;
      q1.ParamByName('codigo').Value := CodigoInput.Text;

      try
        if confirma('Confirmar alteração?') then
        begin
          q1.ExecSQL;
          mensagem('Usuário alterado com sucesso!');
          close;
          FormUsuarios.grid_usuariosDBTableView1.DataController.RefreshExternalData;
        end;
      except on E:Exception do
        if E.Message.Contains('usuarios2_pkey') then
        begin
          erro('Usuário já existe!');
        end
        else
        begin
          erro('Erro!' + #13 + E.Message);
        end;
      end;
    finally
      FreeAndNil(q1);
    end;
  end;
end;

end.
