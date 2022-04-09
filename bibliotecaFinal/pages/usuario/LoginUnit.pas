unit LoginUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls;

type
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LoginForm: TLoginForm;

implementation

{$R *.dfm}

uses CadastroUnit, dm1;

procedure TLoginForm.AbrirForm(Sender: TObject);
begin

  dm1
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

end.
