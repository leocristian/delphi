object NewVendaForm: TNewVendaForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Nova venda'
  ClientHeight = 455
  ClientWidth = 393
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = CriarForm
  OnKeyPress = EmularEnter
  OnShow = AbrirForm
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 16
    Width = 132
    Height = 16
    Caption = 'Realizar nova venda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 40
    Top = 165
    Width = 92
    Height = 13
    Caption = 'Livros selecionados'
  end
  object Label3: TLabel
    Left = 257
    Top = 359
    Width = 91
    Height = 23
    Caption = 'Valor total:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object labelPreco: TLabel
    Left = 300
    Top = 384
    Width = 17
    Height = 33
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 257
    Top = 384
    Width = 37
    Height = 33
    Caption = 'R$'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 40
    Top = 38
    Width = 76
    Height = 13
    Caption = 'Nome do cliente'
  end
  object Label6: TLabel
    Left = 40
    Top = 88
    Width = 64
    Height = 13
    Caption = 'Titulo do livro'
  end
  object TituloInput: TEdit
    Left = 40
    Top = 107
    Width = 217
    Height = 21
    TabOrder = 1
  end
  object ClienteInput: TEdit
    Left = 40
    Top = 57
    Width = 313
    Height = 21
    TabOrder = 0
  end
  object RealizarVendaBtn: TButton
    Left = 40
    Top = 364
    Width = 177
    Height = 53
    Caption = 'Confirmar venda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = RealizarVenda
  end
  object Button1: TButton
    Left = 263
    Top = 84
    Width = 91
    Height = 46
    Caption = 'Adicionar livro'
    TabOrder = 2
    OnClick = AdicionarLivro
  end
  object DBGrid1: TDBGrid
    Left = 40
    Top = 192
    Width = 321
    Height = 153
    DataSource = dsLivrosVenda
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'codigo'
        ReadOnly = True
        Title.Caption = 'C'#243'digo'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'titulo'
        ReadOnly = True
        Title.Caption = 'T'#237'tulo do livro'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 146
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'preco'
        ReadOnly = True
        Title.Caption = 'Pre'#231'o'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 68
        Visible = True
      end>
  end
  object tbLivrosVenda: TVirtualTable
    Active = True
    FieldDefs = <
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'titulo'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'preco'
        DataType = ftString
        Size = 20
      end>
    Left = 168
    Top = 144
    Data = {
      040003000600636F6469676F03000000000000000600746974756C6F01001400
      000000000500707265636F0100140000000000000000000000}
  end
  object dsLivrosVenda: TDataSource
    DataSet = tbLivrosVenda
    Left = 256
    Top = 144
  end
end
