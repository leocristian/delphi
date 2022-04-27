unit u_usuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations,
  Data.DB, cxDBData, Vcl.Menus, MemDS, DBAccess, Uni, Vcl.StdCtrls, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Vcl.ExtCtrls, frame_busca, frxClass, frxDBSet,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPSCore, dxPScxCommon,
  frame_grid;

type
  TFormUsuarios = class(TForm)
    grid_usuarios: TcxGrid;
    grid_usuariosDBTableView1: TcxGridDBTableView;
    grid_usuariosLevel1: TcxGridLevel;
    PopupUsuarios: TPopupMenu;
    VisualizarUsuario: TMenuItem;
    AlterarUsuario: TMenuItem;
    N2: TMenuItem;
    ExcluirUsuario: TMenuItem;
    tb_usuarios: TUniTable;
    ds_usuarios: TDataSource;
    grid_usuariosDBTableView1codigo: TcxGridDBColumn;
    grid_usuariosDBTableView1nome_completo: TcxGridDBColumn;
    grid_usuariosDBTableView1email: TcxGridDBColumn;
    FrameBusca1: TFrameBusca;
    RelatorioUsuarios: TMenuItem;
    rel_usuarios: TfrxReport;
    ds_rel_usuarios: TfrxDBDataset;
    frame_estilo_grid1: Tframe_estilo_grid;
    procedure FormShow(Sender: TObject);
    procedure VisualizarUsuarioClick(Sender: TObject);
    procedure AlterarUsuarioClick(Sender: TObject);
    procedure ExcluirUsuarioClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bt_buscaClick(Sender: TObject);
    procedure bt_mostrarTudoClick(Sender: TObject);
    procedure FrameBusca1BuscaInputClick(Sender: TObject);
    procedure RelatorioUsuariosClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormUsuarios: TFormUsuarios;

implementation

{$R *.dfm}

uses u_dm1, u_mostrar, u_forms, frame_estilo;

procedure TFormUsuarios.AlterarUsuarioClick(Sender: TObject);
var
  q1: TUniQuery;
  codUsuario: Integer;
  indexUsuario: Integer;

begin
  try
    q1 := TUniQuery.Create(nil);
    q1.Connection := dm1.con1;

    q1.Close;
    q1.SQL.Clear;

    indexUsuario := grid_usuariosDBTableView1.DataController.GetSelectedRowIndex(0);
    codUsuario := grid_usuariosDBTableView1.ViewData.Records[indexUsuario].Values[0];

    q1.SQL.Add('select * from usuarios ');
    q1.SQL.Add('where ');
    q1.SQL.Add('codigo = :codigo');

    q1.ParamByName('codigo').Value := codUsuario;

    q1.Open;

    if q1.RecordCount > 0 then
    begin
      UsuarioForm.CodigoInput.Text := q1.FieldByName('codigo').Value;
      UsuarioForm.NomeInput.Text :=  q1.FieldByName('nome_completo').Value;
      UsuarioForm.EmailInput.Text := q1.FieldByName('email').Value;
      UsuarioForm.LoginInput.Text := q1.FieldByName('login').Value;
      UsuarioForm.ModoInput.Text := 'A';
    end;

  finally
    UsuarioForm.ShowModal;
    FreeAndNil(q1);
  end;
end;

procedure TFormUsuarios.bt_buscaClick(Sender: TObject);
var
  buscaInfo: String;

begin

  buscaInfo := FrameBusca1.BuscaInput.Text;

  if buscaInfo = '' then
  begin
    aviso('Informe uma palavra-chave válida!');
    FrameBusca1.BuscaInput.SetFocus;
    exit;
  end;

  if FrameBusca1.SelecaoBusca.Text = 'CÓDIGO' then
  begin
    ds_usuarios.DataSet.Filter := 'codigo = ' + buscaInfo;
  end
  else if FrameBusca1.SelecaoBusca.Text = 'NOME COMPLETO' then
  begin
    ds_usuarios.DataSet.Filter := 'nome_completo like ' + QuotedStr('%' + buscaInfo + '%');
  end
  else if FrameBusca1.SelecaoBusca.Text = 'EMAIL' then
  begin
    ds_usuarios.DataSet.Filter := 'email like ' + QuotedStr('%' + LowerCase(buscaInfo) + '%');
  end;

  try
    ds_usuarios.DataSet.Filtered := True;
    grid_usuariosDBTableView1.DataController.RefreshExternalData;
    FrameBusca1.BuscaInput.Text := '';
    grid_usuariosDBTableView1.OptionsView.NoDataToDisplayInfoText := '';
  except on E:Exception do
    if E.Message.Contains('not found') then
    begin
      erro('Digite apenas números para buscar por código!');
      FrameBusca1.BuscaInput.SetFocus;
    end;
  end;

end;

procedure TFormUsuarios.bt_mostrarTudoClick(Sender: TObject);
begin
  ds_usuarios.DataSet.Filtered := False;
  grid_usuariosDBTableView1.DataController.RefreshExternalData;
end;

procedure TFormUsuarios.ExcluirUsuarioClick(Sender: TObject);
var
  q1: TUniQuery;
  indexUsuario: Integer;
  codUsuario: Integer;

begin
  try
    q1 := TUniQuery.Create(nil);
    q1.Connection := dm1.con1;

    q1.Close;
    q1.SQL.Clear;

    indexUsuario := grid_usuariosDBTableView1.DataController.GetSelectedRowIndex(0);
    codUsuario := grid_usuariosDBTableView1.ViewData.Records[indexUsuario].Values[0];

    q1.SQL.Add('delete from usuarios where codigo = :codigo');

    q1.ParamByName('codigo').Value := codUsuario;

    try
      if confirma('Confirmar exclusão de usuário?') then
      begin
        q1.ExecSQL;
        MessageDlg('Usuário excluído com sucesso!', mtConfirmation, [mbOk], 0);
        Self.grid_usuariosDBTableView1.DataController.RefreshExternalData;
      end;
    except
      erro('Erro ao excluir usuário');
    end;
  finally
    FreeAndNil(q1);
  end;
end;

procedure TFormUsuarios.FormShow(Sender: TObject);
begin
//  dm1.con1.Close;

  tb_usuarios.Connection := dm1.con1;
  tb_usuarios.TableName := 'usuarios';
  ds_usuarios.DataSet := tb_usuarios;
  tb_usuarios.Active := True;

//  dm1.con1.Open;
end;

procedure TFormUsuarios.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(wm_nextdlgctl, 0, 0);
  end
  else if key = #27 then close;
end;

procedure TFormUsuarios.FrameBusca1BuscaInputClick(Sender: TObject);
begin
  FrameBusca1.BuscaInput.SetFocus;
end;

procedure TFormUsuarios.RelatorioUsuariosClick(Sender: TObject);
begin
  ds_rel_usuarios.DataSource := ds_usuarios;
  rel_usuarios.ShowReport(true);
end;

procedure TFormUsuarios.VisualizarUsuarioClick(Sender: TObject);
var
  q1: TUniQuery;
  codUsuario: Integer;
  indexUsuario: Integer;

begin
  try
    q1 := TUniQuery.Create(nil);
    q1.Connection := dm1.con1;

    q1.Close;
    q1.SQL.Clear;

    indexUsuario := grid_usuariosDBTableView1.DataController.GetSelectedRowIndex(0);
    codUsuario := grid_usuariosDBTableView1.ViewData.Records[indexUsuario].Values[0];

    q1.SQL.Add('select * from usuarios ');
    q1.SQL.Add('where ');
    q1.SQL.Add('codigo = :codigo');

    q1.ParamByName('codigo').Value := codUsuario;

    q1.Open;

    if q1.RecordCount > 0 then
    begin
      UsuarioForm.CodigoInput.Text := q1.FieldByName('codigo').Value;
      UsuarioForm.NomeInput.Text :=  q1.FieldByName('nome_completo').Value;
      UsuarioForm.EmailInput.Text := q1.FieldByName('email').Value;
      UsuarioForm.LoginInput.Text := q1.FieldByName('login').Value;
      UsuarioForm.ModoInput.Text := 'V';
    end;

  finally
    UsuarioForm.ShowModal;
    FreeAndNil(q1);
  end;
end;

end.
