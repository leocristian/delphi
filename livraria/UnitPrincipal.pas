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
    UniQuery1: TUniQuery;
    CodInput: TEdit;
    LogoutBtn: TButton;
    TabSheet1: TTabSheet;
    Button2: TButton;
    Label3: TLabel;
    DBNavigator2: TDBNavigator;
    TabSheet2: TTabSheet;
    Button3: TButton;
    Button4: TButton;
    Label4: TLabel;
    DBGrid3: TDBGrid;
    DBGrid2: TDBGrid;
    LogPage: TTabSheet;
    Label5: TLabel;
    CRDBGrid1: TCRDBGrid;
    procedure Button1Click(Sender: TObject);
    procedure LogoutBtnClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses SetupDatabase, LoginForm, CreateClientForm;

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
       '''' + Form1.Edit1.Text + '''' + ',' + '''' + Form1.Edit2.Text + '''' +
       ',' + '''' + DateToStr(Form1.YearInput.Date) + '''' + ');';

      ShowMessage(Query);

      try
        Form1.UniQuery1.SQL.Add(Query);
        Form1.UniQuery1.Execute;
      finally
        ShowMessage('Livro cadastrado com sucesso!');
      end;
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  CreateClientForm.Form4.Visible := True;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  ShowMessage(Form1.DBGrid1.SelectedRows.CurrentRowSelected.ToString(True));
end;

procedure TForm1.LogoutBtnClick(Sender: TObject);
begin
//  Form1.Visible := False;
//  LoginForm.Form2.visible := True
  ShowMessage('Programa encerrado!');
  Application.Terminate;
end;

end.
