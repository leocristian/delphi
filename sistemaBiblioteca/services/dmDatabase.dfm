object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 360
  Width = 576
  object pgProvider: TPostgreSQLUniProvider
    Left = 56
    Top = 40
  end
  object dbConnection: TUniConnection
    ProviderName = 'PostgreSQL'
    Port = 5432
    Database = 'bibliotecaDB'
    Username = 'postgres'
    Connected = True
    LoginPrompt = False
    Left = 56
    Top = 96
    EncryptedPassword = '9EFF9BFF92FF96FF91FF'
  end
end
