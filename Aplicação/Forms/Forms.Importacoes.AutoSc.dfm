inherited frmImportacoesAutoSc: TfrmImportacoesAutoSc
  Caption = 'Importa'#231#227'o de Planilhas - AUTOSC'
  OnDestroy = FormDestroy
  PixelsPerInch = 120
  TextHeight = 16
  inherited pnlForm: TPanel
    inherited btnAnalisarDados: TBitBtn
      OnClick = btnAnalisarDadosClick
    end
    inherited btnEfetivarImportacao: TBitBtn
      Left = 217
      Top = 299
      OnClick = btnEfetivarImportacaoClick
      ExplicitLeft = 217
      ExplicitTop = 299
    end
  end
end
