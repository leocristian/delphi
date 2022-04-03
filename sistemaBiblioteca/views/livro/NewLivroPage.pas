unit NewLivroPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, FormManipulation;

type
  TNewLivroForm = class(TForm)
    Label1: TLabel;
    TituloInput: TEdit;
    EditoraInput: TEdit;
    PrecoInput: TEdit;
    AnoInput: TDateTimePicker;
    Label2: TLabel;
    Button1: TButton;
    procedure Adicionar(Sender: TObject);
    procedure OpenLivroForm(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewLivroForm: TNewLivroForm;
  formManipulation: TFormManipulation;

implementation

{$R *.dfm}

uses Livro;

procedure TNewLivroForm.OpenLivroForm(Sender: TObject);
begin
  formManipulation.LimparInputs(NewLivroForm);
  formManipulation.AbrirForm(NewLivroForm);
end;

procedure TNewLivroForm.Adicionar(Sender: TObject);
var
  novoLivro: TLivro;

begin
  if formManipulation.ExisteInputsVazios(NewLivroForm) then
  begin
    ShowMessage('Preencha todos os campos!');
  end
  else
  begin

    novoLivro := TLivro.Create;

    try
      novoLivro.titulo := NewLivroForm.TituloInput.Text;
      novoLivro.editora := NewLivroForm.EditoraInput.Text;
      novoLivro.anoPublicacao := DateToStr(NewLivroForm.AnoInput.Date);
      novoLivro.preco := NewLivroForm.PrecoInput.Text;

    finally
      Case
        MessageBox(Application.Handle, 'Confirmar inclusão de registro?', 'Adicionar livro', MB_YESNO) of
        idYes:
          begin
            try
              novoLivro.Insert(novoLivro);
            finally
              ShowMessage('Livro inserido com sucesso!');
            end;
          end;
        idNo:
          begin
            ShowMessage('Operação cancelada!');
          end;
      End;
        FreeAndNil(novoLivro);
        NewLivroForm.Visible := False;
    end;
  end;
end;

end.
