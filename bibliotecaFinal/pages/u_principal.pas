unit u_principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.StdCtrls;

type
  TFormPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Cadastro2: TMenuItem;
    sistema1: TMenuItem;
    Pessoas1: TMenuItem;
    usuarios: TMenuItem;
    clientes: TMenuItem;
    Outros1: TMenuItem;
    livros: TMenuItem;
    vendas: TMenuItem;
    relatorioVendas: TMenuItem;
    AlterarPerfil: TMenuItem;
    encerrar: TMenuItem;
    N1: TMenuItem;
    SelecaoBusca: TComboBox;
    Panel2: TPanel;
    Label1: TLabel;
    Verperfil1: TMenuItem;
    N2: TMenuItem;
    procedure AbrirForm(Sender: TObject);
    procedure usuariosClick(Sender: TObject);
    procedure clientesClick(Sender: TObject);
    procedure Verperfil1Click(Sender: TObject);
    procedure encerrarClick(Sender: TObject);
    procedure AlterarPerfilClick(Sender: TObject);
    procedure vendasClick(Sender: TObject);
    procedure livrosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

uses u_usuarios, u_clientes, u_login, u_perfil, u_vendas, u_livros;

procedure TFormPrincipal.AbrirForm(Sender: TObject);
begin
  FormPrincipal.WindowState := TWindowState.wsMaximized;
end;

procedure TFormPrincipal.clientesClick(Sender: TObject);
begin
  FormClientes.Parent := Panel2;
  FormClientes.Show;
end;

procedure TFormPrincipal.encerrarClick(Sender: TObject);
begin
  FormPrincipal.Visible := False;
  LoginForm.LoginInput.SetFocus;
end;

procedure TFormPrincipal.livrosClick(Sender: TObject);
begin
  FormLivros.Parent := Panel2;
  FormLivros.Show;
end;

procedure TFormPrincipal.usuariosClick(Sender: TObject);
begin
  FormUsuarios.Parent := Panel2;
  FormUsuarios.Show;
end;

procedure TFormPrincipal.vendasClick(Sender: TObject);
begin
  FormVendas.Parent := Panel2;
  FormVendas.Show;
end;

procedure TFormPrincipal.Verperfil1Click(Sender: TObject);
begin
  PerfilUsuario.ModoInput.Text := 'V';
  PerfilUsuario.ShowModal;
end;

procedure TFormPrincipal.AlterarPerfilClick(Sender: TObject);
begin
  PerfilUsuario.ModoInput.Text := 'A';
  PerfilUsuario.ShowModal;
end;

end.
