object NovaVendaForm: TNovaVendaForm
  Left = 0
  Top = 0
  Caption = 'NovaVendaForm'
  ClientHeight = 539
  ClientWidth = 751
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = CriarForm
  OnKeyPress = AtivarNavegacao
  OnShow = MostrarForm
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 16
    Width = 274
    Height = 33
    Caption = 'Realizar nova venda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
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
    Top = 439
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
    Top = 468
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
    Top = 468
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
    Top = 69
    Width = 76
    Height = 13
    Caption = 'Nome do cliente'
  end
  object Label6: TLabel
    Left = 304
    Top = 69
    Width = 64
    Height = 13
    Caption = 'Titulo do livro'
  end
  object TituloInput: TEdit
    Left = 304
    Top = 88
    Width = 217
    Height = 21
    CharCase = ecLowerCase
    TabOrder = 1
  end
  object ClienteInput: TEdit
    Left = 40
    Top = 88
    Width = 241
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object RealizarVendaBtn: TButton
    Left = 40
    Top = 448
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
    OnClick = RealizarVendaBtnClick
  end
  object AddLivro: TButton
    Left = 574
    Top = 76
    Width = 91
    Height = 46
    Caption = 'Adicionar livro'
    TabOrder = 2
    OnClick = AddLivroClick
  end
  object grid_livros: TDBGrid
    Left = 40
    Top = 192
    Width = 657
    Height = 223
    DataSource = vds_livrosVenda
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
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
        Title.Caption = 'T'#237'tulo'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 158
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'anoPublicacao'
        Title.Caption = 'Ano de publica'#231#227'o'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 285
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'preco'
        Title.Caption = 'Pre'#231'o'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end>
  end
  object vtb_livrosVenda: TVirtualTable
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
        Name = 'anoPublicacao'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'preco'
        DataType = ftString
        Size = 20
      end>
    Left = 336
    Top = 16
    Data = {
      040004000600636F6469676F03000000000000000600746974756C6F01001400
      000000000D00616E6F5075626C69636163616F01001400000000000500707265
      636F0100140000000000000000000000}
  end
  object vds_livrosVenda: TDataSource
    DataSet = vtb_livrosVenda
    Left = 400
    Top = 16
  end
  object ds_livrosVenda: TDataSource
    DataSet = tb_livrosVenda
    Left = 632
    Top = 16
  end
  object tb_livrosVenda: TUniTable
    TableName = 'livros_venda'
    Connection = dm1.con1
    Left = 536
    Top = 16
  end
end
