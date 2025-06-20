inherited frmRelatorioExtrato: TfrmRelatorioExtrato
  Caption = 'Relat'#243'rio Extrato'
  ClientHeight = 211
  ClientWidth = 508
  OnDestroy = FormDestroy
  ExplicitWidth = 526
  ExplicitHeight = 258
  PixelsPerInch = 120
  TextHeight = 16
  inherited pnlForm: TPanel
    Width = 498
    Height = 201
    ExplicitWidth = 498
    ExplicitHeight = 201
    object Label3: TLabel [0]
      Left = 40
      Top = 61
      Width = 30
      Height = 16
      Caption = 'Tipo:'
    end
    object lblTipo: TLabel [1]
      Left = 40
      Top = 138
      Width = 92
      Height = 16
      Caption = 'N'#186' do Processo:'
    end
    inherited pnlBotoes: TPanel
      Width = 494
      ExplicitWidth = 494
      inherited btnImprimir: TSpeedButton
        OnClick = btnImprimirClick
      end
      inherited pnlSair: TPanel
        Left = 357
        ExplicitLeft = 357
      end
    end
    object rdbAutoSc: TRadioButton
      Left = 40
      Top = 87
      Width = 113
      Height = 17
      Caption = 'AUTOSC'
      TabOrder = 1
      OnClick = rdbAutoScClick
    end
    object rdbSiags: TRadioButton
      Left = 177
      Top = 87
      Width = 113
      Height = 17
      Caption = 'SIAGS'
      TabOrder = 2
      OnClick = rdbSiagsClick
    end
    object rdbControlPc: TRadioButton
      Left = 315
      Top = 87
      Width = 113
      Height = 17
      Caption = 'CONTROLPC'
      TabOrder = 3
      OnClick = rdbControlPcClick
    end
    object edtNumero: TEdit
      Left = 140
      Top = 135
      Width = 230
      Height = 24
      TabOrder = 4
      Text = 'edtNumero'
    end
  end
end
