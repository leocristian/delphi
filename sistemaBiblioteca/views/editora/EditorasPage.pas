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
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    procedure InserirEditora(Sender: TObject);
    procedure ShowEditoraInfo(Sender: TObject);
    procedure AlterarEditora(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditorasForm: TEditorasForm;

implementation

{$R *.dfm}

uses NewEditoraPage, dmDatabase, Editora, ShowEditoraPage, EditEditoraPage;

procedure TEditorasForm.AlterarEditora(Sender: TObject);
var
  colunaSelected: Integer;
  editoraSelecionada: TEditora;

begin

  colunaSelected := Self.cxGrid1DBTableView1.ViewData.DataController.GetSelectedRowIndex(0);

  try

    editoraSelecionada := TEditora.Create;
    editoraSelecionada.cod := Self.cxGrid1DBTableView1.ViewData.Records[colunaSelected].Values[Self.cxGrid1DBTableView1.GetColumnByFieldName('codigo').Index];
    editoraSelecionada.Read(editoraSelecionada);

  finally
    EditEditoraPage.EditEditoraForm.PreencherInputs(editoraSelecionada);
    EditEditoraPage.EditEditoraForm.Visible := True;
  end;
end;

procedure TEditorasForm.InserirEditora(Sender: TObject);
begin
  NewEditoraForm.Visible := True;
end;

procedure TEditorasForm.ShowEditoraInfo(Sender: TObject);
var
  colunaSelected: Integer;
  editoraSelecionada: TEditora;

begin

  colunaSelected := Self.cxGrid1DBTableView1.ViewData.DataController.GetSelectedRowIndex(0);

  try

    editoraSelecionada := TEditora.Create;
    editoraSelecionada.cod := Self.cxGrid1DBTableView1.ViewData.Records[colunaSelected].Values[Self.cxGrid1DBTableView1.GetColumnByFieldName('codigo').Index];
    editoraSelecionada.Read(editoraSelecionada);

  finally

    ShowEditoraPage.ShowEditoraForm.PreencherInputs(editoraSelecionada);
    ShowEditoraPage.ShowEditoraForm.visible := True;
  end;
end;

end.
