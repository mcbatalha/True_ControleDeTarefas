inherited frmListagemDesignacoes: TfrmListagemDesignacoes
  Caption = 'frmListagemDesignacoes'
  ClientHeight = 329
  ClientWidth = 608
  OnDestroy = FormDestroy
  ExplicitWidth = 626
  ExplicitHeight = 376
  PixelsPerInch = 120
  TextHeight = 16
  inherited pnlForm: TPanel
    Width = 598
    Height = 319
    ExplicitWidth = 598
    ExplicitHeight = 319
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
      Width = 594
      TabOrder = 6
      ExplicitWidth = 594
      inherited btnExportar: TSpeedButton
        OnClick = btnExportarClick
      end
      inherited btnImprimir: TSpeedButton
        OnClick = btnImprimirClick
      end
      inherited pnlSair: TPanel
        Left = 457
        ExplicitLeft = 457
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
      Top = 218
      Width = 588
      Height = 74
      Margins.Bottom = 25
      Align = alBottom
      Color = clWhite
      ParentBackground = False
      ParentColor = False
      TabOrder = 7
      ExplicitLeft = 5
      ExplicitTop = 218
      ExplicitWidth = 588
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
