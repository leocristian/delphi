object MostrarVendaForm: TMostrarVendaForm
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'MostrarVendaForm'
  ClientHeight = 540
  ClientWidth = 765
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
  object Label2: TLabel
    Left = 40
    Top = 154
    Width = 195
    Height = 24
    Caption = 'Livros selecionados'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 593
    Top = 427
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
    Left = 636
    Top = 456
    Width = 17
    Height = 33
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 593
    Top = 456
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
    Left = 121
    Top = 69
    Width = 76
    Height = 13
    Caption = 'Nome do cliente'
  end
  object TituloLabel: TLabel
    Left = 368
    Top = 69
    Width = 64
    Height = 13
    Caption = 'Titulo do livro'
  end
  object TituloPagina: TLabel
    Left = 40
    Top = 16
    Width = 219
    Height = 33
    Caption = 'Venda escolhida'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 40
    Top = 69
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object TituloInput: TEdit
    Left = 368
    Top = 88
    Width = 217
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object ClienteInput: TEdit
    Left = 121
    Top = 88
    Width = 241
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object SalvarBtn: TButton
    Left = 40
    Top = 435
    Width = 177
    Height = 53
    Caption = 'Salvar altera'#231#245'es'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = SalvarBtnClick
  end
  object AddLivro: TButton
    Left = 606
    Top = 76
    Width = 91
    Height = 46
    Caption = 'Adicionar livro'
    TabOrder = 2
    OnClick = AddLivroClick
  end
  object CodigoInput: TEdit
    Left = 40
    Top = 88
    Width = 75
    Height = 21
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 4
  end
  object ModoInput: TEdit
    Left = 40
    Top = 494
    Width = 25
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 5
    Visible = False
  end
  object grid_livros: TDBGrid
    Left = 42
    Top = 192
    Width = 715
    Height = 209
    DataSource = vds_livrosVenda
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object vtb_livrosVenda: TVirtualTable
    Active = True
    FieldDefs = <
      item
        Name = 'titulo'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'editora'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ano_publicacao'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'preco'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'numero_venda'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'codigo'
        DataType = ftString
        Size = 20
      end>
    Left = 304
    Top = 128
    Data = {
      040006000600746974756C6F01001400000000000700656469746F7261010014
      00000000000E00616E6F5F7075626C69636163616F0100140000000000050070
      7265636F01001400000000000C006E756D65726F5F76656E6461010014000000
      00000600636F6469676F0100140000000000000000000000}
  end
  object vds_livrosVenda: TDataSource
    DataSet = vtb_livrosVenda
    Left = 416
    Top = 128
  end
  object PopupMenu1: TPopupMenu
    Left = 536
    Top = 136
    object removerLivro: TMenuItem
      Caption = 'Remover livro da venda'
      OnClick = removerLivroClick
    end
  end
end
