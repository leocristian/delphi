unit u_usuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations,
  Data.DB, cxDBData, Vcl.Menus, MemDS, DBAccess, Uni, Vcl.StdCtrls, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Vcl.ExtCtrls;

type
  TFormUsuarios = class(TForm)
    bt_busca: TButton;
    grid_usuarios: TcxGrid;
    grid_usuariosDBTableView1: TcxGridDBTableView;
    grid_usuariosLevel1: TcxGridLevel;
    SelecaoBusca: TComboBox;
    PopupUsuarios: TPopupMenu;
    VisualizarUsuario: TMenuItem;
    AlterarUsuario: TMenuItem;
    N2: TMenuItem;
    ExcluirUsuario: TMenuItem;
    BuscaInput: TEdit;
    tb_usuarios: TUniTable;
    ds_usuarios: TDataSource;
    grid_usuariosDBTableView1codigo: TcxGridDBColumn;
    grid_usuariosDBTableView1nome_completo: TcxGridDBColumn;
    grid_usuariosDBTableView1email: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    bt_mostrarTudo: TButton;
    Panel1: TPanel;
    procedure FocarInput(Sender: TObject);
    procedure VisualizarUsuarioClick(Sender: TObject);
    procedure AlterarUsuarioClick(Sender: TObject);
    procedure ExcluirUsuarioClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bt_buscaClick(Sender: TObject);
    procedure bt_mostrarTudoClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormUsuarios: TFormUsuarios;

implementation

{$R *.dfm}

uses u_dm1, u_mostrar;

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

    q1.SQL.Add('select * from usuarios2 ');
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
  q1: TUniQuery;
begin

  buscaInfo := BuscaInput.Text;

  q1 := TUniQuery.Create(nil);
  q1.Connection := dm1.con1;

  if Self.SelecaoBusca.Text = 'CÓDIGO' then
  begin
    q1.Close;
    q1.SQL.Clear;

    q1.SQL.Add('select * from usuarios2 ');
    q1.SQL.Add(' where codigo = :codigo');

    q1.ParamByName('codigo').Value := buscaInfo;

    try
      q1.Open;
      if(q1.RecordCount > 0 ) then
      begin
        ds_usuarios.DataSet.Filter := 'codigo = ' + buscaInfo;
        ds_usuarios.DataSet.Filtered := True;
        grid_usuariosDBTableView1.DataController.RefreshExternalData;
        buscaInput.Text := '';
      end
      else
      begin
        ShowMessage('Usuário não encontrado!');
      end;
    except
      ShowMessage('Erro ao buscar usuário!');
    end;
  end
  else if Self.SelecaoBusca.Text = 'NOME COMPLETO' then
  begin
    q1.Close;
    q1.SQL.Clear;

    q1.SQL.Add('select * from usuarios2 ');
    q1.SQL.Add(' where nome_completo like :nome');

    q1.ParamByName('nome').Value := '%' + buscaInfo + '%';

    try
      q1.Open;
      if(q1.RecordCount > 0 ) then
      begin
        ds_usuarios.DataSet.Filter := 'nome_completo like ' + QuotedStr('%' + buscaInfo + '%');
        ds_usuarios.DataSet.Filtered := True;
        grid_usuariosDBTableView1.DataController.RefreshExternalData;
        buscaInput.Text := '';
      end
      else
      begin
        ShowMessage('Usuário não encontrado!');
      end;
    except
      ShowMessage('Erro ao buscar usuário!');
    end;
  end
  else if Self.SelecaoBusca.Text = 'EMAIL' then
  begin
    q1.Close;
    q1.SQL.Clear;

    q1.SQL.Add('select * from usuarios2 ');
    q1.SQL.Add(' where email like :email');

    q1.ParamByName('email').Value := '%' + buscaInfo + '%';

    try
      q1.Open;
      if(q1.RecordCount > 0 ) then
      begin
        ds_usuarios.DataSet.Filter := 'email like ' + QuotedStr('%' + buscaInfo + '%');
        ds_usuarios.DataSet.Filtered := True;
        grid_usuariosDBTableView1.DataController.RefreshExternalData;
        buscaInput.Text := '';
      end
      else
      begin
        ShowMessage('Usuário não encontrado!');
      end;
    except
      ShowMessage('Erro ao buscar usuário!');
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
  msgExcluir: String;

begin
  try
    q1 := TUniQuery.Create(nil);
    q1.Connection := dm1.con1;

    q1.Close;
    q1.SQL.Clear;

    indexUsuario := grid_usuariosDBTableView1.DataController.GetSelectedRowIndex(0);
    codUsuario := grid_usuariosDBTableView1.ViewData.Records[indexUsuario].Values[0];

    q1.SQL.Add('delete from usuarios2 where codigo = :codigo');

    q1.ParamByName('codigo').Value := codUsuario;

    msgExcluir := 'Confirmar exclusão do usuário ' + IntToStr(codUsuario) + '?';

    try

      case
        MessageBox(Application.Handle, 'Confirmar exclusão de usuário?', 'Excluir usuário', MB_YESNO) of
        idYes:
          begin
            q1.ExecSQL;
            ShowMessage('Usuário excluído com sucesso! código: ' + IntToStr(codUsuario));
            Self.grid_usuariosDBTableView1.DataController.RefreshExternalData;
          end;
        idNo: ShowMessage('Operação cancelada!');
      end;

    except
      ShowMessage('Erro ao excluir usuário!');
    end;
  finally
    FreeAndNil(q1);
  end;
end;

procedure TFormUsuarios.FocarInput(Sender: TObject);
begin
  Self.BuscaInput.SetFocus;
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

    q1.SQL.Add('select * from usuarios2 ');
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
