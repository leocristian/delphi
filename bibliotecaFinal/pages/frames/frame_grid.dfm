object frame_estilo_grid: Tframe_estilo_grid
  Left = 0
  Top = 0
  Width = 130
  Height = 72
  TabOrder = 0
  object estilo_padrao: TcxStyleRepository
    Left = 32
    Top = 16
    PixelsPerInch = 96
    object cabecalho: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object linhas: TcxStyle
      AssignedValues = [svColor]
      Color = clInactiveCaption
    end
  end
end
