unit MainPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, MenuFrame,
  Vcl.ToolWin, Vcl.ComCtrls, System.Actions, Vcl.ActnList, Vcl.ExtCtrls,
  dxGDIPlusClasses;

type
  TFormPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros: TMenuItem;
    Pessoas: TMenuItem;
    Usuarios: TMenuItem;
    Clientes: TMenuItem;
    Outros: TMenuItem;
    Editoras: TMenuItem;
    Vendas: TMenuItem;
    RealizarVenda: TMenuItem;
    N1: TMenuItem;
    RelatorioVendas: TMenuItem;
    Sistema: TMenuItem;
    Sair: TMenuItem;
    ActionList1: TActionList;
    ShowUsuariosPage: TAction;
    ShowClientesPage: TAction;
    ShowLivrosPage: TAction;
    Livros1: TMenuItem;
    PageControl1: TPageControl;
    Welcome: TTabSheet;
    ShowEditorasPage: TAction;
    ShowVendasPage: TAction;
    Label1: TLabel;
    Alterarsenha1: TMenuItem;
    N2: TMenuItem;
    Image1: TImage;

    procedure AbrirForm(Sender: TObject);
    procedure Finalizar(Sender: TObject);
    procedure AbrirTelaUsuarios(Sender: TObject);
    procedure AbrirTelaClientes(Sender: TObject);
    procedure AbrirTelaLivros(Sender: TObject);
    procedure AbrirTelaEditoras(Sender: TObject);
    procedure AbrirTelaVendas(Sender: TObject);
    procedure AbrirRelatorioVendas(Sender: TObject);
    procedure AlterarSenha(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;
  tabSheet: TTabSheet;

implementation

{$R *.dfm}

uses UserPage, ClientPage, LivrosPage, EditorasPage, VendasPage, dmDatabase,
  LoginPage;

procedure TFormPrincipal.AbrirForm(Sender: TObject);
begin
  FormPrincipal.WindowState := TWindowState.wsMaximized;
end;

procedure TFormPrincipal.Finalizar(Sender: TObject);
begin
  ShowMessage('Programa encerrado!');
  Application.Terminate;
end;

procedure TFormPrincipal.AbrirTelaLivros(Sender: TObject);
begin

  tabSheet := TTabSheet.Create(FormPrincipal.PageControl1);
  tabSheet.PageControl := FormPrincipal.PageControl1;

  LivrosPage.LivrosForm.Parent := tabSheet;
  LivrosPage.LivrosForm.Visible := True;

  tabSheet.Caption := 'Livros';
  FormPrincipal.PageControl1.ActivePage := tabSheet;

end;

procedure TFormPrincipal.AbrirTelaUsuarios(Sender: TObject);
begin

  tabSheet := TTabSheet.Create(FormPrincipal.PageControl1);
  tabSheet.PageControl := FormPrincipal.PageControl1;

  UserPage.UserForm.Parent := tabSheet;
  UserPage.UserForm.Visible := True;

  tabSheet.Caption := 'Usuarios';
  FormPrincipal.PageControl1.ActivePage := tabSheet;

end;

procedure TFormPrincipal.AbrirTelaVendas(Sender: TObject);
begin
  tabSheet := TTabSheet.Create(FormPrincipal.PageControl1);
  tabSheet.PageControl := FormPrincipal.PageControl1;

  VendasPage.VendasForm.Parent := tabSheet;
  VendasPage.VendasForm.Visible := True;

  tabSheet.Caption := 'Vendas';
  FormPrincipal.PageControl1.ActivePage := tabSheet;
end;

procedure TFormPrincipal.AlterarSenha(Sender: TObject);
begin
  ShowMessage('Usuario logado: ');
end;

procedure TFormPrincipal.AbrirRelatorioVendas(Sender: TObject);
begin
  dmDatabase.DataModule1.ShowRelatorioVendas;
end;

procedure TFormPrincipal.AbrirTelaClientes(Sender: TObject);
begin

  tabSheet := TTabSheet.Create(FormPrincipal.PageControl1);
  tabSheet.PageControl := FormPrincipal.PageControl1;

  ClientPage.ClientForm.Parent := tabSheet;
  ClientPage.ClientForm.Visible := True;

  tabSheet.Caption := 'Clientes';
  FormPrincipal.PageControl1.ActivePage := tabSheet;

end;

procedure TFormPrincipal.AbrirTelaEditoras(Sender: TObject);
begin

  tabSheet := TTabSheet.Create(FormPrincipal.PageControl1);
  tabSheet.PageControl := FormPrincipal.PageControl1;

  EditorasPage.EditorasForm.Parent := tabSheet;
  EditorasPage.EditorasForm.Visible := True;

  tabSheet.Caption := 'Editoras';
  FormPrincipal.PageControl1.ActivePage := tabSheet;

end;

end.
