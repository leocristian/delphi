unit EditEditoraPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Editora;

type
  TEditEditoraForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    codigoEdit: TEdit;
    nameEdit: TEdit;
    cnpjEdit: TEdit;
    Button1: TButton;

    procedure PreencherInputs(const objEditora: TEditora);
    procedure AbrirForm(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditEditoraForm: TEditEditoraForm;

implementation

{$R *.dfm}

uses FormManipulation;

procedure TEditEditoraForm.AbrirForm(Sender: TObject);
var
  formManipulation: TFormManipulation;

begin
  formManipulation.AbrirForm(EditEditoraform);
end;

procedure TEditEditoraForm.PreencherInputs(const objEditora: TEditora);
begin
  Self.codigoEdit.Text := IntToStr(objEditora.cod);
  Self.nameEdit.Text := objEditora.nome;
  Self.cnpjEdit.Text := objEditora.cnpj;
end;

end.
