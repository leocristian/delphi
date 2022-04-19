object PerfilUsuario: TPerfilUsuario
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'PerfilUsuario'
  ClientHeight = 353
  ClientWidth = 328
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
    Top = 14
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
    Top = 58
    Width = 73
    Height = 13
    Caption = 'Nome completo'
  end
  object Label3: TLabel
    Left = 56
    Top = 104
    Width = 24
    Height = 13
    Caption = 'Email'
  end
  object Label4: TLabel
    Left = 56
    Top = 160
    Width = 25
    Height = 13
    Caption = 'Login'
  end
  object Label5: TLabel
    Left = 190
    Top = 14
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object NomeInput: TEdit
    Left = 56
    Top = 77
    Width = 208
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 100
    TabOrder = 0
  end
  object EmailInput: TEdit
    Left = 56
    Top = 125
    Width = 208
    Height = 21
    CharCase = ecLowerCase
    MaxLength = 30
    TabOrder = 1
  end
  object LoginInput: TEdit
    Left = 56
    Top = 179
    Width = 208
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 30
    TabOrder = 2
  end
  object CodigoInput: TEdit
    Left = 190
    Top = 33
    Width = 74
    Height = 21
    Enabled = False
    TabOrder = 3
  end
  object Panel1: TPanel
    Left = 0
    Top = 233
    Width = 328
    Height = 120
    Align = alBottom
    TabOrder = 4
    ExplicitTop = 304
    object SalvarBtn: TButton
      Left = 78
      Top = 13
      Width = 83
      Height = 35
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = SalvarBtnClick
    end
    object CancelarBtn: TButton
      Left = 167
      Top = 13
      Width = 83
      Height = 35
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = CancelarBtnClick
    end
    object ModoInput: TEdit
      Left = 47
      Top = 24
      Width = 25
      Height = 21
      TabOrder = 2
      Visible = False
    end
    object AlterarSenhaBtn: TButton
      Left = 167
      Top = 72
      Width = 132
      Height = 41
      Caption = 'Alterar senha'
      Style = bsCommandLink
      TabOrder = 3
      OnClick = AlterarSenhaBtnClick
    end
  end
end
