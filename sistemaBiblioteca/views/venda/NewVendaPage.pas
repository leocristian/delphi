unit NewVendaPage;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Livro, VendaControle, FormManipulation,
  Vcl.Grids, Vcl.ValEdit, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations,
  Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Vcl.DBGrids,
  MemDS, VirtualTable, Cliente, LoginPage, Venda, dmDatabase, NewClientPage, LivroVenda;
type
  TNewVendaForm = class(TForm)
    Label1: TLabel;
    TituloInput: TEdit;
    ClienteInput: TEdit;
    RealizarVendaBtn: TButton;
    Label2: TLabel;
    Button1: TButton;
    Label3: TLabel;
    labelPreco: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    DBGrid1: TDBGrid;
    tbLivrosVenda: TVirtualTable;
    dsLivrosVenda: TDataSource;
    procedure CriarForm(Sender: TObject);
    procedure RealizarVenda(Sender: TObject);
    procedure AbrirForm(Sender: TObject);
    procedure AdicionarLivro(Sender: TObject);
    procedure EmularEnter(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  NewVendaForm: TNewVendaForm;
  vendaControle: TVendaControle;
  formManipulation: TFormManipulation;
  novaVenda: TVenda;
  livroEncontrado: TLivro;
  livroVenda: TLivroVenda;
implementation
{$R *.dfm}
procedure TNewVendaForm.CriarForm(Sender: TObject);
begin
  novaVenda := TVenda.Create;
  formManipulation := TFormManipulation.Create;
  vendaControle := TVendaControle.Create;
  novaVenda.cod := novaVenda.SelecionarProxCodigo;
  livroEncontrado := TLivro.Create;
  livroVenda := TLivroVenda.Create;
end;
procedure TNewVendaForm.EmularEnter(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform (wm_nextdlgctl, 0, 0);
  end
  else if key = #27 then close;
       
end;

procedure TNewVendaForm.AdicionarLivro(Sender: TObject);
begin
  if Self.TituloInput.Text = '' then
  begin
    ShowMessage('Informe o título do livro!');
  end
  else
  begin
    try
      livroEncontrado := livroEncontrado.FindByTitulo(Self.TituloInput.Text);
    finally
      if livroEncontrado.titulo = '' then
      begin
        ShowMessage('Livro não encontrado!!');
        Self.TituloInput.SetFocus;
      end
      else
      begin
        livroVenda.titulo := livroEncontrado.titulo;
        livroVenda.numeroVenda := novaVenda.cod;
        livroVenda.Insert(livroVenda);
        with Self.tbLivrosVenda do
        begin
          Self.tbLivrosVenda.Append;
          Self.tbLivrosVenda['codigo'] := livroEncontrado.cod;
          Self.tbLivrosVenda['titulo'] := livroEncontrado.titulo;
          Self.tbLivrosVenda['preco'] := livroEncontrado.preco;
        end;
        vendaControle.IncrementaValor(StrToFloat(livroEncontrado.preco));
        Self.labelPreco.Caption := FloatToStr(vendaControle.valorAtual);
        Self.TituloInput.SetFocus;
      end;
    end;
  end;
end;
procedure TNewVendaForm.AbrirForm(Sender: TObject);
begin
  formManipulation.LimparInputs(NewVendaForm);
  formManipulation.AbrirForm(NewVendaForm);
end;
procedure TNewVendaForm.RealizarVenda(Sender: TObject);
var
  nomeCliente: String;
  tituloLivro: String;
  clienteVenda: TCliente;
  livroVenda: TLivro;
begin
  if formManipulation.ExisteInputsVazios(NewVendaForm) then
  begin
    ShowMessage('Preencha todos os campos!!');
  end
  else
  begin
    try
      livroVenda := TLivro.Create;
      nomeCliente := NewVendaForm.ClienteInput.Text;
      tituloLivro := NewVendaform.TituloInput.Text;
      livroVenda := livroVenda.FindByTitulo(tituloLivro);
    finally
      Case
      MessageBox(Application.Handle, 'Confirmar venda?', 'Realizar venda', MB_YESNO) of
      idYes:
        begin
          clienteVenda := TCliente.Create;
          clienteVenda := clienteVenda.FindByNome(nomeCliente);
          if clienteVenda.nome_completo = '' then
          begin
            case
            MessageBox(Application.HAndle, 'Cliente não encontrado! Adicionar um novo cliente?', 'Adicionar cliente', MB_YESNO) of
            idYes:
              begin
                NewClientForm.Visible := True;
                NewClientForm.clientNameInput.Text := nomeCliente;
              end;
            idNo: ShowMessage('Operação cancelada.');
            end;
          end
          else
          begin
            try
              novaVenda.vendedor := LoginPage.usuarioLogado.nome_completo;
              novaVenda.cliente := clienteVenda.nome_completo;
              novaVenda.valorTotal := FloatToStr(vendaControle.valorAtual);
              novaVenda.Insert(novaVenda);
            finally
              ShowMessage('Venda realizada com sucesso!');
              NewVendaForm.Visible := False;
              Self.tbLivrosVenda.Free;
              vendaControle.ZerarValor;
              Self.labelPreco.Caption := FloatToStr(vendaControle.valorAtual);
              novaVenda.cod := novaVenda.SelecionarProxCodigo;
            end;
          end;
        end;
      idNo:
        begin
          ShowMessage('Operação cancelada!');
        end;
      End;
    end;
  end;
end;
end.
