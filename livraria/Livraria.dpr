program Livraria;

uses
  Vcl.Forms,
  UnitPrincipal in 'UnitPrincipal.pas' {Form1},
  SetupDatabase in 'SetupDatabase.pas' {DataModule3: TDataModule},
  LoginForm in 'LoginForm.pas' {Form2},
  SignupForm in 'SignupForm.pas' {Form3},
  CreateClientForm in 'CreateClientForm.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule3, DataModule3);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
