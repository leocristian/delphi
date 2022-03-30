unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Data.DB,
  MemDS, DBAccess, Uni, UniProvider, PostgreSQLUniProvider, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Menus, VirtualTable,
  Vcl.Imaging.jpeg, Vcl.CheckLst, CRGrid;

type
  TBook = class
    Title: String;
    Author: String;
    Year: TDate;
  end;
  TForm1 = class(TForm)
    title: TLabel;
    PageControl1: TPageControl;
    BooksPage: TTabSheet;
    NewBook: TTabSheet;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    YearInput: TDateTimePicker;
    Label2: TLabel;
    Button1: TButton;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    CodInput: TEdit;
    LogoutBtn: TButton;
    s: TTabSheet;
    Button2: TButton;
    Label3: TLabel;
    DBNavigator2: TDBNavigator;
    TabSheet2: TTabSheet;
    Button3: TButton;
    Button4: TButton;
    Label4: TLabel;
    DBGrid2: TDBGrid;
    UniQuery1: TUniQuery;
    DBGrid3: TDBGrid;
    LogPage: TTabSheet;
    Button5: TButton;
    PriceInput: TEdit;
    Image1: TImage;
    Label5: TLabel;
    PublisherInput: TEdit;
    DBNavigator3: TDBNavigator;
    procedure Button1Click(Sender: TObject);
    procedure LogoutBtnClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses LoginForm, CreateClientForm, SellPage, SetupDatabase, SellPage2,
  SellCancelPage;

function StrIsEmpty(strIn: String): Boolean;
begin
  if strIn = '' then
    begin
      Result := True;
    end
  else
    begin
      Result := False;
    end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  NewBook: TBook;
  Query: String;

begin

  if (StrIsEmpty(Form1.Edit1.Text)) or
     (StrIsEmpty(Form1.Edit2.Text)) or
     (StrIsEmpty(DateToStr(Form1.YearInput.Date))) then
    begin
      ShowMessage(BoolToStr(StrIsEmpty(Form1.Edit1.Text)));
    end
  else
    begin
      Form1.UniQuery1.SQL.Clear;
      Query := 'insert into livros values(' + Form1.CodInput.Text + ',' +
        QuotedStr(Form1.Edit1.Text) + ',' + QuotedStr(Form1.Edit2.Text) +
       ',' + QuotedStr(DateToStr(Form1.YearInput.Date)) + ',' +
       QuotedStr(Form1.PublisherInput.text) + ',' + QuotedStr(Form1.PriceInput.Text) + ');';

      try
        Form1.UniQuery1.SQL.Add(Query);
        Form1.UniQuery1.Execute;
      finally
        ShowMessage('Livro cadastrado com sucesso!');
        Form1.DBGrid1.Refresh;
      end;
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  CreateClientForm.Form4.Visible := True;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  SellPage2.Form5.Visible := True;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  SellCancelPage.Form6.visible := True;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  SetupDatabase.DataModule3.frxReport1.ShowReport;
end;

procedure TForm1.LogoutBtnClick(Sender: TObject);
begin
  ShowMessage('Programa encerrado!');
  Application.Terminate;
end;

end.
