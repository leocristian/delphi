unit AlterarSenhaPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TAlterarSenhaForm = class(TForm)
    Label1: TLabel;
    senhaAtualInput: TEdit;
    Label2: TLabel;
    novaSenhaInput: TEdit;
    Label3: TLabel;
    novaSenhaCheckInput: TEdit;
    Label4: TLabel;
    Button1: TButton;
    procedure CriarForm(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AlterarSenhaForm: TAlterarSenhaForm;

implementation

{$R *.dfm}

uses FormManipulation;

procedure TAlterarSenhaForm.CriarForm(Sender: TObject);
begin
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top :=  (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
end;

end.
