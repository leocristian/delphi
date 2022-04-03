unit ClientPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MenuFrame, Vcl.Menus, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid;

type
  TClientForm = class(TForm)
    PopupMenu1: TPopupMenu;
    Visualizarclienteselecionado1: TMenuItem;
    Acidionarnovocliente1: TMenuItem;
    N1: TMenuItem;
    Excluirclienteselecionado1: TMenuItem;
    BuscaPessoa1: TBuscaPessoa;
    Inserirnovocliente1: TMenuItem;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1codigo: TcxGridDBColumn;
    cxGrid1DBTableView1nome_completo: TcxGridDBColumn;
    cxGrid1DBTableView1email: TcxGridDBColumn;
    cxGrid1DBTableView1telefone: TcxGridDBColumn;
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

uses NewClientPage, dmDatabase;

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
