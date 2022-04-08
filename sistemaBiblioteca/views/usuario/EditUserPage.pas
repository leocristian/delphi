unit EditUserPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FormManipulation, Usuario;

type
  TEditUserForm = class(TForm)
    Label1: TLabel;
    codigoEdit: TEdit;
    loginEdit: TEdit;
    nameEdit: TEdit;
    emailEdit: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Button1: TButton;

    procedure OpenForm(Sender: TObject);
    procedure PreencherInputs(const objUsuario: TUsuario);
    procedure SalvarAlteracoes(Sender: TObject);
    procedure EmularEnter(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditUserForm: TEditUserForm;
  formManipulation: TFormManipulation;

implementation

{$R *.dfm}

procedure TEditUserForm.EmularEnter(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform (wm_nextdlgctl, 0, 0);
  end;
end;

procedure TEditUserForm.OpenForm(Sender: TObject);
begin
  formManipulation.AbrirForm(EditUserForm);
end;

procedure TEditUserForm.PreencherInputs(const objUsuario: TUsuario);
begin
  EditUserForm.codigoEdit.Text := IntToStr(objUsuario.cod);
  EditUserForm.nameEdit.Text := objUsuario.nome_completo;
  EditUserForm.emailEdit.Text := objUsuario.email;
  EditUserForm.loginEdit.Text := objUsuario.login;
end;
procedure TEditUserForm.SalvarAlteracoes(Sender: TObject);
var
  usuarioSelecionado, usuarioAlterado: TUsuario;
begin
  try
    usuarioSelecionado := TUsuario.Create;
    usuarioSelecionado.cod := StrToInt(EditUserForm.codigoEdit.Text);

    usuarioSelecionado.Read(usuarioSelecionado);

  finally
    case
      MessageBox(Application.Handle, 'Confirmar alteração de usuário?', 'Alterar usuário', MB_YESNO) of
      idYes:
        begin
          usuarioAlterado := TUsuario.Create;

          usuarioAlterado.nome_completo := EditUserForm.nameEdit.Text;
          usuarioAlterado.email := EditUserForm.emailEdit.Text;
          usuarioAlterado.login := EditUserForm.loginEdit.Text;

          try
            usuarioSelecionado.Update(usuarioAlterado);
          finally
            ShowMessage('Usuário alterado com sucesso!');
            EditUserForm.visible := False;
            FreeAndNil(usuarioSelecionado);
            FreeAndNil(usuarioAlterado);
          end;
        end;
      idNo: ShowMessage('Operação cancelada');
    end;
  end;

end;

end.
