unit u_cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Uni;

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
    procedure AdicionarUsuarioBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadastroForm: TCadastroForm;

implementation

{$R *.dfm}

uses u_dm1, u_forms;

procedure TCadastroForm.AbrirForm(Sender: TObject);
var
  mousePointer: TPoint;
begin

  mousePointer := Mouse.CursorPos;
  CadastroForm.Left := mousePointer.X - 100;
  CadastroForm.Top := mousePointer.Y - 100;

  nome_completoInput.SetFocus;
end;

procedure TCadastroForm.AdicionarUsuarioBtnClick(Sender: TObject);
var
  q1: TUniQuery;
  codUsuario: Integer;

begin
  try
    q1 := TUniQuery.Create(nil);
    q1.Connection := dm1.con1;

    q1.Close;
    q1.SQL.Text := 'select nextval(''tb_usuarios_cod_seq'') as codProximo';
    q1.Open;

    codUsuario := q1.FieldByName('codProximo').AsInteger;

    q1.Close;
    q1.SQL.Clear;

    q1.SQL.Add('insert into usuarios2 ');
    q1.SQL.Add('values');
    q1.SQL.Add('(:codigo, :nome_completo, :email, :login, md5(:senha))');

    q1.ParamByName('codigo').Value := codUsuario;
    q1.ParamByName('nome_completo').Value := nome_completoInput.Text;
    q1.ParamByName('email').Value := emailInput.Text;
    q1.ParamByName('login').Value := loginInput.Text;
    q1.ParamByName('senha').Value := 'segredo' + senhaInput.Text + 'segredo';

    q1.ExecSQL;

  finally
    ShowMessage('Usuário cadastrado com sucesso!');

    LimparInputs(CadastroForm);
    CadastroForm.Close;

    FreeAndNil(q1);
  end;
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
