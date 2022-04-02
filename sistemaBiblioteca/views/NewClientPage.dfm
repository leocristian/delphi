object NewClientForm: TNewClientForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'NewClientForm'
  ClientHeight = 250
  ClientWidth = 252
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = OpenClienteForm
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 24
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
  object clientNameInput: TEdit
    Left = 40
    Top = 72
    Width = 161
    Height = 21
    TabOrder = 0
    TextHint = 'Nome'
  end
  object clientEmailInput: TEdit
    Left = 40
    Top = 107
    Width = 161
    Height = 21
    TabOrder = 1
    TextHint = 'Email'
  end
  object clientTelInput: TEdit
    Left = 40
    Top = 144
    Width = 161
    Height = 21
    TabOrder = 2
    TextHint = 'Telefone'
  end
  object AdicionarClienteBtn: TButton
    Left = 126
    Top = 179
    Width = 75
    Height = 25
    Caption = 'Adicionar'
    TabOrder = 3
    OnClick = Adicionar
  end
end
