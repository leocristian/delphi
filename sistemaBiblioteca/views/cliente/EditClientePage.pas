unit EditClientePage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Cliente;

type
  TEditClienteForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    codigoEdit: TEdit;
    nameEdit: TEdit;
    emailEdit: TEdit;
    Button1: TButton;
    Label5: TLabel;
    telefoneEdit: TEdit;

    procedure PreencherInputs(const objCliente: TCliente);
    procedure OpenForm(Sender: TObject);
    procedure SalvarAlteracoes(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditClienteForm: TEditClienteForm;

implementation

{$R *.dfm}

uses FormManipulation;

procedure TEditClienteForm.OpenForm(Sender: TObject);
var
  formManipulation: TFormManipulation;
begin
  formManipulation := TFormManipulation.Create;
  formManipulation.AbrirForm(EditClienteForm);
end;

procedure TEditClienteForm.PreencherInputs(const objCliente: TCliente);
begin
  EditClienteForm.codigoEdit.Text := IntToStr(objCliente.cod);
  EditClienteForm.nameEdit.Text := objCliente.nome_completo;
  EditClienteForm.emailEdit.Text := objCliente.email;
  EditClienteForm.telefoneEdit.Text := objCliente.telefone;
end;

procedure TEditClienteForm.SalvarAlteracoes(Sender: TObject);
var
  clienteSelecionado, clienteAlterado: TCliente;
begin
  try
    clienteSelecionado := TCliente.Create;
    clienteSelecionado.cod := StrToInt(EditClienteForm.codigoEdit.Text);

    clienteSelecionado.Read(clienteSelecionado);

  finally
    case
      MessageBox(Application.Handle, 'Confirmar alteração de usuário?', 'Alterar cliente', MB_YESNO) of
      idYes:
        begin
          clienteAlterado := TCliente.Create;

          clienteAlterado.nome_completo := EditClienteForm.nameEdit.Text;
          clienteAlterado.email := EditClienteForm.emailEdit.Text;
          clienteAlterado.telefone := EditClienteForm.telefoneEdit.Text;

          try
            clienteSelecionado.Update(clienteAlterado);
          finally
            ShowMessage('Cliente alterado com sucesso!');
            EditClienteForm.visible := False;
            FreeAndNil(clienteSelecionado);
            FreeAndNil(clienteAlterado);
          end;
        end;
      idNo: ShowMessage('Operação cancelada');
    end;
  end;

end;


end.
