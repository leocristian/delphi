object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 372
  ClientWidth = 705
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 705
    Height = 372
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 538
    ExplicitHeight = 315
    object BooksPage: TTabSheet
      Caption = 'Livros cadastrados'
      object title: TLabel
        Left = 24
        Top = 24
        Width = 121
        Height = 19
        Caption = 'Todos os livros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBGrid1: TDBGrid
        Left = 24
        Top = 57
        Width = 617
        Height = 191
        DataSource = DataModule3.DataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object DBNavigator1: TDBNavigator
        Left = 24
        Top = 278
        Width = 216
        Height = 25
        DataSource = DataModule3.DataSource1
        VisibleButtons = [nbDelete, nbEdit, nbPost, nbRefresh]
        TabOrder = 1
      end
      object LogoutBtn: TButton
        Left = 566
        Top = 278
        Width = 75
        Height = 25
        Caption = 'Sair'
        TabOrder = 2
        OnClick = LogoutBtnClick
      end
    end
    object NewBook: TTabSheet
      Caption = 'Novo livro'
      ImageIndex = 1
      object Label1: TLabel
        Left = 32
        Top = 16
        Width = 165
        Height = 19
        Caption = 'Cadastrar novo livro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 32
        Top = 178
        Width = 87
        Height = 13
        Caption = 'Ano de publica'#231#227'o'
      end
      object Image1: TImage
        Left = 424
        Top = 64
        Width = 105
        Height = 105
      end
      object Label5: TLabel
        Left = 424
        Top = 45
        Width = 28
        Height = 13
        Caption = 'Capa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Edit1: TEdit
        Left = 144
        Top = 65
        Width = 194
        Height = 21
        TabOrder = 0
        TextHint = 'T'#237'tulo'
      end
      object Edit2: TEdit
        Left = 32
        Top = 103
        Width = 209
        Height = 21
        TabOrder = 1
        TextHint = 'Autor'
      end
      object YearInput: TDateTimePicker
        Left = 32
        Top = 197
        Width = 201
        Height = 21
        Date = 44642.000000000000000000
        Time = 0.517772164348571100
        TabOrder = 2
      end
      object Button1: TButton
        Left = 248
        Top = 178
        Width = 90
        Height = 40
        Caption = 'Cadastrar'
        TabOrder = 3
        OnClick = Button1Click
      end
      object CodInput: TEdit
        Left = 32
        Top = 65
        Width = 97
        Height = 21
        TabOrder = 4
        TextHint = 'C'#243'digo'
      end
      object PriceInput: TEdit
        Left = 251
        Top = 103
        Width = 87
        Height = 21
        TabOrder = 5
        TextHint = 'Pre'#231'o (R$)'
      end
      object PublisherInput: TEdit
        Left = 32
        Top = 138
        Width = 306
        Height = 21
        TabOrder = 6
        TextHint = 'Editora'
      end
    end
    object s: TTabSheet
      Caption = 'Clientes'
      ImageIndex = 2
      DesignSize = (
        697
        344)
      object Label3: TLabel
        Left = 16
        Top = 3
        Width = 140
        Height = 19
        Caption = 'Todos os clientes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Button2: TButton
        Left = 512
        Top = 287
        Width = 97
        Height = 39
        Caption = 'Adicionar'
        TabOrder = 0
        OnClick = Button2Click
      end
      object DBNavigator2: TDBNavigator
        Left = 16
        Top = 300
        Width = 216
        Height = 25
        DataSource = DataModule3.DataSource4
        VisibleButtons = [nbDelete, nbEdit, nbPost, nbRefresh]
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 1
      end
      object DBGrid2: TDBGrid
        Left = 16
        Top = 28
        Width = 593
        Height = 245
        DataSource = DataModule3.DataSource4
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Vendas'
      ImageIndex = 3
      object Label4: TLabel
        Left = 16
        Top = 16
        Width = 134
        Height = 19
        Caption = 'Todas as vendas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Button3: TButton
        Left = 378
        Top = 293
        Width = 104
        Height = 34
        Caption = 'Nova venda'
        TabOrder = 0
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 488
        Top = 294
        Width = 113
        Height = 32
        Caption = 'Estornar venda'
        TabOrder = 1
        OnClick = Button4Click
      end
      object DBGrid3: TDBGrid
        Left = 16
        Top = 41
        Width = 585
        Height = 232
        DataSource = DataModule3.DataSource3
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object DBNavigator3: TDBNavigator
        Left = 16
        Top = 296
        Width = 216
        Height = 25
        DataSource = DataModule3.DataSource3
        VisibleButtons = [nbDelete, nbEdit, nbPost, nbRefresh]
        TabOrder = 3
      end
    end
    object LogPage: TTabSheet
      Caption = 'Relat'#243'rio geral'
      ImageIndex = 4
      object Button5: TButton
        Left = 264
        Top = 152
        Width = 177
        Height = 49
        Caption = 'Abrir relat'#243'rio de vendas'
        TabOrder = 0
        OnClick = Button5Click
      end
    end
  end
  object UniQuery1: TUniQuery
    Connection = DataModule3.UniConnection1
    Left = 624
    Top = 320
  end
end
