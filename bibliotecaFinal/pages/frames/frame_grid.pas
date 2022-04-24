unit frame_grid;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxClasses, cxStyles;

type
  Tframe_estilo_grid = class(TFrame)
    estilo_padrao: TcxStyleRepository;
    cabecalho: TcxStyle;
    linhas: TcxStyle;
    busca: TcxStyle;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
