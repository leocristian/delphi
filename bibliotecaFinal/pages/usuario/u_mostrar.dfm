object UsuarioForm: TUsuarioForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'UsuarioForm'
  ClientHeight = 308
  ClientWidth = 368
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
    Width = 368
    Height = 308
    Align = alClient
    TabOrder = 0
    ExplicitTop = -8
    ExplicitHeight = 336
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
      Left = 56
      Top = 175
      Width = 73
      Height = 13
      Caption = 'Nome completo'
    end
    object Label3: TLabel
      Left = 55
      Top = 120
      Width = 24
      Height = 13
      Caption = 'Email'
    end
    object Label4: TLabel
      Left = 135
      Top = 74
      Width = 25
      Height = 13
      Caption = 'Login'
    end
    object Label5: TLabel
      Left = 56
      Top = 74
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object NomeInput: TEdit
      Left = 55
      Top = 194
      Width = 256
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 2
    end
    object EmailInput: TEdit
      Left = 55
      Top = 139
      Width = 257
      Height = 21
      CharCase = ecLowerCase
      MaxLength = 30
      TabOrder = 1
    end
    object LoginInput: TEdit
      Left = 135
      Top = 93
      Width = 177
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 30
      TabOrder = 0
    end
    object ModoInput: TEdit
      Left = 63
      Top = 238
      Width = 25
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      TabOrder = 5
      Visible = False
    end
    object SalvarBtn: TButton
      Left = 94
      Top = 233
      Width = 83
      Height = 32
      Caption = 'Salvar'
      TabOrder = 3
      OnClick = SalvarBtnClick
    end
    object CodigoInput: TEdit
      Left = 55
      Top = 93
      Width = 74
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 6
    end
    object CancelarBtn: TButton
      Left = 190
      Top = 233
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
