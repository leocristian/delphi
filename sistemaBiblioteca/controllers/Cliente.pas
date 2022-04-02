unit Cliente;

interface

uses
  Uni, dmDatabase, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, MenuFrame,
  Vcl.ToolWin, Vcl.ComCtrls, System.Actions, Vcl.ActnList, Vcl.ExtCtrls;

type
  TCliente = class
    cod: Integer;
    nome_completo: String;
    email: String;
    telefone: String;

    procedure Insert(const objCliente: TCliente);
    procedure Read(const objCliente: TCliente);
    procedure Update(const objCliente: TCliente);
    procedure Delete(const objCliente: TCliente);

  end;

implementation

procedure TCliente.Insert(const objCliente: TCliente);
var
  query: TUniQuery;
  valuesStr: String;
begin
  try
    query := TUniQuery.Create(nil);
    query.Connection := DataModule1.dbConnection;

    query.Close;
    query.SQL.Text := 'select nextval(''tb_clientes_cod_seq'') as codProximo';
    query.Open;
    objCliente.cod := query.FieldByName('codProximo').AsInteger;

    query.Close;
    query.SQL.Clear;
    query.SQL.Add('insert into clientes (codigo, nome_completo, email, telefone) ');
    query.SQL.Add('values ');

    valuesStr := '(' + IntToStr(objCliente.cod) + ',' + QuotedStr(objCliente.nome_completo)
                + ',' + QuotedStr(objCliente.email) + ',' + QuotedStr(objCliente.telefone)  + ')';

    query.SQL.Add(valuesStr);

//    query.ParamByName('codigo').Value := objCliente.cod;
//    query.ParamByName('nome_completo').Value := objCliente.nome_completo;
//    query.ParamByName('email').Value := objCliente.email;
//    query.ParamByName('telefone').Value := objCliente.telefone;

    query.ExecSQL;

  finally
    FreeAndNil(query);
  end;
end;

procedure TCliente.Read(const objCliente: TCliente);
begin

end;

procedure TCliente.Update(const objCliente: TCliente);
begin

end;

procedure TCliente.Delete(const objCliente: TCliente);
begin

end;
end.
