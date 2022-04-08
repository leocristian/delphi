object EditClienteForm: TEditClienteForm
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'EditClienteForm'
  ClientHeight = 262
  ClientWidth = 359
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
    Top = 32
    Width = 174
    Height = 16
    Caption = 'Alterar cliente selecionado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 120
    Top = 62
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
    Top = 120
    Width = 24
    Height = 13
    Caption = 'Email'
  end
  object Label5: TLabel
    Left = 48
    Top = 178
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object codigoEdit: TEdit
    Left = 48
    Top = 81
    Width = 57
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object nameEdit: TEdit
    Left = 120
    Top = 81
    Width = 185
    Height = 21
    TabOrder = 1
  end
  object emailEdit: TEdit
    Left = 48
    Top = 139
    Width = 257
    Height = 21
    TabOrder = 2
  end
  object Button1: TButton
    Left = 199
    Top = 178
    Width = 106
    Height = 45
    Caption = 'Salvar altera'#231#245'es'
    TabOrder = 4
    OnClick = SalvarAlteracoes
  end
  object telefoneEdit: TEdit
    Left = 48
    Top = 197
    Width = 145
    Height = 21
    TabOrder = 3
  end
end
