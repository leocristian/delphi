object NovoCliente: TNovoCliente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Novo cliente'
  ClientHeight = 261
  ClientWidth = 418
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
    418
    261)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 42
    Top = 28
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
    Left = 167
    Top = 66
    Width = 75
    Height = 13
    Caption = 'Nome Completo'
  end
  object Label3: TLabel
    Left = 42
    Top = 127
    Width = 24
    Height = 13
    Caption = 'Email'
  end
  object Label4: TLabel
    Left = 42
    Top = 66
    Width = 19
    Height = 13
    Caption = 'CPF'
  end
  object Label7: TLabel
    Left = 256
    Top = 127
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object nome_completoInput: TEdit
    Left = 167
    Top = 85
    Width = 208
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 100
    TabOrder = 1
  end
  object emailInput: TEdit
    Left = 42
    Top = 146
    Width = 208
    Height = 21
    CharCase = ecLowerCase
    MaxLength = 30
    TabOrder = 2
  end
  object cpfInput: TEdit
    Left = 42
    Top = 85
    Width = 119
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 11
    NumbersOnly = True
    TabOrder = 0
  end
  object AdicionarUsuarioBtn: TButton
    Left = 122
    Top = 199
    Width = 84
    Height = 34
    Anchors = [akLeft, akBottom]
    Caption = 'Adicionar'
    TabOrder = 4
    OnClick = AdicionarUsuarioBtnClick
  end
  object Button1: TButton
    Left = 212
    Top = 199
    Width = 84
    Height = 34
    Anchors = [akLeft, akBottom]
    Caption = 'Cancelar'
    TabOrder = 5
    OnClick = Button1Click
  end
  object TelefoneInput: TEdit
    Left = 256
    Top = 146
    Width = 119
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 11
    NumbersOnly = True
    TabOrder = 3
  end
end
