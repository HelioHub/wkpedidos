object FViewPedidos: TFViewPedidos
  Left = 0
  Top = 0
  ActiveControl = LEFiltroNumeroPedido
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pedidos'
  ClientHeight = 466
  ClientWidth = 641
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 13
  object PHead: TPanel
    Left = 0
    Top = 0
    Width = 641
    Height = 44
    Align = alTop
    TabOrder = 0
    DesignSize = (
      641
      44)
    object LNR: TLabel
      Left = 527
      Top = 16
      Width = 73
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'N'#186' Registros:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BBIncluir: TBitBtn
      Left = 5
      Top = 8
      Width = 62
      Height = 30
      Hint = 'Incluir Pedido'
      Caption = '&Incluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ImageIndex = 0
      Images = DMUtils.ILImagensSystem
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BBIncluirClick
    end
    object BBAlterar: TBitBtn
      Left = 69
      Top = 8
      Width = 62
      Height = 30
      Hint = 'Alterar Pedido'
      Caption = '&Alterar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ImageIndex = 1
      Images = DMUtils.ILImagensSystem
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BBAlterarClick
    end
    object BBExcluir: TBitBtn
      Left = 133
      Top = 8
      Width = 62
      Height = 30
      Hint = 'Cancela o Pedido e seus Itens deletandos'
      Caption = '&Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ImageIndex = 2
      Images = DMUtils.ILImagensSystem
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BBExcluirClick
    end
    object BBSair: TBitBtn
      Left = 197
      Top = 8
      Width = 62
      Height = 30
      Hint = 'Fechar tela de Pedidos'
      Cancel = True
      Caption = '&Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ImageIndex = 8
      Images = DMUtils.ILImagensSystem
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BBSairClick
    end
    object ENR: TEdit
      Left = 602
      Top = 13
      Width = 33
      Height = 21
      Hint = 'Limite de registros da Consulta. Colocando zero desconsidera.'
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      NumbersOnly = True
      ParentFont = False
      TabOrder = 6
      Text = '100'
    end
    object BBProdutoMaisVendido: TBitBtn
      Left = 276
      Top = 8
      Width = 81
      Height = 30
      Hint = 'Visualiza os Produtos mais Vendidos.'
      Cancel = True
      Caption = '+ &Vendido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ImageIndex = 6
      Images = DMUtils.ILImagensSystem
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = BBProdutoMaisVendidoClick
    end
    object BBRelatorio: TBitBtn
      Left = 442
      Top = 8
      Width = 80
      Height = 30
      Hint = 
        'Gera Relat'#243'rio em HTML dos Pedidos. Considera o Filtro Data de E' +
        'miss'#227'o.'
      Cancel = True
      Caption = 'Rela&t'#243'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ImageIndex = 4
      Images = DMUtils.ILImagensSystem
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = BBRelatorioClick
    end
    object BBGrafico: TBitBtn
      Left = 359
      Top = 8
      Width = 81
      Height = 30
      Hint = 'Visualiza os Produtos mais Vendidos em Formato de Gr'#225'fico.'
      Cancel = True
      Caption = '+ &Gr'#225'fico'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ImageIndex = 6
      Images = DMUtils.ILImagensSystem
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = BBGraficoClick
    end
  end
  object PRodape: TPanel
    Left = 0
    Top = 337
    Width = 641
    Height = 24
    Align = alBottom
    Alignment = taLeftJustify
    Caption = '   Itens do Pedido:'
    TabOrder = 4
  end
  object PViewPedidos: TPanel
    Left = 0
    Top = 116
    Width = 641
    Height = 221
    Align = alClient
    TabOrder = 2
    object DBGView: TDBGrid
      Left = 1
      Top = 1
      Width = 639
      Height = 219
      Hint = 'Duplo Click para Alterar o Pedido...'
      Align = alClient
      DataSource = DSViewPedidos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentShowHint = False
      PopupMenu = PMOptions
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGViewDblClick
      OnKeyDown = DBGViewKeyDown
      Columns = <
        item
          Alignment = taCenter
          Color = clWheat
          Expanded = False
          FieldName = 'NumeroPedidos'
          Title.Alignment = taCenter
          Title.Caption = 'N'#186' Pedido'
          Width = 54
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DataEmissaoPedidos'
          Title.Alignment = taCenter
          Title.Caption = 'Data de Emiss'#227'o'
          Width = 124
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ClientePedidos'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo do Cliente'
          Width = 89
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NomeClientes'
          Title.Caption = 'Nome do Cliente'
          Width = 243
          Visible = True
        end
        item
          Color = clWheat
          Expanded = False
          FieldName = 'ValorTotalPedidos'
          Title.Alignment = taRightJustify
          Title.Caption = 'Total do Pedido'
          Width = 90
          Visible = True
        end>
    end
  end
  object PFiltrar: TPanel
    Left = 0
    Top = 44
    Width = 641
    Height = 72
    Align = alTop
    TabOrder = 1
    DesignSize = (
      641
      72)
    object LDT: TLabel
      Left = 14
      Top = 51
      Width = 133
      Height = 13
      Caption = 'Filtrar por Data de Emiss'#227'o:'
    end
    object Label1: TLabel
      Left = 240
      Top = 52
      Width = 6
      Height = 13
      Caption = 'a'
    end
    object SBClearPedido: TSpeedButton
      Left = 198
      Top = 3
      Width = 23
      Height = 22
      Hint = 'Limpar Pedido'
      ImageIndex = 7
      Images = DMUtils.ILImagensSystem
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBClearPedidoClick
    end
    object SBClearNomeCliente: TSpeedButton
      Left = 479
      Top = 24
      Width = 23
      Height = 22
      Hint = 'Limpar Nome do Cliente'
      ImageIndex = 7
      Images = DMUtils.ILImagensSystem
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBClearNomeClienteClick
    end
    object LEFiltroNumeroPedido: TLabeledEdit
      Left = 150
      Top = 3
      Width = 46
      Height = 21
      EditLabel.Width = 141
      EditLabel.Height = 21
      EditLabel.Caption = 'Filtrar por N'#250'mero do Pedido:'
      LabelPosition = lpLeft
      NumbersOnly = True
      TabOrder = 0
      Text = ''
    end
    object LEFiltroNomeCliente: TLabeledEdit
      Left = 150
      Top = 25
      Width = 326
      Height = 21
      EditLabel.Width = 132
      EditLabel.Height = 21
      EditLabel.Caption = 'Filtrar por Nome do Cliente:'
      LabelPosition = lpLeft
      TabOrder = 1
      Text = ''
    end
    object BBAtualizar: TBitBtn
      Left = 539
      Top = 5
      Width = 75
      Height = 61
      Anchors = [akTop, akRight]
      Caption = 'Filtra&r'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ImageIndex = 3
      Images = DMUtils.ILImagensSystem
      ParentFont = False
      TabOrder = 4
      OnClick = BBAtualizarClick
    end
    object DTPDEIni: TDateTimePicker
      Left = 150
      Top = 47
      Width = 85
      Height = 21
      Date = 45686.000000000000000000
      Time = 0.829977719906310100
      TabOrder = 2
    end
    object DTPDEFin: TDateTimePicker
      Left = 250
      Top = 47
      Width = 85
      Height = 21
      Date = 45686.000000000000000000
      Time = 0.829977719906310100
      TabOrder = 3
    end
  end
  object PViewItensPedido: TPanel
    Left = 0
    Top = 361
    Width = 641
    Height = 105
    Align = alBottom
    TabOrder = 3
    object DBGViewItens: TDBGrid
      Left = 1
      Top = 1
      Width = 639
      Height = 103
      Align = alClient
      DataSource = DSItensPedido
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'idItensPedido'
          Title.Alignment = taCenter
          Title.Caption = 'Id'
          Width = 31
          Visible = True
        end
        item
          Alignment = taCenter
          Color = clSnow
          Expanded = False
          FieldName = 'ProdutoItensPedido'
          Title.Alignment = taCenter
          Title.Caption = 'Item'
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DescricaoProdutos'
          Title.Caption = 'Descri'#231#227'o do Item'
          Width = 240
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QuantidadeItensPedido'
          Title.Alignment = taRightJustify
          Title.Caption = 'Quantidade'
          Width = 84
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VlrUnitarioItensPedido'
          Title.Alignment = taRightJustify
          Title.Caption = 'Pre'#231'o Venda'
          Width = 98
          Visible = True
        end
        item
          Color = clSnow
          Expanded = False
          FieldName = 'VlrTotalItensPedido'
          Title.Alignment = taRightJustify
          Title.Caption = 'Valor Total'
          Width = 90
          Visible = True
        end>
    end
  end
  object DSViewPedidos: TDataSource
    DataSet = PedidosMemTable
    OnDataChange = DSViewPedidosDataChange
    Left = 224
    Top = 160
  end
  object PedidosMemTable: TFDMemTable
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 328
    Top = 160
    object PedidosMemTableNumeroPedidos: TIntegerField
      FieldName = 'NumeroPedidos'
    end
    object PedidosMemTableDataEmissaoPedidos: TDateTimeField
      FieldName = 'DataEmissaoPedidos'
    end
    object PedidosMemTableClientePedidos: TIntegerField
      FieldName = 'ClientePedidos'
    end
    object PedidosMemTableNomeClientes: TStringField
      FieldName = 'NomeClientes'
      Size = 80
    end
    object PedidosMemTableValorTotalPedidos: TFMTBCDField
      FieldName = 'ValorTotalPedidos'
      DisplayFormat = '###,##0.00'
    end
  end
  object PMOptions: TPopupMenu
    Left = 80
    Top = 159
    object PMAtualizarItensdoPedido: TMenuItem
      Caption = 'Atualizar View'
      OnClick = PMAtualizarItensdoPedidoClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object PMValorTotaldoPedido: TMenuItem
      Caption = 'Valor Total do Pedido'
      OnClick = PMValorTotaldoPedidoClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object PMProdutoMaisVendido: TMenuItem
      Caption = 'Listar Produtos mais Vendido'
      OnClick = PMProdutoMaisVendidoClick
    end
  end
  object DSItensPedido: TDataSource
    DataSet = ItensMemTable
    Left = 224
    Top = 232
  end
  object ItensMemTable: TFDMemTable
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 328
    Top = 232
    object ItensMemTableidItensPedido: TIntegerField
      FieldName = 'idItensPedido'
    end
    object ItensMemTablePedidoItensPedido: TIntegerField
      FieldName = 'PedidoItensPedido'
    end
    object ItensMemTableProdutoItensPedido: TIntegerField
      FieldName = 'ProdutoItensPedido'
    end
    object ItensMemTableQuantidadeItensPedido: TBCDField
      FieldName = 'QuantidadeItensPedido'
      DisplayFormat = '###,##0.00'
      Size = 2
    end
    object ItensMemTableVlrUnitarioItensPedido: TBCDField
      FieldName = 'VlrUnitarioItensPedido'
      DisplayFormat = '###,##0.00'
      Size = 3
    end
    object ItensMemTableVlrTotalItensPedido: TBCDField
      FieldName = 'VlrTotalItensPedido'
      DisplayFormat = '###,##0.00'
      Size = 3
    end
    object ItensMemTableDescricaoProdutos: TStringField
      FieldName = 'DescricaoProdutos'
      Size = 80
    end
  end
end
