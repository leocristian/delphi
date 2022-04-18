unit u_novoCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Uni;

type
  TNovoCliente = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    nome_completoInput: TEdit;
    emailInput: TEdit;
    cpfInput: TEdit;
    AdicionarUsuarioBtn: TButton;
    Button1: TButton;
    Label7: TLabel;
    TelefoneInput: TEdit;
    procedure AdicionarUsuarioBtnClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NovoCliente: TNovoCliente;

implementation

{$R *.dfm}

uses u_dm1, u_clientes, u_forms;

procedure TNovoCliente.AdicionarUsuarioBtnClick(Sender: TObject);
var
  q1: TUniQuery;
  codUsuario: Integer;

begin
  if ExisteInputsVazios(NovoCliente) then
  begin
    ShowMessage('Preencha todos os campos!');
  end
  else
  begin
    try
//      // Validar o cpf
      if Not testacpf( Trim( cpfInput.Text ) ) then
      begin
        showmessage('Cpf inválido !');
        cpfInput.SetFocus;
        Exit;
      end;

      // Validar o email
      if not testaemail(emailInput.Text) then
      begin
        ShowMessage('Email inválido!');
        emailInput.SetFocus;
        Exit;
      end;

      q1 := TUniQuery.Create(nil);
      q1.Connection := dm1.con1;

      q1.Close;
      q1.SQL.Text := 'select nextval(''tb_clientes_cod_seq'') as codProximo';
      q1.Open;

      codUsuario := q1.FieldByName('codProximo').AsInteger;

      q1.Close;
      q1.SQL.Clear;

      q1.SQL.Add('insert into clientes2 ');
      q1.SQL.Add('values');
      q1.SQL.Add('(:codigo, :cpf, :nome_completo, :email, :telefone)');

      q1.ParamByName('codigo').Value := codUsuario;
      q1.ParamByName('cpf').Value := cpfInput.Text;
      q1.ParamByName('nome_completo').Value := nome_completoInput.Text;
      q1.ParamByName('email').Value := emailInput.Text;
      q1.ParamByName('telefone').Value := telefoneInput.Text;

      try
        q1.ExecSQL;
        ShowMessage('Cliente cadastrado com sucesso!');
        Self.Close;
        FormClientes.grid_clientesDBTableView1.DataController.RefreshExternalData;
        limparInputs(NovoCliente);
      except

        on e:exception do
        begin
          ShowMessage( 'Erro!'+#13+e.Message );
        end;
      end;

    finally
      FreeAndNil(q1);
    end;
  end;
end;

procedure TNovoCliente.Button1Click(Sender: TObject);
begin
  LimparInputs(NovoCliente);
  Close;
end;

procedure TNovoCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(wm_nextdlgctl, 0, 0);
  end
  else if key = #27 then close;
end;
procedure TNovoCliente.FormShow(Sender: TObject);
var
  mousePointer: TPoint;
begin

  mousePointer := Mouse.CursorPos;
  NovoCliente.Left := mousePointer.X - 100;
  NovoCliente.Top := mousePointer.Y - 100;

  cpfInput.SetFocus;
end;

end.
