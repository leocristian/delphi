object dm1: Tdm1
  OldCreateOrder = False
  Height = 253
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
  object tb_usuarios: TUniTable
    TableName = 'usuarios2'
    Connection = con1
    Active = True
    Left = 40
    Top = 120
  end
  object ds_usuarios: TDataSource
    DataSet = tb_usuarios
    Left = 40
    Top = 176
  end
end
