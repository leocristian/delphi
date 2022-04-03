object NewUserForm: TNewUserForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'NewUserForm'
  ClientHeight = 265
  ClientWidth = 263
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  OnShow = OpenUserForm
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 24
    Width = 131
    Height = 16
    Caption = 'Inserir novo usu'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object nome_completoInput: TEdit
    Left = 40
    Top = 64
    Width = 185
    Height = 21
    TabOrder = 0
    TextHint = 'Nome completo'
  end
  object emailInput: TEdit
    Left = 40
    Top = 99
    Width = 185
    Height = 21
    TabOrder = 1
    TextHint = 'Email'
  end
  object loginInput: TEdit
    Left = 40
    Top = 134
    Width = 185
    Height = 21
    TabOrder = 2
    TextHint = 'Login'
  end
  object senhaInput: TEdit
    Left = 40
    Top = 169
    Width = 89
    Height = 21
    PasswordChar = '*'
    TabOrder = 3
    TextHint = 'Senha'
  end
  object AdicionarUsuarioBtn: TButton
    Left = 150
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Adicionar'
    TabOrder = 4
    OnClick = Adicionar
  end
  object SenhaCheckInput: TEdit
    Left = 135
    Top = 169
    Width = 90
    Height = 21
    PasswordChar = '*'
    TabOrder = 5
    TextHint = 'Repita a senha'
  end
end
