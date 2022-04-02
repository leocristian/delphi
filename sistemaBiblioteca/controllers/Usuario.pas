unit Usuario;


interface

uses
  Uni, dmDatabase, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, MenuFrame,
  Vcl.ToolWin, Vcl.ComCtrls, System.Actions, Vcl.ActnList, Vcl.ExtCtrls;

type
  TUsuario = Class

    cod: Integer;
    nome_completo: String;
    email: String;
    login: String;
    senha: String;

    procedure Insert(const objUsuario: TUsuario);
    procedure Read(const objUsuario: TUsuario);
    procedure Update(const objUsuario: TUsuario);
    procedure Delete(const objUsuaro: TUsuario);

  End;

implementation

procedure TUsuario.Insert(const objUsuario: TUsuario);
var
  query: TUniQuery;
  valuesStr: String;
begin
  try
    query := TUniQuery.Create(nil);
    query.Connection := DataModule1.dbConnection;

    query.Close;
    query.SQL.Text := 'select nextval(''tb_usuarios_cod_seq'') as codProximo';
    query.Open;
    objUsuario.cod := query.FieldByName('codProximo').AsInteger;

    query.Close;
    query.SQL.Clear;
    query.SQL.Add('insert into usuarios ');
    query.SQL.Add('values ');

    valuesStr := '(' + IntToStr(objUsuario.cod) + ',' + QuotedStr(objUsuario.nome_completo)
                + ',' + QuotedStr(objUsuario.email) + ',' + QuotedStr(objUsuario.login)
                + ',' + QuotedStr(objUsuario.senha) + ')';

    query.SQL.Add(valuesStr);

    query.ExecSQL;
  finally
    FreeAndNil(query);
  end;
end;

procedure TUsuario.Read(const objUsuario: TUsuario);
var
  query: TUniQuery;
begin
  try
    query := TUniQuery.Create(query);
    query.Connection := dmDatabase.DataModule1.dbConnection;

    query.Close;
    query.SQL.Clear;

    query.SQL.Add('select * from usuarios');
    query.SQL.Add('where codigo = :objUsuario.cod');
    query.ParamByName('codigo').Value := objUsuario.cod;

    query.Open;

    if query.RecordCount > 0 then
    begin
      objUsuario.nome_completo := query.FieldByName('codigo').Value;
    end;
  finally
    FreeAndnil(query);
  end;
end;

procedure TUsuario.Update(const objUsuario: TUsuario);
begin
  WriteLn('oi');
end;

procedure TUsuario.Delete(const objUsuaro: TUsuario);
begin
  WriteLn('oi');
end;

end.
