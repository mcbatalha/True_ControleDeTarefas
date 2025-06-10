object frmSelecaoBancoDados: TfrmSelecaoBancoDados
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Selecao do Banco de Dados'
  ClientHeight = 242
  ClientWidth = 545
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Roboto'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 14
  object pnlForm: TPanel
    Left = 19
    Top = 9
    Width = 507
    Height = 224
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object btnAmbienteDesenvolvimento: TSpeedButton
      Left = 37
      Top = 74
      Width = 206
      Height = 50
      Caption = 'Ambiente de Desenvolvimento'
      OnClick = btnAmbienteDesenvolvimentoClick
    end
    object btnAmbienteProducao: TSpeedButton
      Left = 263
      Top = 74
      Width = 206
      Height = 50
      Caption = 'Ambiente de Produ'#231#227'o'
      OnClick = btnAmbienteProducaoClick
    end
    object btnFinalizar: TSpeedButton
      Left = 151
      Top = 137
      Width = 206
      Height = 50
      Caption = 'Finalizar'
      OnClick = btnFinalizarClick
    end
    object StaticText1: TStaticText
      Left = 102
      Top = 16
      Width = 280
      Height = 28
      Caption = 'Sele'#231#227'o de Banco de Dados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
end
