unit NewEditoraPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FormManipulation;

type
  TNewEditoraForm = class(TForm)
    Label1: TLabel;
    editoraNomeInput: TEdit;
    editoraCnpjInput: TEdit;
    AdicionarEditoraBtn: TButton;

    procedure OpenEditoraForm(Sender: TObject);
    procedure Adicionar(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewEditoraForm: TNewEditoraForm;
  formManipulation: TFormManipulation;

implementation

{$R *.dfm}

uses Editora;

procedure TNewEditoraForm.OpenEditoraForm(Sender: TObject);
begin
  formManipulation.LimparInputs(NewEditoraForm);
  formManipulation.AbrirForm(NewEditoraform);
end;

procedure TNewEditoraForm.Adicionar(Sender: TObject);
var
  novaEditora: TEditora;
begin

  if formManipulation.ExisteInputsVazios(NewEditoraForm) then
  begin
    ShowMessage('Preencha todos os campos!');
  end
  else
  begin

    novaEditora := TEditora.Create;

    try
      novaEditora.cnpj := NewEditoraForm.editoraCnpjInput.Text;
      novaEditora.nome := NewEditoraForm.editoraNomeInput.text;

      novaEditora.Insert(novaEditora);
    finally
      ShowMessage('Editora cadastrada com sucesso!');
      FreeandNil(novaEditora);

      NewEditoraForm.Visible := False;
    end;
  end;
end;
end.
