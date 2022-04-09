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
    Panel1: TPanel;
    BuscaInput: TEdit;
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
    grid_usuariosDBTableView1codigo: TcxGridDBColumn;
    grid_usuariosDBTableView1nome_completo: TcxGridDBColumn;
    grid_usuariosDBTableView1login: TcxGridDBColumn;
    procedure FocarInput(Sender: TObject);
    procedure VisualizarUsuarioClick(Sender: TObject);
    procedure AlterarUsuarioClick(Sender: TObject);

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

procedure TFormUsuarios.FocarInput(Sender: TObject);
begin
  Self.BuscaInput.SetFocus;
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
