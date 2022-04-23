object MostrarClientesForm: TMostrarClientesForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'MostrarClientesForm'
  ClientHeight = 369
  ClientWidth = 365
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
  object panel_cliente: TPanel
    Left = 0
    Top = 0
    Width = 365
    Height = 369
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 50
      Top = 41
      Width = 186
      Height = 23
      Caption = 'Cliente selecionado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 51
      Top = 133
      Width = 73
      Height = 13
      Caption = 'Nome completo'
    end
    object Label3: TLabel
      Left = 51
      Top = 179
      Width = 24
      Height = 13
      Caption = 'Email'
    end
    object Label4: TLabel
      Left = 50
      Top = 233
      Width = 42
      Height = 13
      Caption = 'Telefone'
    end
    object Label5: TLabel
      Left = 51
      Top = 83
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label6: TLabel
      Left = 130
      Top = 83
      Width = 19
      Height = 13
      Caption = 'CPF'
    end
    object NomeInput: TEdit
      Left = 51
      Top = 152
      Width = 264
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 60
      TabOrder = 1
    end
    object EmailInput: TEdit
      Left = 51
      Top = 198
      Width = 264
      Height = 21
      CharCase = ecLowerCase
      MaxLength = 30
      TabOrder = 2
    end
    object TelefoneInput: TEdit
      Left = 50
      Top = 252
      Width = 264
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 11
      TabOrder = 3
    end
    object ModoInput: TEdit
      Left = 59
      Top = 301
      Width = 25
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      TabOrder = 6
      Visible = False
    end
    object SalvarBtn: TButton
      Left = 102
      Top = 294
      Width = 74
      Height = 35
      Caption = 'Salvar'
      TabOrder = 4
      OnClick = SalvarBtnClick
    end
    object CodigoInput: TEdit
      Left = 50
      Top = 102
      Width = 74
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      ReadOnly = True
      TabOrder = 7
    end
    object CpfInput: TEdit
      Left = 130
      Top = 102
      Width = 185
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 11
      NumbersOnly = True
      TabOrder = 0
    end
    object CancelarBtn: TButton
      Left = 190
      Top = 295
      Width = 74
      Height = 34
      Caption = 'Cancelar'
      TabOrder = 5
      OnClick = CancelarBtnClick
    end
  end
end
