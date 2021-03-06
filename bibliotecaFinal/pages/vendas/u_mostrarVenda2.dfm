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
    Height = 23
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
    ExplicitLeft = -144
    ExplicitTop = 8
    object Label4: TLabel
      Left = 121
      Top = 86
      Width = 76
      Height = 13
      Caption = 'Nome do cliente'
    end
    object Label7: TLabel
      Left = 32
      Top = 86
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object TituloPagina: TLabel
      Left = 32
      Top = 34
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
      Left = 536
      Top = 86
      Width = 64
      Height = 13
      Caption = 'T'#237'tulo do livro'
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
    object SpeedButton2: TSpeedButton
      Left = 880
      Top = 428
      Width = 25
      Height = 24
      Hint = 
        'Ajuda|Clique com o bot'#227'o direito sobre um livro para remov'#234'-lo d' +
        'a venda|0'
      CustomHint = BalloonHint1
      ImageIndex = 0
      Images = FrameImagens1.ImageList1
      ParentShowHint = False
      ShowHint = True
    end
    object BuscaClienteBtn: TSpeedButton
      Left = 437
      Top = 105
      Width = 60
      Height = 22
      Hint = 'Clique aqui para busca um cliente por um campo espef'#237'fico'
      CustomHint = BalloonHint1
      ImageIndex = 1
      Images = FrameImagens1.ImageList1
      ParentShowHint = False
      ShowHint = True
      OnClick = BuscaClienteClick
    end
    object BuscaLivroBtn: TSpeedButton
      Left = 845
      Top = 106
      Width = 60
      Height = 21
      Hint = 'Clique aqui para busca um livro por um campo espef'#237'fico'
      CustomHint = BalloonHint1
      ImageIndex = 1
      Images = FrameImagens1.ImageList1
      ParentShowHint = False
      ShowHint = True
      OnClick = AddLivroClick
    end
    object CodigoInput: TEdit
      Left = 32
      Top = 105
      Width = 75
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 0
    end
    object grid_livros: TcxGrid
      Left = 32
      Top = 185
      Width = 913
      Height = 237
      TabOrder = 3
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
      TabOrder = 1
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
      TabOrder = 2
    end
    object ClienteInput: TEdit
      Left = 121
      Top = 105
      Width = 296
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 60
      TabOrder = 4
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
    Left = 478
    Top = 8
    Width = 75
    Height = 72
    TabOrder = 2
    ExplicitLeft = 478
    ExplicitTop = 8
    ExplicitWidth = 75
    inherited estilo_padrao: TcxStyleRepository
      Left = 24
      Top = 24
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
    Left = 559
    Top = 7
    Width = 386
    Height = 73
    BevelInner = bvRaised
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      386
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
  inline FrameImagens1: TFrameImagens
    Left = 732
    Top = 428
    Width = 52
    Height = 50
    TabOrder = 6
    ExplicitLeft = 732
    ExplicitTop = 428
    inherited ImageList1: TImageList
      Left = 12
      Top = 65532
    end
  end
  object TituloInput: TEdit
    Left = 536
    Top = 106
    Width = 295
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 60
    TabOrder = 7
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
    Delay = 200
    Left = 816
    Top = 424
  end
end
