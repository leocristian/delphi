unit Cliente;

interface

uses
  Uni, dmDatabase, System.SysUtils;

type
  TCliente = class
    cod: Integer;
    nome_completo: String;
    email: String;
    telefone: String;

    procedure Insert(const objCliente: TCliente);
    procedure Read(const objCliente: TCliente);
    procedure Update(var objCliente: TCliente);

    procedure Delete(const codDelete: Integer);

    function FindByNome(const nomeParam: String): TCliente;

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

    valuesStr := '(:codigo, :nome_completo, :email, :telefone)'; // add cpf

    query.SQL.Add(valuesStr);

    query.ParamByName('codigo').Value := objCliente.cod;
    query.ParamByName('nome_completo').Value := objCliente.nome_completo;
    query.ParamByName('email').Value := objCliente.email;
    query.ParamByName('telefone').Value := objCliente.telefone;

    query.ExecSQL;

  finally
    FreeAndNil(query);
  end;
end;

procedure TCliente.Read(const objCliente: TCliente);
var
  query: TUniQuery;
begin
  try
    query := TUniQuery.Create(query);
    query.Connection := dmDatabase.DataModule1.dbConnection;

    query.Close;
    query.SQL.Clear;

    query.SQL.Add('select * from clientes');
    query.SQL.Add('where codigo = :codigo');

    query.ParamByName('codigo').Value := objCliente.cod;

    query.Open;
    if query.RecordCount > 0 then
    begin
      objCliente.nome_completo := query.FieldByName('nome_completo').Value;
      objCliente.email := query.FieldByName('email').Value;
      objCliente.telefone := query.FieldByName('telefone').Value;
    end;
  finally
    FreeAndnil(query);
  end;
end;

procedure TCliente.Update(var objCliente: TCliente);
var
  query: TUniQuery;
  queryStr: String;
begin
  try
    query := TUniQuery.Create(nil);
    query.Connection := DataModule1.dbConnection;

    query.Close;
    query.SQL.Clear;

    queryStr := 'update clientes set nome_completo = :nome_completo, email = :email, telefone = :telefone';
    query.SQL.Add(queryStr);
    query.SQL.Add(' where codigo = :codigo');

    query.ParamByName('codigo').Value := objCliente.cod;
    query.ParamByName('nome_completo').Value := objCliente.nome_completo;
    query.ParamByName('email').Value := objCliente.email;
    query.ParamByName('telefone').Value := objCliente.telefone;

    query.ExecSQL;
  finally
    FreeAndNil(query);
  end;
end;

procedure TCliente.Delete(const codDelete: Integer);
var
  query: TUniQuery;
begin
  try
    query := TUniQuery.Create(nil);
    query.Connection := DataModule1.dbConnection;

    query.Close;
    query.SQL.Clear;
    query.SQL.Add('delete from clientes where codigo = ' + IntToStr(codDelete));

    query.ExecSQL;
  finally
    FreeAndNil(query);
  end;
end;

function TCliente.FindByNome(const nomeParam: String): TCliente;
var
  query: TUniQuery;
  clienteSelecionado: TCliente;

begin
  try
    query := TUniQuery.Create(nil);
    query.connection := DataModule1.dbConnection;

    query.Close;
    query.SQL.Clear;

    query.SQL.Add('select * from clientes ');
    query.SQL.Add('where nome_completo = ' + QuotedStr(nomeParam));

    query.ExecSQL;

  finally

    clienteSelecionado := TCliente.Create;

    clienteSelecionado.cod := query.FieldByName('codigo').AsInteger;
    clienteSelecionado.nome_completo := query.FieldByName('nome_completo').AsString;
    clienteSelecionado.email := query.FieldByName('email').AsString;
    clienteSelecionado.telefone := query.FieldByName('telefone').AsString;

    Result := clienteSelecionado;

    FreeAndNil(query);
  end;
end;
end.
