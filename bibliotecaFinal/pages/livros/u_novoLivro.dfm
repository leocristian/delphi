object NovoLivroForm: TNovoLivroForm
  Left = 0
  Top = 0
  Caption = 'NovoLivroForm'
  ClientHeight = 349
  ClientWidth = 630
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 16
    Width = 202
    Height = 24
    Caption = 'Adicionar novo livro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 40
    Top = 56
    Width = 64
    Height = 13
    Caption = 'T'#237'tulo do livro'
  end
  object Label3: TLabel
    Left = 40
    Top = 112
    Width = 34
    Height = 13
    Caption = 'Editora'
  end
  object Label4: TLabel
    Left = 40
    Top = 176
    Width = 87
    Height = 13
    Caption = 'Ano de publica'#231#227'o'
  end
  object Label5: TLabel
    Left = 40
    Top = 237
    Width = 99
    Height = 13
    Caption = 'Pre'#231'o de venda (R$)'
  end
  object Categorias: TRadioGroup
    Left = 313
    Top = 56
    Width = 280
    Height = 169
    Caption = 'Selecione uma categoria'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'NENHUMA'
      'A'#199#195'O'
      'AVENTURA'
      'C'#202'NCIA E TECNOLOGIA'
      'FIC'#199#195'O CIENT'#205'FICA'
      'SUSPENSE'
      'TERROR')
    ParentFont = False
    TabOrder = 4
  end
  object TituloInput: TEdit
    Left = 40
    Top = 85
    Width = 225
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object EditoraInput: TEdit
    Left = 40
    Top = 131
    Width = 225
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object AnoPublicacao: TDateTimePicker
    Left = 40
    Top = 195
    Width = 87
    Height = 21
    Date = 44663.000000000000000000
    Time = 0.670588252316520100
    TabOrder = 2
  end
  object PrecoInput: TEdit
    Left = 40
    Top = 256
    Width = 158
    Height = 21
    CharCase = ecUpperCase
    NumbersOnly = True
    TabOrder = 3
  end
  object AdicionarBtn: TButton
    Left = 353
    Top = 256
    Width = 240
    Height = 54
    Caption = 'Adicionar livro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = AdicionarBtnClick
  end
end
