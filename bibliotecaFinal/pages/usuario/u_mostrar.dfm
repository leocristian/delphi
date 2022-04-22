object UsuarioForm: TUsuarioForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'UsuarioForm'
  ClientHeight = 301
  ClientWidth = 363
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
  object panel_usuarioSelecionado: TPanel
    Left = 0
    Top = 0
    Width = 363
    Height = 301
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 49
      Top = 34
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
      Left = 57
      Top = 177
      Width = 73
      Height = 13
      Caption = 'Nome completo'
    end
    object Label3: TLabel
      Left = 56
      Top = 122
      Width = 24
      Height = 13
      Caption = 'Email'
    end
    object Label4: TLabel
      Left = 136
      Top = 76
      Width = 25
      Height = 13
      Caption = 'Login'
    end
    object Label5: TLabel
      Left = 57
      Top = 76
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object NomeInput: TEdit
      Left = 56
      Top = 196
      Width = 256
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 2
    end
    object EmailInput: TEdit
      Left = 56
      Top = 141
      Width = 257
      Height = 21
      CharCase = ecLowerCase
      MaxLength = 30
      TabOrder = 1
    end
    object LoginInput: TEdit
      Left = 136
      Top = 95
      Width = 177
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 30
      TabOrder = 0
    end
    object ModoInput: TEdit
      Left = 64
      Top = 240
      Width = 25
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      TabOrder = 5
      Visible = False
    end
    object SalvarBtn: TButton
      Left = 95
      Top = 235
      Width = 83
      Height = 32
      Caption = 'Salvar'
      TabOrder = 3
      OnClick = SalvarBtnClick
    end
    object CodigoInput: TEdit
      Left = 56
      Top = 95
      Width = 74
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 6
    end
    object CancelarBtn: TButton
      Left = 191
      Top = 235
      Width = 83
      Height = 32
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = CancelarBtnClick
    end
  end
end
