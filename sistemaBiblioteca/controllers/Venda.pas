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
    livro: String;
    cliente: String;
    valorTotal: String;

    procedure Insert(var objVenda: TVenda);
//    procedure Read(const objLivro: TLivro);
//    procedure Update(const objLivro: TLivro);
    procedure Delete(const codVenda: Integer);

  end;

implementation

procedure TVenda.Insert(var objVenda: TVenda);
var
  query: TUniQuery;

begin
  try
    query := TUniQuery.Create(nil);
    query.Connection := DataModule1.dbConnection;

    query.Close;
    query.SQL.Text := 'select nextval(''tb_vendas_cod_seq'') as codProximo';
    query.Open;

    objVenda.cod := query.FieldByName('codProximo').AsInteger;

    query.Close;
    query.SQL.Clear;

    query.SQL.Add('insert into vendas (codigo, vendedor, livro, cliente, valor_total) ');

    query.SQL.Add('values ');
    query.SQL.Add('(:codigo, :vendedor, :livro, :cliente, :valor_total)');

    query.ParamByName('codigo').Value := objVenda.cod;
    query.ParamByName('vendedor').Value := objVenda.vendedor;
    query.ParamByName('livro').Value := objVenda.livro;
    query.ParamByName('cliente').Value := objVenda.cliente;
    query.ParamByName('valor_total').Value := objVenda.valorTotal;

    query.ExecSQL;

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
