object EscolhaLivroForm: TEscolhaLivroForm
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'EscolhaLivroForm'
  ClientHeight = 435
  ClientWidth = 956
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyPress = AtivaNavegacao
  OnShow = AbrirForm
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 16
    Width = 258
    Height = 33
    Caption = 'Livros encontrados'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Confirmar: TButton
    Left = 32
    Top = 368
    Width = 137
    Height = 49
    Caption = 'Confirmar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = ConfirmarClick
  end
  object cxGrid1: TcxGrid
    Left = 32
    Top = 86
    Width = 897
    Height = 251
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
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
      Styles.Header = frame_estilo_grid1.cabecalho
      object cxGrid1DBTableView1codigo: TcxGridDBColumn
        DataBinding.FieldName = 'codigo'
      end
      object cxGrid1DBTableView1titulo: TcxGridDBColumn
        DataBinding.FieldName = 'titulo'
      end
      object cxGrid1DBTableView1editora: TcxGridDBColumn
        DataBinding.FieldName = 'editora'
      end
      object cxGrid1DBTableView1anoPublicacao: TcxGridDBColumn
        DataBinding.FieldName = 'anoPublicacao'
      end
      object cxGrid1DBTableView1preco: TcxGridDBColumn
        DataBinding.FieldName = 'preco'
      end
      object cxGrid1DBTableView1categoria: TcxGridDBColumn
        DataBinding.FieldName = 'categoria'
      end
      object cxGrid1DBTableView1qtdEstoque: TcxGridDBColumn
        Caption = 'Qtd. em estoque'
        DataBinding.FieldName = 'qtdEstoque'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  inline frame_estilo_grid1: Tframe_estilo_grid
    Left = 704
    Top = 8
    Width = 130
    Height = 72
    TabOrder = 2
    ExplicitLeft = 704
    ExplicitTop = 8
    inherited estilo_padrao: TcxStyleRepository
      PixelsPerInch = 96
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
    Left = 352
    Top = 16
    Data = {
      040007000600636F6469676F01001400000000000600746974756C6F01001400
      000000000700656469746F726101001400000000000D00616E6F5075626C6963
      6163616F01001400000000000500707265636F01001400000000000900636174
      65676F72696101001400000000000A007174644573746F717565010014000000
      0000000000000000}
  end
  object vds_livrosEncontrados: TDataSource
    DataSet = vtb_livrosEncontrados
    Left = 472
    Top = 16
  end
end
