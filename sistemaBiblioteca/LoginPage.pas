unit LoginPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus;

type
  TFormUsuario = class(TForm)
    NomeInput: TEdit;
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

uses MainPage;

procedure TFormUsuario.FormCreate(Sender: TObject);
begin
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top :=  (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
end;

procedure TFormUsuario.Login(Sender: TObject);
begin
  FormUsuario.Visible := False;
  MainPage.FormPrincipal.Visible := True;
end;
end.
