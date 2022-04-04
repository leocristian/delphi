unit NewVendaPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Livro, VendaControle, FormManipulation;

type
  TNewVendaForm = class(TForm)
    Label1: TLabel;
    TituloInput: TEdit;
    ClienteInput: TEdit;
    RealizarVendaBtn: TButton;
    LivrosEscolhidos: TListBox;
    Label2: TLabel;
    Button1: TButton;
    Label3: TLabel;
    labelPreco: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label6: TLabel;

    procedure RealizarVenda(Sender: TObject);
    procedure OpenForm(Sender: TObject);
    procedure AdicionarLivro(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewVendaForm: TNewVendaForm;
  livrosVenda: Array of TLivro;
  vendaControle: TVendaControle;
  formManipulation: TFormManipulation;

implementation

{$R *.dfm}

uses Cliente, LoginPage, Venda;

procedure TNewVendaForm.AdicionarLivro(Sender: TObject);
var
  livroEncontrado: TLivro;
begin
  if Self.TituloInput.Text = '' then
  begin
    ShowMessage('Informe o título do livro!');
  end
  else
  begin

    try

      livroEncontrado := TLivro.Create;
      livroEncontrado := livroEncontrado.FindByTitulo(Self.TituloInput.Text);

    finally
      if livroEncontrado.titulo = '' then
      begin
        ShowMessage('Livro não encontrado!!');
        Self.TituloInput.SetFocus;
      end
      else
      begin
        Self.LivrosEscolhidos.Items.Add(livroEncontrado.titulo);
        vendaControle.IncrementaValor(StrToFloat(livroEncontrado.preco));

        Self.labelPreco.Caption := FloatToStr(vendaControle.valorAtual);
      end;
    end;
  end;

end;

procedure TNewVendaForm.OpenForm(Sender: TObject);
begin
  formManipulation := TFormManipulation.Create;
  vendaControle := TVendaControle.Create;

  formManipulation.LimparInputs(NewVendaForm);
  formManipulation.AbrirForm(NewVendaForm);
end;

procedure TNewVendaForm.RealizarVenda(Sender: TObject);
var
  nomeCliente: String;
  tituloLivro: String;

  clienteVenda: TCliente;
  livroVenda: TLivro;

  novaVenda: TVenda;

begin
  if formManipulation.ExisteInputsVazios(NewVendaForm) then
  begin
    ShowMessage('Preencha todos os campos!!');
  end
  else
  begin
    try
      clienteVenda := TCliente.Create;
      livroVenda := TLivro.Create;

      nomeCliente := NewVendaForm.ClienteInput.Text;
      tituloLivro := NewVendaform.TituloInput.Text;

  //    clienteVenda := clienteVenda.FindByNome(nomeCliente);
      livroVenda := livroVenda.FindByTitulo(tituloLivro);

    finally
      try
        novaVenda := TVenda.Create;

        novaVenda.vendedor := 'leonardo';
        novaVenda.livro := livroVenda.titulo;
        novaVenda.cliente := clienteVenda.nome_completo;
        novaVenda.valorTotal := livroVenda.preco;

      finally
        Case
        MessageBox(Application.Handle, 'Confirmar venda?', 'Realizar venda', MB_YESNO) of
        idYes:
          begin
            try
              showMessage('vendedor: ' + novaVenda.vendedor);
              novaVenda.Insert(novaVenda);
            finally
              ShowMessage('Venda realizada com sucesso!');
            end;
          end;
        idNo:
          begin
            ShowMessage('Operação cancelada!');
          end;
        End;
        FreeAndNil(novaVenda);
        NewVendaForm.Visible := False;
      end;
    end;
  end;

end;
end.
