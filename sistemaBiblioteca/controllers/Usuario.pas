unit Usuario;


interface

uses
  Uni, dmDatabase;

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

var
  dataModule: TDataModule1;

procedure FreeAndNil(var obj);
var
  aux: TObject;
begin
  aux := TObject(obj);
  Pointer(obj) := nil;
  aux.Free;
end;

procedure TUsuario.Insert(const objUsuario: TUsuario);
var
  query: TUniQuery;
begin
  try
    query := TUniQuery.Create(query);
    query.Connection := dataModule.dbConnection;

    query.Close;
    query.SQL.Text := 'select nextval('' '') as codProximo';
    query.Open;

    objUsuario.cod := query.FieldByName('codProximo').AsInteger;

  finally
    FreeAndNil(query);
  end;

    query.SQL.Add('oi');

end;

procedure TUsuario.Read(const objUsuario: TUsuario);
begin
  WriteLn('oi');
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
