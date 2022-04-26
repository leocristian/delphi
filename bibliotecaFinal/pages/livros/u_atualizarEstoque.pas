unit u_atualizarEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Uni, Vcl.ExtCtrls;

type
  TAtualizarEstoqueForm = class(TForm)
    Label1: TLabel;
    ValorIncremento: TEdit;
    Label2: TLabel;
    QtdEstoqueLabel: TLabel;
    Label3: TLabel;
    ConfirmarBtn: TButton;
    CancelarBtn: TButton;
    Panel1: TPanel;
    Label4: TLabel;
    TituloInput: TEdit;
    CodInput: TEdit;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelarBtnClick(Sender: TObject);
    procedure ConfirmarBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AtualizarEstoqueForm: TAtualizarEstoqueForm;

implementation

{$R *.dfm}

uses u_forms, u_dm1, u_livros;

procedure TAtualizarEstoqueForm.CancelarBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TAtualizarEstoqueForm.ConfirmarBtnClick(Sender: TObject);
var
  q1: TUniQuery;
  novoEstoque: Integer;

begin
  try
    q1 := TUniQuery.Create(nil);
    q1.Connection := dm1.con1;

    q1.Close;
    q1.SQL.Clear;

    q1.SQL.Add('update livros set qtd_estoque = :novoEstoque where codigo = :codigo');
    novoEstoque := StrToInt(QtdEstoqueLabel.Caption) + StrToInt(ValorIncremento.Text);
    q1.ParamByName('novoEstoque').Value := novoEstoque;
    q1.ParamByName('codigo').Value := codInput.Text;

    if confirma('Confirmar alteração de estoque?') then
    begin
      q1.ExecSQL;
      Mensagem('Estoque atualizado com sucesso!');
      FormLivros.grid_livrosDBTableView1.DataController.RefreshExternalData;
      Close;
    end;
  finally
    FreeAndNil(q1);
  end;
end;

procedure TAtualizarEstoqueForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  LimparInputs(AtualizarEstoqueForm);
end;

procedure TAtualizarEstoqueForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(wm_nextdlgctl, 0, 0);
  end
  else if key = #27 then close;
end;

procedure TAtualizarEstoqueForm.FormShow(Sender: TObject);
begin
  AbrirForm(AtualizarEstoqueForm);

  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top :=  (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;

  ValorIncremento.Clear;
  ValorIncremento.SetFocus;
end;

end.
