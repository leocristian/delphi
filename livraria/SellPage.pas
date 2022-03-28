unit SellPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, MemDS, DBAccess,
  Uni;

type
  TForm5 = class(TForm)
    Label1: TLabel;
    ClientInput: TEdit;
    BookInput: TEdit;
    Button1: TButton;
    UniQuery1: TUniQuery;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

uses SetupDatabase;

procedure TForm5.Button1Click(Sender: TObject);
var
  query: String;
begin
  Form5.UniQuery1.SQL.Clear;

  query := 'insert into vendas values (' + IntToStr(Random(1000))+ ',' +
  QuotedStr('leonardo') + ',' + QuotedStr(Form5.ClientInput.Text) + ',' +
  QuotedStr(Form5.BookInput.Text) + ')';

  try
    Form5.UniQuery1.SQL.Add(query);
    Form5.UniQuery1.Execute;
  finally
    ShowMessage('Venda criada com sucesso');
    Form5.Visible := False;

  end;

end;

end.
