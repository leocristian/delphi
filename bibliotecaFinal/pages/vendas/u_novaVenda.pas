unit u_novaVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, MemDS, VirtualTable, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Uni, u_vendaControle, DBAccess;

type
  TNovaVendaForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    labelPreco: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    TituloInput: TEdit;
    ClienteInput: TEdit;
    RealizarVendaBtn: TButton;
    AddLivro: TButton;
    vtb_livrosVenda: TVirtualTable;
    vds_livrosVenda: TDataSource;
    grid_livros: TDBGrid;
    ds_livrosVenda: TDataSource;
    tb_livrosVenda: TUniTable;
    procedure MostrarForm(Sender: TObject);
    procedure AtivarNavegacao(Sender: TObject; var Key: Char);
    procedure AddLivroClick(Sender: TObject);
    procedure CriarForm(Sender: TObject);
    procedure RealizarVendaBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NovaVendaForm: TNovaVendaForm;
  q1: TUniQuery;
  vendaControle: TVendaControle;

implementation

{$R *.dfm}

uses u_forms, u_dm1, u_escolhaLivro;

procedure TNovaVendaForm.AtivarNavegacao(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(wm_nextdlgctl, 0, 0);
  end
  else if key = #27 then close;
end;
procedure TNovaVendaForm.AddLivroClick(Sender: TObject);
begin
  if TituloInput.Text = '' then
  begin
    ShowMessage('Informe o t�tulo do livro!!');
  end
  else
  begin
    try
      q1.Close;
      q1.SQL.Clear;

      q1.SQL.Add('select * from livros where titulo like :titulo');
      q1.ParamByName('titulo').Value := '%' + TituloInput.Text + '%';

      q1.Open;

      if q1.RecordCount > 0 then
      begin
        EscolhaLivroForm.vtb_livrosEncontrados.Clear;
        q1.First;
        while not q1.Eof do
        begin
          EscolhaLivroForm.vtb_livrosEncontrados.Append;
          EscolhaLivroForm.vtb_livrosEncontrados['codigo'] := q1.FieldByName('codigo').AsInteger;
          EscolhaLivroForm.vtb_livrosEncontrados['titulo'] := q1.FieldByName('titulo').AsString;
          EscolhaLivroForm.vtb_livrosEncontrados['anoPublicacao'] := q1.FieldByName('ano_publicacao').AsString;
          EscolhaLivroForm.vtb_livrosEncontrados['preco'] := q1.FieldByName('preco').AsFloat;
          q1.Next;
        end;

        EscolhaLivroForm.ShowModal;
      end
      else
      begin
        ShowMessage('Livro n�o encontrado!');
      end;
    finally
    end;
  end;

end;

procedure TNovaVendaForm.CriarForm(Sender: TObject);
begin
  q1 := TUniQuery.Create(nil);
  q1.Connection := dm1.con1;
  vendaControle := TVendaControle.Create;
end;

procedure TNovaVendaForm.MostrarForm(Sender: TObject);
begin
  AbrirForm(NovaVendaForm);

  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top :=  (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
end;

procedure TNovaVendaForm.RealizarVendaBtnClick(Sender: TObject);
begin
  try

  finally
    vendaControle.ZerarValor;
    LabelPreco.Caption := FloatToStr(vendaControle.valorAtual);
  end;
end;

end.
