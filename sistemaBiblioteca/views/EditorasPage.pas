unit EditorasPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus;

type
  TEditorasForm = class(TForm)
    Label1: TLabel;
    PopupMenu1: TPopupMenu;
    Visualizareditoraselecionada1: TMenuItem;
    Visualizareditoraselecionada2: TMenuItem;
    Alterareditoraselecionada1: TMenuItem;
    N1: TMenuItem;
    Excluireditoraselecionada1: TMenuItem;
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

uses NewEditoraPage;

procedure TEditorasForm.InserirEditora(Sender: TObject);
begin
  NewEditoraForm.Visible := True;
end;

end.
