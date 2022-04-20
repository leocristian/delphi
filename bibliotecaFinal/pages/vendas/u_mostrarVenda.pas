unit u_mostrarVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, MemDS, VirtualTable,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, Vcl.Menus, Uni, u_vendaControle,
  frxClass, frxDBSet;

type
  TMostrarVendaForm = class(TForm)
    vtb_livrosVenda: TVirtualTable;
    Label2: TLabel;
    Label3: TLabel;
    labelPreco: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    TituloLabel: TLabel;
    TituloInput: TEdit;
    ClienteInput: TEdit;
    SalvarBtn: TButton;
    AddLivro: TButton;
    TituloPagina: TLabel;
    Label7: TLabel;
    CodigoInput: TEdit;
    ModoInput: TEdit;
    vds_livrosVenda: TDataSource;
    PopupMenu1: TPopupMenu;
    removerLivro: TMenuItem;
    grid_livrosDBTableView1: TcxGridDBTableView;
    grid_livrosLevel1: TcxGridLevel;
    grid_livros: TcxGrid;
    grid_livrosDBTableView1titulo: TcxGridDBColumn;
    grid_livrosDBTableView1ano_publicacao: TcxGridDBColumn;
    grid_livrosDBTableView1preco: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure removerLivroClick(Sender: TObject);
    procedure SalvarBtnClick(Sender: TObject);
    procedure AddLivroClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MostrarVendaForm: TMostrarVendaForm;
  q1: TUniQuery;
  vendaControle: TVendaControle;

implementation

{$R *.dfm}

uses u_forms, u_dm1, u_vendas, u_escolhaLivro, u_perfil;

procedure TMostrarVendaForm.AddLivroClick(Sender: TObject);
begin
  if TituloInput.Text = '' then
  begin
    ShowMessage('Informe o título do livro!!');
  end
  else
  begin
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
      ShowMessage('Livro não encontrado!');
    end;
  end;
end;

procedure TMostrarVendaForm.FormCreate(Sender: TObject);
begin
  q1 := TUniquery.Create(nil);
  q1.Connection := dm1.con1;

  vendaControle := TVendaControle.Create;
end;

procedure TMostrarVendaForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(wm_nextdlgctl, 0, 0);
  end
  else if key = #27 then close
end;

procedure TMostrarVendaForm.FormShow(Sender: TObject);
begin
  AbrirForm(MostrarVendaForm);

  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top :=  (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;

  if ModoInput.Text = 'N' then
  begin
    TituloPagina.Caption := 'Realizar nova venda';
    TituloInput.Visible := True;
    TituloInput.Clear;
    ClienteInput.Enabled := True;
    ClienteInput.Clear;
    ClienteInput.SetFocus;
    AddLivro.Visible := True;
    SalvarBtn.Caption := 'Realizar venda';
    SalvarBtn.Visible := True;
    TituloLabel.Visible := True;
    LabelPreco.Caption := vendaControle.valorAtual.ToString;
    grid_livros.Enabled := False;
    vds_livrosVenda.edit;
    vtb_livrosVenda.Clear;
//    ComprovanteBtn.Visible := False;
  end
  else if ModoInput.Text = 'V' then
    begin

      q1.Close;
      q1.SQL.Clear;

      q1.SQL.Add('select * from livros_venda2 ');
      q1.SQL.Add('where numero_venda = :numero_venda');

      q1.ParamByName('numero_venda').Value := StrToInt(CodigoInput.Text);

      q1.Open;
      q1.First;
      while not q1.Eof do
      begin
        vtb_livrosVenda.Append;
        vtb_livrosvenda['titulo'] := q1.FieldByName('titulo').Value;
        vtb_livrosvenda['editora'] := q1.FieldByName('editora').Value;
        vtb_livrosvenda['ano_publicacao'] := q1.FieldByName('ano_publicacao').Value;
        vtb_livrosvenda['preco'] := q1.FieldByName('preco').Value;
        vtb_livrosvenda['numero_venda'] := q1.FieldByName('numero_venda').Value;

        q1.Next;
      end;
      TituloPagina.Caption := 'Venda selecionada';
      TituloInput.Visible := False;
      ClienteInput.Enabled := False;
      AddLivro.Visible := False;
      SalvarBtn.visible := False;
      grid_livros.Enabled := False;
      TituloLabel.Visible := False;
//      ComprovanteBtn.Visible := True;
    end
    else if ModoInput.Text = 'A' then
    begin
      q1.Close;
      q1.SQL.Clear;

      q1.SQL.Add('select * from livros_venda2 ');
      q1.SQL.Add('where numero_venda = :numero_venda');

      q1.ParamByName('numero_venda').Value := StrToInt(CodigoInput.Text);

      q1.Open;
      q1.First;
      while not q1.Eof do
      begin
        vtb_livrosVenda.Append;
        vtb_livrosvenda['titulo'] := q1.FieldByName('titulo').Value;
        vtb_livrosvenda['editora'] := q1.FieldByName('editora').Value;
        vtb_livrosvenda['ano_publicacao'] := q1.FieldByName('ano_publicacao').Value;
        vtb_livrosvenda['preco'] := q1.FieldByName('preco').Value;
        vtb_livrosvenda['numero_venda'] := q1.FieldByName('numero_venda').Value;

        q1.Next;
      end;
      TituloPagina.Caption := 'Alterar venda selecionada';
      TituloInput.Visible := True;
      ClienteInput.Enabled := True;
      AddLivro.Visible := True;
      SalvarBtn.Caption := 'Salvar alterações';
      vds_livrosVenda.edit;
      SalvarBtn.Visible := True;
      TituloLabel.Visible := True;
      grid_livros.Enabled := True;
//      ComprovanteBtn.Visible := False;
      vendaControle.valorAtual := StrToInt(labelPreco.Caption);
    end;
end;

procedure TMostrarVendaForm.removerLivroClick(Sender: TObject);
var
  indexLivro: Integer;
  tituloLivro: String;
  precoLivro: String;

begin
  vds_livrosVenda.edit;
  indexLivro := grid_livrosDBTableView1.DataController.GetSelectedRowIndex(0);
  tituloLivro := grid_livrosDBTableView1.ViewData.Records[indexLivro].Values[0];
  precoLivro := grid_livrosDBTableView1.ViewData.Records[indexLivro].Values[2];

  q1.Close;
  q1.SQL.Clear;

  q1.SQL.Add('delete from livros_venda2 ');
  q1.SQL.Add('where titulo = :titulo');

  q1.ParamByName('titulo').Value := tituloLivro;

  q1.ExecSQL;
  vtb_livrosVenda.FieldByName('titulo').AsString := tituloLivro;
  vtb_livrosVenda.Delete;

  labelPreco.Caption := IntToStr(StrToInt(labelPreco.Caption) - StrToInt(precoLivro));
  vendaControle.valorAtual := StrToInt(labelPreco.Caption);

end;
procedure TMostrarVendaForm.SalvarBtnClick(Sender: TObject);
begin


    if ModoInput.Text = 'A' then
    begin
      q1.Close;
      q1.SQL.Clear;

      q1.SQL.Add('update vendas ');
      q1.SQL.Add('set cliente = :cliente, valor_total = :valor_total');
      q1.SQL.Add('where codigo = :codigo');

      q1.ParamByName('cliente').Value := ClienteInput.Text;
      q1.ParamByName('valor_total').Value := labelPreco.Caption;
      q1.ParamByName('codigo').Value := StrToInt(CodigoInput.Text);

      q1.execSQL;
      ShowMessage('Venda alterada com sucesso!');
      vendaControle.ZerarValor;
      Self.Close;
    end
    else if ModoInput.Text = 'N' then
    begin
      q1.Close;
      q1.SQL.Clear;

      q1.SQL.Add('select nome_completo from clientes2 where nome_completo like :nome');
      q1.ParamByName('nome').Value := '%' + ClienteInput.Text + '%';

      q1.ExecSQL;
      if q1.RecordCount = 1 then
      begin
        ClienteInput.Text := q1.FieldByName('nome_completo').Value;

        q1.Close;
        q1.SQL.Clear;

        q1.SQL.Add('insert into vendas ');
        q1.SQL.Add('values (:codigo, :vendedor, :cliente, :valor_total, :data )');

        q1.ParamByName('codigo').Value := CodigoInput.Text;
        q1.ParamByName('vendedor').Value := PerfilUsuario.NomeInput.Text;
        q1.ParamByName('cliente').Value := ClienteInput.Text;
        q1.ParamByName('valor_total').Value := labelPreco.Caption;
        q1.ParamByName('data').Value := Now();

        case MessageBox(Application.Handle, 'Confirmar nova venda?', 'Confirmar venda', MB_YESNO) of
        idYes:
          begin
            q1.ExecSQL;
            ShowMessage('Venda realizada com sucesso');
            FormVendas.grid_vendasDBTableView1.DataController.RefreshExternalData;

            vendaControle.ZerarValor;
            Self.Close;
          end;
        idNo:
          begin
            ShowMessage('Operação cancelada!');
          end;
        end;
      end
      else
      begin
        ShowMessage('Cliente nao encontrado!');
      end;
    end;
end;

end.
