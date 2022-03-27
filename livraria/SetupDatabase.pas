unit SetupDatabase;

interface

uses
  System.SysUtils, System.Classes, UniProvider, PostgreSQLUniProvider, Data.DB,
  MemDS, DBAccess, Uni;

type
  TDataModule3 = class(TDataModule)
    PostgreSQLUniProvider1: TPostgreSQLUniProvider;
    UniConnection1: TUniConnection;
    UniTable1: TUniTable;
    DataSource1: TDataSource;
    UniTable2: TUniTable;
    DataSource2: TDataSource;
    UniTable3: TUniTable;
    DataSource3: TDataSource;
    UniTable4: TUniTable;
    DataSource4: TDataSource;
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
