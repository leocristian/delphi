object ShowClienteForm: TShowClienteForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'ShowClienteForm'
  ClientHeight = 264
  ClientWidth = 287
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = FecharForm
  OnShow = OpenForm
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 24
    Width = 124
    Height = 16
    Caption = 'Cliente selecionado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 104
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
    Left = 49
    Top = 112
    Width = 24
    Height = 13
    Caption = 'Email'
  end
  object Label6: TLabel
    Left = 49
    Top = 168
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object codigoEdit: TEdit
    Left = 48
    Top = 81
    Width = 43
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object nameEdit: TEdit
    Left = 104
    Top = 81
    Width = 145
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object emailEdit: TEdit
    Left = 48
    Top = 131
    Width = 201
    Height = 21
    Enabled = False
    TabOrder = 2
  end
  object telEdit: TEdit
    Left = 49
    Top = 187
    Width = 200
    Height = 21
    Enabled = False
    TabOrder = 3
  end
end
