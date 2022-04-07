unit Venda;

interface

uses
  Uni, dmDatabase, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, MenuFrame,
  Vcl.ToolWin, Vcl.ComCtrls, System.Actions, Vcl.ActnList, Vcl.ExtCtrls;

type
  TVenda = class
    cod: Integer;
    vendedor: String;
    cliente: String;
    valorTotal: String;

    procedure Insert(var objVenda: TVenda);
    procedure Read(const objVenda: TVenda);
//    procedure Update(const objLivro: TLivro);
    procedure Delete(const codVenda: Integer);

    function SelecionarProxCodigo: Integer;

  end;

implementation

function TVenda.SelecionarProxCodigo: Integer;
var
  query: TUniQuery;

begin
  query := TUniQuery.Create(nil);
  query.Connection := DataModule1.dbConnection;

  query.Close;
  query.SQL.Text := 'select nextval(''tb_vendas_cod_seq'') as codProximo';
  query.Open;

  Result := query.FieldByName('codProximo').AsInteger;

end;
procedure TVenda.Insert(var objVenda: TVenda);
var
  query: TUniQuery;

begin
  try
    query := TUniQuery.Create(nil);
    query.Connection := DataModule1.dbConnection;

    query.Close;
    query.SQL.Clear;

    query.SQL.Add('insert into vendas (codigo, vendedor, cliente, valor_total) ');

    query.SQL.Add('values ');
    query.SQL.Add('(:codigo, :vendedor, :cliente, :valor_total)');

    query.ParamByName('codigo').Value := objVenda.cod;
    query.ParamByName('vendedor').Value := objVenda.vendedor;
    query.ParamByName('cliente').Value := objVenda.cliente;
    query.ParamByName('valor_total').Value := objVenda.valorTotal;

    query.ExecSQL;

  finally
    FreeAndNil(query);
  end;
end;

procedure TVenda.Read(const objVenda: TVenda);
var
  query: TUniQuery;
begin
  try
    query := TUniQuery.Create(nil);
    query.Connection := DataModule1.dbConnection;

    query.Close;
    query.SQL.Clear;
    query.SQL.Add('select * from vendas ');
    query.SQL.Add('where codigo = :codigo');
    query.ParamByName('codigo').Value := objVenda.cod;

    query.Open;

    if query.RecordCount > 0  then
    begin
      objVenda.vendedor := query.FieldByName('vendedor').Value;
      objVenda.cliente := query.FieldByName('cliente').Value;
      objVenda.valorTotal := query.FieldByName('valor_total').Value;
    end;

  finally
    FreeAndNil(query);
  end;
end;

procedure TVenda.Delete(const codVenda: Integer);
var
  query: TUniQuery;

begin
  try
    query := TUniQuery.Create(nil);
    query.Connection := DataModule1.dbConnection;

    query.Close;
    query.SQL.Clear;

    query.SQL.Add('delete from vendas where codigo = ' + codVenda.ToString);

    query.ExecSQL;

  finally
    FreeAndNil(query);
  end;
end;
end.
