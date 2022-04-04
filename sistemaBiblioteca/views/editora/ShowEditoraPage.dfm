object ShowEditoraForm: TShowEditoraForm
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'ShowEditoraForm'
  ClientHeight = 242
  ClientWidth = 371
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 80
    Top = 48
    Width = 126
    Height = 16
    Caption = 'Editora selecionada'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 151
    Top = 86
    Width = 69
    Height = 13
    Caption = 'Nome fantasia'
  end
  object Label3: TLabel
    Left = 80
    Top = 86
    Width = 33
    Height = 13
    Caption = 'Codigo'
  end
  object Label4: TLabel
    Left = 80
    Top = 144
    Width = 25
    Height = 13
    Caption = 'CNPJ'
  end
  object codigoEdit: TEdit
    Left = 80
    Top = 105
    Width = 65
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object nomeEdit: TEdit
    Left = 151
    Top = 105
    Width = 130
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object cnpjEdit: TEdit
    Left = 80
    Top = 163
    Width = 201
    Height = 21
    Enabled = False
    TabOrder = 2
  end
end
