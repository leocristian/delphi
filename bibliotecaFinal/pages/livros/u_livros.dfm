object FormLivros: TFormLivros
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'FormLivros'
  ClientHeight = 683
  ClientWidth = 862
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
    Width = 862
    Height = 81
    Align = alTop
    TabOrder = 0
    ExplicitTop = 8
    object Label1: TLabel
      Left = 16
      Top = 19
      Width = 79
      Height = 13
      Caption = 'Campo de busca'
    end
    object Label2: TLabel
      Left = 135
      Top = 19
      Width = 69
      Height = 13
      Caption = 'Palavra-chave'
    end
    object BuscaInput: TEdit
      Left = 135
      Top = 38
      Width = 146
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnClick = BuscaInputClick
    end
    object bt_busca: TButton
      Left = 312
      Top = 18
      Width = 97
      Height = 41
      Caption = 'Pesquisar'
      TabOrder = 1
      OnClick = bt_buscaClick
    end
    object bt_mostrarTudo: TButton
      Left = 415
      Top = 18
      Width = 105
      Height = 41
      Caption = 'Mostrar todos'
      TabOrder = 2
      OnClick = bt_mostrarTudoClick
    end
  end
  object grid_livros: TcxGrid
    Left = 0
    Top = 81
    Width = 862
    Height = 602
    Align = alClient
    PopupMenu = PopupLivros
    TabOrder = 1
    ExplicitTop = 73
    object grid_livrosDBTableView1: TcxGridDBTableView
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
      DataController.DataSource = ds_livros
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 20
      Styles.Header = cxStyle1
      object grid_livrosDBTableView1codigo: TcxGridDBColumn
        DataBinding.FieldName = 'codigo'
      end
      object grid_livrosDBTableView1titulo: TcxGridDBColumn
        DataBinding.FieldName = 'titulo'
        Width = 180
      end
      object grid_livrosDBTableView1editora: TcxGridDBColumn
        DataBinding.FieldName = 'editora'
        Width = 164
      end
      object grid_livrosDBTableView1ano_publicacao: TcxGridDBColumn
        DataBinding.FieldName = 'ano_publicacao'
        Width = 106
      end
      object grid_livrosDBTableView1preco: TcxGridDBColumn
        DataBinding.FieldName = 'preco'
      end
      object grid_livrosDBTableView1categoria: TcxGridDBColumn
        DataBinding.FieldName = 'categoria'
      end
    end
    object grid_livrosLevel1: TcxGridLevel
      GridView = grid_livrosDBTableView1
    end
  end
  object SelecaoBusca: TComboBox
    Left = 16
    Top = 38
    Width = 113
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
    Text = 'C'#211'DIGO'
    Items.Strings = (
      'C'#211'DIGO'
      'CATEGORIA'
      'EDITORA'
      'TITULO')
  end
  object tb_livros: TUniTable
    TableName = 'livros'
    Left = 704
    Top = 16
  end
  object PopupLivros: TPopupMenu
    Left = 640
    Top = 16
    object VisualizarLivro: TMenuItem
      Caption = 'Visualizar livro selecionado'
      OnClick = VisualizarLivroClick
    end
    object NovoLivro: TMenuItem
      Caption = 'Adicionar novo livro'
      OnClick = NovoLivroClick
    end
    object AlterarLivro: TMenuItem
      Caption = 'Alterar livro selecionado'
      OnClick = AlterarLivroClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object ExcluirLivro: TMenuItem
      Caption = 'Excluir livro selecionado'
      OnClick = ExcluirLivroClick
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 568
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
  object ds_livros: TDataSource
    DataSet = tb_livros
    Left = 760
    Top = 16
  end
end
