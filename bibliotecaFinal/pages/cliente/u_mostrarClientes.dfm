object MostrarClientesForm: TMostrarClientesForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'MostrarClientesForm'
  ClientHeight = 355
  ClientWidth = 372
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
    Left = 49
    Top = 140
    Width = 73
    Height = 13
    Caption = 'Nome completo'
  end
  object Label3: TLabel
    Left = 49
    Top = 186
    Width = 24
    Height = 13
    Caption = 'Email'
  end
  object Label4: TLabel
    Left = 49
    Top = 240
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object Label5: TLabel
    Left = 49
    Top = 74
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label6: TLabel
    Left = 137
    Top = 74
    Width = 19
    Height = 13
    Caption = 'CPF'
  end
  object NomeInput: TEdit
    Left = 49
    Top = 159
    Width = 272
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 100
    TabOrder = 1
  end
  object EmailInput: TEdit
    Left = 48
    Top = 205
    Width = 273
    Height = 21
    CharCase = ecLowerCase
    MaxLength = 30
    TabOrder = 2
  end
  object TelefoneInput: TEdit
    Left = 49
    Top = 259
    Width = 177
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 11
    TabOrder = 3
  end
  object ModoInput: TEdit
    Left = 48
    Top = 293
    Width = 25
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 5
    Visible = False
  end
  object SalvarBtn: TButton
    Left = 232
    Top = 245
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
    ReadOnly = True
    TabOrder = 6
  end
  object CpfInput: TEdit
    Left = 137
    Top = 93
    Width = 185
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 11
    NumbersOnly = True
    TabOrder = 0
  end
end
