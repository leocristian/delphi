unit ClientPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MenuFrame, Vcl.Menus;

type
  TClientForm = class(TForm)
    PopupMenu1: TPopupMenu;
    Visualizarclienteselecionado1: TMenuItem;
    Acidionarnovocliente1: TMenuItem;
    N1: TMenuItem;
    Excluirclienteselecionado1: TMenuItem;
    BuscaPessoa1: TBuscaPessoa;
    Inserirnovocliente1: TMenuItem;
    procedure SetFocus(Sender: TObject);
    procedure BuscaPessoa1Button1Click(Sender: TObject);
    procedure CreateClient(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ClientForm: TClientForm;

implementation

{$R *.dfm}

uses NewClientPage;

procedure TClientForm.BuscaPessoa1Button1Click(Sender: TObject);
begin
  ShowMessage('Pesquisando cliente ' + ClientForm.BuscaPessoa1.Edit1.Text);
end;

procedure TClientForm.CreateClient(Sender: TObject);
begin
  NewClientPage.NewClientForm.Visible := True;
end;

procedure TClientForm.SetFocus(Sender: TObject);
begin
  ClientForm.BuscaPessoa1.Edit1.SetFocus;
end;

end.
