unit NewVendaPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TNewVendaForm = class(TForm)
    Label1: TLabel;
    TituloInput: TEdit;
    ClienteInput: TEdit;
    RealizarVendaBtn: TButton;
    procedure RealizarVenda(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewVendaForm: TNewVendaForm;

implementation

{$R *.dfm}

//uses Cliente, Livro, LoginPage, Venda;

procedure TNewVendaForm.RealizarVenda(Sender: TObject);
//var
//  nomeCliente: String;
//  tituloLivro: String;
//
//  clienteVenda: TCliente;
//  livroVenda: TLivro;
//
//  novaVenda: TVenda;

begin
  ShowMessage('realização de venda');
//  try
//    clienteVenda := TCliente.Create;
//    livroVenda := TLivro.Create;
//
//    nomeCliente := NewVendaForm.ClienteInput.Text;
//    tituloLivro := NewVendaform.TituloInput.Text;
//
//    clienteVenda := clienteVenda.FindByNome(nomeCliente);
//    livroVenda := livroVenda.FindByTitulo(tituloLivro);
//
//  finally
//    try
//      novaVenda := TVenda.Create;
//
//      novaVenda.vendedor := 'leonardo';
//      novaVenda.livro := livroVenda.titulo;
//      novaVenda.cliente := clienteVenda.nome_completo;
//      novaVenda.valor_total := StrToFloat(livroVenda.preco);
//
//    finally
//      Case
//      MessageBox(Application.Handle, 'Confirmar inclusão de registro?', 'Realizar venda', MB_YESNO) of
//      idYes:
//        begin
//          try
//            novaVenda.Insert(novaVenda);
//          finally
//            ShowMessage('Venda realizadasso!');
//          end;
//        end;
//      idNo:
//        begin
//          ShowMessage('Operação cancelada!');
//        end;
//    End;
//      FreeAndNil(novaVenda);
//      NewVendaForm.Visible := False;
//    end;
//  end;

end;

end.
