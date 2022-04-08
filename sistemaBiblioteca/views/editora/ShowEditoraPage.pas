unit ShowEditoraPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Editora;

type
  TShowEditoraForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    codigoEdit: TEdit;
    nomeEdit: TEdit;
    cnpjEdit: TEdit;

    procedure AbrirForm(Sender: TObject);
    procedure PreencherInputs(const objEditora: TEditora);
    procedure EmularEnter(Sender: TObject; var Key: Char);

  end;

var
  ShowEditoraForm: TShowEditoraForm;

implementation

{$R *.dfm}

uses FormManipulation;

procedure TShowEditoraForm.AbrirForm(Sender: TObject);
var
  formManipulation: TFormManipulation;
begin
  formManipulation := TFormManipulation.Create;
  formManipulation.AbrirForm(ShowEditoraForm);
end;

procedure TShowEditoraForm.EmularEnter(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform (wm_nextdlgctl, 0, 0);
  end
  else if key = #27 then close;
end;

procedure TShowEditoraForm.PreencherInputs(const objEditora: TEditora);
begin
  ShowEditoraForm.codigoEdit.Text := IntToStr(objEditora.cod);
  ShowEditoraForm.nomeEdit.Text := objEditora.nome;
  ShowEditoraForm.cnpjEdit.Text := objEditora.cnpj;
end;
end.
