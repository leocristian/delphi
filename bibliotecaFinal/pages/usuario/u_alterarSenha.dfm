object AlterarSenhaForm: TAlterarSenhaForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'AlterarSenhaForm'
  ClientHeight = 311
  ClientWidth = 290
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  DesignSize = (
    290
    311)
  PixelsPerInch = 96
  TextHeight = 13
  object NovaSenhaLabel: TLabel
    Left = 58
    Top = 134
    Width = 109
    Height = 13
    Caption = 'Digite uma nova senha'
  end
  object NovaSenhaCheckLabel: TLabel
    Left = 58
    Top = 190
    Width = 99
    Height = 13
    Caption = 'Repita a nova senha'
  end
  object Label1: TLabel
    Left = 54
    Top = 30
    Width = 193
    Height = 24
    Caption = 'Altera'#231#227'o de senha'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 58
    Top = 80
    Width = 106
    Height = 13
    Caption = 'Digite sua senha atual'
  end
  object NovaSenhaInput: TEdit
    Left = 58
    Top = 153
    Width = 174
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 50
    PasswordChar = '*'
    TabOrder = 1
  end
  object NovaSenhaCheckInput: TEdit
    Left = 58
    Top = 209
    Width = 174
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 50
    PasswordChar = '*'
    TabOrder = 2
  end
  object SenhaAtualInput: TEdit
    Left = 58
    Top = 99
    Width = 174
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 50
    PasswordChar = '*'
    TabOrder = 0
  end
  object AlterarSenhaBtn: TButton
    Left = 54
    Top = 264
    Width = 88
    Height = 39
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Confirmar'
    TabOrder = 3
    OnClick = AlterarSenhaBtnClick
  end
  object CancelarBtn: TButton
    Left = 148
    Top = 264
    Width = 88
    Height = 39
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancelar'
    TabOrder = 4
    OnClick = CancelarBtnClick
  end
end
