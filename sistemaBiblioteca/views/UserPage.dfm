object UserForm: TUserForm
  Left = 0
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
    inherited Button1: TButton
      OnClick = BuscaPessoa1Button1Click
    end
    inherited Edit1: TEdit
      OnClick = SetFocus
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 728
    Top = 24
    object Vsiuali1: TMenuItem
      Caption = 'Visualizar usuario selecionado'
    end
    object Inserirnovo1: TMenuItem
      Caption = 'Inserir novo usuario'
      OnClick = CreateUser
    end
    object Inserirnovo2: TMenuItem
      Caption = 'Alterar usuario selecionado'
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Excluirselecionado1: TMenuItem
      Caption = 'Excluir usuario selecionado'
      OnClick = DeleteUser
    end
  end
end
