object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 268
  ClientWidth = 416
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
    Left = 56
    Top = 40
    Width = 265
    Height = 177
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 24
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
    object ClientNameInput: TEdit
      Left = 40
      Top = 61
      Width = 121
      Height = 21
      TabOrder = 0
      TextHint = 'Nome do cliente'
    end
    object ClientCodInput: TEdit
      Left = 175
      Top = 61
      Width = 57
      Height = 21
      TabOrder = 1
      TextHint = 'C'#243'digo'
    end
    object ClientEmailInput: TEdit
      Left = 40
      Top = 88
      Width = 193
      Height = 21
      TabOrder = 2
      TextHint = 'Email'
    end
    object CreateClientBtn: TButton
      Left = 152
      Top = 128
      Width = 75
      Height = 25
      Caption = 'Cadastrar'
      TabOrder = 3
    end
  end
  object UniQuery1: TUniQuery
    Connection = DataModule3.UniConnection1
    MasterSource = DataModule3.DataSource4
    Left = 112
    Top = 168
  end
end
