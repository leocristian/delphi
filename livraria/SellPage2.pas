unit SellPage2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, MemDS, DBAccess,
  Uni;

type
  TForm5 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    UniQuery1: TUniQuery;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function VerifyClient(nameParam: String): Boolean;
  function VerifyBook(titleParam: String): Boolean;

var
  Form5: TForm5;

implementation

{$R *.dfm}

uses SetupDatabase;

procedure TForm5.Button1Click(Sender: TObject);
var
  query: String;
begin

  if VerifyClient(Form5.Edit1.Text) then
    begin
      if not VerifyBook(Form5.Edit2.Text) then
        begin
          ShowMessage('Livro não encontrado!');
        end
      else
        begin

        query := 'insert into vendas values (' + IntToStr(Random(1000))+ ',' +
        QuotedStr('leonardo') + ',' + QuotedStr(Form5.Edit1.Text) + ',' +
        QuotedStr(Form5.Edit2.Text) + ')';

          try
            Form5.UniQuery1.SQL.Clear;
            Form5.UniQuery1.SQL.Add(query);
            Form5.UniQuery1.Execute;
          finally
            ShowMessage('Venda criada com sucesso!');
            Form5.Visible := False;
          end;
        end;
    end
  else
    begin
      ShowMessage('Cliente não encontrado!');
    end;
end;

function VerifyClient(nameParam: String): Boolean;
var
  clientName: String;
begin
  Form5.UniQuery1.SQL.Clear;
  Form5.UniQuery1.SQL.text := 'select * from clientes where nome = ' + QuotedStr(nameParam);
  Form5.UniQuery1.Execute;

  clientName := Form5.Uniquery1.fieldbyname('nome').AsString;

  if clientName = '' then
    begin
      Result := False;
    end
  else
    begin
      Result := True;
    end;
end;

function VerifyBook(titleParam: String): Boolean;
var
  bookTitle: String;
begin
  Form5.UniQuery1.SQL.Clear;
  Form5.UniQuery1.SQL.text := 'select * from livros where titulo = ' + QuotedStr(titleParam);
  Form5.UniQuery1.Execute;

  bookTitle := Form5.Uniquery1.fieldbyname('titulo').AsString;

  if bookTitle = '' then
    begin
      Result := False;
    end
  else
    begin
      Result := True;
    end;
end;
end.
