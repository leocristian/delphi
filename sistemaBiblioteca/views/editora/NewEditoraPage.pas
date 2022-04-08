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
    Label2: TLabel;
    Label3: TLabel;

    procedure OpenEditoraForm(Sender: TObject);
    procedure Adicionar(Sender: TObject);
    procedure EmularEnter(Sender: TObject; var Key: Char);
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

procedure TNewEditoraForm.EmularEnter(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform (wm_nextdlgctl, 0, 0);
  end;
end;

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
