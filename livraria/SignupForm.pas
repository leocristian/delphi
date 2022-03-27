unit SignupForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  MemDS, DBAccess, Uni;

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    NameInput: TEdit;
    PassInput: TEdit;
    PassCheckInput: TEdit;
    SignupBtn: TButton;
    EmailInput: TEdit;
    UniQuery1: TUniQuery;
    CodInput: TEdit;
    ReturnBtn: TButton;
    procedure SignupBtnClick(Sender: TObject);
    procedure ReturnBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses SetupDatabase, LoginForm;

procedure TForm3.ReturnBtnClick(Sender: TObject);
begin
  Form3.Visible := False;
  LoginForm.Form2.Visible := True;
end;

function IsEmpty(field: String): Boolean;
begin
  if field = '' then
    begin
      Result := True;
    end
  else
    begin
      Result := False;
    end;
end;
procedure TForm3.SignupBtnClick(Sender: TObject);
var
  Query: String;
begin
  if Form3.PassInput.Text <> Form3.PassCheckInput.Text then
    begin
      ShowMessage('Senhas não são iguais!!');
    end
  else
    begin
      if (IsEmpty(Form3.CodInput.Text)) or
          (IsEmpty(Form3.NameInput.Text)) or
          (IsEmpty(Form3.EmailInput.Text)) or
          (IsEmpty(Form3.PassInput.Text)) then
          begin
            ShowMessage('Preencha todos os campos!');
          end
      else
        begin
          Form3.UniQuery1.SQL.Clear;
          Query := 'insert into usuarios values(' + Form3.CodInput.Text + ',' +
             QuotedStr(Form3.NameInput.Text) + ',' + QuotedStr(Form3.EmailInput.Text) +
            ',' + QuotedStr(Form3.PassInput.Text) + ');';

          try
            Form3.UniQuery1.SQL.Add(Query);
            Form3.UniQuery1.Execute;
          finally
            ShowMessage('Usuário cadastrado com sucesso!');
          end;
        end;
    end;
  end;
end.
