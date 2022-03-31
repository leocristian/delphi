unit Cliente;

interface

uses
  Uni, dmDatabase;

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
begin

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
