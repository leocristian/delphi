unit u_novoLivro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Uni;

type
  TNovoLivroForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Categorias: TRadioGroup;
    TituloInput: TEdit;
    EditoraInput: TEdit;
    AnoPublicacao: TDateTimePicker;
    Label5: TLabel;
    PrecoInput: TEdit;
    AdicionarBtn: TButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure AdicionarBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NovoLivroForm: TNovoLivroForm;
  q1: TUniQuery;

implementation

{$R *.dfm}

uses u_dm1, u_livros, u_forms;

procedure TNovoLivroForm.AdicionarBtnClick(Sender: TObject);
var
  categoria: String;
  codLivro: Integer;

begin
  if ExisteInputsVazios(NovoLivroForm) then
  begin
    ShowMessage('Preencha todos os campos!');
  end
  else
  begin
    q1.Close;
    q1.SQL.Clear;

    q1.SQL.Text := 'select nextval(''tb_livros_cod_seq'') as codProximo';

    q1.Open;

    codLivro := q1.FieldByname('codProximo').AsInteger;

    q1.Close;
    q1.SQL.Clear;

    q1.SQL.Add('insert into livros ');
    q1.SQL.Add('values');
    q1.SQL.Add('(:codigo, :titulo, :editora, :anoPublicacao, :preco, :categoria)');

    q1.ParamByName('codigo').Value := codLivro;
    q1.ParamByName('titulo').Value := TituloInput.Text;
    q1.ParamByName('editora').Value := EditoraInput.Text;
    q1.ParamByName('anoPublicacao').Value := DateToStr(AnoPublicacao.Date);
    q1.ParamByName('preco').Value := PrecoInput.Text;

    categoria := Categorias.Items[Categorias.ItemIndex];

    q1.ParamByName('categoria').Value := categoria;

    try
      q1.ExecSQL;
      ShowMessage('Livro adicionado com sucesso!');
      FormLivros.grid_livrosDBTableView1.DataController.RefreshExternalData;
      Self.Close;
    except
    ShowMessage('Erro ao cadastrar livro');
    end;
  end;

end;

procedure TNovoLivroForm.FormCreate(Sender: TObject);
begin
  q1 := TUniQuery.Create(nil);
  q1.Connection := dm1.con1;
end;

procedure TNovoLivroForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(wm_nextdlgctl, 0, 0);
  end
  else if key = #27 then close;
end;
procedure TNovoLivroForm.FormShow(Sender: TObject);
begin
  LimparInputs(NovoLivroForm);
  TituloInput.SetFocus;
end;

end.
