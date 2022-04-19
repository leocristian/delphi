unit u_dm1;

interface

uses
  System.SysUtils, System.Classes, Data.DB, MemDS, DBAccess, Uni, UniProvider,
  PostgreSQLUniProvider, frxClass, frxDBSet;

type
  Tdm1 = class(TDataModule)
    ProvedorPG: TPostgreSQLUniProvider;
    con1: TUniConnection;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm1: Tdm1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
