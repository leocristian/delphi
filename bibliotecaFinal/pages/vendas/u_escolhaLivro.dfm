object EscolhaLivroForm: TEscolhaLivroForm
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Localizar livro'
  ClientHeight = 435
  ClientWidth = 907
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnKeyPress = AtivaNavegacao
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grid_livros: TcxGrid
    Left = 0
    Top = 60
    Width = 907
    Height = 312
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 16
    ExplicitTop = 68
    ExplicitWidth = 956
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
      Navigator.Buttons.Refresh.Enabled = False
      Navigator.Buttons.Refresh.Visible = False
      Navigator.Buttons.SaveBookmark.Enabled = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Enabled = False
      Navigator.Buttons.Filter.Visible = False
      Navigator.InfoPanel.DisplayMask = '[RecordIndex] / [RecordCount]'
      Navigator.InfoPanel.Visible = True
      Navigator.Visible = True
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = vds_livrosEncontrados
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 20
      Styles.ContentEven = frame_estilo_grid1.linhas
      Styles.IncSearch = frame_estilo_grid1.busca
      Styles.Header = frame_estilo_grid1.cabecalho
      object grid_livrosDBTableView1codigo: TcxGridDBColumn
        DataBinding.FieldName = 'codigo'
      end
      object grid_livrosDBTableView1titulo: TcxGridDBColumn
        DataBinding.FieldName = 'titulo'
      end
      object grid_livrosDBTableView1editora: TcxGridDBColumn
        DataBinding.FieldName = 'editora'
      end
      object grid_livrosDBTableView1anoPublicacao: TcxGridDBColumn
        DataBinding.FieldName = 'anoPublicacao'
      end
      object grid_livrosDBTableView1preco: TcxGridDBColumn
        DataBinding.FieldName = 'preco'
      end
      object grid_livrosDBTableView1categoria: TcxGridDBColumn
        DataBinding.FieldName = 'categoria'
      end
      object grid_livrosDBTableView1qtdEstoque: TcxGridDBColumn
        Caption = 'Qtd. em estoque'
        DataBinding.FieldName = 'qtdEstoque'
      end
    end
    object grid_livrosLevel1: TcxGridLevel
      GridView = grid_livrosDBTableView1
    end
  end
  object BuscaLivro: TPanel
    Left = 0
    Top = 0
    Width = 907
    Height = 60
    Align = alTop
    TabOrder = 1
    ExplicitLeft = -8
    ExplicitTop = 88
    ExplicitWidth = 472
    object BuscaBtn: TSpeedButton
      Left = 824
      Top = 20
      Width = 42
      Height = 21
      ImageIndex = 2
      Images = FrameImagens1.ImageList1
      OnClick = BuscaBtnClick
    end
    object Label1: TLabel
      Left = 40
      Top = 18
      Width = 197
      Height = 19
      Caption = 'Adicionar livro na venda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clDefault
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SelecaoBusca: TComboBox
      Left = 457
      Top = 20
      Width = 122
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 1
      Text = 'C'#211'DIGO'
      Items.Strings = (
        'C'#211'DIGO'
        'T'#205'TULO'
        'EDITORA'
        'CATEGORIA')
    end
    object BuscaInput: TEdit
      Left = 585
      Top = 20
      Width = 233
      Height = 21
      TabOrder = 0
    end
  end
  object PanelConfirma: TPanel
    Left = 0
    Top = 372
    Width = 907
    Height = 63
    Align = alBottom
    TabOrder = 2
    ExplicitLeft = 16
    ExplicitTop = 380
    ExplicitWidth = 956
    object CancelarBtn: TSpeedButton
      Left = 768
      Top = 16
      Width = 89
      Height = 30
      Caption = 'Cancelar'
    end
    inline FrameImagens1: TFrameImagens
      Left = 31
      Top = 6
      Width = 52
      Height = 50
      TabOrder = 0
      ExplicitLeft = 31
      ExplicitTop = 6
    end
    object Confirmar: TButton
      Left = 673
      Top = 16
      Width = 89
      Height = 31
      Cursor = crHandPoint
      Caption = 'Selecionar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = ConfirmarClick
    end
    inline frame_estilo_grid1: Tframe_estilo_grid
      Left = 168
      Top = -20
      Width = 130
      Height = 99
      TabOrder = 2
      ExplicitLeft = 168
      ExplicitTop = -20
      ExplicitHeight = 99
      inherited estilo_padrao: TcxStyleRepository
        Left = 16
        Top = 32
        PixelsPerInch = 96
      end
    end
  end
  object vtb_livrosEncontrados: TVirtualTable
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
        Name = 'anoPublicacao'
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
        Name = 'qtdEstoque'
        DataType = ftString
        Size = 20
      end>
    Left = 440
    Top = 296
    Data = {
      040007000600636F6469676F01001400000000000600746974756C6F01001400
      000000000700656469746F726101001400000000000D00616E6F5075626C6963
      6163616F01001400000000000500707265636F01001400000000000900636174
      65676F72696101001400000000000A007174644573746F717565010014000000
      0000000000000000}
  end
  object vds_livrosEncontrados: TDataSource
    DataSet = vtb_livrosEncontrados
    Left = 320
    Top = 296
  end
end
