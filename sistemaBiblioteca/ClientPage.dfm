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
  end
  object PopupMenu1: TPopupMenu
    Left = 720
    Top = 16
    object Visualizarclienteselecionado1: TMenuItem
      Caption = 'Visualizar cliente selecionado'
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
