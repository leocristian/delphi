unit BuscaControle;

interface
uses Usuario, Uni, System.SysUtils, Generics.Collections;

type
  TBuscaControle = class
    public
      function FilterByNomeCompleto(var nomeBusca: String): TList<TUsuario>;
  end;

implementation

uses dmDatabase;

function TBuscaControle.FilterByNomeCompleto(var nomeBusca: String): TList<TUsuario>;
var
  query: TUniQuery;
  listaUsuarios: TList<TUsuario>;
  usuarioAtual: TUsuario;

begin
  try

    query := TUniQuery.Create(nil);
    query.Connection := DataModule1.dbConnection;

    query.Close;
    query.SQL.Clear;

    query.SQL.Add('select * from usuarios where nome_completo like '+ QuotedStr('%:nomeBusca%'));

    query.ExecSQL;


  finally

    usuarioAtual := TUsuario.Create;
    listaUsuarios := TList<TUsuario>.create;
    query.First; // seleciona o primeiro elemento do resultado

    while not query.Eof do
    begin
      usuarioAtual.cod := query.FieldByName('codigo').AsInteger;
      usuarioAtual.nome_completo := query.FieldByName('NomeCompleto').AsString;
      usuarioAtual.email := query.FieldByName('email').AsString;
      usuarioAtual.login := query.FieldByName('login').AsString;
      usuarioAtual.senha := query.FieldByName('senha').AsString;

      listaUsuarios.Add(usuarioAtual);

      query.Next; // seleciona o elemento seguinte do resultado
    end;

    FreeAndNil(usuarioAtual);
    FreeAndNil(query);

    Result := listaUsuarios;
  end;
end;

end.
