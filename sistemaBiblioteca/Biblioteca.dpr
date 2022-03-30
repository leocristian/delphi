program Biblioteca;

uses
  Vcl.Forms,
  MainPage in 'MainPage.pas' {FormPrincipal},
  LoginPage in 'LoginPage.pas' {FormUsuario},
  UserPage in 'UserPage.pas' {UserForm},
  dmDatabase in 'dmDatabase.pas' {DataModule1: TDataModule},
  MenuFrame in 'MenuFrame.pas' {BuscaPessoa: TFrame},
  ClientPage in 'ClientPage.pas' {ClientForm},
  UserUnit in 'UserUnit.pas' {UserScreen: TDataModule},
  LivrosPage in 'LivrosPage.pas' {LivrosForm},
  EditorasPage in 'EditorasPage.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormUsuario, FormUsuario);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TUserForm, UserForm);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TClientForm, ClientForm);
  Application.CreateForm(TUserScreen, UserScreen);
  Application.CreateForm(TLivrosForm, LivrosForm);
  Application.CreateForm(TForm1, EditorasForm);
  Application.Run;
end.



