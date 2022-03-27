unit LoginForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  MemDS, DBAccess, Uni;

type
  TUser = class
    name: String;
    email: String;
    password: String;
  end;

  TForm2 = class(TForm)
    Panel1: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    LoginBtn: TButton;
    Label1: TLabel;
    SignupBtn: TButton;
    QueryUsers: TUniQuery;

    procedure LoginBtnClick(Sender: TObject);
    procedure SignupBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses UnitPrincipal, SetupDatabase, SignupForm;

procedure TForm2.LoginBtnClick(Sender: TObject);
var
  query: String;
  userLogged: TUser;
  name: String;
  email: String;
  password: String;
begin
  Form2.QueryUsers.SQL.Clear;

  query := 'SELECT * FROM usuarios WHERE nome = ' + QuotedStr(Form2.Edit1.Text) +
  ' and senha = ' + QuotedStr(Form2.Edit2.Text);

  Form2.QueryUsers.SQL.Text := query;
  Form2.QueryUsers.Execute;  
  
  name := Form2.QueryUsers.fieldbyname('nome').AsString;
  email := Form2.QueryUsers.fieldbyname('email').AsString;
  password := Form2.QueryUsers.fieldbyname('senha').AsString;

  if name = '' then
    begin
      ShowMessage('Usuário não encontrado!');
    end
  else
    begin
      UnitPrincipal.Form1.Visible := True;
      Form2.Visible := False;
    end;
end;

procedure TForm2.SignupBtnClick(Sender: TObject);
begin
   SignupForm.Form3.Visible := True;
   Form2.Visible := False;
end;
end.
