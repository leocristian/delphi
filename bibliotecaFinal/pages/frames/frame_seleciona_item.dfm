object SelecionaItemFrame: TSelecionaItemFrame
  Left = 0
  Top = 0
  Width = 296
  Height = 33
  TabOrder = 0
  object BuscaBtn: TSpeedButton
    Left = 250
    Top = 6
    Width = 41
    Height = 21
    ImageIndex = 1
    Images = FrameImagens1.ImageList1
  end
  object BuscaInput: TEdit
    Left = 3
    Top = 6
    Width = 241
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 60
    TabOrder = 0
  end
  inline FrameImagens1: TFrameImagens
    Left = 297
    Top = 3
    Width = 52
    Height = 50
    TabOrder = 1
    ExplicitLeft = 297
    ExplicitTop = 3
  end
end
