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
  object Label1: TLabel
    Left = 88
    Top = 56
    Width = 77
    Height = 13
    Caption = 'Tela de editoras'
  end
  object PopupMenu1: TPopupMenu
    Left = 656
    Top = 40
    object Visualizareditoraselecionada1: TMenuItem
      Caption = 'Visualizar editora selecionada'
    end
    object Visualizareditoraselecionada2: TMenuItem
      Caption = 'Adicionar nova editora'
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
