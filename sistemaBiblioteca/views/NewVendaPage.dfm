object NewVendaForm: TNewVendaForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'NewVendaForm'
  ClientHeight = 194
  ClientWidth = 239
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 32
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
  object TituloInput: TEdit
    Left = 24
    Top = 91
    Width = 161
    Height = 21
    TabOrder = 0
    TextHint = 'Titulo do livro'
  end
  object ClienteInput: TEdit
    Left = 24
    Top = 64
    Width = 161
    Height = 21
    TabOrder = 1
    TextHint = 'Nome do cliente'
  end
  object RealizarVendaBtn: TButton
    Left = 88
    Top = 128
    Width = 97
    Height = 25
    Caption = 'Confirmar venda'
    TabOrder = 2
    OnClick = RealizarVenda
  end
end
