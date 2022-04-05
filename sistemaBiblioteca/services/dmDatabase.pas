unit dmDatabase;

interface

uses
  System.SysUtils, System.Classes, Data.DB, DBAccess, Uni, UniProvider,
  PostgreSQLUniProvider, MemDS, frxClass, frxDBSet, VirtualTable;

type
  TDataModule1 = class(TDataModule)
    pgProvider: TPostgreSQLUniProvider;
    dbConnection: TUniConnection;
    dsUsuarios: TDataSource;
    tbUsuarios: TUniTable;
    tbClientes: TUniTable;
    dsClientes: TDataSource;
    dsLivros: TDataSource;
    tbLivros: TUniTable;
    tbEditoras: TUniTable;
    dsEditoras: TDataSource;
    tbVendas: TUniTable;
    dsVendas: TDataSource;
    relVendas: TfrxReport;
    relDsVendas: TfrxDBDataset;

    procedure ShowRelatorioVendas;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModule1.ShowRelatorioVendas;
begin
  DataModule1.relVendas.ShowReport;
end;
end.
