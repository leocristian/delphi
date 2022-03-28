unit SetupDatabase;

interface

uses
  System.SysUtils, System.Classes, UniProvider, PostgreSQLUniProvider, Data.DB,
  MemDS, DBAccess, Uni, VirtualTable, frxClass, frxDBSet;

type
  TDataModule3 = class(TDataModule)
    PostgreSQLUniProvider1: TPostgreSQLUniProvider;
    UniConnection1: TUniConnection;
    UniTable1: TUniTable;
    DataSource1: TDataSource;
    UniTable2: TUniTable;
    DataSource2: TDataSource;
    UniTable3: TUniTable;
    UniTable4: TUniTable;
    DataSource4: TDataSource;
    DataSource3: TDataSource;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule3: TDataModule3;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
