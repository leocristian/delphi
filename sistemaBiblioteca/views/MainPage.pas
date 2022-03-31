unit MainPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, MenuFrame,
  Vcl.ToolWin, Vcl.ComCtrls, System.Actions, Vcl.ActnList, Vcl.ExtCtrls,
  dxBarBuiltInMenu, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore;
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
    RelatorioGeral: TMenuItem;
    N2: TMenuItem;
    Sair: TMenuItem;
    ActionList1: TActionList;
    ShowUsersPage: TAction;
    ShowClientsPage: TAction;
    ShowBooksPage: TAction;
    Livros1: TMenuItem;
    PageControl1: TPageControl;
    Welcome: TTabSheet;
    Label1: TLabel;
    ShowPublishersPage: TAction;
    procedure AbrirForm(Sender: TObject);
    procedure Finalizar(Sender: TObject);
    procedure AbrirTelaUsuarios(Sender: TObject);
    procedure AbrirTelaClientes(Sender: TObject);
    procedure AbrirTelaLivros(Sender: TObject);
    procedure AbrirTelaEditoras(Sender: TObject);

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

uses UserPage, ClientPage, LivrosPage, EditorasPage;

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
