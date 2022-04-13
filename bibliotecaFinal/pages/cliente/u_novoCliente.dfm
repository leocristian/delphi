object NovoCliente: TNovoCliente
  Left = 0
  Top = 0
  Caption = 'Novo cliente'
  ClientHeight = 263
  ClientWidth = 443
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 24
    Width = 215
    Height = 23
    Caption = 'Cadastrar novo cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 173
    Top = 62
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
    Top = 62
    Width = 19
    Height = 13
    Caption = 'CPF'
  end
  object Label7: TLabel
    Left = 254
    Top = 123
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object nome_completoInput: TEdit
    Left = 173
    Top = 81
    Width = 208
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object emailInput: TEdit
    Left = 40
    Top = 142
    Width = 208
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
  end
  object cpfInput: TEdit
    Left = 48
    Top = 81
    Width = 119
    Height = 21
    CharCase = ecUpperCase
    NumbersOnly = True
    TabOrder = 0
  end
  object AdicionarUsuarioBtn: TButton
    Left = 203
    Top = 200
    Width = 84
    Height = 34
    Caption = 'Adicionar'
    TabOrder = 4
    OnClick = AdicionarUsuarioBtnClick
  end
  object Button1: TButton
    Left = 306
    Top = 200
    Width = 75
    Height = 34
    Caption = 'Cancelar'
    TabOrder = 5
  end
  object TelefoneInput: TEdit
    Left = 254
    Top = 142
    Width = 119
    Height = 21
    CharCase = ecUpperCase
    NumbersOnly = True
    TabOrder = 3
  end
end
