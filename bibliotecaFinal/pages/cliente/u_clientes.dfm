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
    ExplicitLeft = -8
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
  object grid_usuarios: TcxGrid
    Left = 0
    Top = 65
    Width = 831
    Height = 446
    Align = alClient
    PopupMenu = PopupClientes
    TabOrder = 1
    ExplicitLeft = -8
    object grid_usuariosDBTableView1: TcxGridDBTableView
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
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
    end
    object grid_usuariosLevel1: TcxGridLevel
      GridView = grid_usuariosDBTableView1
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
      'NOME OU EMAIL')
  end
  object tb_clientes: TUniTable
    Left = 736
    Top = 16
  end
  object PopupClientes: TPopupMenu
    Left = 648
    Top = 16
    object Visualizarusurioselecionado1: TMenuItem
      Caption = 'Visualizar usu'#225'rio selecionado'
    end
    object Visualizarusurioselecionado2: TMenuItem
      Caption = 'Alterar usu'#225'rio selecionado'
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Excluirusurioselecionado1: TMenuItem
      Caption = 'Excluir usu'#225'rio selecionado'
    end
  end
end
