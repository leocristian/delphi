unit u_perfil;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Uni, u_dm1;

type
  TPerfilUsuario = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    NomeInput: TEdit;
    EmailInput: TEdit;
    LoginInput: TEdit;
    ModoInput: TEdit;
    SalvarBtn: TButton;
    CodigoInput: TEdit;
    Label5: TLabel;
    procedure MostrarPerfil(Sender: TObject);
    procedure AbrirForm(Sender: TObject; var Key: Char);
    procedure SalvarBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PerfilUsuario: TPerfilUsuario;

implementation

{$R *.dfm}

procedure TPerfilUsuario.AbrirForm(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(wm_nextdlgctl, 0, 0);
  end
  else if key = #27 then close
end;

procedure TPerfilUsuario.MostrarPerfil(Sender: TObject);
begin
  if ModoInput.Text = 'V' then
  begin
    NomeInput.Enabled := False;
    EmailInput.Enabled := False;
    LoginInput.Enabled := False;
    SalvarBtn.Visible := False;
  end
  else
  begin
    NomeInput.Enabled := True;
    NomeInput.SetFocus;
    EmailInput.Enabled := True;
    LoginInput.Enabled := True;
    SalvarBtn.Visible := True;
  end;
end;

procedure TPerfilUsuario.SalvarBtnClick(Sender: TObject);
var
  q1: TUniQuery;

begin
  try
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
      q1.ExecSQL;
      ShowMessage('Perfil alterado com sucesso!');
      Self.Close;
    except
      ShowMessage('Usu�rio j� existe!');
    end;
  finally
    FreeAndNil(q1);
  end;
end;

end.
