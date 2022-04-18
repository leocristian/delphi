object dm1: Tdm1
  OldCreateOrder = False
  Height = 237
  Width = 351
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
  object rel_vendasDataset: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = tb_vendas
    BCDToCurrency = False
    DataSetOptions = []
    Left = 248
    Top = 120
  end
  object ds_vendas: TDataSource
    DataSet = tb_vendas
    Left = 248
    Top = 168
  end
  object tb_vendas: TUniTable
    TableName = 'vendas'
    Connection = con1
    Active = True
    Left = 160
    Top = 160
  end
  object rel_vendas: TfrxReport
    Version = '2022.2'
    DataSet = rel_vendasDataset
    DataSetName = 'frxDBDataset1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44667.546362592600000000
    ReportOptions.LastChange = 44667.546362592600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 160
    Top = 120
    Datasets = <
      item
        DataSet = rel_vendasDataset
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
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 71.811070000000000000
        Top = 102.047310000000000000
        Width = 718.110700000000000000
        RowCount = 0
        object frxDBDataset1codigo: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 30.236240000000000000
          Top = 30.236240000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'codigo'
          DataSet = rel_vendasDataset
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."codigo"]')
        end
        object frxDBDataset1vendedor: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 132.283550000000000000
          Top = 30.236240000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          DataField = 'vendedor'
          DataSet = rel_vendasDataset
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."vendedor"]')
        end
        object frxDBDataset1cliente: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 272.126160000000000000
          Top = 30.236240000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DataField = 'cliente'
          DataSet = rel_vendasDataset
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."cliente"]')
        end
        object frxDBDataset1valor_total: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 442.205010000000000000
          Top = 30.236240000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'valor_total'
          DataSet = rel_vendasDataset
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."valor_total"]')
        end
        object frxDBDataset1data_venda: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 604.724800000000000000
          Top = 30.236240000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'data_venda'
          DataSet = rel_vendasDataset
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."data_venda"]')
        end
      end
    end
  end
end
