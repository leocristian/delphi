object UserForm: TUserForm
  Left = 390
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'UserForm'
  ClientHeight = 439
  ClientWidth = 796
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  inline BuscaPessoa1: TBuscaPessoa
    Left = 0
    Top = 0
    Width = 796
    Height = 72
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 796
    inherited ComboBox1: TComboBox
      Text = 'Nome completo'
      Items.Strings = (
        'Nome completo'
        'Codigo')
    end
    inherited Button1: TButton
      Left = 440
      Top = 16
      Width = 105
      Height = 44
      OnClick = BuscarUsuario
      ExplicitLeft = 440
      ExplicitTop = 16
      ExplicitWidth = 105
      ExplicitHeight = 44
    end
    inherited Edit1: TEdit
      OnClick = SetFocus
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 72
    Width = 796
    Height = 367
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 1
    ExplicitTop = 78
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
      DataController.DataSource = DataModule1.dsUsuarios
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 20
      object cxGrid1DBTableView1codigo: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'codigo'
        Styles.Header = cxStyle1
      end
      object cxGrid1DBTableView1login: TcxGridDBColumn
        Caption = 'Login'
        DataBinding.FieldName = 'login'
        Styles.Header = cxStyle1
      end
      object cxGrid1DBTableView1nome_completo: TcxGridDBColumn
        Caption = 'Nome Completo'
        DataBinding.FieldName = 'nome_completo'
        Styles.Header = cxStyle1
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 728
    Top = 8
    object Vsiuali1: TMenuItem
      Caption = 'Visualizar usuario selecionado'
      OnClick = ShowUsuarioInfo
    end
    object Inserirnovo2: TMenuItem
      Caption = 'Alterar usuario selecionado'
      OnClick = ShowEditUsuarioForm
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Excluirselecionado1: TMenuItem
      Caption = 'Excluir usuario selecionado'
      OnClick = DeletarUsuario
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 736
    Top = 96
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
