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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 862
    Height = 65
    Align = alTop
    TabOrder = 0
    ExplicitTop = 8
    ExplicitWidth = 826
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
    Width = 862
    Height = 618
    Align = alClient
    PopupMenu = PopupLivros
    TabOrder = 1
    ExplicitLeft = -48
    ExplicitTop = 13
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
      DataController.DataSource = ds_livros
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
      object grid_vendasDBTableView1titulo: TcxGridDBColumn
        DataBinding.FieldName = 'titulo'
      end
      object grid_vendasDBTableView1editora: TcxGridDBColumn
        DataBinding.FieldName = 'editora'
      end
      object grid_vendasDBTableView1ano_publicacao: TcxGridDBColumn
        DataBinding.FieldName = 'ano_publicacao'
      end
      object grid_vendasDBTableView1categoria: TcxGridDBColumn
        DataBinding.FieldName = 'categoria'
        Width = 130
      end
      object grid_vendasDBTableView1preco: TcxGridDBColumn
        DataBinding.FieldName = 'preco'
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
      'TITULO'
      'CATEGORIA')
  end
  object tb_livros: TUniTable
    TableName = 'livros'
    Connection = dm1.con1
    Active = True
    Left = 704
    Top = 16
  end
  object PopupLivros: TPopupMenu
    Left = 640
    Top = 16
    object VisualizarLivro: TMenuItem
      Caption = 'Visualizar livro selecionado'
    end
    object NovoLivro: TMenuItem
      Caption = 'Adicionar novo livro'
      OnClick = NovoLivroClick
    end
    object AlterarLivro: TMenuItem
      Caption = 'Alterar livro selecionado'
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object ExcluirLivro: TMenuItem
      Caption = 'Excluir livro selecionado'
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
  object ds_livros: TDataSource
    DataSet = tb_livros
    Left = 760
    Top = 16
  end
end
