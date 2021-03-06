unit Usuario;


interface

uses
  Uni, dmDatabase, System.SysUtils;

type
  TUsuario = Class

    cod: Integer;
    nome_completo: String;
    email: String;
    login: String;
    senha: String;

    procedure Insert(const objUsuario: TUsuario);
    procedure Read(const objUsuario: TUsuario);
    procedure Update(var objUsuario: TUsuario);
    procedure Delete(const codUsuario: Integer);

    function FindByNomeAndSenha(var nome, senha: String): TUsuario;
    procedure FindByNomeCompleto(const objUsuario: TUsuario);

    private
      semente: String;

  End;

implementation

procedure TUsuario.Insert(const objUsuario: TUsuario);
var
  query: TUniQuery;
  valuesStr: String;
  senhaHash: String;

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
    query.SQL.Add('insert into usuarios2 (codigo, nome_completo, email, login, senha) ');
    query.SQL.Add('values ');

    valuesStr := '(:codigo, :nome_completo, :email, :login, md5(:senha))';

    query.SQL.Add(valuesStr);

    query.ParamByName('codigo').Value := objUsuario.cod;
    query.ParamByName('nome_completo').Value := objUsuario.nome_completo;
    query.ParamByName('email').Value := objUsuario.email;
    query.ParamByName('login').Value := objUsuario.login;

    senhaHash := Self.semente + objUsuario.senha + Self.semente;
    query.ParamByName('senha').Value := senhaHash;

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

    query.SQL.Add('select * from usuarios2');
    query.SQL.Add('where codigo = :codigo');

    query.ParamByName('codigo').Value := objUsuario.cod;

    query.Open;

    if query.RecordCount > 0 then
    begin
      objUsuario.nome_completo := query.FieldByName('nome_completo').Value;
      objUsuario.email := query.FieldByName('email').Value;
      objUsuario.login := query.FieldByName('login').Value;
    end;
  finally
    FreeAndnil(query);
  end;
end;

procedure TUsuario.Update(var objUsuario: TUsuario);
var
  query: TUniQuery;
  queryStr: String;
begin
  try
    query := TUniQuery.Create(nil);
    query.Connection := DataModule1.dbConnection;

    query.Close;
    query.SQL.Clear;

    queryStr := 'update usuarios2 set nome_completo = :nome_completo, email = :email, login = :login';
    query.SQL.Add(queryStr);
    query.SQL.Add(' where codigo = :codigo');

    query.ParamByName('nome_completo').Value := objUsuario.nome_completo;
    query.ParamByName('email').Value := objUsuario.email;
    query.ParamByName('login').Value := objUsuario.login;
    query.ParamByName('codigo').Value := objUsuario.cod;

    query.ExecSQL;
  finally
    FreeAndNil(query);
  end;
end;

procedure TUsuario.Delete(const codUsuario: Integer);
var
  query: TUniQuery;

begin
  try

    query := TUniQuery.Create(nil);
    query.Connection := DataModule1.dbConnection;

    query.Close;
    query.SQL.Clear;

    query.SQL.Add('delete from usuarios2 where codigo = :codigo');
    query.ParamByName('codigo').Value := codUsuario;

    query.ExecSQL;

  finally
    FreeAndNil(query);
  end;
end;

function TUsuario.FindByNomeAndSenha(var nome, senha: String): TUsuario;
var
  query: TUniQuery;
  usuarioSelecionado: TUsuario;
  senhaHash: String;

begin
  try

    query := TUniQuery.Create(nil);
    query.connection := DataModule1.dbConnection;

    query.Close;
    query.SQL.Clear;

    query.SQL.Add('select * from usuarios2 ');
    query.SQL.Add('Where login = :login and senha = md5(:senha)');

    query.ParamByName('login').Value := nome;

    senhaHash := Self.semente + senha + Self.semente;
    query.ParamByName('senha').Value := senha;

    query.ExecSQL;
  finally
    usuarioSelecionado := TUsuario.Create;

    usuarioSelecionado.cod := query.FieldByName('codigo').AsInteger;
    usuarioSelecionado.nome_completo := query.FieldByName('nome_completo').AsString;
    usuarioSelecionado.email := query.FieldByName('email').AsString;
    usuarioSelecionado.login := query.FieldByName('login').AsString;
    usuarioSelecionado.senha := query.FieldByName('senha').AsString;

    Result := usuarioSelecionado;

    FreeAndNil(query);
  end;
end;

procedure TUsuario.FindByNomeCompleto(const objUsuario: TUsuario);
var
  query: TUniQuery;
begin
  try

    query := TUniQuery.Create(nil);
    query.connection := DataModule1.dbConnection;

    query.Close;
    query.SQL.Clear;

    query.SQL.Add('select * from usuarios2 ');
    query.SQL.Add('Where nome_completo = ' + QuotedStr(objUsuario.nome_completo));

    query.ExecSQL;
    if query.RecordCount > 0 then
    begin
      objUsuario.cod := query.FieldByName('codigo').AsInteger;
      objUsuario.email := query.FieldByName('email').AsString;
      objUsuario.login := query.FieldByName('login').AsString;
      objUsuario.senha := query.FieldByName('senha').AsString;
    end;
  finally
    FreeAndNil(query);
  end;
end;
end.
