object FormVendas: TFormVendas
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'FormVendas'
  ClientHeight = 504
  ClientWidth = 826
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 826
    Height = 65
    Align = alTop
    TabOrder = 0
    ExplicitTop = -6
    object BuscaInput: TEdit
      Left = 135
      Top = 23
      Width = 146
      Height = 21
      TabOrder = 0
    end
    object bt_busca: TButton
      Left = 336
      Top = 13
      Width = 97
      Height = 41
      Caption = 'Pesquisar'
      TabOrder = 1
    end
  end
  object grid_vendas: TcxGrid
    Left = 0
    Top = 65
    Width = 826
    Height = 439
    Align = alClient
    PopupMenu = PopupVendas
    TabOrder = 1
    ExplicitLeft = -5
    ExplicitTop = 58
    ExplicitWidth = 831
    ExplicitHeight = 446
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
        DataBinding.FieldName = 'codigo'
      end
      object grid_vendasDBTableView1vendedor: TcxGridDBColumn
        DataBinding.FieldName = 'vendedor'
      end
      object grid_vendasDBTableView1cliente: TcxGridDBColumn
        DataBinding.FieldName = 'cliente'
      end
      object grid_vendasDBTableView1valor_total: TcxGridDBColumn
        DataBinding.FieldName = 'valor_total'
      end
    end
    object grid_vendasLevel1: TcxGridLevel
      GridView = grid_vendasDBTableView1
    end
  end
  object SelecaoBusca: TComboBox
    Left = 8
    Top = 23
    Width = 113
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
    Text = 'C'#211'DIGO'
    Items.Strings = (
      'C'#211'DIGO'
      'CLIENTE')
  end
  object tb_vendas: TUniTable
    TableName = 'vendas'
    Connection = dm1.con1
    Active = True
    Left = 704
    Top = 16
  end
  object PopupVendas: TPopupMenu
    Left = 640
    Top = 16
    object VisualizarVenda: TMenuItem
      Caption = 'Visualizar venda selecionada'
    end
    object NovaVenda: TMenuItem
      Caption = 'Realizar nova venda'
      OnClick = NovaVendaClick
    end
    object AlterarVenda: TMenuItem
      Caption = 'Alterar venda selecionada'
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object ExcluirCliente: TMenuItem
      Caption = 'Cancelar venda  selecionada'
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 560
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