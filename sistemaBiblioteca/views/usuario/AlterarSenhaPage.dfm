object AlterarSenhaForm: TAlterarSenhaForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'AlterarSenhaForm'
  ClientHeight = 260
  ClientWidth = 235
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = CriarForm
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 31
    Width = 127
    Height = 16
    Caption = 'Altera'#231#227'o de senha'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 40
    Top = 61
    Width = 57
    Height = 13
    Caption = 'Senha atual'
  end
  object Label3: TLabel
    Left = 40
    Top = 109
    Width = 57
    Height = 13
    Caption = 'Nova senha'
  end
  object Label4: TLabel
    Left = 40
    Top = 157
    Width = 99
    Height = 13
    Caption = 'Repita a nova senha'
  end
  object senhaAtualInput: TEdit
    Left = 40
    Top = 80
    Width = 145
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
  end
  object novaSenhaInput: TEdit
    Left = 40
    Top = 128
    Width = 145
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object novaSenhaCheckInput: TEdit
    Left = 40
    Top = 176
    Width = 145
    Height = 21
    TabOrder = 2
  end
  object Button1: TButton
    Left = 110
    Top = 211
    Width = 75
    Height = 25
    Caption = 'Alterar senha'
    TabOrder = 3
  end
end
