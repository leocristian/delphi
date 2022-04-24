object MostrarVendaForm: TMostrarVendaForm
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'MostrarVendaForm'
  ClientHeight = 540
  ClientWidth = 764
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 40
    Top = 154
    Width = 195
    Height = 24
    Caption = 'Livros selecionados'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 593
    Top = 427
    Width = 91
    Height = 23
    Caption = 'Valor total:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object labelPreco: TLabel
    Left = 636
    Top = 456
    Width = 17
    Height = 33
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 593
    Top = 456
    Width = 37
    Height = 33
    Caption = 'R$'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 121
    Top = 69
    Width = 76
    Height = 13
    Caption = 'Nome do cliente'
  end
  object TituloLabel: TLabel
    Left = 368
    Top = 69
    Width = 64
    Height = 13
    Caption = 'Titulo do livro'
  end
  object TituloPagina: TLabel
    Left = 40
    Top = 16
    Width = 219
    Height = 33
    Caption = 'Venda escolhida'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 40
    Top = 69
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object TituloInput: TEdit
    Left = 368
    Top = 88
    Width = 217
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 50
    TabOrder = 1
  end
  object ClienteInput: TEdit
    Left = 121
    Top = 88
    Width = 241
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 100
    TabOrder = 0
  end
  object SalvarBtn: TButton
    Left = 40
    Top = 435
    Width = 177
    Height = 53
    Caption = 'Salvar altera'#231#245'es'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = SalvarBtnClick
  end
  object AddLivro: TButton
    Left = 606
    Top = 76
    Width = 131
    Height = 46
    Caption = 'Adicionar livro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = AddLivroClick
  end
  object CodigoInput: TEdit
    Left = 40
    Top = 88
    Width = 75
    Height = 21
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 4
  end
  object ModoInput: TEdit
    Left = 223
    Top = 453
    Width = 25
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 5
    Visible = False
  end
  object grid_livros: TcxGrid
    Left = 40
    Top = 184
    Width = 717
    Height = 237
    PopupMenu = PopupMenu1
    TabOrder = 6
    object grid_livrosDBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = vds_livrosVenda
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = 'Livro n'#227'o encontrado'
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 20
      object grid_livrosDBTableView1titulo: TcxGridDBColumn
        Caption = 'T'#237'tulo'
        DataBinding.FieldName = 'titulo'
      end
      object grid_livrosDBTableView1ano_publicacao: TcxGridDBColumn
        Caption = 'Ano de publica'#231#227'o'
        DataBinding.FieldName = 'ano_publicacao'
      end
      object grid_livrosDBTableView1preco: TcxGridDBColumn
        Caption = 'Pre'#231'o'
        DataBinding.FieldName = 'preco'
      end
    end
    object grid_livrosLevel1: TcxGridLevel
      GridView = grid_livrosDBTableView1
    end
  end
  object ComprovanteBtn: TButton
    Left = 40
    Top = 435
    Width = 177
    Height = 53
    Caption = 'Ver comprovante'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = ComprovanteBtnClick
  end
  object vtb_livrosVenda: TVirtualTable
    Active = True
    FieldDefs = <
      item
        Name = 'titulo'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'editora'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ano_publicacao'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'preco'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'numero_venda'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'codigo'
        DataType = ftString
        Size = 20
      end>
    Left = 304
    Top = 128
    Data = {
      040006000600746974756C6F01001400000000000700656469746F7261010014
      00000000000E00616E6F5F7075626C69636163616F0100140000000000050070
      7265636F01001400000000000C006E756D65726F5F76656E6461010014000000
      00000600636F6469676F0100140000000000000000000000}
  end
  object vds_livrosVenda: TDataSource
    DataSet = vtb_livrosVenda
    Left = 416
    Top = 128
  end
  object PopupMenu1: TPopupMenu
    Left = 504
    Top = 136
    object removerLivro: TMenuItem
      Caption = 'Remover livro da venda'
      OnClick = removerLivroClick
    end
  end
  object rel_comprovante: TfrxReport
    Version = '2022.2.3'
    DataSet = ds_rel_livrosVenda
    DataSetName = 'frxDBDataset1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44673.677277291700000000
    ReportOptions.LastChange = 44673.677277291700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 280
    Top = 456
    Datasets = <
      item
        DataSet = ds_rel_livrosVenda
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <
      item
        Name = ' Variaveis Venda'
        Value = Null
      end
      item
        Name = 'data'
        Value = Null
      end
      item
        Name = 'vendedor'
        Value = Null
      end
      item
        Name = 'cliente'
        Value = Null
      end
      item
        Name = 'valor'
        Value = Null
      end
      item
        Name = 'numero_venda'
        Value = Null
      end>
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
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 419.527830000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 309.921460000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Comprovante de venda n'#176)
          ParentFont = False
        end
        object numero_venda: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 317.480520000000000000
          Width = 200.315090000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[numero_venda]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 34.015770000000000000
          Top = 158.740260000000000000
          Width = 86.929190000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Cliente:')
          ParentFont = False
        end
        object cliente: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 124.724490000000000000
          Top = 158.740260000000000000
          Width = 502.677490000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[cliente]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 37.795300000000000000
          Top = 64.252010000000000000
          Width = 154.960730000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Data da venda:')
          ParentFont = False
        end
        object data1: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 204.094620000000000000
          Top = 64.252010000000000000
          Width = 158.740260000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[data]')
          ParentFont = False
        end
        object vendedor: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 158.740260000000000000
          Top = 113.385900000000000000
          Width = 502.677490000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[vendedor]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 37.795300000000000000
          Top = 113.385900000000000000
          Width = 117.165430000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Vendedor:')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 34.015770000000000000
          Top = 215.433210000000000000
          Width = 170.078850000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Valor total (R$):')
          ParentFont = False
        end
        object valor: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 211.653680000000000000
          Top = 215.433210000000000000
          Width = 154.960730000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[valor]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 37.795300000000000000
          Top = 332.598640000000000000
          Width = 207.874150000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Livros vendidos')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 37.795300000000000000
          Top = 393.071120000000000000
          Width = 86.929190000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 158.740260000000000000
          Top = 393.071120000000000000
          Width = 86.929190000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'T'#237'tulo')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 272.126160000000000000
          Top = 393.071120000000000000
          Width = 86.929190000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Editora')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 381.732530000000000000
          Top = 393.071120000000000000
          Width = 86.929190000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Ano')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 491.338900000000000000
          Top = 393.071120000000000000
          Width = 86.929190000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Pre'#231'o')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 604.724800000000000000
          Top = 393.071120000000000000
          Width = 94.488250000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Categoria')
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
        Height = 45.354360000000000000
        Top = 498.897960000000000000
        Width = 718.110700000000000000
        RowCount = 0
        object frxDBDataset1frxDBDataset1: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 34.015770000000000000
          Top = 11.338590000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = ds_rel_livrosVenda
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."codigo"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 154.960730000000000000
          Top = 11.338590000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = ds_rel_livrosVenda
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."titulo"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 272.126160000000000000
          Top = 11.338590000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = ds_rel_livrosVenda
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."editora"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 381.732530000000000000
          Top = 11.338590000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = ds_rel_livrosVenda
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."ano_publicacao"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 491.338900000000000000
          Top = 11.338590000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = ds_rel_livrosVenda
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."preco"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 604.724800000000000000
          Top = 11.338590000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = ds_rel_livrosVenda
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."categoria"]')
          ParentFont = False
        end
      end
    end
  end
  object ds_rel_livrosVenda: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = FormVendas.tb_vendas
    BCDToCurrency = False
    DataSetOptions = []
    Left = 384
    Top = 448
  end
end
