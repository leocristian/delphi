unit ShowClientePage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FormManipulation, Cliente;

type
  TShowClienteForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    codigoEdit: TEdit;
    nameEdit: TEdit;
    emailEdit: TEdit;
    telEdit: TEdit;
    Label6: TLabel;

    procedure OpenForm(Sender: TObject);
    procedure PreencherInputs(const objCliente: TCliente);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ShowClienteForm: TShowClienteForm;
  formManipulation: TFormManipulation;

implementation

{$R *.dfm}

procedure TShowClienteForm.OpenForm(Sender: TObject);
begin
  formManipulation.AbrirForm(ShowClienteForm);
end;

procedure TShowClienteForm.PreencherInputs(const objCliente: TCliente);
begin
  Self.codigoEdit.Text := IntToStr(objCliente.cod);
  Self.nameEdit.Text := objCliente.nome_completo;
  Self.emailEdit.Text := objCliente.email;
  Self.telEdit.text := objCliente.telefone;
end;

end.
