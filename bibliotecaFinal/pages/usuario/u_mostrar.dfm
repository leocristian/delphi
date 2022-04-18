object UsuarioForm: TUsuarioForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'UsuarioForm'
  ClientHeight = 265
  ClientWidth = 346
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = AtivaNavegacao
  OnShow = MostrarForm
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 32
    Width = 192
    Height = 23
    Caption = 'Usu'#225'rio selecionado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 128
    Top = 74
    Width = 73
    Height = 13
    Caption = 'Nome completo'
  end
  object Label3: TLabel
    Left = 48
    Top = 120
    Width = 24
    Height = 13
    Caption = 'Email'
  end
  object Label4: TLabel
    Left = 48
    Top = 168
    Width = 25
    Height = 13
    Caption = 'Login'
  end
  object Label5: TLabel
    Left = 49
    Top = 74
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object NomeInput: TEdit
    Left = 128
    Top = 93
    Width = 193
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 100
    TabOrder = 0
  end
  object EmailInput: TEdit
    Left = 48
    Top = 141
    Width = 273
    Height = 21
    CharCase = ecLowerCase
    MaxLength = 30
    TabOrder = 1
  end
  object LoginInput: TEdit
    Left = 48
    Top = 187
    Width = 177
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 30
    TabOrder = 2
  end
  object ModoInput: TEdit
    Left = 47
    Top = 224
    Width = 25
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 3
    Visible = False
  end
  object SalvarBtn: TButton
    Left = 238
    Top = 173
    Width = 83
    Height = 49
    Caption = 'Salvar'
    TabOrder = 4
    OnClick = SalvarBtnClick
  end
  object CodigoInput: TEdit
    Left = 48
    Top = 93
    Width = 74
    Height = 21
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 5
  end
end
