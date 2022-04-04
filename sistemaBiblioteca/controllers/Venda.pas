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

    procedure Insert(const objVenda: TVenda);
//    procedure Read(const objLivro: TLivro);
//    procedure Update(const objLivro: TLivro);
    procedure Delete(const codVenda: Integer);

  end;

implementation

procedure TVenda.Insert(const objVenda: TVenda);
var
  query: TUniQuery;
  valuesStr: String;

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

    valuesStr := IntToStr(objVenda.cod) + ',' + QuotedStr(objVenda.vendedor)
                  + ',' + QuotedStr(objVenda.livro)
                  + ',' + QuotedStr(objVenda.cliente)
                  + ',' + objVenda.valorTotal;

    query.SQL.Add('insert into vendas values (' + valuesStr + ')');

    query.SQL.Add(valuesStr);

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
