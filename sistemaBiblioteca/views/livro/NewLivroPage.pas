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
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure Adicionar(Sender: TObject);
    procedure OpenLivroForm(Sender: TObject);
    procedure EmularEnter(Sender: TObject; var Key: Char);
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

uses Livro, Editora;

procedure TNewLivroForm.EmularEnter(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform (wm_nextdlgctl, 0, 0);
  end;
end;

procedure TNewLivroForm.OpenLivroForm(Sender: TObject);
begin
  formManipulation.LimparInputs(NewLivroForm);
  formManipulation.AbrirForm(NewLivroForm);
end;

procedure TNewLivroForm.Adicionar(Sender: TObject);
var
  novoLivro: TLivro;
  objEditora: TEditora;

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

      objEditora := TEditora.Create;

      objEditora := objEditora.FindByNome(novoLivro.editora);

    finally
      Case
        MessageBox(Application.Handle, 'Confirmar inclusão de registro?', 'Adicionar livro', MB_YESNO) of
        idYes:
          begin
            if objEditora.nome = novoLivro.editora then
            begin
              try
                novoLivro.Insert(novoLivro);
              finally
                ShowMessage('Livro inserido com sucesso!');
                NewLivroForm.Visible := False;
              end;
            end
            else
            begin
              ShowMessage('Editora não encontrada!');
            end;
          end;
        idNo:
          begin
            ShowMessage('Operação cancelada!');
          end;
      End;
        FreeAndNil(novoLivro);
    end;
  end;
end;

end.
