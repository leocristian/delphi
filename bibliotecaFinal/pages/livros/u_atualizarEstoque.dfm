object AtualizarEstoqueForm: TAtualizarEstoqueForm
  Left = 0
  Top = 0
  Caption = 'AtualizarEstoqueForm'
  ClientHeight = 294
  ClientWidth = 402
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 67
    Top = 16
    Width = 167
    Height = 23
    Caption = 'Atualizar estoque'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 70
    Top = 136
    Width = 82
    Height = 16
    Caption = 'Estoque atual:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object QtdEstoqueLabel: TLabel
    Left = 158
    Top = 133
    Width = 5
    Height = 19
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 70
    Top = 175
    Width = 150
    Height = 16
    Caption = 'Valor a ser incrementado:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ValorIncremento: TEdit
    Left = 226
    Top = 170
    Width = 49
    Height = 21
    MaxLength = 4
    NumbersOnly = True
    TabOrder = 0
  end
  object ConfirmarBtn: TButton
    Left = 114
    Top = 224
    Width = 84
    Height = 41
    Caption = 'Confirmar'
    TabOrder = 1
    OnClick = ConfirmarBtnClick
  end
  object CancelarBtn: TButton
    Left = 204
    Top = 224
    Width = 84
    Height = 41
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = CancelarBtnClick
  end
  object Panel1: TPanel
    Left = 67
    Top = 45
    Width = 302
    Height = 75
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 3
    object Label4: TLabel
      Left = 60
      Top = 12
      Width = 83
      Height = 16
      Caption = 'T'#237'tulo do livro:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 3
      Top = 12
      Width = 39
      Height = 16
      Caption = 'C'#243'digo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object TituloInput: TEdit
      Left = 60
      Top = 34
      Width = 212
      Height = 21
      MaxLength = 4
      NumbersOnly = True
      TabOrder = 0
    end
    object CodInput: TEdit
      Left = 5
      Top = 34
      Width = 49
      Height = 21
      MaxLength = 4
      NumbersOnly = True
      TabOrder = 1
    end
  end
end
