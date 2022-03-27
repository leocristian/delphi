object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 268
  ClientWidth = 473
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 104
    Top = 24
    Width = 249
    Height = 236
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 191
      Height = 19
      Caption = 'Cadastre-se no sistema'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object NameInput: TEdit
      Left = 16
      Top = 88
      Width = 193
      Height = 21
      TabOrder = 0
      TextHint = 'Nome'
    end
    object PassInput: TEdit
      Left = 16
      Top = 142
      Width = 89
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
      TextHint = 'Senha'
    end
    object PassCheckInput: TEdit
      Left = 120
      Top = 142
      Width = 89
      Height = 21
      PasswordChar = '*'
      TabOrder = 2
      TextHint = 'Repita a senha'
    end
    object SignupBtn: TButton
      Left = 79
      Top = 185
      Width = 75
      Height = 25
      Caption = 'Confirmar'
      TabOrder = 3
      OnClick = SignupBtnClick
    end
  end
  object EmailInput: TEdit
    Left = 120
    Top = 136
    Width = 193
    Height = 21
    TabOrder = 1
    TextHint = 'E-mail'
  end
  object CodInput: TEdit
    Left = 120
    Top = 88
    Width = 193
    Height = 21
    TabOrder = 2
    TextHint = 'C'#243'digo'
  end
  object ReturnBtn: TButton
    Left = 264
    Top = 209
    Width = 49
    Height = 25
    Caption = 'Voltar'
    TabOrder = 3
    OnClick = ReturnBtnClick
  end
  object UniQuery1: TUniQuery
    Connection = DataModule3.UniConnection1
    SQL.Strings = (
      'insert into usuarios values (342, '#39'cristian'#39', '#39'123456'#39')')
    Left = 128
    Top = 200
  end
end
