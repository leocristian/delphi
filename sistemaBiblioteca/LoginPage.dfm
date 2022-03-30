object FormUsuario: TFormUsuario
  Left = 0
  Top = 0
  Anchors = []
  Caption = 'FormUsuario'
  ClientHeight = 261
  ClientWidth = 358
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClick = Login
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 88
    Top = 45
    Width = 119
    Height = 16
    Caption = 'Acessar o sistema'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelNome: TLabel
    Left = 88
    Top = 75
    Width = 80
    Height = 13
    Caption = 'Nome de usu'#225'rio'
  end
  object LabelSenha: TLabel
    Left = 88
    Top = 121
    Width = 30
    Height = 13
    Caption = 'Senha'
  end
  object NomeInput: TEdit
    Left = 88
    Top = 94
    Width = 169
    Height = 21
    TabOrder = 0
  end
  object SenhaInput: TEdit
    Left = 88
    Top = 140
    Width = 169
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object Button1: TButton
    Left = 182
    Top = 172
    Width = 75
    Height = 25
    Caption = 'Entrar'
    TabOrder = 2
    OnClick = Login
  end
end
