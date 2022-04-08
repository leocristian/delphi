program Biblioteca;
uses
  Vcl.Forms,
  MainPage in 'MainPage.pas' {FormPrincipal},
  LoginPage in 'views\LoginPage.pas' {FormUsuario},
  UserPage in 'views\usuario\UserPage.pas' {UserForm},
  MenuFrame in 'MenuFrame.pas' {BuscaPessoa: TFrame},
  ClientPage in 'views\cliente\ClientPage.pas' {ClientForm},
  LivrosPage in 'views\livro\LivrosPage.pas' {LivrosForm},
  EditorasPage in 'views\editora\EditorasPage.pas' {EditorasForm: T},
  Usuario in 'controllers\Usuario.pas',
  dmDatabase in 'services\dmDatabase.pas' {DataModule1: TDataModule},
  Cliente in 'controllers\Cliente.pas',
  NewUserPage in 'views\usuario\NewUserPage.pas' {NewUserForm},
  NewClientPage in 'views\cliente\NewClientPage.pas' {NewClientForm},
  NewEditoraPage in 'views\editora\NewEditoraPage.pas' {NewEditoraForm},
  Editora in 'controllers\Editora.pas',
  Livro in 'controllers\Livro.pas',
  NewLivroPage in 'views\livro\NewLivroPage.pas' {NewLivroForm},
  VendasPage in 'views\venda\VendasPage.pas' {VendasForm},
  NewVendaPage in 'views\venda\NewVendaPage.pas' {NewVendaForm},
  Venda in 'controllers\Venda.pas',
  FormManipulation in 'controllers\formManipulation\FormManipulation.pas',
  ShowUserPage in 'views\usuario\ShowUserPage.pas' {ShowUsuarioForm},
  EditUserPage in 'views\usuario\EditUserPage.pas' {EditUserForm},
  ShowClientePage in 'views\cliente\ShowClientePage.pas' {ShowClienteForm},
  EditClientePage in 'views\cliente\EditClientePage.pas' {EditClienteForm},
  ShowEditoraPage in 'views\editora\ShowEditoraPage.pas' {ShowEditoraForm},
  EditEditoraPage in 'views\editora\EditEditoraPage.pas' {EditEditoraForm},
  VendaControle in 'controllers\VendaControle.pas',
  AlterarSenhaPage in 'views\usuario\AlterarSenhaPage.pas' {AlterarSenhaForm},
  BuscaControle in 'controllers\BuscaControle.pas',
  livroVenda in 'controllers\livroVenda.pas',
  ShowVendaPage in 'views\venda\ShowVendaPage.pas' {ShowVendaForm};

{$R *.res}
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormUsuario, FormUsuario);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TNewUserForm, NewUserForm);
  Application.CreateForm(TLivrosForm, LivrosForm);
  Application.CreateForm(TUserForm, UserForm);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TClientForm, ClientForm);
  Application.CreateForm(TEditorasForm, EditorasForm);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TNewClientForm, NewClientForm);
  Application.CreateForm(TNewEditoraForm, NewEditoraForm);
  Application.CreateForm(TNewLivroForm, NewLivroForm);
  Application.CreateForm(TNewVendaForm, NewVendaForm);
  Application.CreateForm(TVendasForm, VendasForm);
  Application.CreateForm(TShowUsuarioForm, ShowUsuarioForm);
  Application.CreateForm(TEditUserForm, EditUserForm);
  Application.CreateForm(TShowClienteForm, ShowClienteForm);
  Application.CreateForm(TEditClienteForm, EditClienteForm);
  Application.CreateForm(TShowEditoraForm, ShowEditoraForm);
  Application.CreateForm(TEditEditoraForm, EditEditoraForm);
  Application.CreateForm(TAlterarSenhaForm, AlterarSenhaForm);
  Application.CreateForm(TShowVendaForm, ShowVendaForm);
  Application.Run;
end.
