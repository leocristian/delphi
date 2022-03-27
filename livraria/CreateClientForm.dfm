object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 260
  ClientWidth = 444
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 96
    Top = 48
    Width = 249
    Height = 169
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 140
      Height = 19
      Caption = 'Cadastrar cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EmailClientInput: TEdit
      Left = 24
      Top = 83
      Width = 201
      Height = 21
      TabOrder = 0
      TextHint = 'Email'
    end
    object CodClientInput: TEdit
      Left = 151
      Top = 56
      Width = 73
      Height = 21
      TabOrder = 1
      TextHint = 'C'#243'digo'
    end
    object CreaateClientBtn: TButton
      Left = 151
      Top = 120
      Width = 74
      Height = 25
      Caption = 'Cadastrar'
      TabOrder = 2
      OnClick = CreaateClientBtnClick
    end
  end
  object NameClientInput: TEdit
    Left = 120
    Top = 104
    Width = 121
    Height = 21
    TabOrder = 1
    TextHint = 'Nome do cliente'
  end
  object UniQuery1: TUniQuery
    Connection = DataModule3.UniConnection1
    Left = 152
    Top = 160
  end
end
