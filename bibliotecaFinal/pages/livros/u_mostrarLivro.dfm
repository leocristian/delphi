object LivroForm: TLivroForm
  Left = 0
  Top = 0
  Caption = 'LivroForm'
  ClientHeight = 376
  ClientWidth = 471
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
    471
    376)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 471
    Height = 297
    Align = alTop
    BevelOuter = bvNone
    Caption = 'qtd_estoque'
    TabOrder = 0
    object LabelTitulo: TLabel
      Left = 64
      Top = 32
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
      Left = 159
      Top = 76
      Width = 64
      Height = 13
      Caption = 'T'#237'tulo do livro'
    end
    object Label3: TLabel
      Left = 64
      Top = 122
      Width = 34
      Height = 13
      Caption = 'Editora'
    end
    object Label4: TLabel
      Left = 64
      Top = 173
      Width = 87
      Height = 13
      Caption = 'Ano de publica'#231#227'o'
    end
    object Label6: TLabel
      Left = 64
      Top = 76
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label7: TLabel
      Left = 64
      Top = 224
      Width = 47
      Height = 13
      Caption = 'Categoria'
    end
    object Label5: TLabel
      Left = 265
      Top = 173
      Width = 75
      Height = 13
      Caption = 'Pre'#231'o de venda'
    end
    object Label8: TLabel
      Left = 265
      Top = 192
      Width = 15
      Height = 16
      Caption = 'R$'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 286
      Top = 224
      Width = 113
      Height = 13
      Caption = 'Quantidade no estoque'
    end
    object TituloInput: TEdit
      Left = 145
      Top = 95
      Width = 262
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 1
    end
    object EditoraInput: TEdit
      Left = 64
      Top = 139
      Width = 343
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 30
      TabOrder = 2
    end
    object CodigoInput: TEdit
      Left = 64
      Top = 95
      Width = 75
      Height = 21
      Cursor = crNo
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 0
    end
    object CategoriaInput: TComboBox
      Left = 64
      Top = 243
      Width = 207
      Height = 21
      Cursor = crHandPoint
      Style = csDropDownList
      CharCase = ecUpperCase
      ItemIndex = 0
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
    object QtdEstoqueInput: TEdit
      Left = 286
      Top = 243
      Width = 121
      Height = 21
      MaxLength = 5
      NumbersOnly = True
      TabOrder = 6
    end
    object AnoPublicacaoInput: TMaskEdit
      Left = 64
      Top = 192
      Width = 157
      Height = 21
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 3
      Text = '  /  /    '
    end
    object PrecoInput: TcxCurrencyEdit
      Left = 286
      Top = 192
      EditValue = 0c
      Properties.AssignedValues.EditFormat = True
      Properties.DisplayFormat = ',0.00;,0.00'
      Properties.MaxLength = 5
      Properties.MaxValue = 100000.000000000000000000
      Properties.UseDisplayFormatWhenEditing = True
      TabOrder = 4
      Width = 121
    end
  end
  object SalvarBtn: TButton
    Left = 129
    Top = 314
    Width = 103
    Height = 35
    Cursor = crHandPoint
    Anchors = [akLeft, akBottom]
    Caption = 'Salvar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = SalvarBtnClick
  end
  object ModoInput: TEdit
    Left = 82
    Top = 321
    Width = 25
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    TabOrder = 1
    Visible = False
  end
  object CancelarBtn: TButton
    Left = 238
    Top = 314
    Width = 103
    Height = 35
    Cursor = crHandPoint
    Anchors = [akLeft, akBottom]
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = CancelarBtnClick
  end
end
