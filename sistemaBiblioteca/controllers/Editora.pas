unit Editora;

interface

uses
  Uni, dmDatabase, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, MenuFrame,
  Vcl.ToolWin, Vcl.ComCtrls, System.Actions, Vcl.ActnList, Vcl.ExtCtrls;

type
  TEditora = class
    cod: Integer;
    nome: String;
    cnpj: String;

    procedure Insert(const objEditora: TEditora);
    procedure Read(const objEditora: TEditora);
    procedure Update(const objEditora: TEditora);
    procedure Delete(const objEditora: TEditora);

  end;

implementation

procedure TEditora.Insert(const objEditora: TEditora);
var
  query: TUniQuery;
  valuesStr: String;

begin
  try
    query := TUniQuery.Create(nil);
    query.Connection := DataModule1.dbConnection;

    query.Close;
    query.SQL.Text := 'select nextval(''tb_editoras_cod_seq'') as codProximo  ';
    query.Open;
    objEditora.cod := Query.FieldByName('codProximo').AsInteger;

    query.Close;
    query.SQL.Clear;
    query.SQL.Add('insert into editoras (codigo, nome, cnpj) ');
    query.SQL.Add('values');

    valuesStr :=  '(' + IntToStr(objEditora.cod) + ',' + QuotedStr(objEditora.nome)
                + ',' + QuotedStr(objEditora.cnpj) + ')';

    query.SQL.Add(valuesStr);

    query.ExecSQL;
  finally
    FreeAndNil(query);
  end;
end;

procedure TEditora.Read(const objEditora: TEditora);
begin

end;

procedure TEditora.Update(const objEditora: TEditora);
begin

end;

procedure TEditora.Delete(const objEditora: TEditora);
begin

end;

end.
