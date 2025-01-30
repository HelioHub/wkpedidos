object FViewPedidos: TFViewPedidos
  Left = 0
  Top = 0
  Caption = 'Pedidos'
  ClientHeight = 434
  ClientWidth = 641
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnClose = FormClose
  TextHeight = 13
  object PHead: TPanel
    Left = 0
    Top = 0
    Width = 641
    Height = 44
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 807
    DesignSize = (
      641
      44)
    object LNR: TLabel
      Left = 515
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
      ExplicitLeft = 720
    end
    object BBIncluir: TBitBtn
      Left = 8
      Top = 8
      Width = 75
      Height = 30
      Caption = '&Incluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object BBAlterar: TBitBtn
      Left = 89
      Top = 8
      Width = 75
      Height = 30
      Caption = '&Alterar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object BBExcluir: TBitBtn
      Left = 170
      Top = 8
      Width = 75
      Height = 30
      Caption = '&Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object BBSair: TBitBtn
      Left = 251
      Top = 8
      Width = 75
      Height = 30
      Caption = '&Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Kind = bkClose
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 3
      OnClick = BBSairClick
    end
    object ENR: TEdit
      Left = 590
      Top = 13
      Width = 44
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
      TabOrder = 4
      Text = '100'
      ExplicitLeft = 795
    end
  end
  object PRodape: TPanel
    Left = 0
    Top = 305
    Width = 641
    Height = 24
    Align = alBottom
    Alignment = taLeftJustify
    Caption = '   Itens do Pedido:'
    TabOrder = 4
    ExplicitTop = 336
  end
  object PViewPedidos: TPanel
    Left = 0
    Top = 94
    Width = 641
    Height = 211
    Align = alClient
    TabOrder = 2
    ExplicitHeight = 242
    object DBGView: TDBGrid
      Left = 1
      Top = 1
      Width = 639
      Height = 209
      Hint = 'Duplo Click para Consultar o Pedido...'
      Align = alClient
      DataSource = DSViewPedidos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Color = clWheat
          Expanded = False
          Title.Caption = 'N'#250'mero do Pedido'
          Width = 103
          Visible = True
        end
        item
          Expanded = False
          Title.Alignment = taCenter
          Title.Caption = 'Data de Emiss'#227'o'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'C'#243'digo do Cliente'
          Width = 89
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'Nome do Cliente'
          Width = 225
          Visible = True
        end
        item
          Color = clWheat
          Expanded = False
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
    Height = 50
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 807
    DesignSize = (
      641
      50)
    object LEFiltroNumeroPedido: TLabeledEdit
      Left = 155
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
      Left = 155
      Top = 26
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
      Left = 515
      Top = 5
      Width = 75
      Height = 39
      Anchors = [akTop, akRight]
      Caption = 'Filtra&r'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
  end
  object PViewItensPedido: TPanel
    Left = 0
    Top = 329
    Width = 641
    Height = 105
    Align = alBottom
    TabOrder = 3
    ExplicitTop = 335
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 639
      Height = 103
      Hint = 'Duplo Click para Consultar o Pedido...'
      Align = alClient
      DataSource = DSViewPedidos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Color = clSnow
          Expanded = False
          Title.Caption = 'Item'
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'Descri'#231#227'o do Item'
          Width = 266
          Visible = True
        end
        item
          Expanded = False
          Title.Alignment = taRightJustify
          Title.Caption = 'Quantidade'
          Width = 89
          Visible = True
        end
        item
          Expanded = False
          Title.Alignment = taRightJustify
          Title.Caption = 'Pre'#231'o Unit'#225'rio'
          Width = 101
          Visible = True
        end
        item
          Color = clSnow
          Expanded = False
          Title.Alignment = taRightJustify
          Title.Caption = 'Valor Total'
          Width = 90
          Visible = True
        end>
    end
  end
  object DSViewPedidos: TDataSource
    Left = 328
    Top = 168
  end
end
