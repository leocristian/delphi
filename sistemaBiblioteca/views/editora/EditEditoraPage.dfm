object EditEditoraForm: TEditEditoraForm
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Editar editora'
  ClientHeight = 203
  ClientWidth = 365
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = AbrirForm
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
    Width = 69
    Height = 13
    Caption = 'Nome fantasia'
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
    Width = 25
    Height = 13
    Caption = 'CNPJ'
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
  object cnpjEdit: TEdit
    Left = 48
    Top = 139
    Width = 141
    Height = 21
    TabOrder = 2
  end
  object Button1: TButton
    Left = 203
    Top = 123
    Width = 102
    Height = 37
    Caption = 'Salvar altera'#231#245'es'
    TabOrder = 3
  end
end
