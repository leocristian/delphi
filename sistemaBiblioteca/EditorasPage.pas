unit EditorasPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    PopupMenu1: TPopupMenu;
    Visualizareditoraselecionada1: TMenuItem;
    Visualizareditoraselecionada2: TMenuItem;
    Alterareditoraselecionada1: TMenuItem;
    N1: TMenuItem;
    Excluireditoraselecionada1: TMenuItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditorasForm: TForm1;

implementation

{$R *.dfm}

end.
