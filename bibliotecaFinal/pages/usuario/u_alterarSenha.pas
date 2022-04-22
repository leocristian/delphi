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
    CancelarBtn: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CancelarBtnClick(Sender: TObject);
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
      aviso('Senha atual incorreta!');
      SenhaAtualInput.SetFocus;
    end
    else
    begin
      if NovaSenhaInput.Text <> NovaSenhaCheckInput.Text then
      begin
        aviso('Senhas diferentes!');
        NovaSenhaInput.SetFocus;
      end
      else
      begin
        q1.Close;
        q1.SQL.Clear;

        q1.SQL.Add('update usuarios2 set senha = :novaSenha where codigo = :codigo');

        q1.ParamByName('novaSenha').Value :=  MD5String('segredo' + NovaSenhaInput.Text + 'segredo');
        q1.ParamByName('codigo').Value := codUsuario;

        try
          if confirma('Confirmar alteração de senha?') then
          begin
            q1.ExecSQL;
            mensagem('Senha alterada com sucesso!');
            Close;
          end;
        except on E:Exception do
          erro('Erro!' + #13 + E.Message);
        end;
      end;
    end;
  finally
    FreeAndNil(q1);
  end;
end;

procedure TAlterarSenhaForm.CancelarBtnClick(Sender: TObject);
begin
  Close;
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
  SenhaAtualInput.SetFocus;
end;

end.
