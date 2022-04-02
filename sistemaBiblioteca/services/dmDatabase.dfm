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
  object dsUsuarios: TDataSource
    DataSet = tbUsuarios
    Left = 56
    Top = 232
  end
  object tbUsuarios: TUniTable
    TableName = 'usuarios'
    Connection = dbConnection
    Active = True
    Left = 56
    Top = 160
  end
  object tbClientes: TUniTable
    TableName = 'clientes'
    Connection = dbConnection
    Active = True
    Left = 128
    Top = 160
  end
  object dsClientes: TDataSource
    DataSet = tbClientes
    Left = 128
    Top = 232
  end
  object dsLivros: TDataSource
    DataSet = tbLivros
    Left = 208
    Top = 232
  end
  object tbLivros: TUniTable
    TableName = 'livros'
    Connection = dbConnection
    Active = True
    Left = 208
    Top = 160
  end
  object tbEditoras: TUniTable
    TableName = 'editoras'
    Connection = dbConnection
    Active = True
    Left = 280
    Top = 160
  end
  object dsEditoras: TDataSource
    DataSet = tbEditoras
    Left = 280
    Top = 232
  end
  object tbVendas: TUniTable
    TableName = 'vendas'
    Connection = dbConnection
    Active = True
    Left = 352
    Top = 160
  end
  object dsVendas: TDataSource
    DataSet = tbVendas
    Left = 352
    Top = 232
  end
  object relVendas: TfrxReport
    Version = '2022.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44653.748292037000000000
    ReportOptions.LastChange = 44653.756675057900000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 432
    Top = 120
    Datasets = <
      item
        DataSet = relDsVendas
        DataSetName = 'relDsVendas'
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
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Codigo')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 124.724490000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Vendedor')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 317.480520000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Livro')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 468.661720000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Cliente')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 623.622450000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Valor total')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 166.299320000000000000
        Top = 102.047310000000000000
        Width = 718.110700000000000000
        DataSet = relDsVendas
        DataSetName = 'relDsVendas'
        RowCount = 0
        object relDsVendascodigo: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 22.677180000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'codigo'
          DataSet = relDsVendas
          DataSetName = 'relDsVendas'
          Frame.Typ = []
          Memo.UTF8W = (
            '[relDsVendas."codigo"]')
        end
        object relDsVendasvendedor: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 124.724490000000000000
          Top = 22.677180000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          DataField = 'vendedor'
          DataSet = relDsVendas
          DataSetName = 'relDsVendas'
          Frame.Typ = []
          Memo.UTF8W = (
            '[relDsVendas."vendedor"]')
        end
        object relDsVendaslivro: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 317.480520000000000000
          Top = 22.677180000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DataField = 'livro'
          DataSet = relDsVendas
          DataSetName = 'relDsVendas'
          Frame.Typ = []
          Memo.UTF8W = (
            '[relDsVendas."livro"]')
        end
        object relDsVendascliente: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 468.661720000000000000
          Top = 22.677180000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          DataField = 'cliente'
          DataSet = relDsVendas
          DataSetName = 'relDsVendas'
          Frame.Typ = []
          Memo.UTF8W = (
            '[relDsVendas."cliente"]')
        end
        object relDsVendasvalor_total: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 623.622450000000000000
          Top = 22.677180000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'valor_total'
          DataSet = relDsVendas
          DataSetName = 'relDsVendas'
          Frame.Typ = []
          Memo.UTF8W = (
            '[relDsVendas."valor_total"]')
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 328.819110000000000000
        Width = 718.110700000000000000
      end
    end
  end
  object relDsVendas: TfrxDBDataset
    UserName = 'relDsVendas'
    CloseDataSource = False
    DataSet = tbVendas
    BCDToCurrency = False
    DataSetOptions = []
    Left = 432
    Top = 56
  end
end
