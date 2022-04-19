object FormVendas: TFormVendas
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'FormVendas'
  ClientHeight = 640
  ClientWidth = 805
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 805
    Height = 89
    Align = alTop
    TabOrder = 0
    ExplicitTop = -6
    object Label1: TLabel
      Left = 18
      Top = 26
      Width = 79
      Height = 13
      Caption = 'Campo de busca'
    end
    object Label2: TLabel
      Left = 137
      Top = 26
      Width = 69
      Height = 13
      Caption = 'Palavra-chave'
    end
    object BuscaInput: TEdit
      Left = 137
      Top = 45
      Width = 146
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnClick = BuscaInputClick
    end
    object bt_busca: TButton
      Left = 346
      Top = 24
      Width = 97
      Height = 41
      Caption = 'Pesquisar'
      TabOrder = 2
      OnClick = bt_buscaClick
    end
    object SelecaoBusca: TComboBox
      Left = 18
      Top = 45
      Width = 113
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      Text = 'C'#211'DIGO'
      Items.Strings = (
        'C'#211'DIGO'
        'CLIENTE'
        'DATA')
    end
    object MostrarTodas: TButton
      Left = 457
      Top = 24
      Width = 98
      Height = 41
      Caption = 'Mostrar todas'
      TabOrder = 3
      OnClick = MostrarTodasClick
    end
  end
  object grid_vendas: TcxGrid
    Left = 0
    Top = 89
    Width = 805
    Height = 551
    Align = alClient
    PopupMenu = PopupVendas
    TabOrder = 1
    ExplicitTop = 65
    ExplicitHeight = 575
    object grid_vendasDBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Enabled = False
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Append.Enabled = False
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Enabled = False
      Navigator.Buttons.Delete.Visible = False
      Navigator.Buttons.Edit.Enabled = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Enabled = False
      Navigator.Buttons.Post.Visible = False
      Navigator.Buttons.Cancel.Enabled = False
      Navigator.Buttons.Cancel.Visible = False
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Enabled = False
      Navigator.Buttons.Filter.Visible = False
      Navigator.InfoPanel.DisplayMask = '[RecordIndex] / [RecordCount]'
      Navigator.InfoPanel.Visible = True
      Navigator.Visible = True
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = ds_vendas
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 20
      Styles.Header = cxStyle1
      object grid_vendasDBTableView1codigo: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'codigo'
      end
      object grid_vendasDBTableView1vendedor: TcxGridDBColumn
        Caption = 'Vendedor'
        DataBinding.FieldName = 'vendedor'
        Width = 168
      end
      object grid_vendasDBTableView1cliente: TcxGridDBColumn
        Caption = 'Cliente'
        DataBinding.FieldName = 'cliente'
        Width = 184
      end
      object grid_vendasDBTableView1valor_total: TcxGridDBColumn
        Caption = 'Valor total'
        DataBinding.FieldName = 'valor_total'
        Width = 169
      end
      object grid_vendasDBTableView1data_venda: TcxGridDBColumn
        Caption = 'Data da venda'
        DataBinding.FieldName = 'data_venda'
        Width = 159
      end
    end
    object grid_vendasLevel1: TcxGridLevel
      GridView = grid_vendasDBTableView1
    end
  end
  object tb_vendas: TUniTable
    TableName = 'vendas'
    Left = 704
    Top = 16
  end
  object PopupVendas: TPopupMenu
    Left = 640
    Top = 16
    object VisualizarVenda: TMenuItem
      Caption = 'Visualizar venda selecionada'
      OnClick = VisualizarVendaClick
    end
    object NovaVenda: TMenuItem
      Caption = 'Realizar nova venda'
      OnClick = NovaVendaClick
    end
    object AlterarVenda: TMenuItem
      Caption = 'Alterar venda selecionada'
      OnClick = AlterarVendaClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object ExcluirVenda: TMenuItem
      Caption = 'Excluir venda selecionada'
      OnClick = ExcluirVendaClick
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 592
    Top = 16
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
  end
  object ds_vendas: TDataSource
    DataSet = tb_vendas
    Left = 760
    Top = 16
  end
end
