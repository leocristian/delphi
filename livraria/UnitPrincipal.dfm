object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 315
  ClientWidth = 469
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
    Width = 469
    Height = 315
    ActivePage = LogPage
    Align = alClient
    TabOrder = 0
    object BooksPage: TTabSheet
      Caption = 'Livros cadastrados'
      object title: TLabel
        Left = 24
        Top = 32
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
        Top = 72
        Width = 449
        Height = 120
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
        Top = 206
        Width = 216
        Height = 25
        DataSource = DataModule3.DataSource1
        VisibleButtons = [nbDelete, nbEdit, nbPost, nbRefresh]
        TabOrder = 1
      end
      object LogoutBtn: TButton
        Left = 398
        Top = 207
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
        Top = 24
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
        Top = 138
        Width = 87
        Height = 13
        Caption = 'Ano de publica'#231#227'o'
      end
      object Edit1: TEdit
        Left = 32
        Top = 76
        Width = 186
        Height = 21
        TabOrder = 0
        TextHint = 'T'#237'tulo'
      end
      object Edit2: TEdit
        Left = 32
        Top = 103
        Width = 186
        Height = 21
        TabOrder = 1
        TextHint = 'Autor'
      end
      object YearInput: TDateTimePicker
        Left = 32
        Top = 157
        Width = 186
        Height = 21
        Date = 44642.000000000000000000
        Time = 0.517772164348571100
        TabOrder = 2
      end
      object Button1: TButton
        Left = 143
        Top = 200
        Width = 75
        Height = 25
        Caption = 'Cadastrar'
        TabOrder = 3
        OnClick = Button1Click
      end
      object CodInput: TEdit
        Left = 32
        Top = 49
        Width = 186
        Height = 21
        TabOrder = 4
        TextHint = 'C'#243'digo'
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Clientes'
      ImageIndex = 2
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
        Left = 261
        Top = 169
        Width = 75
        Height = 25
        Caption = 'Adicionar'
        TabOrder = 0
        OnClick = Button2Click
      end
      object DBNavigator2: TDBNavigator
        Left = 16
        Top = 168
        Width = 216
        Height = 25
        DataSource = DataModule3.DataSource1
        VisibleButtons = [nbDelete, nbEdit, nbPost, nbRefresh]
        TabOrder = 1
      end
      object DBGrid2: TDBGrid
        Left = 16
        Top = 28
        Width = 320
        Height = 120
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
        Left = 161
        Top = 168
        Width = 97
        Height = 25
        Caption = 'Nova venda'
        TabOrder = 0
      end
      object Button4: TButton
        Left = 264
        Top = 168
        Width = 97
        Height = 25
        Caption = 'Estornar venda'
        TabOrder = 1
        OnClick = Button4Click
      end
      object DBGrid3: TDBGrid
        Left = 16
        Top = 42
        Width = 345
        Height = 120
        DataSource = DataModule3.DataSource3
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object LogPage: TTabSheet
      Caption = 'Relat'#243'rio geral'
      ImageIndex = 4
      object Label5: TLabel
        Left = 16
        Top = 16
        Width = 190
        Height = 19
        Caption = 'Relat'#243'rio de atividades'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object CRDBGrid1: TCRDBGrid
        Left = 16
        Top = 56
        Width = 320
        Height = 120
        DataSource = DataModule3.DataSource3
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
  end
  object UniQuery1: TUniQuery
    Connection = DataModule3.UniConnection1
    Left = 256
    Top = 32
  end
end
