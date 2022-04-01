program Biblioteca;

uses
  Vcl.Forms,
  MainPage in 'MainPage.pas' {FormPrincipal},
  LoginPage in 'views\LoginPage.pas' {FormUsuario},
  UserPage in 'views\UserPage.pas' {UserForm},
  MenuFrame in 'MenuFrame.pas' {BuscaPessoa: TFrame},
  ClientPage in 'views\ClientPage.pas' {ClientForm},
  LivrosPage in 'views\LivrosPage.pas' {LivrosForm},
  EditorasPage in 'views\EditorasPage.pas' {EditorasForm: T},
  Usuario in 'controllers\Usuario.pas',
  dmDatabase in 'services\dmDatabase.pas' {DataModule1: TDataModule},
  Cliente in 'controllers\Cliente.pas',
  NewUserPage in 'views\NewUserPage.pas' {NewUserForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormUsuario, FormUsuario);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TUserForm, UserForm);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TClientForm, ClientForm);
  Application.CreateForm(TLivrosForm, LivrosForm);
  Application.CreateForm(TEditorasForm, EditorasForm);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TNewUserForm, NewUserForm);
  Application.Run;
end.
