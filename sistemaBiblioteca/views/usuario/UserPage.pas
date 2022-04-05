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
  cxGrid, dxSkinsForm, MemDS, DBAccess, Uni,  Generics.Collections;

type
  TUserForm = class(TForm)
    PopupMenu1: TPopupMenu;
    Vsiuali1: TMenuItem;
    Inserirnovo2: TMenuItem;
    N1: TMenuItem;
    Excluirselecionado1: TMenuItem;
    BuscaPessoa1: TBuscaPessoa;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1codigo: TcxGridDBColumn;
    cxGrid1DBTableView1login: TcxGridDBColumn;
    AtualizarBtn: TButton;
    cxGrid1DBTableView1nome_completo: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;

    procedure CreateUser(Sender: TObject);
    procedure SetFocus(Sender: TObject);
    procedure BuscarUsuario(Sender: TObject);
    procedure DeletarUsuario(Sender: TObject);
    procedure AtualizarGrid(Sender: TObject);
    procedure ShowUsuarioInfo(Sender: TObject);
    procedure ShowEditUsuarioForm(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UserForm: TUserForm;

implementation

{$R *.dfm}

uses NewUserPage, dmDatabase, Usuario, ShowUserPage, EditUserPage,
  BuscaControle;

procedure TUserForm.AtualizarGrid(Sender: TObject);
begin
  UserForm.cxGrid1DBTableView1.DataController.Refresh;
end;

procedure TUserForm.BuscarUsuario(Sender: TObject);
var
  nomeFiltro: String;
  usuarioEncontrado: TUsuario;
  listaEncontrados: TList<TUsuario>;

  codigoFiltro: String;
  buscaControle: TBuscaControle;

begin
  if UserForm.BuscaPessoa1.ComboBox1.Text = 'Codigo' then
    begin
      try

        usuarioEncontrado := TUsuario.Create;
        usuarioEncontrado.cod := StrToInt(Self.BuscaPessoa1.Edit1.Text);

        usuarioEncontrado.Read(usuarioEncontrado);

      finally

        if usuarioEncontrado.nome_completo = '' then
        begin
          ShowMessage('Usuário não encontrado!');
        end
        else
        begin
          ShowUserPage.ShowUsuarioForm.PreencherInputs(usuarioEncontrado);
          ShowUserPage.ShowUsuarioForm.visible := True;
          Self.cxGrid1DBTableView1.GetColumnByFieldName('codigo');
        end;
      end;
    end
  else if UserForm.BuscaPessoa1.ComboBox1.Text = 'Nome completo' then
    begin
      try

        nomeFiltro := Self.BuscaPessoa1.Edit1.Text;

        listaEncontrados := TList<TUsuario>.Create;
        buscaControle.FilterByNomeCompleto(nomeFiltro);

      finally

        if usuarioEncontrado.email = '' then
        begin
          ShowMessage('Usuário não encontrado!');
        end
        else
        begin
          ShowUserPage.ShowUsuarioForm.PreencherInputs(usuarioEncontrado);
          ShowUserPage.ShowUsuarioForm.visible := True;
          Self.cxGrid1DBTableView1.GetColumnByFieldName('codigo');
        end;
      end;
    end
  else
    begin
      ShowMessage('Campo de busca inválido!');
    end;
end;

procedure TUserForm.DeletarUsuario(Sender: TObject);
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

procedure TUserForm.ShowEditUsuarioForm(Sender: TObject);
var
  colunaSelected: Integer;
  usuarioSelecionado: TUsuario;

begin

  colunaSelected := UserForm.cxGrid1DBTableView1.ViewData.DataController.GetSelectedRowIndex(0);

  try

    usuarioSelecionado := TUsuario.Create;
    usuarioSelecionado.cod := UserForm.cxGrid1DBTableView1.ViewData.Records[colunaSelected].Values[Userform.cxGrid1DBTableView1.GetColumnByFieldName('codigo').Index];
    usuarioSelecionado.Read(usuarioSelecionado);

  finally
    EditUserPage.EditUserForm.PreencherInputs(usuarioSelecionado);
    EditUserPage.EditUserForm.Visible := True;
  end;
end;

procedure TUserForm.ShowUsuarioInfo(Sender: TObject);
var
  colunaSelected: Integer;
  usuarioSelecionado: TUsuario;

begin

  colunaSelected := UserForm.cxGrid1DBTableView1.ViewData.DataController.GetSelectedRowIndex(0);

  try

    usuarioSelecionado := TUsuario.Create;
    usuarioSelecionado.cod := UserForm.cxGrid1DBTableView1.ViewData.Records[colunaSelected].Values[Userform.cxGrid1DBTableView1.GetColumnByFieldName('codigo').Index];
    usuarioSelecionado.Read(usuarioSelecionado);

  finally
    ShowUserPage.ShowUsuarioForm.PreencherInputs(usuarioSelecionado);
    ShowUserPage.ShowUsuarioForm.visible := True;
  end;
end;

procedure TUserForm.CreateUser(Sender: TObject);
begin
  NewUserPage.NewUserForm.Visible := True;
end;

end.
