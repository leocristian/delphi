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
    ExplicitLeft = 8
    ExplicitWidth = 796
    inherited ComboBox1: TComboBox
      Text = 'Nome completo'
      Items.Strings = (
        'Nome completo'
        'Codigo')
    end
    inherited Button1: TButton
      Left = 384
      OnClick = BuscarUsuario
      ExplicitLeft = 384
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
    Font.Name = 'z'
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
      DataController.DataSource = DataModule1.dsUsuarios
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid1DBTableView1codigo: TcxGridDBColumn
        DataBinding.FieldName = 'codigo'
      end
      object cxGrid1DBTableView1login: TcxGridDBColumn
        DataBinding.FieldName = 'login'
      end
      object cxGrid1DBTableView1nome_completo: TcxGridDBColumn
        DataBinding.FieldName = 'nome_completo'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object AtualizarBtn: TButton
    Left = 512
    Top = 17
    Width = 89
    Height = 41
    Caption = 'Atualizar'
    TabOrder = 2
    OnClick = AtualizarGrid
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
end
