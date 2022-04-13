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
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  OnShow = FocarInput
  PixelsPerInch = 96
  TextHeight = 13
  object grid_usuarios: TcxGrid
    Left = 0
    Top = 81
    Width = 829
    Height = 415
    Align = alClient
    PopupMenu = PopupUsuarios
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = -15
    ExplicitHeight = 439
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
      DataController.DataSource = ds_usuarios
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 20
      Styles.Header = cxStyle1
      object grid_usuariosDBTableView1codigo: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'codigo'
      end
      object grid_usuariosDBTableView1nome_completo: TcxGridDBColumn
        Caption = 'Nome completo'
        DataBinding.FieldName = 'nome_completo'
        Width = 261
      end
      object grid_usuariosDBTableView1email: TcxGridDBColumn
        Caption = 'Email'
        DataBinding.FieldName = 'email'
      end
    end
    object grid_usuariosLevel1: TcxGridLevel
      GridView = grid_usuariosDBTableView1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 829
    Height = 81
    Align = alTop
    TabOrder = 2
    ExplicitTop = 8
    object Label1: TLabel
      Left = 16
      Top = 20
      Width = 79
      Height = 13
      Caption = 'Campo de busca'
    end
    object Label2: TLabel
      Left = 135
      Top = 20
      Width = 69
      Height = 13
      Caption = 'Palavra-chave'
    end
    object BuscaInput: TEdit
      Left = 135
      Top = 39
      Width = 130
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object bt_busca: TButton
      Left = 320
      Top = 19
      Width = 97
      Height = 41
      Caption = 'Pesquisar'
      TabOrder = 1
      OnClick = bt_buscaClick
    end
    object bt_mostrarTudo: TButton
      Left = 440
      Top = 19
      Width = 97
      Height = 41
      Caption = 'Mostrar todos'
      TabOrder = 2
      OnClick = bt_mostrarTudoClick
    end
  end
  object SelecaoBusca: TComboBox
    Left = 16
    Top = 39
    Width = 113
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
    Text = 'C'#211'DIGO'
    Items.Strings = (
      'C'#211'DIGO'
      'NOME COMPLETO'
      'EMAIL')
  end
  object PopupUsuarios: TPopupMenu
    Left = 600
    Top = 8
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
      OnClick = ExcluirUsuarioClick
    end
  end
  object tb_usuarios: TUniTable
    TableName = 'usuarios2'
    Connection = dm1.con1
    Active = True
    Left = 672
    Top = 8
  end
  object ds_usuarios: TDataSource
    DataSet = tb_usuarios
    Left = 736
    Top = 8
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 736
    Top = 72
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
