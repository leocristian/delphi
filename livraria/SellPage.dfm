object Form5: TForm5
  Left = 0
  Top = 0
  Caption = 'Form5'
  ClientHeight = 201
  ClientWidth = 267
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
    Left = 40
    Top = 24
    Width = 95
    Height = 19
    Caption = 'Nova venda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ClientInput: TEdit
    Left = 40
    Top = 64
    Width = 177
    Height = 21
    TabOrder = 0
    TextHint = 'Digite o nome do cliente'
  end
  object BookInput: TEdit
    Left = 40
    Top = 91
    Width = 177
    Height = 21
    TabOrder = 1
    TextHint = 'Digite o nome do livro'
  end
  object Button1: TButton
    Left = 142
    Top = 118
    Width = 75
    Height = 25
    Caption = 'Concluir'
    TabOrder = 2
    OnClick = Button1Click
  end
  object UniQuery1: TUniQuery
    Connection = DataModule3.UniConnection1
    Left = 56
    Top = 152
  end
end
