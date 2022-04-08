object ShowUsuarioForm: TShowUsuarioForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'ShowUsuarioForm'
  ClientHeight = 252
  ClientWidth = 300
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = EmularEnter
  OnShow = OpenForm
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 24
    Width = 128
    Height = 16
    Caption = 'Usu'#225'rio selecionado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 48
    Top = 112
    Width = 73
    Height = 13
    Caption = 'Nome completo'
  end
  object Label3: TLabel
    Left = 48
    Top = 62
    Width = 33
    Height = 13
    Caption = 'Codigo'
  end
  object Label4: TLabel
    Left = 48
    Top = 160
    Width = 24
    Height = 13
    Caption = 'Email'
  end
  object Label5: TLabel
    Left = 136
    Top = 62
    Width = 25
    Height = 13
    Caption = 'Login'
  end
  object codigoEdit: TEdit
    Left = 48
    Top = 81
    Width = 73
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object nameEdit: TEdit
    Left = 48
    Top = 131
    Width = 208
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object emailEdit: TEdit
    Left = 48
    Top = 179
    Width = 209
    Height = 21
    Enabled = False
    TabOrder = 2
  end
  object loginEdit: TEdit
    Left = 136
    Top = 81
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 3
  end
end
