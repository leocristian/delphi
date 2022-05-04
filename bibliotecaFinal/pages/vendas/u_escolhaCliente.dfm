object EscolhaClienteForm: TEscolhaClienteForm
  Left = 0
  Top = 0
  Caption = 'EscolhaClienteForm'
  ClientHeight = 453
  ClientWidth = 463
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BuscaCliente: TPanel
    Left = 0
    Top = 0
    Width = 463
    Height = 60
    Align = alTop
    TabOrder = 0
    object BuscaBtn: TSpeedButton
      Tag = 2
      Left = 383
      Top = 20
      Width = 42
      Height = 21
      ImageIndex = 0
      Images = ImageList1
      OnClick = BuscaBtnClick
    end
    object SelecaoBusca: TComboBox
      Left = 16
      Top = 20
      Width = 122
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 0
      Text = 'C'#211'DIGO'
      Items.Strings = (
        'C'#211'DIGO'
        'CPF'
        'NOME COMPLETO'
        'EMAIL')
    end
    object BuscaInput: TEdit
      Left = 144
      Top = 20
      Width = 233
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 60
      TabOrder = 1
    end
  end
  object grid_clientes: TcxGrid
    Left = 0
    Top = 60
    Width = 463
    Height = 330
    Align = alClient
    TabOrder = 1
    object grid_clientesDBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 20
      object grid_clientesDBTableView1codigo: TcxGridDBColumn
        DataBinding.FieldName = 'codigo'
        DataBinding.IsNullValueType = True
        Width = 49
      end
      object grid_clientesDBTableView1cpf: TcxGridDBColumn
        DataBinding.FieldName = 'cpf'
        DataBinding.IsNullValueType = True
        Width = 85
      end
      object grid_clientesDBTableView1nome_completo: TcxGridDBColumn
        DataBinding.FieldName = 'nome_completo'
        DataBinding.IsNullValueType = True
        Width = 164
      end
      object grid_clientesDBTableView1email: TcxGridDBColumn
        DataBinding.FieldName = 'email'
        DataBinding.IsNullValueType = True
      end
    end
    object grid_clientesLevel1: TcxGridLevel
      GridView = grid_clientesDBTableView1
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 60
    Width = 463
    Height = 330
    Align = alClient
    TabOrder = 3
    object cxGridDBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = vds_clientesEncontrados
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 20
      Styles.ContentEven = frame_estilo_grid1.linhas
      Styles.IncSearch = frame_estilo_grid1.busca
      Styles.Header = frame_estilo_grid1.cabecalho
      object cxGridDBColumn1: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'codigo'
        Width = 49
      end
      object cxGridDBColumn2: TcxGridDBColumn
        Caption = 'CPF'
        DataBinding.FieldName = 'cpf'
        Width = 85
      end
      object cxGridDBColumn3: TcxGridDBColumn
        Caption = 'Nome completo'
        DataBinding.FieldName = 'nome_completo'
        Width = 164
      end
      object cxGridDBColumn4: TcxGridDBColumn
        Caption = 'Email'
        DataBinding.FieldName = 'email'
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGridDBTableView1
    end
  end
  object PanelConfirma: TPanel
    Left = 0
    Top = 390
    Width = 463
    Height = 63
    Align = alBottom
    TabOrder = 2
    object SelecionarBtn: TSpeedButton
      Tag = 4
      Left = 233
      Top = 16
      Width = 89
      Height = 30
      Caption = 'Selecionar'
      OnClick = SelecionarBtnClick
    end
    object CancelarBtn: TSpeedButton
      Tag = 5
      Left = 328
      Top = 16
      Width = 89
      Height = 30
      Caption = 'Cancelar'
      OnClick = CancelarBtnClick
    end
  end
  inline frame_estilo_grid1: Tframe_estilo_grid
    Left = 8
    Top = 390
    Width = 130
    Height = 72
    TabOrder = 4
    ExplicitLeft = 8
    ExplicitTop = 390
    inherited estilo_padrao: TcxStyleRepository
      PixelsPerInch = 96
    end
  end
  object vds_clientesEncontrados: TDataSource
    DataSet = vtb_clientesEncontrados
    Left = 384
    Top = 224
  end
  object vtb_clientesEncontrados: TVirtualTable
    Active = True
    FieldDefs = <
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'cpf'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'nome_completo'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'email'
        DataType = ftString
        Size = 20
      end>
    Left = 392
    Top = 160
    Data = {
      040004000600636F6469676F0300000000000000030063706601001400000000
      000D006E6F6D655F636F6D706C65746F01001400000000000500656D61696C01
      00140000000000000000000000}
  end
  object ImageList1: TImageList
    Left = 176
    Top = 318
    Bitmap = {
      494C010101000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE0100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D88100FFF3A736FFFFA51FFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E8B5
      6B94F3A736FFFFA51FFFDD8400FFFEFEFE010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F3A7
      36FFFFA520FFDD8400FFB16A00FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7F7F70C8A8A8AFF8A8A8AFFB1B1B19500000000FEFEFE01F3A736FFFFA5
      20FFDD8500FFD0A6689700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A9A9
      A9FF8E8E8EFFD3D3D3FFD1D1D1FFA6A6A6FFA8A8A8FF8F7D62FFFFA520FFDD85
      00FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD02BFBFBFFFD4D4
      D4FFE4E4E4FFEDEDEDFFEEEEEEFFE7E7E7FFD9D9D9FFB3B3B3FF8C7757FFFEFE
      FE01000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C5C5C5FFD2D2D2FFEAEA
      EAFFF9F9F9FFF8F8F8FFF8F8F8FFF8F8F8FFEFEFEFFFD9D9D9FFC3C3C3FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDFDFD04CACACAFFE0E0E0FFF9F9
      F9FFF7F7F7FFF5F5F5FFF5F5F5FFF6F6F6FFF8F8F8FFE7E7E7FFA6A6A6FFC4C4
      C498000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D4D4D4FFE6E6E6FFF8F8
      F8FFF6F6F6FFF4F4F4FFF3F3F3FFF5F5F5FFF8F8F8FFEEEEEEFFD1D1D1FFC6C6
      C6FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E3E3E3FFE6E6E6FFF8F8
      F8FFF6F6F6FFF4F4F4FFF4F4F4FFF5F5F5FFF8F8F8FFEDEDEDFFD2D2D2FFC4C4
      C4FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE01E4E4E4FFDDDDDDFFF7F7
      F7FFF7F7F7FFF6F6F6FFF6F6F6FFF7F7F7FFF9F9F9FFE4E4E4FF9F9F9FFFF6F6
      F61D000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCFFBCBCBCBFFE5E5
      E5FFF7F7F7FFF8F8F8FFF8F8F8FFF9F9F9FFEAEAEAFFD4D4D4FFD1D1D1FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C0FFCBCB
      CBFFDDDDDDFFE6E6E6FFE6E6E6FFE0E0E0FFD3D3D3FFC0C0C0FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B7B7
      B7FBB0B0B0FFE6E6E6FFE3E3E3FFAEAEAEFFB0B0B0FFFDFDFD03000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE010000000000000000FDFDFD040000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFB000000000000FFF1000000000000
      FFE0000000000000FFE1000000000000F083000000000000E00F000000000000
      800F000000000000801F000000000000000F000000000000800F000000000000
      800F000000000000000F000000000000801F000000000000C03F000000000000
      E03F000000000000F6FF00000000000000000000000000000000000000000000
      000000000000}
  end
end