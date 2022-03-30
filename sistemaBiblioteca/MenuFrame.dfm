object BuscaPessoa: TBuscaPessoa
  Left = 0
  Top = 0
  Width = 717
  Height = 72
  Align = alTop
  TabOrder = 0
  object ComboBox1: TComboBox
    Left = 24
    Top = 27
    Width = 129
    Height = 21
    TabOrder = 0
    Text = 'Nome ou email'
    Items.Strings = (
      'Nome ou email'
      'Codigo')
  end
  object Button1: TButton
    Left = 592
    Top = 17
    Width = 97
    Height = 41
    Caption = 'Pesquisar'
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 176
    Top = 27
    Width = 121
    Height = 21
    TabOrder = 2
  end
end
