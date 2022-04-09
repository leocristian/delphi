unit dm1;

interface

uses
  System.SysUtils, System.Classes, Data.DB, MemDS, DBAccess, Uni, UniProvider,
  PostgreSQLUniProvider;

type
  Tdm = class(TDataModule)
    ProvedorPG: TPostgreSQLUniProvider;
    con1: TUniConnection;
    q1: TUniQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
