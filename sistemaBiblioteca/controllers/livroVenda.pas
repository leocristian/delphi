unit livroVenda;


interface

uses uni, System.Sysutils, Generics.Collections;

type
  TLivroVenda = class
    titulo: String;
    numeroVenda: Integer;

    procedure Insert(const objLivroVenda: TLivroVenda);
//    procedure Read(const objLivroVenda: TLivroVenda);
//    procedure Update(var objLivroVenda: TLivroVenda);
//    procedure Delete(const objLivroVenda: TLivroVenda);


    function FindAllByCodVenda(var codVenda: Integer): TList<String>;

  end;
implementation

uses dmDatabase;

var
  query: TUniQuery;

procedure TLivroVenda.Insert(const objLivroVenda: TLivroVenda);
begin
  try
    query := TUniQuery.Create(nil);
    query.Connection := DataModule1.dbConnection;

    query.Close;
    query.SQL.Clear;

    query.SQL.Add('insert into livros_venda (titulo_livro, numero_venda) ');
    query.SQL.Add('values');
    query.SQL.Add('(:tituloLivro, :numeroVenda)');

    query.ParamByName('tituloLivro').Value := objLivroVenda.titulo;
    query.ParamByName('numeroVenda').Value := objLivroVenda.numeroVenda;

    query.ExecSQL;
  finally
    FreeAndNil(query);
  end;

end;

function TLivroVenda.FindAllByCodVenda(var codVenda: Integer): TList<String>;
var
  query: TUniQuery;
  livroAtual: String;
  resultado: TList<String>;
begin

  query := TUniQuery.Create(nil);
  query.Connection := DataModule1.dbConnection;

  query.Close;
  query.SQL.Clear;

  query.SQL.Add('select * from livros_venda ');
  query.SQL.Add('where numero_venda = :numeroVenda');

  query.Parambyname('numeroVenda').Value := codVenda;

  query.ExecSQL;
  resultado := TList<String>.Create;

  query.First;
  while not query.Eof do
  begin
    livroAtual := query.FieldByName('titulo_livro').Value;
    resultado.Add(livroAtual);

    query.Next;
  end;

  Result := resultado;
end;
end.
