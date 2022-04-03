object NewLivroForm: TNewLivroForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'NewLivroForm'
  ClientHeight = 232
  ClientWidth = 378
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 32
    Width = 129
    Height = 16
    Caption = 'Adicionar novo livro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 200
    Top = 53
    Width = 87
    Height = 13
    Caption = 'Ano de publica'#231#227'o'
  end
  object TituloInput: TEdit
    Left = 48
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 0
    TextHint = 'T'#237'tulo'
  end
  object EditoraInput: TEdit
    Left = 48
    Top = 112
    Width = 121
    Height = 21
    TabOrder = 1
    TextHint = 'Editora'
  end
  object PrecoInput: TEdit
    Left = 200
    Top = 112
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 2
    TextHint = 'Pre'#231'o'
  end
  object AnoInput: TDateTimePicker
    Left = 200
    Top = 72
    Width = 121
    Height = 21
    Date = 44653.000000000000000000
    Time = 0.676915231480961700
    TabOrder = 3
  end
  object Button1: TButton
    Left = 238
    Top = 160
    Width = 83
    Height = 33
    Caption = 'Adicionar'
    TabOrder = 4
    OnClick = Adicionar
  end
end
