unit UserPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.Menus, MenuFrame, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, dxSkinsForm, MemDS, DBAccess, Uni;

type
  TUserForm = class(TForm)
    PopupMenu1: TPopupMenu;
    Vsiuali1: TMenuItem;
    Inserirnovo1: TMenuItem;
    Inserirnovo2: TMenuItem;
    N1: TMenuItem;
    Excluirselecionado1: TMenuItem;
    BuscaPessoa1: TBuscaPessoa;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1codigo: TcxGridDBColumn;
    cxGrid1DBTableView1nome_completo: TcxGridDBColumn;
    cxGrid1DBTableView1email: TcxGridDBColumn;
    cxGrid1DBTableView1login: TcxGridDBColumn;
    AtualizarBtn: TButton;

    procedure CreateUser(Sender: TObject);
    procedure SetFocus(Sender: TObject);
    procedure BuscarUsuario(Sender: TObject);
    procedure DeleteUser(Sender: TObject);
    procedure AtualizarGrid(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UserForm: TUserForm;

implementation

{$R *.dfm}

uses NewUserPage, dmDatabase, Usuario;

procedure TUserForm.AtualizarGrid(Sender: TObject);
begin
  try
    UserForm.cxGrid1.Refresh;
  finally
    ShowMessage('Tabela de usuarios atualizada com sucesso!');
  end;
end;

procedure TUserForm.BuscarUsuario(Sender: TObject);
begin
  if UserForm.BuscaPessoa1.ComboBox1.Text = 'Codigo' then
    begin
      ShowMessage('buscando por codigo');
    end
  else if UserForm.BuscaPessoa1.ComboBox1.Text = 'Nome ou email' then
    begin
      ShowMessage('Buscando por nome ou email');
    end
  else
    begin
      ShowMessage('Campo inválido!');
    end;

end;

procedure TUserForm.DeleteUser(Sender: TObject);
var
  codDelete: Integer;
  colunaSelected: Integer;
  usuarioDelete: TUsuario;

begin
  Case
    MessageBox(Application.Handle, 'Confirmar exclusão de usuário', 'Excluir usuário', MB_YESNO) of
    idYes:
      begin
        colunaSelected := UserForm.cxGrid1DBTableView1.ViewData.DataController.GetSelectedRowIndex(0);
        codDelete := UserForm.cxGrid1DBTableView1.ViewData.Records[colunaSelected].Values[Userform.cxGrid1DBTableView1.GetColumnByFieldName('codigo').Index];

        usuarioDelete := TUsuario.Create;

        try
          usuarioDelete.Delete(codDelete);
        finally
          ShowMessage('Usuario excluido com sucesso, codigo: ' + IntToStr(codDelete));
        end;

      end;
    idNo: ShowMessage('Operação cancelada');
  End;
end;

procedure TUserForm.SetFocus(Sender: TObject);
begin
  UserForm.BuscaPessoa1.Edit1.SetFocus;
end;

procedure TUserForm.CreateUser(Sender: TObject);
begin
  NewUserPage.NewUserForm.Visible := True;
end;

end.
