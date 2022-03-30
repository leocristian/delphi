unit SellCancelPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, MemDS, DBAccess,
  Uni;

type
  TForm6 = class(TForm)
    Label1: TLabel;
    SellCodInput: TEdit;
    Button1: TButton;
    UniQuery1: TUniQuery;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

uses SetupDatabase;

procedure TForm6.Button1Click(Sender: TObject);
var
  query: String;
begin
  Form6.UniQuery1.SQL.Clear;

  query := 'delete from vendas where codigo = ' + QuotedStr(Form6.SellCodInput.Text);

  try
    Form6.UniQuery1.SQL.Text := query;
    Form6.UniQuery1.Execute;
  finally
    ShowMessage('Venda ' + QuotedStr(Form6.SellCodInput.text + ' deletada com sucesso!'));
    Form6.visible := False;
  end;

end;

end.
