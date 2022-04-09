unit u_mostrar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TUsuarioForm = class(TForm)
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
    procedure MostrarForm(Sender: TObject);
    procedure AtivaNavegacao(Sender: TObject; var Key: Char);
    procedure SalvarBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UsuarioForm: TUsuarioForm;

implementation

{$R *.dfm}

uses u_forms, Uni, u_dm1;

procedure TUsuarioForm.AtivaNavegacao(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(wm_nextdlgctl, 0, 0);
  end
  else if key = #27 then close
end;

procedure TUsuarioForm.MostrarForm(Sender: TObject);
begin
  AbrirForm(UsuarioForm);

  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top :=  (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;

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
    EmailInput.Enabled := True;
    LoginInput.Enabled := True;
    SalvarBtn.Visible := True;
  end;
end;

procedure TUsuarioForm.SalvarBtnClick(Sender: TObject);
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

    q1.ExecSQL;
  finally
    FreeAndNil(q1);
  end;
end;

end.
