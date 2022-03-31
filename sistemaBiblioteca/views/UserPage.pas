unit UserPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.Menus, MenuFrame, MainPage;

type
  TUserForm = class(TForm)
    PopupMenu1: TPopupMenu;
    Vsiuali1: TMenuItem;
    Inserirnovo1: TMenuItem;
    Inserirnovo2: TMenuItem;
    N1: TMenuItem;
    Excluirselecionado1: TMenuItem;
    BuscaPessoa1: TBuscaPessoa;
    procedure SetFocus(Sender: TObject);
    procedure BuscaPessoa1Button1Click(Sender: TObject);
    procedure DeleteUser(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UserForm: TUserForm;

implementation

{$R *.dfm}

procedure TUserForm.BuscaPessoa1Button1Click(Sender: TObject);
begin
  ShowMessage('Pesquisando usuario ' + UserForm.BuscaPessoa1.Edit1.Text + #13 +
  'campo: ' + UserForm.BuscaPessoa1.ComboBox1.Text);
end;

procedure TUserForm.DeleteUser(Sender: TObject);
begin
  Case
    MessageBox(Application.Handle, 'Confirmar exclusão de usuário', 'Excluir usuário', MB_YESNO) of
    idYes: ShowMessage('Usuario excluido com sucesso');
  End;
end;

procedure TUserForm.SetFocus(Sender: TObject);
begin
  UserForm.BuscaPessoa1.Edit1.SetFocus;
end;

end.
