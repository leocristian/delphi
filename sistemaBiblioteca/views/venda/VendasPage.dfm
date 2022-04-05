object VendasForm: TVendasForm
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'VendasForm'
  ClientHeight = 429
  ClientWidth = 802
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
    Width = 802
    Height = 73
    Align = alTop
    TabOrder = 0
    object Edit1: TEdit
      Left = 224
      Top = 27
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object ComboBox1: TComboBox
      Left = 33
      Top = 27
      Width = 145
      Height = 21
      TabOrder = 1
      Text = 'Codigo'
      Items.Strings = (
        'Codigo'
        'Nome vendedor'
        'Nome cliente')
    end
  end
  object Button1: TButton
    Left = 448
    Top = 18
    Width = 97
    Height = 40
    Caption = 'Pesquisar'
    TabOrder = 1
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 73
    Width = 802
    Height = 356
    Align = alClient
    TabOrder = 2
    ExplicitTop = 64
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
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Enabled = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Enabled = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Enabled = False
      Navigator.Buttons.Filter.Visible = False
      Navigator.InfoPanel.DisplayMask = '[RecordIndex] / [RecordCount]'
      Navigator.InfoPanel.Visible = True
      Navigator.Visible = True
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = DataModule1.dsVendas
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 20
      Styles.Header = cxStyle1
      object cxGrid1DBTableView1codigo: TcxGridDBColumn
        DataBinding.FieldName = 'codigo'
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1vendedor: TcxGridDBColumn
        DataBinding.FieldName = 'vendedor'
      end
      object cxGrid1DBTableView1livro: TcxGridDBColumn
        DataBinding.FieldName = 'livro'
      end
      object cxGrid1DBTableView1cliente: TcxGridDBColumn
        DataBinding.FieldName = 'cliente'
      end
      object cxGrid1DBTableView1valor_total: TcxGridDBColumn
        DataBinding.FieldName = 'valor_total'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 656
    Top = 24
    object Visualizarselecionado1: TMenuItem
      Caption = 'Visualizar selecionado'
    end
    object Visualizarselecionado2: TMenuItem
      Caption = 'Realizar nova venda'
      OnClick = NovaVenda
    end
    object Alterarvendaselecionada1: TMenuItem
      Caption = 'Alterar venda selecionada'
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Excluirvendaselecionada1: TMenuItem
      Caption = 'Excluir venda selecionada'
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 640
    Top = 216
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
end
