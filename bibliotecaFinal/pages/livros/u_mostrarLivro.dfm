object MostrarLivroForm: TMostrarLivroForm
  Left = 0
  Top = 0
  Caption = 'MostrarLivroForm'
  ClientHeight = 297
  ClientWidth = 409
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
    Top = 16
    Width = 175
    Height = 24
    Caption = 'Livro selecionado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 110
    Top = 60
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
    Left = 271
    Top = 112
    Width = 87
    Height = 13
    Caption = 'Ano de publica'#231#227'o'
  end
  object Label5: TLabel
    Left = 40
    Top = 165
    Width = 99
    Height = 13
    Caption = 'Pre'#231'o de venda (R$)'
  end
  object Label6: TLabel
    Left = 40
    Top = 60
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label7: TLabel
    Left = 151
    Top = 165
    Width = 47
    Height = 13
    Caption = 'Categoria'
  end
  object TituloInput: TEdit
    Left = 110
    Top = 79
    Width = 248
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object EditoraInput: TEdit
    Left = 40
    Top = 131
    Width = 225
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
  end
  object AnoPublicacao: TDateTimePicker
    Left = 271
    Top = 131
    Width = 87
    Height = 21
    Date = 44663.000000000000000000
    Time = 0.670588252316520100
    TabOrder = 3
  end
  object PrecoInput: TEdit
    Left = 40
    Top = 184
    Width = 105
    Height = 21
    CharCase = ecUpperCase
    NumbersOnly = True
    TabOrder = 4
  end
  object SalvarBtn: TButton
    Left = 216
    Top = 223
    Width = 142
    Height = 44
    Caption = 'Salvar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = SalvarBtnClick
  end
  object CodigoInput: TEdit
    Left = 40
    Top = 79
    Width = 64
    Height = 21
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 0
  end
  object ModoInput: TEdit
    Left = 40
    Top = 223
    Width = 25
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    TabOrder = 6
    Visible = False
  end
  object CategoriaInput: TComboBox
    Left = 151
    Top = 184
    Width = 207
    Height = 21
    TabOrder = 5
    Text = 'NENHUMA'
    Items.Strings = (
      'NENHUMA'
      'A'#199#195'O'
      'AVENTURA'
      'CI'#202'NCIA E TECNOLOGIA'
      'FIC'#199#195'O CIENT'#205'FICA'
      'SUSPENSE'
      'TERROR')
  end
end
