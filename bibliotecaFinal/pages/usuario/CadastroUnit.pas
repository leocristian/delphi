unit CadastroUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

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
    AdicionarUsuarioBtn: TButton;
    SenhaCheckInput: TEdit;
    Button1: TButton;
    procedure AtivaNavegacao(Sender: TObject; var Key: Char);
    procedure AbrirForm(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadastroForm: TCadastroForm;

implementation

{$R *.dfm}

procedure TCadastroForm.AbrirForm(Sender: TObject);
var
  mousePointer: TPoint;
begin

  mousePointer := Mouse.CursorPos;
  CadastroForm.Left := mousePointer.X - 100;
  CadastroForm.Top := mousePointer.Y - 100;

  nome_completoInput.SetFocus;
end;

procedure TCadastroForm.AtivaNavegacao(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(wm_nextdlgctl, 0, 0);
  end
  else if key = #27 then close
end;

end.
