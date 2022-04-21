unit u_mostrarClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Uni, u_dm1, Vcl.ExtCtrls;

type
  TMostrarClientesForm = class(TForm)
    panel_cliente: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    NomeInput: TEdit;
    EmailInput: TEdit;
    TelefoneInput: TEdit;
    ModoInput: TEdit;
    SalvarBtn: TButton;
    CodigoInput: TEdit;
    CpfInput: TEdit;
    CancelarBtn: TButton;
    procedure AtivaNavegacao(Sender: TObject; var Key: Char);
    procedure MostrarForm(Sender: TObject);
    procedure SalvarBtnClick(Sender: TObject);
    procedure CancelarBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MostrarClientesForm: TMostrarClientesForm;

implementation

{$R *.dfm}

uses u_forms, u_clientes;

procedure TMostrarClientesForm.AtivaNavegacao(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(wm_nextdlgctl, 0, 0);
  end
  else if key = #27 then close;
end;

procedure TMostrarClientesForm.CancelarBtnClick(Sender: TObject);
begin
  LimparInputs(MostrarClientesForm);
  Close;
end;

procedure TMostrarClientesForm.MostrarForm(Sender: TObject);
begin
  AbrirForm(MostrarClientesForm);

  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top :=  (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;

  if ModoInput.Text = 'V' then
  begin
    panel_cliente.Enabled := False;
    SalvarBtn.Visible := False;
    CancelarBtn.Visible := False;
  end
  else
  begin
    panel_cliente.Enabled := True;
    SalvarBtn.Visible := True;
    CancelarBtn.Visible := True;
    CpfInput.SetFocus;
  end;
end;
procedure TMostrarClientesForm.SalvarBtnClick(Sender: TObject);
var
  q1: TUniQuery;

begin
  try
    // Validar o cpf
    if Not testacpf( Trim( cpfInput.Text ) ) then
    begin
      erro('Cpf inválido !');
      cpfInput.SetFocus;
      Exit;
    end;

    // Validar o email
    if not testaemail(emailInput.Text) then
    begin
      erro('Email inválido!');
      emailInput.SetFocus;
      Exit;
    end;

    q1 := TUniQuery.Create(nil);
    q1.Connection := dm1.con1;

    q1.Close;
    q1.SQL.Clear;

    q1.SQL.Add('update clientes2 set nome_completo = :nome_completo, email = :email, cpf = :cpf, telefone = :telefone');
    q1.SQL.Add(' where codigo = :codigo');

    q1.ParamByName('nome_completo').Value := NomeInput.Text;
    q1.ParamByName('email').Value := EmailInput.Text;
    q1.ParamByName('cpf').Value := CpfInput.Text;
    q1.ParamByName('telefone').Value := TelefoneInput.Text;
    q1.ParamByName('codigo').Value := CodigoInput.Text;

    try
      if confirma('Confirmar alteração de cliente?') then
      begin
        q1.ExecSQL;
        MessageDlg('Cliente alterado com sucesso!', mtConfirmation, [mbOk], 0);
        Self.Close;
        FormClientes.grid_clientesDBTableView1.DataController.RefreshExternalData;
      end;
    except
      erro('Cliente já existe!');
      CpfInput.SetFocus;
    end;
  finally
    FreeAndNil(q1);
  end;
end;

end.
