unit u_mostrarLivro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Uni,
  Vcl.Mask, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit;

type
  TLivroForm = class(TForm)
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
    Label8: TLabel;
    Label9: TLabel;
    QtdEstoqueInput: TEdit;
    AnoPublicacaoInput: TMaskEdit;
    PrecoInput: TcxCurrencyEdit;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SalvarBtnClick(Sender: TObject);
    procedure CancelarBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LivroForm: TLivroForm;

implementation

{$R *.dfm}

uses u_forms, u_dm1, u_livros;

procedure TLivroForm.CancelarBtnClick(Sender: TObject);
begin
  close;
end;

procedure TLivroForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(wm_nextdlgctl, 0, 0);
  end
  else if key = #27 then close;
end;

procedure TLivroForm.FormShow(Sender: TObject);
var
  q1: TUniQuery;

begin
  AbrirForm(LivroForm);

  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top :=  (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;

  if (ModoInput.Text = 'V') or (ModoInput.Text = 'A') then
  begin
    try
      q1 := TUniQuery.Create(nil);
      q1.Connection := dm1.con1;

      q1.Close;

      q1.SQL.Text := 'select * from livros where codigo = :codigo';
      q1.ParamByName('codigo').Value := CodigoInput.Text;

      q1.Open;

      if q1.RecordCount > 0 then
      begin
        CodigoInput.Text := IntToStr(q1.FieldByName('codigo').Value);
        TituloInput.Text := q1.FieldByName('titulo').Value;
        EditoraInput.Text :=  q1.FieldByName('editora').Value;
        AnoPublicacaoInput.Text := DateToStr(q1.FieldByName('ano_publicacao').Value);
        PrecoInput.Text := FloatToStr(q1.FieldByName('preco').Value);
        CategoriaInput.Text := q1.FieldByName('categoria').Value;
        QtdEstoqueInput.Text := IntToStr(q1.FieldByName('qtd_estoque').Value);
      end;
    finally
    end;
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

procedure TLivroForm.SalvarBtnClick(Sender: TObject);
var
  q1: TUniQuery;

begin

  CodigoInput.Text := '0';

  if ExisteInputsVazios(LivroForm) then
  begin
    aviso('Preencha todos os campos!');
  end
  else
  begin
    try
      q1 := TUniQuery.Create(nil);
      q1.Connection := dm1.con1;

      q1.Close;
      q1.SQL.Clear;

      if ModoInput.Text = 'A' then
      begin
        q1.SQl.Add('update livros set');
        q1.SQL.Add(' titulo = :titulo, editora = :editora, ano_publicacao = :anoPublicacao, preco = :preco, categoria = :categoria, qtd_estoque = :qtdEstoque');
        q1.SQL.Add('where codigo = :codigo');
      end
      else if ModoInput.Text = 'N' then
      begin
        // PREENCHER INPUT COM NOVO CÓDIGO
        q1.Close;
        q1.SQL.Text := 'select nextval(''tb_livros_cod_seq'') as codProximo';
        q1.Open;

        CodigoInput.Text := IntToStr(q1.FieldByName('codProximo').Value);

        q1.Close;
        q1.SQL.Clear;

        q1.SQL.Add('insert into livros ');
        q1.SQL.Add('values');
        q1.SQL.Add('(:codigo, :titulo, :editora, :anoPublicacao, :preco, :categoria, :qtdEstoque)');
      end;

      q1.ParamByName('codigo').Value := CodigoInput.Text;
      q1.ParamByName('titulo').Value := TituloInput.Text;
      q1.ParamByName('editora').Value := EditoraInput.Text;

      // VALIDAÇÃO DE DATA
      try
        if StrToDate(AnoPublicacaoInput.Text) > Now then
        begin
          aviso('Ano de publicação deve ser menor que a data atual!!');
          AnoPublicacaoInput.SetFocus;
          Exit;
        end
        else
        begin
            q1.ParamByName('anoPublicacao').Value := StrToDate(AnoPublicacaoInput.Text);
        end;
      except on e:exception do
        begin
          aviso('Digite uma data válida!');
          AnoPublicacaoInput.SetFocus;
          exit;
        end;
      end;

      q1.ParamByName('preco').Value := precoInput.Value;
      q1.ParamByName('categoria').Value := CategoriaInput.Text;
      q1.ParamByName('qtdEstoque').Value := StrToInt(QtdEstoqueInput.Text);

      if confirma('Confirmar operação?') then
      begin
        try
          q1.ExecSQL;
          mensagem('Operação conclúída!');
          Self.Close;
          FormLivros.grid_livrosDBTableView1.DataController.RefreshExternalData;
        except on e:exception do
          if e.Message.Contains('livros_pkey') then
          begin
            erro('Livro já existe');
            TituloInput.SetFocus;
          end;
        end;
      end;
    finally
      q1.Close;
      FreeAndNil(q1);
    end;
  end;
end;

end.
