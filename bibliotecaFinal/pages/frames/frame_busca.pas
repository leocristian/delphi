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
    procedure BuscaInputClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFrameBusca.BuscaInputClick(Sender: TObject);
begin
  BuscaInput.SetFocus;
end;

end.
