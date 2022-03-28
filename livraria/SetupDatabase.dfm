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
  object frxReport1: TfrxReport
    Version = '2022.1.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44647.973267546300000000
    ReportOptions.LastChange = 44647.996094675920000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 264
    Top = 272
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object Memo1: TfrxMemoView
        AllowVectorExport = True
        Left = 41.574830000000000000
        Top = 83.149660000000000000
        Width = 268.346630000000000000
        Height = 26.456710000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Memo.UTF8W = (
          'Relat'#243'rio geral de vendas')
        ParentFont = False
      end
      object Memo2: TfrxMemoView
        AllowVectorExport = True
        Left = 45.354360000000000000
        Top = 158.740260000000000000
        Width = 90.708720000000000000
        Height = 22.677180000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          'Vendedor')
        ParentFont = False
      end
      object Memo3: TfrxMemoView
        AllowVectorExport = True
        Left = 200.315090000000000000
        Top = 158.740260000000000000
        Width = 90.708720000000000000
        Height = 22.677180000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          'Cliente')
        ParentFont = False
      end
      object Memo4: TfrxMemoView
        AllowVectorExport = True
        Left = 362.834880000000000000
        Top = 154.960730000000000000
        Width = 90.708720000000000000
        Height = 22.677180000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          'Livro')
        ParentFont = False
      end
      object frxDBDataset1vendedor: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 56.692950000000000000
        Top = 181.417440000000000000
        Width = 158.740260000000000000
        Height = 18.897650000000000000
        DataField = 'vendedor'
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        Frame.Typ = []
        Memo.UTF8W = (
          '[frxDBDataset1."vendedor"]')
      end
      object frxDBDataset1cliente: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 222.992270000000000000
        Top = 181.417440000000000000
        Width = 158.740260000000000000
        Height = 18.897650000000000000
        DataField = 'cliente'
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        Frame.Typ = []
        Memo.UTF8W = (
          '[frxDBDataset1."cliente"]')
      end
      object frxDBDataset1livro: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 393.071120000000000000
        Top = 181.417440000000000000
        Width = 120.944960000000000000
        Height = 18.897650000000000000
        DataField = 'livro'
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        Frame.Typ = []
        Memo.UTF8W = (
          '[frxDBDataset1."livro"]')
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = UniTable3
    BCDToCurrency = False
    DataSetOptions = []
    Left = 368
    Top = 248
  end
end
