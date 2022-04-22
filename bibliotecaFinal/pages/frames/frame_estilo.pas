unit frame_estilo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxStyles, cxClasses;

type
  Tframe_cxGrid = class(TFrame)
    estilo_padrao: TcxStyleRepository;
    cabecalho: TcxStyle;
    linhas: TcxStyle;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
