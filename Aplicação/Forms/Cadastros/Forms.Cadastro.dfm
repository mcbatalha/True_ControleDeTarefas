object frmCadastro: TfrmCadastro
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'FrmCadastro'
  ClientHeight = 521
  ClientWidth = 830
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object pnlForm: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 824
    Height = 515
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    inline fraBotoes: TfraBotoes
      Tag = 1
      Left = 2
      Top = 2
      Width = 820
      Height = 56
      Align = alTop
      TabOrder = 0
      ExplicitLeft = 2
      ExplicitTop = 2
      ExplicitWidth = 820
      inherited btnNovo: TSpeedButton
        OnClick = fraBotoesbtnNovoClick
      end
      inherited btnAlterar: TSpeedButton
        OnClick = fraBotoesbtnAlterarClick
      end
      inherited btnSair: TSpeedButton
        OnClick = fraBotoes1btnSairClick
      end
    end
    object pnlBotoes: TPanel
      Left = 2
      Top = 456
      Width = 820
      Height = 57
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object Panel1: TPanel
        Left = 496
        Top = 0
        Width = 324
        Height = 57
        Align = alRight
        Alignment = taLeftJustify
        BevelOuter = bvNone
        TabOrder = 1
        object btnCancelar: TBitBtn
          Left = 192
          Top = 12
          Width = 105
          Height = 33
          Caption = 'Cancelar'
          TabOrder = 0
          OnClick = btnCancelarClick
        end
        object btnGravar: TBitBtn
          Left = 65
          Top = 12
          Width = 114
          Height = 33
          Caption = 'Gravar'
          TabOrder = 1
          OnClick = btnGravarClick
        end
      end
      object pnlOpcao: TPanel
        Left = 16
        Top = 6
        Width = 185
        Height = 41
        BevelOuter = bvNone
        Caption = 'Incluindo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -20
        Font.Name = 'Roboto'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
    end
    object pnlCentral: TPanel
      Left = 2
      Top = 58
      Width = 820
      Height = 398
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
    end
  end
  object dtsCadastro: TDataSource
    Left = 88
    Top = 120
  end
end
