object CadastroForm: TCadastroForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastre-se'
  ClientHeight = 338
  ClientWidth = 293
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyPress = AtivaNavegacao
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 24
    Width = 223
    Height = 23
    Caption = 'Cadastre-se no sistema'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 40
    Top = 70
    Width = 75
    Height = 13
    Caption = 'Nome Completo'
  end
  object Label3: TLabel
    Left = 40
    Top = 123
    Width = 24
    Height = 13
    Caption = 'Email'
  end
  object Label4: TLabel
    Left = 40
    Top = 171
    Width = 25
    Height = 13
    Caption = 'Login'
  end
  object Label5: TLabel
    Left = 40
    Top = 222
    Width = 30
    Height = 13
    Caption = 'Senha'
  end
  object Label6: TLabel
    Left = 150
    Top = 222
    Width = 72
    Height = 13
    Caption = 'Repita a senha'
  end
  object nome_completoInput: TEdit
    Left = 40
    Top = 89
    Width = 208
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 100
    TabOrder = 0
  end
  object emailInput: TEdit
    Left = 40
    Top = 142
    Width = 208
    Height = 21
    CharCase = ecLowerCase
    MaxLength = 30
    TabOrder = 1
  end
  object loginInput: TEdit
    Left = 40
    Top = 190
    Width = 208
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 15
    TabOrder = 2
  end
  object senhaInput: TEdit
    Left = 40
    Top = 241
    Width = 97
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 50
    PasswordChar = '*'
    TabOrder = 3
  end
  object SenhaCheckInput: TEdit
    Left = 150
    Top = 241
    Width = 98
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 50
    PasswordChar = '*'
    TabOrder = 4
  end
  object Panel2: TPanel
    Left = 0
    Top = 284
    Width = 293
    Height = 54
    Align = alBottom
    TabOrder = 5
    object AdicionarUsuarioBtn: TButton
      Left = 61
      Top = 3
      Width = 80
      Height = 34
      Caption = 'Cadastrar-se'
      TabOrder = 0
      OnClick = AdicionarUsuarioBtnClick
    end
    object Button1: TButton
      Left = 151
      Top = 3
      Width = 80
      Height = 34
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
end
