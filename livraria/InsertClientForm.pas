unit InsertClientForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  MemDS, DBAccess, Uni;

type
  TForm4 = class(TForm)
    Panel1: TPanel;
    ClientNameInput: TEdit;
    ClientCodInput: TEdit;
    ClientEmailInput: TEdit;
    CreateClientBtn: TButton;
    Label1: TLabel;
    UniQuery1: TUniQuery;
//    procedure CreateClientBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

uses SetupDatabase;

//procedure TForm4.CreateClientBtnClick(Sender: TObject);
//var
//  query: String;
//begin
//  query := 'insert into clientes values (' + Form4.ClientCodInput.Text + ',' +
//    QuotedStr(Form4.ClientNameInput.Text) + ',' + QuotedStr(Form4.ClientEmailInput.Text) +  ')';
//
//    Form4.UniQuery1.SQL.Clear;
//
//    try
//      Form4.UniQuery1.SQL.text := query;
//      Form4.UniQuery1.Execute;
//    finally
//      ShowMessage('Cliente cadastrado com sucesso!');
//      Form4.Visible := False;
//    end;
//
//
//end;
end.
