object MostrarLivroForm: TMostrarLivroForm
  Left = 0
  Top = 0
  Caption = 'MostrarLivroForm'
  ClientHeight = 326
  ClientWidth = 387
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
    387
    326)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 387
    Height = 241
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 421
    object Label1: TLabel
      Left = 24
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
      Left = 94
      Top = 60
      Width = 64
      Height = 13
      Caption = 'T'#237'tulo do livro'
    end
    object Label3: TLabel
      Left = 24
      Top = 112
      Width = 34
      Height = 13
      Caption = 'Editora'
    end
    object Label4: TLabel
      Left = 255
      Top = 112
      Width = 87
      Height = 13
      Caption = 'Ano de publica'#231#227'o'
    end
    object Label5: TLabel
      Left = 24
      Top = 165
      Width = 99
      Height = 13
      Caption = 'Pre'#231'o de venda (R$)'
    end
    object Label6: TLabel
      Left = 24
      Top = 60
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label7: TLabel
      Left = 135
      Top = 165
      Width = 47
      Height = 13
      Caption = 'Categoria'
    end
    object TituloInput: TEdit
      Left = 94
      Top = 79
      Width = 248
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 1
    end
    object EditoraInput: TEdit
      Left = 24
      Top = 131
      Width = 225
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 30
      TabOrder = 2
    end
    object AnoPublicacao: TDateTimePicker
      Left = 255
      Top = 131
      Width = 87
      Height = 21
      Date = 44663.000000000000000000
      Time = 0.670588252316520100
      TabOrder = 3
    end
    object PrecoInput: TEdit
      Left = 24
      Top = 184
      Width = 105
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 7
      NumbersOnly = True
      TabOrder = 4
    end
    object CodigoInput: TEdit
      Left = 24
      Top = 79
      Width = 64
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 0
    end
    object CategoriaInput: TComboBox
      Left = 135
      Top = 184
      Width = 207
      Height = 21
      MaxLength = 40
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
  object SalvarBtn: TButton
    Left = 200
    Top = 277
    Width = 142
    Height = 44
    Anchors = [akLeft, akBottom]
    Caption = 'Salvar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = SalvarBtnClick
    ExplicitTop = 303
  end
  object ModoInput: TEdit
    Left = 79
    Top = 271
    Width = 25
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    TabOrder = 2
    Visible = False
  end
end
