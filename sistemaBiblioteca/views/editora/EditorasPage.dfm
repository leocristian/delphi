object EditorasForm: TEditorasForm
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  ClientHeight = 455
  ClientWidth = 844
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
  object cxGrid1: TcxGrid
    Left = 0
    Top = 89
    Width = 844
    Height = 366
    Align = alClient
    TabOrder = 0
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
      DataController.DataSource = DataModule1.dsEditoras
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid1DBTableView1codigo: TcxGridDBColumn
        DataBinding.FieldName = 'codigo'
      end
      object cxGrid1DBTableView1nome: TcxGridDBColumn
        DataBinding.FieldName = 'nome'
      end
      object cxGrid1DBTableView1cnpj: TcxGridDBColumn
        DataBinding.FieldName = 'cnpj'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 844
    Height = 89
    Align = alTop
    TabOrder = 1
    object ComboBox1: TComboBox
      Left = 48
      Top = 35
      Width = 145
      Height = 21
      TabOrder = 0
      Text = 'Nome fantasia'
      Items.Strings = (
        'Nome fantasia'
        'CNPJ'
        'Codigo')
    end
    object Edit1: TEdit
      Left = 216
      Top = 35
      Width = 121
      Height = 21
      TabOrder = 1
    end
  end
  object PesquisarBtn: TButton
    Left = 424
    Top = 24
    Width = 97
    Height = 41
    Caption = 'Pesquisar'
    TabOrder = 2
  end
  object PopupMenu1: TPopupMenu
    Left = 728
    Top = 32
    object Visualizareditoraselecionada1: TMenuItem
      Caption = 'Visualizar editora selecionada'
      OnClick = ShowEditoraInfo
    end
    object Visualizareditoraselecionada2: TMenuItem
      Caption = 'Inserir nova editora'
      OnClick = InserirEditora
    end
    object Alterareditoraselecionada1: TMenuItem
      Caption = 'Alterar editora selecionada'
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Excluireditoraselecionada1: TMenuItem
      Caption = 'Excluir editora selecionada'
    end
  end
end
