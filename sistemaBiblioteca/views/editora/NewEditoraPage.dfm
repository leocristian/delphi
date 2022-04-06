object NewEditoraForm: TNewEditoraForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'NewEditoraForm'
  ClientHeight = 226
  ClientWidth = 276
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = OpenEditoraForm
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 32
    Width = 148
    Height = 16
    Caption = 'Adicionar nova editora'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 40
    Top = 61
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object Label3: TLabel
    Left = 40
    Top = 112
    Width = 25
    Height = 13
    Caption = 'CNPJ'
  end
  object editoraNomeInput: TEdit
    Left = 40
    Top = 80
    Width = 177
    Height = 21
    TabOrder = 0
  end
  object editoraCnpjInput: TEdit
    Left = 40
    Top = 131
    Width = 177
    Height = 21
    TabOrder = 1
  end
  object AdicionarEditoraBtn: TButton
    Left = 142
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Adicionar'
    TabOrder = 2
    OnClick = Adicionar
  end
end
