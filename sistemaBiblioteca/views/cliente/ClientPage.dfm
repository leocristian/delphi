object ClientForm: TClientForm
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'ClientForm'
  ClientHeight = 421
  ClientWidth = 771
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
  inline BuscaPessoa1: TBuscaPessoa
    Left = 0
    Top = 0
    Width = 771
    Height = 72
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 771
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 72
    Width = 771
    Height = 349
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 184
    ExplicitTop = 200
    ExplicitWidth = 250
    ExplicitHeight = 200
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
      DataController.DataSource = DataModule1.dsClientes
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid1DBTableView1codigo: TcxGridDBColumn
        DataBinding.FieldName = 'codigo'
      end
      object cxGrid1DBTableView1nome_completo: TcxGridDBColumn
        DataBinding.FieldName = 'nome_completo'
      end
      object cxGrid1DBTableView1email: TcxGridDBColumn
        DataBinding.FieldName = 'email'
      end
      object cxGrid1DBTableView1telefone: TcxGridDBColumn
        DataBinding.FieldName = 'telefone'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 720
    Top = 16
    object Visualizarclienteselecionado1: TMenuItem
      Caption = 'Visualizar cliente selecionado'
    end
    object Inserirnovocliente1: TMenuItem
      Caption = 'Inserir novo cliente'
      OnClick = CreateClient
    end
    object Acidionarnovocliente1: TMenuItem
      Caption = 'Alterar cliente selecionado'
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Excluirclienteselecionado1: TMenuItem
      Caption = 'Excluir cliente selecionado'
    end
  end
end
