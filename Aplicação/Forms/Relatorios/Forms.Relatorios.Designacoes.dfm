inherited frmRelatorioDesignacoes: TfrmRelatorioDesignacoes
  Caption = 'Relat'#243'rio de Designa'#231#245'es'
  ClientHeight = 333
  ClientWidth = 607
  OnDestroy = FormDestroy
  ExplicitWidth = 625
  ExplicitHeight = 380
  PixelsPerInch = 120
  TextHeight = 16
  inherited pnlForm: TPanel
    Width = 597
    Height = 323
    ExplicitWidth = 597
    ExplicitHeight = 323
    object Label1: TLabel [0]
      Left = 40
      Top = 186
      Width = 172
      Height = 16
      Caption = 'Designa'#231#245'es realizadas entre:'
    end
    object Label2: TLabel [1]
      Left = 319
      Top = 186
      Width = 7
      Height = 16
      Caption = 'e'
    end
    object Label3: TLabel [2]
      Left = 40
      Top = 61
      Width = 30
      Height = 16
      Caption = 'Tipo:'
    end
    object lblTipo: TLabel [3]
      Left = 40
      Top = 138
      Width = 92
      Height = 16
      Caption = 'N'#186' do Processo:'
    end
    inherited pnlBotoes: TPanel
      Width = 593
      TabOrder = 6
      ExplicitWidth = 593
      inherited btnExportar: TSpeedButton
        OnClick = btnExportarClick
      end
      inherited btnImprimir: TSpeedButton
        OnClick = btnImprimirClick
      end
      inherited pnlSair: TPanel
        Left = 456
        ExplicitLeft = 456
      end
    end
    object edtDataInicial: TMaskEdit
      Left = 218
      Top = 182
      Width = 95
      Height = 24
      EditMask = '99/99/9999'
      MaxLength = 10
      TabOrder = 4
      Text = '  /  /    '
      OnExit = edtDataInicialExit
    end
    object edtDataFinal: TMaskEdit
      Left = 332
      Top = 182
      Width = 95
      Height = 24
      EditMask = '99/99/9999'
      MaxLength = 10
      TabOrder = 5
      Text = '  /  /    '
      OnExit = edtDataInicialExit
    end
    object rdbAutoSc: TRadioButton
      Left = 40
      Top = 87
      Width = 113
      Height = 17
      Caption = 'AUTOSC'
      TabOrder = 0
      OnClick = rdbAutoScClick
    end
    object rdbSiags: TRadioButton
      Left = 177
      Top = 87
      Width = 113
      Height = 17
      Caption = 'SIAGS'
      TabOrder = 1
      OnClick = rdbSiagsClick
    end
    object rdbControlPc: TRadioButton
      Left = 315
      Top = 87
      Width = 113
      Height = 17
      Caption = 'CONTROLPC'
      TabOrder = 2
      OnClick = rdbControlPcClick
    end
    object edtNumero: TEdit
      Left = 140
      Top = 135
      Width = 230
      Height = 24
      TabOrder = 3
      Text = 'edtNumero'
    end
    inline fraPesquisaUsuario: TfraPesquisaUsuario
      AlignWithMargins = True
      Left = 5
      Top = 222
      Width = 587
      Height = 74
      Margins.Bottom = 25
      Align = alBottom
      Color = clWhite
      ParentBackground = False
      ParentColor = False
      TabOrder = 7
      ExplicitLeft = 5
      ExplicitTop = 222
      ExplicitWidth = 587
      inherited Label9: TLabel
        Left = 35
        Width = 87
        Caption = 'Designado por:'
        ExplicitLeft = 35
        ExplicitWidth = 87
      end
      inherited btnPesquisarUsuario: TSpeedButton
        Left = 541
        ExplicitLeft = 541
      end
      inherited cmbUsuarios: TDBLookupComboBox
        Left = 35
        ExplicitLeft = 35
      end
    end
  end
end
