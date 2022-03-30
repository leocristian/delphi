object Form6: TForm6
  Left = 0
  Top = 0
  Caption = 'Form6'
  ClientHeight = 201
  ClientWidth = 256
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
    Left = 48
    Top = 40
    Width = 123
    Height = 19
    Caption = 'Estornar venda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SellCodInput: TEdit
    Left = 48
    Top = 72
    Width = 153
    Height = 21
    TabOrder = 0
    TextHint = 'Digite o c'#243'digo da venda'
  end
  object Button1: TButton
    Left = 126
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Estornar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object UniQuery1: TUniQuery
    Connection = DataModule3.UniConnection1
    Left = 48
    Top = 136
  end
end
