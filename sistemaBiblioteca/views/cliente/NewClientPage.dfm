object NewClientForm: TNewClientForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Novo cliente'
  ClientHeight = 243
  ClientWidth = 388
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  OnCreate = AbrirForm
  OnKeyPress = EmularEnter
  OnShow = AbrirForm
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 40
    Width = 126
    Height = 16
    Caption = 'Inserir novo cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 184
    Top = 79
    Width = 73
    Height = 13
    Caption = 'Nome completo'
  end
  object Label3: TLabel
    Left = 48
    Top = 133
    Width = 24
    Height = 13
    Caption = 'Email'
  end
  object Label4: TLabel
    Left = 184
    Top = 133
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object Label5: TLabel
    Left = 48
    Top = 79
    Width = 19
    Height = 13
    Caption = 'CPF'
  end
  object clientNameInput: TEdit
    Left = 184
    Top = 98
    Width = 161
    Height = 21
    TabOrder = 1
  end
  object clientEmailInput: TEdit
    Left = 48
    Top = 152
    Width = 126
    Height = 21
    TabOrder = 2
  end
  object clientTelInput: TEdit
    Left = 184
    Top = 152
    Width = 161
    Height = 21
    NumbersOnly = True
    TabOrder = 3
  end
  object AdicionarClienteBtn: TButton
    Left = 254
    Top = 199
    Width = 91
    Height = 36
    Caption = 'Adicionar'
    TabOrder = 4
    OnClick = Adicionar
  end
  object clientCpfInput: TEdit
    Left = 48
    Top = 98
    Width = 126
    Height = 21
    NumbersOnly = True
    TabOrder = 0
  end
end
