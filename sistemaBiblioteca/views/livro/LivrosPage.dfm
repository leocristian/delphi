object LivrosForm: TLivrosForm
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'LivrosForm'
  ClientHeight = 462
  ClientWidth = 845
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 845
    Height = 89
    Align = alTop
    TabOrder = 0
    ExplicitLeft = -40
    ExplicitTop = -8
    object ComboBox1: TComboBox
      Left = 48
      Top = 35
      Width = 89
      Height = 21
      TabOrder = 0
      Text = 'Titulo'
      Items.Strings = (
        'Titulo'
        'Codigo'
        'Editora')
    end
    object Edit1: TEdit
      Left = 160
      Top = 35
      Width = 137
      Height = 21
      TabOrder = 1
    end
    object Button1: TButton
      Left = 488
      Top = 28
      Width = 89
      Height = 36
      Caption = 'Pesquisar'
      TabOrder = 2
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 89
    Width = 845
    Height = 373
    Align = alClient
    TabOrder = 1
    ExplicitLeft = -40
    ExplicitTop = 81
    object cxGrid1DBTableView1: TcxGridDBTableView
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
      DataController.DataSource = DataModule1.dsLivros
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid1DBTableView1codigo: TcxGridDBColumn
        DataBinding.FieldName = 'codigo'
      end
      object cxGrid1DBTableView1titulo: TcxGridDBColumn
        DataBinding.FieldName = 'titulo'
      end
      object cxGrid1DBTableView1editora: TcxGridDBColumn
        DataBinding.FieldName = 'editora'
      end
      object cxGrid1DBTableView1ano_publicacao: TcxGridDBColumn
        DataBinding.FieldName = 'ano_publicacao'
      end
      object cxGrid1DBTableView1preco: TcxGridDBColumn
        DataBinding.FieldName = 'preco'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 664
    Top = 32
    object Visualizarseleciona1: TMenuItem
      Caption = 'Visualizar selecionado'
    end
    object Inserirnovolivro1: TMenuItem
      Caption = 'Inserir novo livro'
      OnClick = AdicionarLivro
    end
    object Inserirnovolivro2: TMenuItem
      Caption = 'Alterar selecionado'
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Excluirselecionado1: TMenuItem
      Caption = 'Excluir selecionado'
      OnClick = DeletarLivro
    end
  end
end