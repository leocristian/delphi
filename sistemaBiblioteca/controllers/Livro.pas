unit Livro;

interface

uses
  Uni, dmDatabase, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, MenuFrame,
  Vcl.ToolWin, Vcl.ComCtrls, System.Actions, Vcl.ActnList, Vcl.ExtCtrls;

type
  TLivro = class
    cod: Integer;
    titulo: String;
    editora: String;
    anoPublicacao: String;
    preco: String;

    procedure Insert(const objLivro: TLivro);
//    procedure Read(const objLivro: TLivro);
//    procedure Update(const objLivro: TLivro);
    procedure Delete(const codLivro: Integer);

    function FindByTitulo(const tituloParam: String): TLivro;

  end;

implementation

procedure TLivro.Insert(const objLivro: TLivro);
var
  query: TUniQuery;
  valuesStr: String;

begin
  try
    query := TUniQuery.Create(nil);
    query.Connection := DataModule1.dbConnection;

    query.Close;
    query.SQL.Text := 'select nextval(''tb_livros_cod_seq'') as codProximo';
    query.Open;
    objLivro.cod := query.FieldByName('codProximo').AsInteger;

    query.Close;
    query.SQL.Clear;
    query.SQL.Add('insert into livros (codigo, titulo, editora, ano_publicacao, preco) ');
    query.SQL.Add('values ');

    valuesStr := '(' + IntToStr(objLivro.cod) + ',' + QuotedStr(objLivro.titulo)
                  + ',' + QuotedStr(objLivro.editora)
                  + ',' + QuotedStr(objLivro.anoPublicacao)
                  + ',' + QuotedStr(objLivro.preco) + ')';

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

procedure TLivro.Delete(const codLivro: Integer);
var
  query: TUniQuery;

begin
  try
    query := TUniQuery.Create(nil);
    query.Connection := DataModule1.dbConnection;

    query.Close;
    query.SQL.Clear;

    query.SQL.Add('delete from livros where codigo = ' + codLivro.ToString);

    query.ExecSQL;

  finally
    FreeAndNil(query);
  end;
end;

function TLivro.FindByTitulo(const tituloParam: String): TLivro;
var
  query: TUniQuery;
  livroSelecionado: TLivro;

begin
  try
    query := TUniQuery.Create(nil);
    query.connection := DataModule1.dbConnection;

    query.Close;
    query.SQL.Clear;

    query.SQL.Add('select * from livros ');
    query.SQL.Add('where titulo = ' + QuotedStr(tituloParam));

    query.ExecSQL;

  finally

    livroSelecionado := Tlivro.Create;

    livroSelecionado.cod := query.FieldByName('codigo').AsInteger;
    livroSelecionado.titulo := query.FieldByName('titulo').AsString;
    livroSelecionado.editora := query.FieldByName('editora').AsString;
    livroSelecionado.anoPublicacao := query.FieldByName('ano_publicacao').AsString;
    livroSelecionado.preco := query.FieldByName('preco').AsString;

    Result := livroSelecionado;

    FreeAndNil(query);
  end;
end;
end.
