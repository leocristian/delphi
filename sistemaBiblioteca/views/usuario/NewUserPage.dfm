object NewUserForm: TNewUserForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'NewUserForm'
  ClientHeight = 316
  ClientWidth = 304
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
    Width = 154
    Height = 16
    Caption = 'Cadastre-se no sistema'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 40
    Top = 46
    Width = 75
    Height = 13
    Caption = 'Nome Completo'
  end
  object Label3: TLabel
    Left = 40
    Top = 99
    Width = 24
    Height = 13
    Caption = 'Email'
  end
  object Label4: TLabel
    Left = 40
    Top = 147
    Width = 25
    Height = 13
    Caption = 'Login'
  end
  object Label5: TLabel
    Left = 40
    Top = 198
    Width = 30
    Height = 13
    Caption = 'Senha'
  end
  object Label6: TLabel
    Left = 150
    Top = 198
    Width = 72
    Height = 13
    Caption = 'Repita a senha'
  end
  object nome_completoInput: TEdit
    Left = 40
    Top = 65
    Width = 208
    Height = 21
    TabOrder = 0
  end
  object emailInput: TEdit
    Left = 40
    Top = 118
    Width = 208
    Height = 21
    TabOrder = 1
  end
  object loginInput: TEdit
    Left = 40
    Top = 166
    Width = 208
    Height = 21
    TabOrder = 2
  end
  object senhaInput: TEdit
    Left = 40
    Top = 217
    Width = 105
    Height = 21
    PasswordChar = '*'
    TabOrder = 3
  end
  object AdicionarUsuarioBtn: TButton
    Left = 164
    Top = 263
    Width = 84
    Height = 34
    Caption = 'Cadastrar-se'
    TabOrder = 5
    OnClick = Adicionar
  end
  object SenhaCheckInput: TEdit
    Left = 150
    Top = 217
    Width = 98
    Height = 21
    PasswordChar = '*'
    TabOrder = 4
  end
end
