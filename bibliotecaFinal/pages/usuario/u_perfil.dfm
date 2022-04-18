object PerfilUsuario: TPerfilUsuario
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'PerfilUsuario'
  ClientHeight = 344
  ClientWidth = 321
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = AbrirForm
  OnShow = MostrarPerfil
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 56
    Top = 30
    Width = 91
    Height = 23
    Caption = 'Seu perfil'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 56
    Top = 74
    Width = 73
    Height = 13
    Caption = 'Nome completo'
  end
  object Label3: TLabel
    Left = 56
    Top = 120
    Width = 24
    Height = 13
    Caption = 'Email'
  end
  object Label4: TLabel
    Left = 56
    Top = 168
    Width = 25
    Height = 13
    Caption = 'Login'
  end
  object Label5: TLabel
    Left = 190
    Top = 30
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object NovaSenhaLabel: TLabel
    Left = 56
    Top = 224
    Width = 57
    Height = 13
    Caption = 'Nova senha'
  end
  object NovaSenhaCheckLabel: TLabel
    Left = 167
    Top = 224
    Width = 99
    Height = 13
    Caption = 'Repita a nova senha'
  end
  object NomeInput: TEdit
    Left = 56
    Top = 93
    Width = 208
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 100
    TabOrder = 0
  end
  object EmailInput: TEdit
    Left = 56
    Top = 141
    Width = 208
    Height = 21
    CharCase = ecLowerCase
    MaxLength = 30
    TabOrder = 1
  end
  object LoginInput: TEdit
    Left = 56
    Top = 187
    Width = 208
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 30
    TabOrder = 2
  end
  object ModoInput: TEdit
    Left = 40
    Top = 293
    Width = 25
    Height = 21
    TabOrder = 6
    Visible = False
  end
  object SalvarBtn: TButton
    Left = 71
    Top = 286
    Width = 83
    Height = 35
    Caption = 'Salvar'
    TabOrder = 5
    OnClick = SalvarBtnClick
  end
  object CodigoInput: TEdit
    Left = 190
    Top = 49
    Width = 74
    Height = 21
    Enabled = False
    TabOrder = 7
  end
  object NovaSenhaInput: TEdit
    Left = 56
    Top = 243
    Width = 105
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 50
    PasswordChar = '*'
    TabOrder = 3
  end
  object NovaSenhaCheckInput: TEdit
    Left = 167
    Top = 243
    Width = 97
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 50
    PasswordChar = '*'
    TabOrder = 4
  end
  object CancelarBtn: TButton
    Left = 167
    Top = 286
    Width = 83
    Height = 35
    Caption = 'Cancelar'
    TabOrder = 8
    OnClick = CancelarBtnClick
  end
end
