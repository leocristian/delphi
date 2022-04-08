unit NewClientPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FormManipulation;

type
  TNewClientForm = class(TForm)
    Label1: TLabel;
    clientNameInput: TEdit;
    clientEmailInput: TEdit;
    clientTelInput: TEdit;
    AdicionarClienteBtn: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    clientCpfInput: TEdit;
    Label5: TLabel;

    procedure AbrirForm(Sender: TObject);
    procedure Adicionar(Sender: TObject);
    procedure Cancelar(Sender: TObject);
    procedure EmularEnter(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewClientForm: TNewClientForm;
  formManipulation: TFormManipulation;

implementation

{$R *.dfm}

uses Cliente;

procedure TNewClientForm.Cancelar(Sender: TObject);
begin
  Self.Visible := False;
end;

procedure TNewClientForm.EmularEnter(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform (wm_nextdlgctl, 0, 0);
  end;
end;

procedure TNewClientForm.AbrirForm(Sender: TObject);
begin
  formManipulation.LimparInputs(NewClientForm);
  formManipulation.AbrirForm(NewClientForm);
end;

procedure TNewClientForm.Adicionar(Sender: TObject);
var
  novoCliente: TCliente;
begin

  if formManipulation.ExisteInputsVazios(NewClientForm) then
  begin
    ShowMessage('Preencha todos os campos!');
  end
  else
  begin

    novoCliente := TCliente.Create;

    try

      novoCliente.cpf := NewClientForm.clientCpfInput.Text;
      novoCliente.nome_completo := NewClientForm.clientNameInput.Text;
      novoCliente.email := NewClientForm.clientEmailInput.Text;
      novoCliente.telefone := NewClientForm.clientTelInput.Text;

    finally
      Case
        MessageBox(Application.Handle, 'Confirmar inclusão de registro?', 'Adicionar usuário', MB_YESNO) of
        idYes:
          begin
            novoCliente.Insert(novoCliente);
            ShowMessage('Cliente cadastrado com sucesso!');
            FreeAndNil(novoCliente);
            NewClientForm.Visible := False;
          end;
        idNo:
          begin
            ShowMessage('Operação cancelada!');
          end;
      End;
    end;
  end;
end;
end.
