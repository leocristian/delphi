unit EditorasPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, Vcl.ExtCtrls, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid;

type
  TEditorasForm = class(TForm)
    PopupMenu1: TPopupMenu;
    Visualizareditoraselecionada1: TMenuItem;
    Visualizareditoraselecionada2: TMenuItem;
    Alterareditoraselecionada1: TMenuItem;
    N1: TMenuItem;
    Excluireditoraselecionada1: TMenuItem;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Panel1: TPanel;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    PesquisarBtn: TButton;
    cxGrid1DBTableView1codigo: TcxGridDBColumn;
    cxGrid1DBTableView1nome: TcxGridDBColumn;
    cxGrid1DBTableView1cnpj: TcxGridDBColumn;
    procedure InserirEditora(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditorasForm: TEditorasForm;

implementation

{$R *.dfm}

uses NewEditoraPage, dmDatabase;

procedure TEditorasForm.InserirEditora(Sender: TObject);
begin
  NewEditoraForm.Visible := True;
end;

end.
