unit frame_busca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrameBusca = class(TFrame)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    BuscaInput: TEdit;
    bt_busca: TButton;
    bt_mostrarTudo: TButton;
    SelecaoBusca: TComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
