object dm1: Tdm1
  OldCreateOrder = False
  Height = 264
  Width = 543
  object ProvedorPG: TPostgreSQLUniProvider
    Left = 40
    Top = 40
  end
  object con1: TUniConnection
    ProviderName = 'PostgreSQL'
    Port = 5432
    Database = 'bibliotecaDB'
    Username = 'postgres'
    Connected = True
    LoginPrompt = False
    Left = 104
    Top = 40
    EncryptedPassword = '9EFF9BFF92FF96FF91FF'
  end
end
