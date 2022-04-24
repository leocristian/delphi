object FrameBusca: TFrameBusca
  Left = 0
  Top = 0
  Width = 792
  Height = 95
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 81
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 21
      Width = 79
      Height = 13
      Caption = 'Campo de busca'
    end
    object Label2: TLabel
      Left = 135
      Top = 21
      Width = 69
      Height = 13
      Caption = 'Palavra-chave'
    end
    object BuscaInput: TEdit
      Left = 135
      Top = 40
      Width = 130
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnClick = BuscaInputClick
    end
    object bt_busca: TButton
      Left = 337
      Top = 20
      Width = 97
      Height = 41
      Cursor = crHandPoint
      Caption = 'Pesquisar'
      TabOrder = 2
    end
    object bt_mostrarTudo: TButton
      Left = 440
      Top = 20
      Width = 97
      Height = 41
      Cursor = crHandPoint
      Caption = 'Mostrar todos'
      TabOrder = 3
    end
    object SelecaoBusca: TComboBox
      Left = 16
      Top = 39
      Width = 113
      Height = 21
      Cursor = crHandPoint
      Style = csDropDownList
      CharCase = ecUpperCase
      ItemIndex = 0
      TabOrder = 0
      Text = 'C'#211'DIGO'
      Items.Strings = (
        'C'#211'DIGO'
        'NOME COMPLETO'
        'EMAIL')
    end
  end
end
