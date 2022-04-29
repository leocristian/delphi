object FormVenda: TFormVenda
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FormVenda'
  ClientHeight = 613
  ClientWidth = 958
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  DesignSize = (
    958
    613)
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 627
    Top = 524
    Width = 91
    Height = 19
    Anchors = [akLeft, akBottom]
    Caption = 'Valor total:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 958
    Height = 505
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 5
    ExplicitWidth = 1037
    object Label4: TLabel
      Left = 113
      Top = 93
      Width = 68
      Height = 13
      Caption = 'CPF do cliente'
    end
    object Label7: TLabel
      Left = 32
      Top = 93
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object TituloPagina: TLabel
      Left = 32
      Top = 40
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
    object TituloLabel: TLabel
      Left = 430
      Top = 93
      Width = 64
      Height = 13
      Caption = 'Titulo do livro'
    end
    object Label2: TLabel
      Left = 32
      Top = 155
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
    object Label1: TLabel
      Left = 32
      Top = 433
      Width = 173
      Height = 19
      Caption = 'Forma de pagamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 32
      Top = 458
      Width = 20
      Height = 13
      Caption = 'Tipo'
    end
    object Label8: TLabel
      Left = 191
      Top = 480
      Width = 74
      Height = 13
      Caption = 'N'#176' de parcelas:'
    end
    object AddLivro: TButton
      Left = 774
      Top = 87
      Width = 131
      Height = 46
      Cursor = crHandPoint
      Caption = 'Adicionar livro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = AddLivroClick
    end
    object ClienteInput: TEdit
      Left = 113
      Top = 112
      Width = 241
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 60
      TabOrder = 1
    end
    object CodigoInput: TEdit
      Left = 32
      Top = 112
      Width = 75
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 0
    end
    object TituloInput: TEdit
      Left = 430
      Top = 112
      Width = 243
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 2
    end
    object grid_livros: TcxGrid
      Left = 32
      Top = 185
      Width = 873
      Height = 237
      TabOrder = 6
      object grid_livrosDBTableView1: TcxGridDBTableView
        PopupMenu = PopupMenu1
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
        OptionsBehavior.IncSearch = True
        OptionsSelection.CellSelect = False
        OptionsView.NoDataToDisplayInfoText = 'Nenhum livro na venda'
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        OptionsView.IndicatorWidth = 20
        Styles.ContentEven = frame_estilo_grid1.linhas
        Styles.IncSearch = frame_estilo_grid1.busca
        Styles.Header = frame_estilo_grid1.cabecalho
        object grid_livrosDBTableView1codigo: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'codigo'
          Width = 50
        end
        object grid_livrosDBTableView1titulo: TcxGridDBColumn
          Caption = 'T'#237'tulo'
          DataBinding.FieldName = 'titulo'
        end
        object grid_livrosDBTableView1editora: TcxGridDBColumn
          Caption = 'Editora'
          DataBinding.FieldName = 'editora'
        end
        object grid_livrosDBTableView1ano_publicacao: TcxGridDBColumn
          Caption = 'Ano de publica'#231#227'o'
          DataBinding.FieldName = 'ano_publicacao'
        end
        object grid_livrosDBTableView1preco: TcxGridDBColumn
          Caption = 'Pre'#231'o unidade'
          DataBinding.FieldName = 'preco_unitario'
          Width = 94
        end
        object grid_livrosDBTableView1categoria: TcxGridDBColumn
          Caption = 'Categoria'
          DataBinding.FieldName = 'categoria'
        end
        object grid_livrosDBTableView1qtdEscolhida: TcxGridDBColumn
          DataBinding.FieldName = 'qtdEscolhida'
        end
        object grid_livrosDBTableView1preco_final: TcxGridDBColumn
          AlternateCaption = 'Pre'#231'o final'
          Caption = 'Pre'#231'o final'
          DataBinding.FieldName = 'preco_final'
        end
      end
      object grid_livrosLevel1: TcxGridLevel
        GridView = grid_livrosDBTableView1
      end
    end
    object TipoPagamento: TComboBox
      Left = 32
      Top = 477
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 4
      Text = 'DINHEIRO'
      Items.Strings = (
        'DINHEIRO'
        'CART'#195'O'
        'PIX')
    end
    object QtdParcelas: TEdit
      Left = 271
      Top = 477
      Width = 26
      Height = 21
      MaxLength = 2
      NumbersOnly = True
      TabOrder = 5
    end
    object Button1: TButton
      Left = 233
      Top = 154
      Width = 25
      Height = 25
      Hint = 
        'Ajuda|Clique com o bot'#227'o direito sobre um livro para remov'#234'-lo d' +
        'a venda|0'
      CustomHint = BalloonHint1
      Caption = '?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBackground
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ImageIndex = 0
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
    end
  end
  object ModoInput: TEdit
    Left = 223
    Top = 551
    Width = 29
    Height = 21
    TabStop = False
    Anchors = [akLeft, akBottom]
    TabOrder = 1
    Visible = False
  end
  inline frame_estilo_grid1: Tframe_estilo_grid
    Left = 430
    Top = 8
    Width = 75
    Height = 72
    TabOrder = 2
    ExplicitLeft = 430
    ExplicitTop = 8
    ExplicitWidth = 75
    inherited estilo_padrao: TcxStyleRepository
      Left = 24
      PixelsPerInch = 96
    end
  end
  object ConfirmarBtn: TButton
    Left = 32
    Top = 534
    Width = 185
    Height = 52
    Anchors = [akLeft, akBottom]
    Caption = 'Confirmar venda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = ConfirmarBtnClick
  end
  object DataPanel: TPanel
    Left = 648
    Top = 0
    Width = 257
    Height = 73
    BevelInner = bvRaised
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      257
      73)
    object DataTituloLabel: TLabel
      Left = 10
      Top = 18
      Width = 100
      Height = 16
      Caption = 'Data da venda:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DataLabel: TLabel
      Left = 116
      Top = 18
      Width = 4
      Height = 16
      Anchors = [akLeft, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object VendedorTituloLabel: TLabel
      Left = 10
      Top = 40
      Width = 68
      Height = 16
      Caption = 'Vendedor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object VendedorLabel: TLabel
      Left = 84
      Top = 40
      Width = 4
      Height = 16
      Anchors = [akLeft, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object ValorVenda: TcxCurrencyEdit
    Left = 631
    Top = 549
    TabStop = False
    Enabled = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clRed
    Style.Font.Height = -24
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    StyleDisabled.BorderColor = clBackground
    StyleDisabled.TextColor = clRed
    TabOrder = 5
    Width = 274
  end
  object vtb_livrosVenda: TVirtualTable
    Active = True
    FieldDefs = <
      item
        Name = 'codigo'
        DataType = ftString
        Size = 20
      end
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
        Name = 'preco_unitario'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'categoria'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'qtdEscolhida'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'preco_final'
        DataType = ftString
        Size = 20
      end>
    Left = 72
    Top = 368
    Data = {
      040008000600636F6469676F01001400000000000600746974756C6F01001400
      000000000700656469746F726101001400000000000E00616E6F5F7075626C69
      636163616F01001400000000000E00707265636F5F756E69746172696F010014
      0000000000090063617465676F72696101001400000000000C00717464457363
      6F6C6869646101001400000000000B00707265636F5F66696E616C0100140000
      000000000000000000}
  end
  object vds_livrosVenda: TDataSource
    DataSet = vtb_livrosVenda
    Left = 140
    Top = 368
  end
  object ds_rel_livrosVenda: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    BCDToCurrency = False
    DataSetOptions = []
    Left = 296
    Top = 368
  end
  object rel_comprovante: TfrxReport
    Version = '2022.2.3'
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
    Left = 218
    Top = 368
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
      end
      item
        Name = 'tipo_pagamento'
        Value = ''
      end
      item
        Name = 'qtd_parcelas'
        Value = ''
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
        Height = 275.905690000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
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
          Top = 102.047310000000000000
          Width = 86.929190000000000000
          Height = 26.456710000000000000
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
          Top = 102.047310000000000000
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
          Left = 34.015770000000000000
          Top = 41.574830000000000000
          Width = 154.960730000000000000
          Height = 26.456710000000000000
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
          Left = 200.315090000000000000
          Top = 41.574830000000000000
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
          Left = 154.960730000000000000
          Top = 71.811070000000000000
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
          Left = 34.015770000000000000
          Top = 71.811070000000000000
          Width = 117.165430000000000000
          Height = 26.456710000000000000
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
          Top = 132.283550000000000000
          Width = 170.078850000000000000
          Height = 26.456710000000000000
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
          Top = 132.283550000000000000
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
          Left = 3.779530000000000000
          Top = 234.330860000000000000
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
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 34.015770000000000000
          Top = 162.519790000000000000
          Width = 215.433210000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Tipo de pagamento:')
          ParentFont = False
        end
        object tipo_pagamento: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 260.787570000000000000
          Top = 162.519790000000000000
          Width = 177.637910000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[tipo_pagamento]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 34.015770000000000000
          Top = 196.535560000000000000
          Width = 215.433210000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'N'#250'mero de parcelas:')
          ParentFont = False
        end
        object qtd_parcelas: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 260.787570000000000000
          Top = 196.535560000000000000
          Width = 139.842610000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[qtd_parcelas]')
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
        Height = 215.433210000000000000
        Top = 355.275820000000000000
        Width = 718.110700000000000000
        DataSet = ds_rel_livrosVenda
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1codigo: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 102.047310000000000000
          Top = 11.338590000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          DataField = 'codigo'
          DataSet = ds_rel_livrosVenda
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."codigo"]')
          ParentFont = False
        end
        object frxDBDataset1titulo: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 154.960730000000000000
          Top = 34.015770000000000000
          Width = 476.220780000000000000
          Height = 18.897650000000000000
          DataField = 'titulo'
          DataSet = ds_rel_livrosVenda
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."titulo"]')
        end
        object frxDBDataset1editora: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 102.047310000000000000
          Top = 56.692950000000000000
          Width = 529.134200000000000000
          Height = 18.897650000000000000
          DataField = 'editora'
          DataSet = ds_rel_livrosVenda
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."editora"]')
        end
        object frxDBDataset1ano_publicacao: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 188.976500000000000000
          Top = 83.149660000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          DataField = 'ano_publicacao'
          DataSet = ds_rel_livrosVenda
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."ano_publicacao"]')
        end
        object frxDBDataset1preco: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 94.488250000000000000
          Top = 105.826840000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DataField = 'preco'
          DataSet = ds_rel_livrosVenda
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."preco"]')
        end
        object frxDBDataset1categoria: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 120.944960000000000000
          Top = 128.504020000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          DataField = 'categoria'
          DataSet = ds_rel_livrosVenda
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."categoria"]')
        end
        object Memo7: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 34.015770000000000000
          Top = 11.338590000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'C'#243'digo:')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 34.015770000000000000
          Top = 34.015770000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'T'#237'tulo do livro:')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 34.015770000000000000
          Top = 56.692950000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Editora:')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 34.015770000000000000
          Top = 83.149660000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Ano de publica'#231#227'o:')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 34.015770000000000000
          Top = 105.826840000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Pre'#231'o:')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 34.015770000000000000
          Top = 128.504020000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Categoria:')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 200.315090000000000000
          Top = 154.960730000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          DataSet = ds_rel_livrosVenda
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."qtdEscolhida"]')
        end
        object Memo14: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 34.015770000000000000
          Top = 154.960730000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Quantidade vendida:')
          ParentFont = False
        end
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 382
    Top = 368
    object removerLivro: TMenuItem
      Caption = 'Remover livro da venda'
      OnClick = removerLivroClick
    end
  end
  object BalloonHint1: TBalloonHint
    Images = ImageList1
    Left = 384
    Top = 144
  end
  object ImageList1: TImageList
    Left = 320
    Top = 144
    Bitmap = {
      494C010101000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F2F2F20DE3E3E31CE5E5E51AF6F6F609000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE01BC5F2CFFD76B2CFFDC7432FFE07D39FFE58640FFEA9047FFEEB076FFD3D3
      D32C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F8F8F807D05D
      22FFD46427FFD86D2DFFDC7534FFE17E3AFFE68841FFEB9249FFF09D50FFF6A8
      58FFE79857FFFEFEFE0100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD02CD571DFFD05D
      22FFD46427FFD86D2DFFDC7433FFF0E8E8FFF4EEEEFFEB9249FFF09D50FFF6A8
      58FFFBB260FFE79757FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA6237FFCD561CFFD05C
      21FFD36426FFD76B2CFFDB7231FFF0E8E8FFF0E8E8FFE98F46FFEE994EFFF2A1
      54FFF5A758FFF5A758FFD3D3D32C000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FCFCFC03C94F18FFCC551CFFCF5B
      20FFD36225FFD66A2BFFDA7131FFDE7A37FFE3823DFFE78A43FFEB9249FFEE99
      4EFFF09D50FFF09D50FFEEB077FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AB5127FFC94E17FFCB531AFFCE59
      1FFFD16024FFD56628FFD45E25FFF1EAEAFFF1E9E9FFE4843EFFE78A43FFE98F
      46FFEB9249FFEB9249FFE98F46FFF6F6F6090000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D48764FFD06633FFCA5119FFCD57
      1DFFD05C21FFD36326FFD66A2BFFF2EBEBFFF1EAEAFFE07D39FFE3823DFFE586
      40FFE68841FFE68841FFE58640FFE5E5E51A0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D68D6BFFD06533FFD16733FFD165
      2FFFCE591FFFD15F23FFD46427FFF3EDEDFFF2ECECFFF2EBEBFFDE7A37FFE07C
      39FFE17E3AFFE17E3AFFE07C39FFE3E3E31C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE8361FFD06534FFD16634FFD167
      33FFD36935FFD05C23FFD15F23FFD46427FFF4EEEEFFF3EDEDFFE29D7DFFDC74
      32FFDC7533FFDC7533FFDB7332FFF2F2F20D0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F8F8F807CF6434FFD06534FFD066
      33FFD16833FFD46A35FFD56C36FFD66E37FFD87238FFF4EFEFFFF4EEEEFFD76B
      2CFFD86C2DFFD86C2DFFDB783CFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CF6535FFCF6534FFD066
      34FFD16634FFFBF9F9FFFAF7F7FFD46C36FFF7F3F3FFF6F1F1FFF5F0F0FFD873
      38FFD97339FFD97339FFBC5E2CFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7F7F708D06535FFD065
      34FFD06634FFFDFDFDFFFCFAFAFFFBF8F8FFF9F6F6FFF8F5F5FFD05E2CFFD66E
      37FFD66F38FFD66F38FFFEFEFE01000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A34B25FFD065
      35FFCF6534FFD06634FFCF6030FFFDFCFCFFF0D2C6FFD26934FFD36A34FFD46B
      35FFD46B36FFF8F8F80700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F7F7
      F708CF6636FFCF6535FFD06534FFD06634FFD16735FFD16735FFD16735FFD270
      47FFFDFDFD020000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F8F8F807CE8361FFD68D6BFFD38764FFAB5127FFFCFCFC030000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FC3F000000000000E00F000000000000
      C003000000000000800300000000000080010000000000000001000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000100000000000080010000000000008001000000000000C003000000000000
      E007000000000000F81F00000000000000000000000000000000000000000000
      000000000000}
  end
end
