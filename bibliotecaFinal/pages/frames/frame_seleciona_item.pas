unit frame_seleciona_item;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  System.ImageList, Vcl.ImgList, frame_imagens;

type
  TSelecionaItemFrame = class(TFrame)
    BuscaBtn: TSpeedButton;
    BuscaInput: TEdit;
    FrameImagens1: TFrameImagens;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
