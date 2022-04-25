unit u_mostrarLivro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Uni,
  Vcl.Mask;

type
  TMostrarLivroForm = class(TForm)
    Panel1: TPanel;
    LabelTitulo: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    TituloInput: TEdit;
    EditoraInput: TEdit;
    CodigoInput: TEdit;
    CategoriaInput: TComboBox;
    SalvarBtn: TButton;
    ModoInput: TEdit;
    CancelarBtn: TButton;
    Label5: TLabel;
    PrecoInput: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    QtdEstoqueInput: TEdit;
    AnoPublicacaoInput: TMaskEdit;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SalvarBtnClick(Sender: TObject);
    procedure CancelarBtnClick(Sender: TObject);
    procedure PrecoInputKeyPress(Sender: TObject; var Key: Char);
    procedure PrecoInputChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MostrarLivroForm: TMostrarLivroForm;

implementation

{$R *.dfm}

uses u_forms, u_dm1, u_livros;

procedure TMostrarLivroForm.CancelarBtnClick(Sender: TObject);
begin
  close;
end;

procedure TMostrarLivroForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(wm_nextdlgctl, 0, 0);
  end
  else if key = #27 then close;
end;

procedure TMostrarLivroForm.FormShow(Sender: TObject);
begin
  AbrirForm(MostrarLivroForm);

  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top :=  (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;

  if ModoInput.Text = 'V' then
  begin
    LabelTitulo.Caption := 'Livro selecionado';
    panel1.Enabled := False;
    SalvarBtn.Visible := False;
    CancelarBtn.Visible := False;
  end
  else if ModoInput.Text = 'A' then
  begin
    LabelTitulo.Caption := 'Alterar livro selecionado';
    panel1.Enabled := True;
    TituloInput.SetFocus;
    SalvarBtn.Visible := True;
    CancelarBtn.Visible := True;
  end
  else if ModoInput.Text = 'N' then
  begin
    LabelTitulo.Caption := 'Adicionar novo livro';
    panel1.Enabled := True;
    TituloInput.SetFocus;
    AnoPublicacaoInput.Clear;
    SalvarBtn.Visible := True;
    CancelarBtn.Visible := True;
  end;

end;
procedure TMostrarLivroForm.PrecoInputChange(Sender: TObject);
var
   s : string;
   v : double;
   I : integer;
begin
   //1º Passo : se o edit estiver vazio, nada pode ser feito.
   If (PrecoInput.Text = emptystr) then
      PrecoInput.Text := '0,00';

   //2º Passo : obter o texto do edit, SEM a virgula e SEM o ponto decimal:
   s := '';
   for I := 1 to length(PrecoInput.Text) do
   if (PrecoInput.text[I] in ['0'..'9']) then
      s := s + PrecoInput.text[I];

   //3º Passo : fazer com que o conteúdo do edit apresente 2 casas decimais:
   v := strtofloat(s);
   v := (v /100); // para criar 2 casa decimais

   //4º Passo : Formata o valor de (V) para aceitar valores do tipo 0,10.
   PrecoInput.text := FormatFloat('###,##0.00',v);
   PrecoInput.SelStart := 0;
end;

procedure TMostrarLivroForm.PrecoInputKeyPress(Sender: TObject; var Key: Char);
begin
  if NOT (Key in ['0'..'9', #8, #9]) then
   key := #0;
   //Função para posicionar o cursor sempre na direita
   PrecoInput.selstart := Length(PrecoInput.text);
end;

procedure TMostrarLivroForm.SalvarBtnClick(Sender: TObject);
var
  q1: TUniQuery;

begin
  if ExisteInputsVazios(MostrarLivroForm) then
  begin
    aviso('Preencha todos os campos!');
  end
  else
  begin
    if ModoInput.Text = 'A' then
    begin
      try
        q1 := TUniQuery.Create(nil);
        q1.Connection := dm1.con1;

        q1.Close;
        q1.SQL.Clear;

        q1.SQl.Add('update livros set');
        q1.SQL.Add(' titulo = :titulo, editora = :editora, ano_publicacao = :anoPublicacao, preco = :preco, categoria = :categoria, qtd_estoque = :qtdEstoque');
        q1.SQL.Add('where codigo = :codigo');

        q1.ParamByName('codigo').Value := CodigoInput.Text;
        q1.ParamByName('titulo').Value := TituloInput.Text;
        q1.ParamByName('editora').Value := EditoraInput.Text;
        q1.ParamByName('anoPublicacao').Value := AnoPublicacaoInput.Text;
        q1.ParamByName('preco').Value := PrecoInput.Text;
        q1.ParamByName('categoria').Value := CategoriaInput.Text;
        q1.ParamByName('qtdEstoque').Value := QtdEstoqueInput.Text;

        if confirma('Confirmar alteração de livro?') then
        begin
          try
            q1.ExecSQL;
            mensagem('Livro alterado com sucesso!');
            Self.Close;
            FormLivros.grid_livrosDBTableView1.DataController.RefreshExternalData;
          except on e:exception do
            if e.Message.Contains('livros_pkey') then
            begin
              erro('Livro já existe');
            end
            else
            begin
              erro('Data inválida!' + e.Message);
            end;
          end;
        end;

      finally
        FreeAndNil(q1);
      end;
    end
    else if ModoInput.Text = 'N' then
    begin
      try
        q1 := TUniQuery.Create(nil);
        q1.Connection := dm1.con1;

        q1.Close;
        q1.SQL.Clear;

        q1.SQL.Add('insert into livros ');
        q1.SQL.Add('values');
        q1.SQL.Add('(:codigo, :titulo, :editora, :anoPublicacao, :preco, :categoria, :qtdEstoque)');

        q1.ParamByName('codigo').Value := CodigoInput.Text;
        q1.ParamByName('titulo').Value := TituloInput.Text;
        q1.ParamByName('editora').Value := EditoraInput.Text;
        q1.ParamByName('anoPublicacao').Value := AnoPublicacaoInput.Text;
        q1.ParamByName('preco').Value := PrecoInput.Text;
        q1.ParamByName('categoria').Value := CategoriaInput.Text;
        q1.ParamByName('qtdEstoque').Value := QtdEstoqueInput.Text;

        if confirma('Confirmar cadastro de livro?') then
        begin
          try
            q1.ExecSQL;
            mensagem('Livro adicionado com sucesso!');
            FormLivros.grid_livrosDBTableView1.DataController.RefreshExternalData;
            Self.Close;
          except on E: Exception do
            if E.Message.Contains('livros_pkey') then
            begin
              erro('Livro já existe!');
              TituloInput.SetFocus;
            end
            else if e.Message.Contains('date/time field value out of range') then
            begin
              aviso('Data inválida! ');
            end
            else erro(e.Message);
          end;
        end;

      finally
          FreeAndNil(q1);
      end;
    end;
  end;
end;

end.
