unit VendaControle;

interface

type
  TVendaControle = class

    valorAtual: Float32;
    procedure IncrementaValor(const novoValor: Float32);

    constructor Create;

  end;

implementation

procedure TVendaControle.IncrementaValor(const novoValor: Float32);
begin
  Self.valorAtual := Self.valorAtual + novoValor;
end;

constructor TVendaControle.Create;
begin
  Self.valorAtual := 0;
end;

end.
