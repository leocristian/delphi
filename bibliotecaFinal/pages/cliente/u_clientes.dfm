object FormClientes: TFormClientes
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsSingle
  Caption = 'FormClientes'
  ClientHeight = 511
  ClientWidth = 831
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
    Width = 831
    Height = 65
    Align = alTop
    TabOrder = 0
    object BuscaInput: TEdit
      Left = 135
      Top = 23
      Width = 146
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object bt_busca: TButton
      Left = 336
      Top = 13
      Width = 97
      Height = 41
      Caption = 'Pesquisar'
      TabOrder = 1
      OnClick = bt_buscaClick
    end
    object bt_mostrarTudo: TButton
      Left = 448
      Top = 13
      Width = 97
      Height = 41
      Caption = 'Mostrar todos'
      TabOrder = 2
      OnClick = bt_mostrarTudoClick
    end
  end
  object grid_clientes: TcxGrid
    Left = 0
    Top = 65
    Width = 831
    Height = 446
    Align = alClient
    PopupMenu = PopupClientes
    TabOrder = 1
    object grid_clientesDBTableView1: TcxGridDBTableView
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
      DataController.DataSource = ds_clientes
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 20
      Styles.Header = cxStyle1
      object grid_clientesDBTableView1codigo: TcxGridDBColumn
        DataBinding.FieldName = 'codigo'
      end
      object grid_clientesDBTableView1cpf: TcxGridDBColumn
        DataBinding.FieldName = 'cpf'
      end
      object grid_clientesDBTableView1nome_completo: TcxGridDBColumn
        DataBinding.FieldName = 'nome_completo'
      end
    end
    object grid_clientesLevel1: TcxGridLevel
      GridView = grid_clientesDBTableView1
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
      'NOME COMPLETO'
      'CPF')
  end
  object PopupClientes: TPopupMenu
    Left = 576
    Top = 16
    object VisualizarCliente: TMenuItem
      Caption = 'Visualizar cliente selecionado'
      OnClick = VisualizarClienteClick
    end
    object AdicionarCliente: TMenuItem
      Caption = 'Adicionar novo cliente'
      OnClick = AdicionarClienteClick
    end
    object AlterarCliente: TMenuItem
      Caption = 'Alterar cliente selecionado'
      OnClick = AlterarClienteClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object ExcluirCliente: TMenuItem
      Caption = 'Excluir cliente selecionado'
      OnClick = ExcluirClienteClick
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 752
    Top = 368
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
  object tb_clientes: TUniTable
    TableName = 'clientes2'
    Connection = dm1.con1
    Active = True
    Left = 656
    Top = 16
  end
  object ds_clientes: TDataSource
    DataSet = tb_clientes
    Left = 736
    Top = 16
  end
end
