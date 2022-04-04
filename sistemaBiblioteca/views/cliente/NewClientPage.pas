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

    procedure OpenClienteForm(Sender: TObject);
    procedure Adicionar(Sender: TObject);

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

procedure TNewClientForm.OpenClienteForm(Sender: TObject);
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
      novoCliente.nome_completo := NewClientForm.clientNameInput.Text;
      novoCliente.email := NewClientForm.clientEmailInput.Text;
      novoCliente.telefone := NewClientForm.clientTelInput.Text;

      novoCliente.Insert(novoCliente);

    finally
      Case
        MessageBox(Application.Handle, 'Confirmar inclusão de registro?', 'Adicionar usuário', MB_YESNO) of
        idYes:
          begin
            ShowMessage('Usuario inserido com sucesso!');
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
