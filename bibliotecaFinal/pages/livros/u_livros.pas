unit u_livros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations,
  Data.DB, cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, Vcl.Menus, MemDS, DBAccess, Uni, Vcl.StdCtrls, cxGridLevel,
  cxGridCustomView, cxGrid, Vcl.ExtCtrls, frame_busca, frxClass,
  frxDBSet;

type
  TFormLivros = class(TForm)
    grid_livros: TcxGrid;
    grid_livrosDBTableView1: TcxGridDBTableView;
    grid_livrosLevel1: TcxGridLevel;
    tb_livros: TUniTable;
    PopupLivros: TPopupMenu;
    VisualizarLivro: TMenuItem;
    NovoLivro: TMenuItem;
    AlterarLivro: TMenuItem;
    N2: TMenuItem;
    ExcluirLivro: TMenuItem;
    ds_livros: TDataSource;
    grid_livrosDBTableView1codigo: TcxGridDBColumn;
    grid_livrosDBTableView1titulo: TcxGridDBColumn;
    grid_livrosDBTableView1editora: TcxGridDBColumn;
    grid_livrosDBTableView1ano_publicacao: TcxGridDBColumn;
    grid_livrosDBTableView1preco: TcxGridDBColumn;
    grid_livrosDBTableView1categoria: TcxGridDBColumn;
    RelatorioLivros: TMenuItem;
    FrameBusca1: TFrameBusca;
    rel_livros: TfrxReport;
    ds_rel_livros: TfrxDBDataset;
    procedure NovoLivroClick(Sender: TObject);
    procedure bt_buscaClick(Sender: TObject);
    procedure bt_mostrarTudoClick(Sender: TObject);
    procedure VisualizarLivroClick(Sender: TObject);
    procedure AlterarLivroClick(Sender: TObject);
    procedure ExcluirLivroClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RelatorioLivrosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLivros: TFormLivros;

implementation

{$R *.dfm}

uses u_novoLivro, u_dm1, u_mostrarLivro, u_forms;

procedure TFormLivros.AlterarLivroClick(Sender: TObject);
var
  q1: TUniQuery;
  codLivro: Integer;
  indexLivro: Integer;

begin
  try
    q1 := TUniQuery.Create(nil);
    q1.Connection := dm1.con1;

    q1.Close;
    q1.SQL.Clear;

    indexLivro := grid_livrosDBTableView1.DataController.GetSelectedRowIndex(0);
    codLivro := grid_livrosDBTableView1.ViewData.Records[indexLivro].Values[0];

    q1.SQL.Add('select * from livros ');
    q1.SQL.Add('where ');
    q1.SQL.Add('codigo = :codigo');

    q1.ParamByName('codigo').Value := codLivro;

    q1.Open;

    if q1.RecordCount > 0 then
    begin
      MostrarLivroForm.CodigoInput.Text := q1.FieldByName('codigo').Value;
      MostrarLivroForm.TituloInput.Text := q1.FieldByName('titulo').Value;
      MostrarLivroForm.EditoraInput.Text :=  q1.FieldByName('editora').Value;
      MostrarLivroForm.AnoPublicacao.Date := StrToDate(q1.FieldByName('ano_publicacao').Value);
      MostrarLivroForm.PrecoInput.Text := FloatToStr(q1.FieldByName('preco').Value);
      MostrarLivroForm.CategoriaInput.Text := q1.FieldByName('categoria').Value;

      MostrarLivroForm.ModoInput.Text := 'A';
    end;

  finally
    MostrarLivroForm.ShowModal;
    FreeAndNil(q1);
  end;
end;

procedure TFormLivros.bt_buscaClick(Sender: TObject);
var
  buscaInfo: String;

begin

  buscaInfo := FrameBusca1.BuscaInput.Text;

  if buscaInfo = '' then
  begin
    aviso('Informe uma palavra-chave válida!');
    FrameBusca1.BuscaInput.SetFocus;
    Exit;
  end;

  if FrameBusca1.SelecaoBusca.Text = 'CÓDIGO' then
  begin
    ds_livros.DataSet.Filter := 'codigo = ' + buscaInfo;
  end
  else if FrameBusca1.SelecaoBusca.Text = 'CATEGORIA' then
  begin
    ds_livros.DataSet.Filter := 'categoria like ' + QuotedStr('%' + buscaInfo + '%');
  end
  else if FrameBusca1.SelecaoBusca.Text = 'EDITORA' then
  begin
    ds_livros.DataSet.Filter := 'editora like ' + QuotedStr('%' + buscaInfo + '%');
  end
  else if FrameBusca1.SelecaoBusca.Text = 'TÍTULO' then
  begin
    ds_livros.DataSet.Filter := 'titulo like ' + QuotedStr('%' + buscaInfo + '%');
  end;

  try
    ds_livros.DataSet.Filtered := True;
    grid_livrosDBTableView1.DataController.RefreshExternalData;
    FrameBusca1.buscaInput.Text := '';
  except on E:Exception do
    if E.Message.Contains('not found') then
    begin
      erro('Digite apenas números para buscar por código!');
      FrameBusca1.BuscaInput.SetFocus;
    end;
  end;

end;

procedure TFormLivros.bt_mostrarTudoClick(Sender: TObject);
begin
  ds_livros.DataSet.Filtered := False;
  grid_livrosDBTableView1.DataController.RefreshExternalData;
end;

procedure TFormLivros.ExcluirLivroClick(Sender: TObject);
var
  indexLivro, codLivro: Integer;
begin
  q1.Close;
  q1.SQL.Clear;

  indexLivro := grid_livrosDBTableView1.DataController.GetSelectedRowIndex(0);
  codLivro := grid_livrosDBTableView1.ViewData.Records[indexLivro].Values[0];

  q1.SQL.Add('delete from livros where codigo = :codigo');

  q1.ParamByName('codigo').Value := codLivro;

  case MessageBox(Application.Handle, 'Confirmar exclusão de livro?', 'Excluir livro', MB_YESNO) of
  idYes:
    begin
      try
        q1.ExecSQL;
        ShowMessage('Livro excluído com sucesso!');
        grid_livrosDBTableView1.DataController.RefreshExternalData;
      except
        ShowMessage('Erro ao excluir livro!');
      end;
    end;
  idNo: ShowMessage('Operação cancelada!');
  end;
end;

procedure TFormLivros.FormCreate(Sender: TObject);
begin
  if dm1.con1.Connected = True then
  begin
    tb_livros.Connection := dm1.con1;
    tb_livros.TableName := 'livros';
    tb_livros.Active := True;
  end
  else
  begin
    dm1.con1.Connect;

    tb_livros.Connection := dm1.con1;
    tb_livros.TableName := 'livros';
    tb_livros.Active := True;
  end;
end;

procedure TFormLivros.NovoLivroClick(Sender: TObject);
begin
  NovoLivroForm.ShowModal;
end;

procedure TFormLivros.RelatorioLivrosClick(Sender: TObject);
begin
  ds_rel_livros.DataSource := ds_livros;
  rel_livros.ShowReport;
end;

procedure TFormLivros.VisualizarLivroClick(Sender: TObject);
var
  q1: TUniQuery;
  codLivro: Integer;
  indexLivro: Integer;

begin
  try
    q1 := TUniQuery.Create(nil);
    q1.Connection := dm1.con1;

    q1.Close;
    q1.SQL.Clear;

    indexLivro := grid_livrosDBTableView1.DataController.GetSelectedRowIndex(0);
    codLivro := grid_livrosDBTableView1.ViewData.Records[indexLivro].Values[0];

    q1.SQL.Add('select * from livros ');
    q1.SQL.Add('where ');
    q1.SQL.Add('codigo = :codigo');

    q1.ParamByName('codigo').Value := codLivro;

    q1.Open;

    if q1.RecordCount > 0 then
    begin
      MostrarLivroForm.CodigoInput.Text := q1.FieldByName('codigo').Value;
      MostrarLivroForm.TituloInput.Text := q1.FieldByName('titulo').Value;
      MostrarLivroForm.EditoraInput.Text :=  q1.FieldByName('editora').Value;
      MostrarLivroForm.AnoPublicacao.Date := StrToDate(q1.FieldByName('ano_publicacao').Value);
      MostrarLivroForm.PrecoInput.Text := FloatToStr(q1.FieldByName('preco').Value);
      MostrarLivroForm.CategoriaInput.Text := q1.FieldByName('categoria').Value;

      MostrarLivroForm.ModoInput.Text := 'V';
    end;

  finally
    MostrarLivroForm.ShowModal;
    FreeAndNil(q1);
  end;

end;
end.
