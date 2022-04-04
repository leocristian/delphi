object NewVendaForm: TNewVendaForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'NewVendaForm'
  ClientHeight = 397
  ClientWidth = 337
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = OpenForm
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
    Top = 148
    Width = 92
    Height = 13
    Caption = 'Livros selecionados'
  end
  object Label3: TLabel
    Left = 207
    Top = 287
    Width = 49
    Height = 13
    Caption = 'Valor total'
  end
  object labelPreco: TLabel
    Left = 262
    Top = 306
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
    Left = 207
    Top = 306
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
    Width = 161
    Height = 21
    TabOrder = 1
  end
  object ClienteInput: TEdit
    Left = 40
    Top = 57
    Width = 242
    Height = 21
    TabOrder = 0
  end
  object RealizarVendaBtn: TButton
    Left = 40
    Top = 298
    Width = 126
    Height = 41
    Caption = 'Confirmar venda'
    TabOrder = 3
    OnClick = RealizarVenda
  end
  object LivrosEscolhidos: TListBox
    Left = 40
    Top = 167
    Width = 242
    Height = 113
    ItemHeight = 13
    TabOrder = 4
  end
  object Button1: TButton
    Left = 207
    Top = 96
    Width = 75
    Height = 33
    Caption = 'Adicionar livro'
    TabOrder = 2
    OnClick = AdicionarLivro
  end
end
