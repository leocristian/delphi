object DataModule3: TDataModule3
  OldCreateOrder = False
  Height = 346
  Width = 478
  object PostgreSQLUniProvider1: TPostgreSQLUniProvider
    Left = 128
    Top = 24
  end
  object UniConnection1: TUniConnection
    ProviderName = 'PostgreSQL'
    Port = 5432
    Database = 'livrariaDB'
    Username = 'postgres'
    Connected = True
    LoginPrompt = False
    Left = 128
    Top = 64
    EncryptedPassword = '9EFF9BFF92FF96FF91FF'
  end
  object UniTable1: TUniTable
    TableName = 'livros'
    Connection = UniConnection1
    Active = True
    Left = 40
    Top = 128
  end
  object DataSource1: TDataSource
    DataSet = UniTable1
    Left = 40
    Top = 184
  end
  object UniTable2: TUniTable
    TableName = 'usuarios'
    Connection = UniConnection1
    Active = True
    Left = 128
    Top = 136
  end
  object DataSource2: TDataSource
    DataSet = UniTable2
    Left = 128
    Top = 182
  end
  object UniTable3: TUniTable
    TableName = 'vendas'
    Connection = UniConnection1
    Active = True
    Left = 208
    Top = 136
  end
  object DataSource3: TDataSource
    DataSet = UniTable3
    Left = 208
    Top = 182
  end
  object UniTable4: TUniTable
    TableName = 'clientes'
    Connection = UniConnection1
    Active = True
    Left = 272
    Top = 120
  end
  object DataSource4: TDataSource
    DataSet = UniTable4
    Left = 272
    Top = 166
  end
end
