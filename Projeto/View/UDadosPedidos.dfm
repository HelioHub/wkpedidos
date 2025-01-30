object FDadosPedidos: TFDadosPedidos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Dados do Pedido'
  ClientHeight = 334
  ClientWidth = 599
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnClose = FormClose
  TextHeight = 13
  object PRodape: TPanel
    Left = 0
    Top = 293
    Width = 599
    Height = 41
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 442
    DesignSize = (
      599
      41)
    object BBSair: TBitBtn
      Left = 513
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akRight]
      Caption = '&Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Kind = bkClose
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      OnClick = BBSairClick
    end
    object BBGravar: TBitBtn
      Left = 430
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akRight]
      Caption = '&Gravar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Kind = bkOK
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
    end
  end
  object PDados: TPanel
    Left = 0
    Top = 0
    Width = 599
    Height = 123
    Align = alClient
    TabOrder = 1
    ExplicitTop = -6
    object Label1: TLabel
      Left = 30
      Top = 41
      Width = 83
      Height = 13
      Caption = 'Data de Emiss'#227'o:'
    end
    object Label2: TLabel
      Left = 182
      Top = 68
      Width = 4
      Height = 13
      Caption = '-'
    end
    object SpeedButton1: TSpeedButton
      Left = 487
      Top = 63
      Width = 107
      Height = 22
      Caption = 'F4 -Concultar Cliente'
      StyleName = 'Windows'
    end
    object LEFiltroNumeroPedido: TLabeledEdit
      Left = 116
      Top = 10
      Width = 61
      Height = 21
      EditLabel.Width = 94
      EditLabel.Height = 21
      EditLabel.Caption = ' N'#250'mero do Pedido:'
      LabelPosition = lpLeft
      NumbersOnly = True
      TabOrder = 0
      Text = ''
    end
    object DateTimePicker1: TDateTimePicker
      Left = 116
      Top = 37
      Width = 133
      Height = 21
      Date = 45686.000000000000000000
      Time = 0.829977719906310100
      TabOrder = 1
    end
    object LabeledEdit1: TLabeledEdit
      Left = 116
      Top = 64
      Width = 61
      Height = 21
      EditLabel.Width = 88
      EditLabel.Height = 21
      EditLabel.Caption = 'C'#243'digo do Cliente:'
      LabelPosition = lpLeft
      NumbersOnly = True
      TabOrder = 2
      Text = ''
    end
    object Edit1: TEdit
      Left = 191
      Top = 64
      Width = 292
      Height = 21
      TabOrder = 3
      Text = 'Edit1'
    end
    object LabeledEdit2: TLabeledEdit
      Left = 116
      Top = 91
      Width = 109
      Height = 21
      Alignment = taRightJustify
      EditLabel.Width = 78
      EditLabel.Height = 21
      EditLabel.Caption = 'Total do Pedido:'
      LabelPosition = lpLeft
      NumbersOnly = True
      TabOrder = 4
      Text = ''
    end
  end
  object PItensPedido: TPanel
    Left = 0
    Top = 123
    Width = 599
    Height = 15
    Align = alBottom
    Alignment = taLeftJustify
    Caption = '   Itens do Pedido:'
    TabOrder = 2
    ExplicitTop = 257
  end
  object Panel2: TPanel
    Left = 0
    Top = 266
    Width = 599
    Height = 27
    Align = alBottom
    TabOrder = 3
    ExplicitLeft = -1
    ExplicitTop = 296
    DesignSize = (
      599
      27)
    object BitBtn1: TBitBtn
      Left = 10
      Top = 3
      Width = 75
      Height = 20
      Anchors = [akRight]
      Caption = '&Incluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
      OnClick = BBSairClick
    end
    object BitBtn2: TBitBtn
      Left = 91
      Top = 3
      Width = 75
      Height = 20
      Anchors = [akRight]
      Caption = '&Alterar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      OnClick = BBSairClick
    end
    object BitBtn3: TBitBtn
      Left = 172
      Top = 3
      Width = 75
      Height = 20
      Anchors = [akRight]
      Caption = '&Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 2
      OnClick = BBSairClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 138
    Width = 599
    Height = 128
    Align = alBottom
    TabOrder = 4
    ExplicitTop = 226
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 597
      Height = 126
      Hint = 'Duplo Click para Consultar o Pedido...'
      Align = alClient
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
          Width = 225
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
end
