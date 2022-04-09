unit u_perfil;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

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
    EmailInput.Enabled := True;
    LoginInput.Enabled := True;
    SalvarBtn.Visible := True;
  end;
end;

end.
