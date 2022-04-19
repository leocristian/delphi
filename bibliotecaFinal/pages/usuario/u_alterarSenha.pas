unit u_alterarSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Uni;

type
  TAlterarSenhaForm = class(TForm)
    NovaSenhaLabel: TLabel;
    NovaSenhaCheckLabel: TLabel;
    NovaSenhaInput: TEdit;
    NovaSenhaCheckInput: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    SenhaAtualInput: TEdit;
    AlterarSenhaBtn: TButton;
    Button1: TButton;
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure AlterarSenhaBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AlterarSenhaForm: TAlterarSenhaForm;
  codUsuario: Integer;

implementation

{$R *.dfm}

uses u_forms, u_dm1, u_md5;

procedure TAlterarSenhaForm.AlterarSenhaBtnClick(Sender: TObject);
var
  q1: TUniquery;
  senhaAtualBD: String;
  senhaAtualInputHash: String;

begin
  try
    q1 := TUniQuery.Create(nil);
    q1.Connection := dm1.con1;

    q1.Close;
    q1.SQL.Clear;

    q1.SQL.Add('select senha from usuarios2 where codigo = :codigo');
    q1.ParamByName('codigo').Value := codUsuario;

    q1.Open;

    senhaAtualBD := q1.FieldByName('senha').Value;
    senhaAtualInputHash := MD5String('segredo' + SenhaAtualInput.Text + 'segredo');

    if senhaAtualBD <> senhaAtualinputHash then
    begin
      ShowMessage('Senha atual incorreta!');
      SenhaAtualInput.SetFocus;
    end
    else
    begin
      if NovaSenhaInput.Text <> NovaSenhaCheckInput.Text then
      begin
        ShowMessage('Senhas diferentes!');
        NovaSenhaInput.SetFocus;
      end
      else
      begin
        case MEssageBox(Application.Handle, 'Confirmar alteração de senha?', 'Alterar senha', MB_YESNO) of
          idYes:
          begin
            q1.Close;
            q1.SQL.Clear;

            q1.SQL.Add('update usuarios2 set senha = :novaSenha where codigo = :codigo');

            q1.ParamByName('novaSenha').Value :=  MD5String('segredo' + NovaSenhaInput.Text + 'segredo');
            q1.ParamByName('codigo').Value := codUsuario;

            try
              q1.ExecSQL;
              ShowMessage('Senha alterada com sucesso!');
            except on E:Exception do
              ShowMessage('Erro!' + #13 + E.Message);
            end;

          end;
          idNo:
          begin
            ShowMessage('Operação cancelada!');
          end;
        end;
        Close;
        FreeAndNil(q1);
      end;
    end;

  finally

  end;
end;

procedure TAlterarSenhaForm.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TAlterarSenhaForm.FormActivate(Sender: TObject);
begin
  SenhaAtualInput.SetFocus;
end;

procedure TAlterarSenhaForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(wm_nextdlgctl, 0, 0);
  end
  else if key = #27 then close
end;

procedure TAlterarSenhaForm.FormShow(Sender: TObject);
begin
  LimparInputs(AlterarSenhaForm);
  AbrirForm(AlterarSenhaForm);
end;

end.
