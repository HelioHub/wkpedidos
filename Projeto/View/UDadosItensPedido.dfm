object FDadosItensPedido: TFDadosItensPedido
  Left = 0
  Top = 0
  ActiveControl = LECodigoProduto
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Dados do Item(Produto) do Pedido'
  ClientHeight = 213
  ClientWidth = 398
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Position = poDesktopCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  TextHeight = 13
  object PRodape: TPanel
    Left = 0
    Top = 172
    Width = 398
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      398
      41)
    object BBSair: TBitBtn
      Left = 312
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akRight]
      Cancel = True
      Caption = '&Fechar'
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
    object BBGravar: TBitBtn
      Left = 229
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
      OnClick = BBGravarClick
    end
  end
  object PDados: TPanel
    Left = 0
    Top = 0
    Width = 398
    Height = 172
    Align = alClient
    TabOrder = 0
    object SBF2: TSpeedButton
      Left = 183
      Top = 35
      Width = 113
      Height = 22
      Caption = 'F2 -Concultar Produto'
      StyleName = 'Windows'
      OnClick = SBF2Click
    end
    object LECodigoProduto: TLabeledEdit
      Left = 116
      Top = 36
      Width = 61
      Height = 21
      EditLabel.Width = 96
      EditLabel.Height = 21
      EditLabel.Caption = ' C'#243'digo do Produto:'
      LabelPosition = lpLeft
      NumbersOnly = True
      TabOrder = 1
      Text = ''
      OnExit = LECodigoProdutoExit
    end
    object LEDescricao: TLabeledEdit
      Left = 116
      Top = 63
      Width = 269
      Height = 21
      EditLabel.Width = 106
      EditLabel.Height = 21
      EditLabel.Caption = 'Descri'#231#227'o do Produto:'
      Enabled = False
      LabelPosition = lpLeft
      NumbersOnly = True
      TabOrder = 2
      Text = ''
    end
    object LEQtd: TLabeledEdit
      Left = 116
      Top = 90
      Width = 109
      Height = 21
      Alignment = taRightJustify
      EditLabel.Width = 60
      EditLabel.Height = 21
      EditLabel.Caption = 'Quantidade:'
      LabelPosition = lpLeft
      TabOrder = 3
      Text = ''
      OnExit = LEQtdExit
      OnKeyPress = LEQtdKeyPress
    end
    object LEPreco: TLabeledEdit
      Left = 116
      Top = 117
      Width = 109
      Height = 21
      Alignment = taRightJustify
      EditLabel.Width = 79
      EditLabel.Height = 21
      EditLabel.Caption = 'Pre'#231'o de Venda:'
      LabelPosition = lpLeft
      TabOrder = 4
      Text = ''
      OnExit = LEQtdExit
      OnKeyPress = LEQtdKeyPress
    end
    object LEValor: TLabeledEdit
      Left = 116
      Top = 144
      Width = 109
      Height = 21
      Alignment = taRightJustify
      EditLabel.Width = 55
      EditLabel.Height = 21
      EditLabel.Caption = 'Valor Total:'
      Enabled = False
      LabelPosition = lpLeft
      TabOrder = 5
      Text = ''
    end
    object LEIdItemProduto: TLabeledEdit
      Left = 116
      Top = 9
      Width = 61
      Height = 21
      EditLabel.Width = 14
      EditLabel.Height = 21
      EditLabel.Caption = 'Id:'
      Enabled = False
      LabelPosition = lpLeft
      NumbersOnly = True
      TabOrder = 0
      Text = ''
    end
  end
end
