object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Servidor de Aplica'#231#227'o - Controle de Tarefas'
  ClientHeight = 587
  ClientWidth = 633
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object pnForm: TPanel
    AlignWithMargins = True
    Left = 10
    Top = 10
    Width = 613
    Height = 567
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object pnBotoes: TPanel
      AlignWithMargins = True
      Left = 5
      Top = 68
      Width = 603
      Height = 420
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      DesignSize = (
        603
        420)
      object Bevel1: TBevel
        AlignWithMargins = True
        Left = 5
        Top = 127
        Width = 593
        Height = 288
        Align = alClient
        Shape = bsFrame
        ExplicitTop = 5
        ExplicitHeight = 204
      end
      object Label4: TLabel
        Left = 26
        Top = 143
        Width = 220
        Height = 16
        Caption = 'Quantidade de Conex'#245'es abertas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = -1
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblConexoes: TLabel
        Left = 251
        Top = 143
        Width = 57
        Height = 16
        Caption = 'lblStatus'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 26
        Top = 169
        Width = 162
        Height = 16
        Caption = 'Lista de IP'#180's Conectados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = -1
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Bevel2: TBevel
        AlignWithMargins = True
        Left = 5
        Top = 5
        Width = 593
        Height = 116
        Align = alTop
        Shape = bsFrame
      end
      object lsbIps: TListBox
        Left = 198
        Top = 174
        Width = 255
        Height = 230
        Anchors = [akLeft, akTop, akRight, akBottom]
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Courier New'
        Font.Style = []
        ItemHeight = 20
        ParentFont = False
        TabOrder = 3
      end
      object btnDesenvolvimento: TBitBtn
        Left = 26
        Top = 30
        Width = 169
        Height = 67
        Caption = 'Iniciar Ambiente de Desenvolvimento'
        TabOrder = 0
        WordWrap = True
        OnClick = btnDesenvolvimentoClick
      end
      object btnProducao: TBitBtn
        Left = 221
        Top = 30
        Width = 169
        Height = 67
        Caption = 'Iniciar Ambiente de Produ'#231#227'o'
        TabOrder = 1
        WordWrap = True
        OnClick = btnProducaoClick
      end
      object btnParar: TBitBtn
        Left = 417
        Top = 30
        Width = 161
        Height = 67
        Caption = 'Parar Servidor de Aplica'#231#227'o'
        TabOrder = 2
        WordWrap = True
        OnClick = btnPararClick
      end
    end
    object pnAmbiente: TPanel
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 603
      Height = 57
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Ambiente de Desenvolvimento'
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -23
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object pnStatus: TPanel
      AlignWithMargins = True
      Left = 5
      Top = 494
      Width = 603
      Height = 68
      Align = alBottom
      BevelOuter = bvNone
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      object lblStatus: TLabel
        Left = 224
        Top = 14
        Width = 57
        Height = 16
        Caption = 'lblStatus'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 19
        Top = 14
        Width = 193
        Height = 16
        Caption = 'Status do servidor DataSnap:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = -1
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 19
        Top = 37
        Width = 82
        Height = 16
        Caption = 'Data | Hora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = -1
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDataHora: TLabel
        Left = 113
        Top = 37
        Width = 57
        Height = 16
        Caption = 'lblStatus'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = -1
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 359
        Top = 14
        Width = 108
        Height = 16
        Caption = 'Banco de Dados:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = -1
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblBD: TLabel
        Left = 473
        Top = 14
        Width = 92
        Height = 16
        Caption = 'Desconectado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
end
