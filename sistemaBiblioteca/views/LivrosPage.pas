unit LivrosPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, Vcl.Menus, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, dmDatabase;

type
  TLivrosForm = class(TForm)
    Panel1: TPanel;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Button1: TButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1codigo: TcxGridDBColumn;
    cxGrid1DBTableView1titulo: TcxGridDBColumn;
    cxGrid1DBTableView1editora: TcxGridDBColumn;
    cxGrid1DBTableView1ano_publicacao: TcxGridDBColumn;
    cxGrid1DBTableView1preco: TcxGridDBColumn;
    PopupMenu1: TPopupMenu;
    Visualizarseleciona1: TMenuItem;
    Inserirnovolivro1: TMenuItem;
    Inserirnovolivro2: TMenuItem;
    N1: TMenuItem;
    Excluirselecionado1: TMenuItem;
    procedure AdicionarLivro(Sender: TObject);
    procedure DeletarLivro(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LivrosForm: TLivrosForm;

implementation

{$R *.dfm}

uses NewLivroPage, Livro;

procedure TLivrosForm.AdicionarLivro(Sender: TObject);
begin
  NewLivroPage.NewLivroForm.Visible := True;
end;

procedure TLivrosForm.DeletarLivro(Sender: TObject);
var
  codDelete: Integer;
  colunaSelected: Integer;
  livroDelete: TLivro;

begin
  Case
    MessageBox(Application.Handle, 'Confirmar exclusão de livro?', 'Excluir livro', MB_YESNO) of
    idYes:
      begin
        colunaSelected := LivrosForm.cxGrid1DBTableView1.ViewData.DataController.GetSelectedRowIndex(0);
        codDelete := LivrosForm.cxGrid1DBTableView1.ViewData.Records[colunaSelected].Values[LivrosForm.cxGrid1DBTableView1.GetColumnByFieldName('codigo').Index];

        livroDelete := TLivro.Create;

        try
          livroDelete.Delete(codDelete);
        finally
          ShowMessage('Livro exluido com sucesso, codigo: ' + IntToStr(codDelete));
        end;
      end;
    idNo: ShowMessage('Operação cancelada');
  end;
end;

end.
