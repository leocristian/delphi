unit u_vendaControle;

interface

type
  TVendaControle = class

    valorAtual: Float32;
    procedure IncrementaValor(const novoValor: Float32);
    procedure ZerarValor;

    constructor Create;

  end;

implementation

procedure TVendaControle.IncrementaValor(const novoValor: Float32);
begin
  Self.valorAtual := Self.valorAtual + novoValor;
end;

procedure TVendaControle.ZerarValor;
begin
  Self.valorAtual := 0;
end;

constructor TVendaControle.Create;
begin
  Self.ZerarValor;
end;

end.
