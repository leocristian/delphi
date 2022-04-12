unit u_mostrarLivro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    TituloInput: TEdit;
    EditoraInput: TEdit;
    AnoPublicacao: TDateTimePicker;
    Label5: TLabel;
    PrecoInput: TEdit;
    Categorias: TRadioGroup;
    AdicionarBtn: TButton;
    Modo: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
