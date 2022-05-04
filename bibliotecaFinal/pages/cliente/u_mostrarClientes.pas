unit u_mostrarClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Uni, u_dm1, Vcl.ExtCtrls,
  Vcl.Mask;

type
  TClienteForm = class(TForm)
    panel_cliente: TPanel;
    LabelTitulo: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    NomeInput: TEdit;
    EmailInput: TEdit;
    ModoInput: TEdit;
    SalvarBtn: TButton;
    CodigoInput: TEdit;
    CancelarBtn: TButton;
    CpfInput: TMaskEdit;
    TelefoneInput: TMaskEdit;
    procedure AtivaNavegacao(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure SalvarBtnClick(Sender: TObject);
    procedure CancelarBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ClienteForm: TClienteForm;

implementation

{$R *.dfm}

uses u_forms, u_clientes;

procedure TClienteForm.AtivaNavegacao(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(wm_nextdlgctl, 0, 0);
  end
  else if key = #27 then close;
end;

procedure TClienteForm.CancelarBtnClick(Sender: TObject);
begin
  LimparInputs(ClienteForm);
  Close;
end;

procedure TClienteForm.FormShow(Sender: TObject);
var
  q1: TUniQuery;

begin
  AbrirForm(ClienteForm);

  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top :=  (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;

  if (ModoInput.Text = 'V') or (ModoInput.Text = 'A') then
  begin
    try
      q1 := TUniQuery.Create(nil);
      q1.Connection := dm1.con1;

      q1.Close;

      q1.SQL.Text := 'select cpf, nome_completo, email, telefone from clientes where codigo = :codigo';
      q1.ParamByName('codigo').Value := CodigoInput.Text;

      q1.Open;

      if q1.RecordCount > 0 then
      begin
        ClienteForm.CpfInput.Text := q1.FieldByName('cpf').AsString;
        ClienteForm.NomeInput.Text := q1.FieldByName('nome_completo').AsString;
        ClienteForm.EmailInput.Text := q1.FieldByName('email').AsString;
        ClienteForm.TelefoneInput.Text := q1.FieldByName('telefone').AsString;
      end;

    finally
      q1.Close;
      FreeAndNil(q1);
    end;
    if ModoInput.Text = 'V' then
    begin
      panel_cliente.Enabled := False;
      SalvarBtn.Visible := False;
      CancelarBtn.Visible := False;
    end
    else if ModoInput.Text = 'A' then
    begin
      panel_cliente.Enabled := True;
      LabelTitulo.Caption := 'Alterar cliente';
      SalvarBtn.Visible := True;
      CancelarBtn.Visible := True;
      CpfInput.SetFocus;
    end;
  end
  else if ModoInput.Text = 'N' then
  begin
    panel_cliente.Enabled := True;

    // LIMPAR INPUTS COM MÁSCARA
    CpfInput.Clear;
    TelefoneInput.Clear;
    LabelTitulo.Caption := 'Adicionar novo cliente';
    SalvarBtn.Visible := True;
    CancelarBtn.Visible := True;
    CpfInput.SetFocus;
  end;
end;

procedure TClienteForm.SalvarBtnClick(Sender: TObject);
var
  q1: TUniQuery;

begin
  CodigoInput.Text := '0';
  if ExisteInputsVazios(ClienteForm) then
    begin
      aviso('Preencha todos os campos!');
      cpfInput.SetFocus;
    end
  else
  begin
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

    try
      q1 := TUniQuery.Create(nil);
      q1.Connection := dm1.con1;

      q1.Close;
      q1.SQL.Clear;

      if ModoInput.Text = 'A' then
      begin
        q1.SQL.Add('update clientes set nome_completo = :nome_completo, email = :email, cpf = :cpf, telefone = :telefone');
        q1.SQL.Add(' where codigo = :codigo');
      end
      else if ModoInput.Text = 'N' then
      begin
      // PREENCHER INPUT COM NOVO CÓDIGO
        q1 := TUniQuery.Create(nil);
        q1.Connection := dm1.con1;

        q1.Close;
        q1.SQL.Text := 'select nextval(''tb_clientes_cod_seq'') as codProximo';
        q1.Open;

        CodigoInput.Text := q1.FieldByName('codProximo').AsString;
        q1.Close;
        q1.SQL.Clear;
        q1.SQL.Add('insert into clientes ');
        q1.SQL.Add('values');
        q1.SQL.Add('(:codigo, :cpf, :nome_completo, :email, :telefone)');
      end;

      q1.ParamByName('nome_completo').Value := NomeInput.Text;
      q1.ParamByName('email').Value := EmailInput.Text;
      q1.ParamByName('cpf').Value := CpfInput.Text;
      q1.ParamByName('telefone').Value := TelefoneInput.Text;
      q1.ParamByName('codigo').Value := CodigoInput.Text;

        try
          if confirma('Confirmar operação?') then
          begin
            q1.ExecSQL;
            Mensagem('Operação concluída!');
            Close;
            FormClientes.grid_clientesDBTableView1.DataController.RefreshExternalData;
          end;
        except on e:exception do
          if e.Message.Contains('clientes_pkey') then
          begin
            erro('Cliente já existe!');
            CpfInput.SetFocus;
          end
          else
          begin
            erro(e.Message);
          end;

        end;
    finally
      q1.Close;
      FreeAndNil(q1);
    end;
    end;
end;

end.
