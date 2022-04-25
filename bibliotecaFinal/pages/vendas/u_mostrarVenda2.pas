unit u_mostrarVenda2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  frame_grid, MemDS, VirtualTable, Uni, u_vendaControle;

type
  TFormVenda = class(TForm)
    Panel1: TPanel;
    Label4: TLabel;
    Label7: TLabel;
    TituloPagina: TLabel;
    TituloLabel: TLabel;
    AddLivro: TButton;
    ClienteInput: TEdit;
    CodigoInput: TEdit;
    TituloInput: TEdit;
    ValorVenda: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    ModoInput: TEdit;
    grid_livros: TcxGrid;
    grid_livrosDBTableView1: TcxGridDBTableView;
    grid_livrosLevel1: TcxGridLevel;
    Label2: TLabel;
    frame_estilo_grid1: Tframe_estilo_grid;
    vtb_livrosVenda: TVirtualTable;
    vds_livrosVenda: TDataSource;
    grid_livrosDBTableView1codigo: TcxGridDBColumn;
    grid_livrosDBTableView1titulo: TcxGridDBColumn;
    grid_livrosDBTableView1editora: TcxGridDBColumn;
    grid_livrosDBTableView1ano_publicacao: TcxGridDBColumn;
    grid_livrosDBTableView1preco: TcxGridDBColumn;
    grid_livrosDBTableView1categoria: TcxGridDBColumn;
    grid_livrosDBTableView1qtdEscolhida: TcxGridDBColumn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure AddLivroClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormVenda: TFormVenda;
  vendaControle: TVendaControle;

implementation

{$R *.dfm}

uses u_forms, u_escolhaLivro, u_dm1;

procedure TFormVenda.AddLivroClick(Sender: TObject);
var
  q1: TUniQuery;
begin
  if TituloInput.Text = '' then
  begin
    aviso('Informe o título do livro!!');
    TituloInput.SetFocus;
  end
  else
  begin
    try

      q1 := TUniQuery.Create(nil);
      q1.Connection := dm1.con1;

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
          EscolhaLivroForm.vtb_livrosEncontrados['editora'] := q1.FieldByName('editora').AsString;
          EscolhaLivroForm.vtb_livrosEncontrados['anoPublicacao'] := q1.FieldByName('ano_publicacao').AsString;
          EscolhaLivroForm.vtb_livrosEncontrados['preco'] := q1.FieldByName('preco').AsFloat;
          EscolhaLivroForm.vtb_livrosEncontrados['categoria'] := q1.FieldByName('categoria').AsString;
          EscolhaLivroForm.vtb_livrosEncontrados['qtdEstoque'] := q1.FieldByName('qtd_estoque').AsInteger;

          q1.Next;
        end;

        EscolhaLivroForm.ShowModal;
      end
      else
      begin
        ShowMessage('Livro não encontrado!');
      end;
    finally
      FreeAndNil(q1);
    end;
  end;
end;

procedure TFormVenda.FormCreate(Sender: TObject);
begin
  vendaControle := TVendaControle.Create;
end;

procedure TFormVenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(wm_nextdlgctl, 0, 0);
  end
  else if key = #27 then close
end;

procedure TFormVenda.FormShow(Sender: TObject);
begin
  AbrirForm(FormVenda);

  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top :=  (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;

  if ModoInput.Text = 'V' then
  begin
    panel1.Enabled := False;
    TituloLabel.Visible := False;
    TituloInput.Visible := False;
    AddLivro.Visible := False;
  end
  else if ModoInput.Text = 'N' then
  begin
    panel1.Enabled := True;
    TituloLabel.Visible := True;
    TituloInput.Visible := True;
    AddLivro.Visible := True;

    VendaControle.ZerarValor;
    ValorVenda.Caption := FloatToStr(VendaControle.valorAtual);
    vtb_livrosVenda.Clear;
  end;
end;

end.
