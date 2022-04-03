unit NewClientPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

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

implementation

{$R *.dfm}

uses Cliente;

procedure TNewClientForm.OpenClienteForm(Sender: TObject);
var
  mousePointer: TPoint;
begin
  mousePointer := Mouse.CursorPos;
  NewClientForm.Left := mousePointer.X - 100;
  NewClientForm.Top := mousePointer.Y - 100;
end;

procedure TNewClientForm.Adicionar(Sender: TObject);
var
  novoCliente: TCliente;
begin

  novoCliente := TCliente.Create;

  try
    novoCliente.nome_completo := NewClientForm.clientNameInput.Text;
    novoCliente.email := NewClientForm.clientEmailInput.Text;
    novoCliente.telefone := NewClientForm.clientTelInput.Text;

    novoCliente.Insert(novoCliente);

  finally
    ShowMessage('Cliente cadastrado com sucesso!');
    FreeAndNil(novoCliente);

    NewClientForm.Visible := False;
  end;
end;
end.
