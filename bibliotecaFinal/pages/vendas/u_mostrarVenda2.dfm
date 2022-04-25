object FormVenda: TFormVenda
  Left = 0
  Top = 0
  Caption = 'FormVenda'
  ClientHeight = 534
  ClientWidth = 798
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
  object ValorVenda: TLabel
    Left = 681
    Top = 481
    Width = 104
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
    Left = 638
    Top = 481
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
  object Label3: TLabel
    Left = 638
    Top = 463
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 798
    Height = 457
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 8
    ExplicitWidth = 809
    object Label4: TLabel
      Left = 97
      Top = 69
      Width = 76
      Height = 13
      Caption = 'Nome do cliente'
    end
    object Label7: TLabel
      Left = 16
      Top = 69
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object TituloPagina: TLabel
      Left = 16
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
    object TituloLabel: TLabel
      Left = 344
      Top = 69
      Width = 64
      Height = 13
      Caption = 'Titulo do livro'
    end
    object Label2: TLabel
      Left = 16
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
    object AddLivro: TButton
      Left = 638
      Top = 75
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
      Left = 97
      Top = 88
      Width = 241
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 60
      TabOrder = 1
    end
    object CodigoInput: TEdit
      Left = 16
      Top = 88
      Width = 75
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 0
    end
    object TituloInput: TEdit
      Left = 344
      Top = 88
      Width = 217
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 2
    end
    object grid_livros: TcxGrid
      Left = 16
      Top = 192
      Width = 753
      Height = 237
      TabOrder = 4
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
        OptionsBehavior.IncSearch = True
        OptionsSelection.CellSelect = False
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        OptionsView.IndicatorWidth = 20
        Styles.ContentEven = frame_estilo_grid1.linhas
        Styles.IncSearch = frame_estilo_grid1.busca
        Styles.Header = frame_estilo_grid1.cabecalho
        object grid_livrosDBTableView1codigo: TcxGridDBColumn
          DataBinding.FieldName = 'codigo'
          Width = 50
        end
        object grid_livrosDBTableView1titulo: TcxGridDBColumn
          DataBinding.FieldName = 'titulo'
        end
        object grid_livrosDBTableView1editora: TcxGridDBColumn
          DataBinding.FieldName = 'editora'
        end
        object grid_livrosDBTableView1ano_publicacao: TcxGridDBColumn
          DataBinding.FieldName = 'ano_publicacao'
        end
        object grid_livrosDBTableView1preco: TcxGridDBColumn
          DataBinding.FieldName = 'preco'
          Width = 72
        end
        object grid_livrosDBTableView1categoria: TcxGridDBColumn
          DataBinding.FieldName = 'categoria'
        end
        object grid_livrosDBTableView1qtdEscolhida: TcxGridDBColumn
          DataBinding.FieldName = 'qtdEscolhida'
          Width = 87
        end
      end
      object grid_livrosLevel1: TcxGridLevel
        GridView = grid_livrosDBTableView1
      end
    end
  end
  object ModoInput: TEdit
    Left = 176
    Top = 481
    Width = 29
    Height = 21
    TabStop = False
    TabOrder = 1
    Visible = False
  end
  inline frame_estilo_grid1: Tframe_estilo_grid
    Left = 502
    Top = 115
    Width = 130
    Height = 72
    TabOrder = 2
    ExplicitLeft = 502
    ExplicitTop = 115
    inherited estilo_padrao: TcxStyleRepository
      PixelsPerInch = 96
    end
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
        Name = 'preco'
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
      end>
    Left = 72
    Top = 368
    Data = {
      040007000600636F6469676F01001400000000000600746974756C6F01001400
      000000000700656469746F726101001400000000000E00616E6F5F7075626C69
      636163616F01001400000000000500707265636F010014000000000009006361
      7465676F72696101001400000000000C007174644573636F6C68696461010014
      0000000000000000000000}
  end
  object vds_livrosVenda: TDataSource
    DataSet = vtb_livrosVenda
    Left = 140
    Top = 368
  end
end
