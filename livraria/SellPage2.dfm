object Form5: TForm5
  Left = 0
  Top = 0
  Caption = 'Form5'
  ClientHeight = 201
  ClientWidth = 308
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
    Left = 80
    Top = 16
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
  object Edit1: TEdit
    Left = 80
    Top = 56
    Width = 161
    Height = 21
    TabOrder = 0
    TextHint = 'Digite o nome do cliente'
  end
  object Edit2: TEdit
    Left = 80
    Top = 83
    Width = 161
    Height = 21
    TabOrder = 1
    TextHint = 'Digite o nome do Livro'
  end
  object Button1: TButton
    Left = 158
    Top = 120
    Width = 83
    Height = 33
    Caption = 'Gerar venda'
    TabOrder = 2
    OnClick = Button1Click
  end
  object UniQuery1: TUniQuery
    Connection = DataModule3.UniConnection1
    Left = 88
    Top = 128
  end
end
