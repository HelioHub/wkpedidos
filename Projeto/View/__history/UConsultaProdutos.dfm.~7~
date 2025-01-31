object FConsultaProdutos: TFConsultaProdutos
  Left = 0
  Top = 0
  ActiveControl = LEFiltroDescricaoItem
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta Produtos'
  ClientHeight = 292
  ClientWidth = 456
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
    Top = 251
    Width = 456
    Height = 41
    Align = alBottom
    TabOrder = 2
    ExplicitLeft = 1
    ExplicitTop = 256
    DesignSize = (
      456
      41)
    object BBSair: TBitBtn
      Left = 370
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
      ExplicitLeft = 513
    end
    object BBSelecionar: TBitBtn
      Left = 278
      Top = 6
      Width = 86
      Height = 25
      Anchors = [akRight]
      Caption = '&Selecionar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Kind = bkOK
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = 310
    end
  end
  object PDados: TPanel
    Left = 0
    Top = 41
    Width = 456
    Height = 210
    Align = alClient
    TabOrder = 1
    ExplicitTop = 0
    ExplicitWidth = 599
    ExplicitHeight = 270
    object DBGView: TDBGrid
      Left = 1
      Top = 1
      Width = 454
      Height = 208
      Hint = 'Duplo Click para Selecionar o Produto...'
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
          Expanded = False
          Title.Caption = 'C'#243'digo '
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'Descri'#231#227'o do Produto'
          Width = 258
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          Title.Alignment = taRightJustify
          Title.Caption = 'Pre'#231'o de Venda'
          Width = 109
          Visible = True
        end>
    end
  end
  object PHead: TPanel
    Left = 0
    Top = 0
    Width = 456
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitTop = 247
    ExplicitWidth = 488
    DesignSize = (
      456
      41)
    object LEFiltroDescricaoItem: TLabeledEdit
      Left = 148
      Top = 10
      Width = 213
      Height = 21
      EditLabel.Width = 137
      EditLabel.Height = 21
      EditLabel.Caption = 'Filtrar Descri'#231#227'o do Produto:'
      LabelPosition = lpLeft
      TabOrder = 0
      Text = ''
    end
    object BBFiltrar: TBitBtn
      Left = 370
      Top = 3
      Width = 75
      Height = 34
      Anchors = [akTop, akRight]
      Caption = 'Filtra&r'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
end
