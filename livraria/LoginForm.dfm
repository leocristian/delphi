object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 205
  ClientWidth = 412
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
    Left = 48
    Top = 8
    Width = 281
    Height = 161
    TabOrder = 0
    OnClick = LoginBtnClick
    object Label1: TLabel
      Left = 33
      Top = 17
      Width = 144
      Height = 19
      Caption = 'Entrar no sistema'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 33
      Top = 50
      Width = 216
      Height = 21
      TabOrder = 0
      TextHint = 'Nome de usu'#225'rio'
    end
    object Edit2: TEdit
      Left = 33
      Top = 77
      Width = 216
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
      TextHint = 'Senha'
    end
    object LoginBtn: TButton
      Left = 94
      Top = 104
      Width = 75
      Height = 25
      Caption = 'Acessar'
      TabOrder = 2
      OnClick = LoginBtnClick
    end
    object SignupBtn: TButton
      Left = 175
      Top = 104
      Width = 75
      Height = 25
      Caption = 'Cadastre-se'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = SignupBtnClick
    end
  end
  object QueryUsers: TUniQuery
    Connection = DataModule3.UniConnection1
    Left = 96
    Top = 120
  end
end
