object EditUserForm: TEditUserForm
  Left = 0
  Top = 0
  Caption = 'EditUserForm'
  ClientHeight = 305
  ClientWidth = 308
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClick = SalvarAlteracoes
  OnKeyPress = EmularEnter
  OnShow = OpenForm
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 32
    Width = 179
    Height = 16
    Caption = 'Alterar usu'#225'rio selecionado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 48
    Top = 121
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
    Top = 176
    Width = 24
    Height = 13
    Caption = 'Email'
  end
  object Label5: TLabel
    Left = 127
    Top = 62
    Width = 25
    Height = 13
    Caption = 'Login'
  end
  object codigoEdit: TEdit
    Left = 48
    Top = 81
    Width = 57
    Height = 21
    Enabled = False
    TabOrder = 4
  end
  object loginEdit: TEdit
    Left = 127
    Top = 81
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object nameEdit: TEdit
    Left = 48
    Top = 140
    Width = 200
    Height = 21
    TabOrder = 1
  end
  object emailEdit: TEdit
    Left = 48
    Top = 195
    Width = 200
    Height = 21
    TabOrder = 2
  end
  object Button1: TButton
    Left = 150
    Top = 232
    Width = 98
    Height = 33
    Caption = 'Salvar altera'#231#245'es'
    TabOrder = 3
    OnClick = SalvarAlteracoes
  end
end
