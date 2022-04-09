object FormUsuarios: TFormUsuarios
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsSingle
  Caption = 'Tela de usu'#225'rios'
  ClientHeight = 496
  ClientWidth = 829
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FocarInput
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 829
    Height = 65
    Align = alTop
    TabOrder = 0
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
    Width = 829
    Height = 431
    Align = alClient
    PopupMenu = PopupUsuarios
    TabOrder = 2
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
      DataController.DataSource = dm1.ds_usuarios
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      object grid_usuariosDBTableView1codigo: TcxGridDBColumn
        DataBinding.FieldName = 'codigo'
      end
      object grid_usuariosDBTableView1nome_completo: TcxGridDBColumn
        DataBinding.FieldName = 'nome_completo'
        Width = 193
      end
      object grid_usuariosDBTableView1login: TcxGridDBColumn
        DataBinding.FieldName = 'login'
      end
    end
    object grid_usuariosLevel1: TcxGridLevel
      GridView = grid_usuariosDBTableView1
    end
  end
  object SelecaoBusca: TComboBox
    Left = 16
    Top = 23
    Width = 113
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
    Text = 'C'#211'DIGO'
    Items.Strings = (
      'C'#211'DIGO'
      'NOME OU EMAIL')
  end
  object PopupUsuarios: TPopupMenu
    Left = 640
    Top = 16
    object VisualizarUsuario: TMenuItem
      Caption = 'Visualizar usu'#225'rio selecionado'
      OnClick = VisualizarUsuarioClick
    end
    object AlterarUsuario: TMenuItem
      Caption = 'Alterar usu'#225'rio selecionado'
      OnClick = AlterarUsuarioClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object ExcluirUsuario: TMenuItem
      Caption = 'Excluir usu'#225'rio selecionado'
    end
  end
end
