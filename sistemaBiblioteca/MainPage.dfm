object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'FormPrincipal'
  ClientHeight = 360
  ClientWidth = 757
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = AbrirForm
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 757
    Height = 360
    ActivePage = Welcome
    Align = alClient
    TabOrder = 0
    object Welcome: TTabSheet
      Caption = 'Seja bem vindo'
      object Label1: TLabel
        Left = 32
        Top = 32
        Width = 140
        Height = 16
        Caption = 'Bem vindo ao sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 692
    Top = 16
    object Cadastros: TMenuItem
      Caption = 'Cadastros'
      object Pessoas: TMenuItem
        Caption = 'Pessoas'
        object Usuarios: TMenuItem
          Action = ShowUsersPage
        end
        object Clientes: TMenuItem
          Action = ShowClientsPage
        end
      end
      object Outros: TMenuItem
        Caption = 'Outros'
        object Editoras: TMenuItem
          Action = ShowPublishersPage
        end
        object Livros1: TMenuItem
          Action = ShowBooksPage
        end
      end
    end
    object Vendas: TMenuItem
      Caption = 'Vendas'
      object RealizarVenda: TMenuItem
        Caption = 'Realizar venda'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object RelatorioVendas: TMenuItem
        Caption = 'Relatorio de vendas'
      end
    end
    object Sistema: TMenuItem
      Caption = 'Sistema'
      object RelatorioGeral: TMenuItem
        Caption = 'Relatorio geral'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Sair: TMenuItem
        Caption = 'Sair'
        OnClick = Finalizar
      end
    end
  end
  object ActionList1: TActionList
    Left = 688
    Top = 72
    object ShowUsersPage: TAction
      Caption = 'Usuarios'
      OnExecute = AbrirTelaUsuarios
    end
    object ShowClientsPage: TAction
      Caption = 'Clientes'
      OnExecute = AbrirTelaClientes
    end
    object ShowBooksPage: TAction
      Caption = 'Livros'
      OnExecute = AbrirTelaLivros
    end
    object ShowPublishersPage: TAction
      Caption = 'Editoras'
      OnExecute = AbrirTelaEditoras
    end
  end
end
