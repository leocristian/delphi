object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'FormPrincipal'
  ClientHeight = 505
  ClientWidth = 821
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = AbrirForm
  PixelsPerInch = 96
  TextHeight = 13
  object SelecaoBusca: TComboBox
    Left = 16
    Top = 23
    Width = 113
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
    Text = 'C'#211'DIGO'
    Items.Strings = (
      'C'#211'DIGO'
      'NOME OU EMAIL')
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 821
    Height = 505
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 53
      Top = 28
      Width = 127
      Height = 23
      Caption = 'P'#225'gina inicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object MainMenu1: TMainMenu
    Left = 744
    Top = 16
    object Cadastro1: TMenuItem
      Caption = 'Cadastros'
      object Pessoas1: TMenuItem
        Caption = 'Pessoas'
        object usuarios: TMenuItem
          Caption = 'Usu'#225'rios'
          OnClick = usuariosClick
        end
        object clientes: TMenuItem
          Caption = 'Clientes'
          OnClick = clientesClick
        end
      end
      object Outros1: TMenuItem
        Caption = 'Outros'
        object livros: TMenuItem
          Caption = 'Livros'
          OnClick = livrosClick
        end
      end
    end
    object Cadastro2: TMenuItem
      Caption = 'Vendas'
      object vendas: TMenuItem
        Caption = 'Abrir vendas'
        OnClick = vendasClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
    end
    object sistema1: TMenuItem
      Caption = 'Sistema'
      object Verperfil1: TMenuItem
        Caption = 'Ver perfil'
        OnClick = Verperfil1Click
      end
      object AlterarPerfil: TMenuItem
        Caption = 'Alterar perfil'
        OnClick = AlterarPerfilClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object encerrar: TMenuItem
        Caption = 'Encerrar se'#231#227'o'
        OnClick = encerrarClick
      end
    end
  end
end
