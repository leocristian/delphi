object BuscaClienteForm: TBuscaClienteForm
  Left = 0
  Top = 0
  Caption = 'Localizar cliente'
  ClientHeight = 487
  ClientWidth = 445
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
  object PanelConfirma: TPanel
    Left = 0
    Top = 424
    Width = 445
    Height = 63
    Align = alBottom
    TabOrder = 0
    ExplicitLeft = 16
    ExplicitTop = 448
    ExplicitWidth = 464
    object SelecionarBtn: TSpeedButton
      Left = 233
      Top = 16
      Width = 89
      Height = 30
      Caption = 'Selecionar'
      OnClick = SelecionarBtnClick
    end
    object CancelarBtn: TSpeedButton
      Left = 328
      Top = 16
      Width = 89
      Height = 30
      Caption = 'Cancelar'
      OnClick = CancelarBtnClick
    end
    inline FrameImagens1: TFrameImagens
      Left = 31
      Top = 6
      Width = 52
      Height = 50
      TabOrder = 0
      ExplicitLeft = 31
      ExplicitTop = 6
    end
  end
  object grid_clientes: TcxGrid
    Left = 0
    Top = 60
    Width = 445
    Height = 364
    Align = alClient
    TabOrder = 1
    ExplicitTop = 47
    object grid_clientesDBTableView1: TcxGridDBTableView
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
      object grid_clientesDBTableView1codigo: TcxGridDBColumn
        DataBinding.FieldName = 'codigo'
        Width = 49
      end
      object grid_clientesDBTableView1cpf: TcxGridDBColumn
        DataBinding.FieldName = 'cpf'
        Width = 85
      end
      object grid_clientesDBTableView1nome_completo: TcxGridDBColumn
        DataBinding.FieldName = 'nome_completo'
        Width = 164
      end
      object grid_clientesDBTableView1email: TcxGridDBColumn
        DataBinding.FieldName = 'email'
      end
    end
    object grid_clientesLevel1: TcxGridLevel
      GridView = grid_clientesDBTableView1
    end
  end
  object BuscaCliente: TPanel
    Left = 0
    Top = 0
    Width = 445
    Height = 60
    Align = alTop
    TabOrder = 2
    ExplicitWidth = 657
    object BuscaBtn: TSpeedButton
      Left = 383
      Top = 20
      Width = 42
      Height = 21
      ImageIndex = 2
      Images = FrameImagens1.ImageList1
      OnClick = BuscaBtnClick
    end
    object SelecaoBusca: TComboBox
      Left = 16
      Top = 20
      Width = 122
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 1
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
      TabOrder = 0
    end
  end
  inline frame_estilo_grid1: Tframe_estilo_grid
    Left = 104
    Top = 430
    Width = 81
    Height = 56
    TabOrder = 3
    ExplicitLeft = 104
    ExplicitTop = 430
    ExplicitWidth = 81
    ExplicitHeight = 56
    inherited estilo_padrao: TcxStyleRepository
      PixelsPerInch = 96
    end
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
    Left = 376
    Top = 240
    Data = {
      040004000600636F6469676F0300000000000000030063706601001400000000
      000D006E6F6D655F636F6D706C65746F01001400000000000500656D61696C01
      00140000000000000000000000}
  end
  object vds_clientesEncontrados: TDataSource
    DataSet = vtb_clientesEncontrados
    Left = 376
    Top = 288
  end
end
