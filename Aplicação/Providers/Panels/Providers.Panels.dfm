inherited dtmPainel: TdtmPainel
  OldCreateOrder = True
  Height = 780
  Width = 585
  inherited DSProviderConnection: TDSProviderConnection
    ServerClassName = 'TMAutoSC'
  end
  object mtbPainel: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 64
    Top = 176
  end
  object cdsPainel: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPainel'
    Left = 64
    Top = 328
  end
  object dspPainel: TDataSetProvider
    DataSet = mtbPainel
    Left = 64
    Top = 256
  end
  object mtbHistoricoDesignacoes: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 64
    Top = 400
    object mtbHistoricoDesignacoesJustificativa: TStringField
      FieldName = 'Justificativa'
      Size = 100
    end
    object mtbHistoricoDesignacoesData_Hora_Log: TDateTimeField
      Alignment = taCenter
      FieldName = 'Data_Hora_Log'
    end
    object mtbHistoricoDesignacoesNome_Setor: TStringField
      FieldName = 'Nome_Setor'
      Size = 50
    end
    object mtbHistoricoDesignacoesUsuario_Designado: TStringField
      FieldName = 'Usuario_Designado'
      Size = 100
    end
    object mtbHistoricoDesignacoesUsuario_Responsavel: TStringField
      FieldName = 'Usuario_Responsavel'
      Size = 100
    end
  end
  object dtsHistoricoDesignacoes: TDataSource
    DataSet = mtbHistoricoDesignacoes
    Left = 256
    Top = 400
  end
  object mtbObservacoesProcesso: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 64
    Top = 472
    object mtbObservacoesProcessoData_Hora: TDateTimeField
      FieldName = 'Data_Hora'
    end
    object mtbObservacoesProcessoObservacao: TStringField
      FieldName = 'Observacao'
      Size = 500
    end
    object mtbObservacoesProcessoNome_Usuario: TStringField
      FieldName = 'Nome_Usuario'
      Size = 100
    end
  end
  object dtsObservacoesProcesso: TDataSource
    DataSet = mtbObservacoesProcesso
    Left = 256
    Top = 472
  end
  object mtbHistoricoAtualizacoes: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 57
    Top = 536
  end
  object dtsHistoricoAtualizacoes: TDataSource
    DataSet = mtbHistoricoAtualizacoes
    Left = 257
    Top = 536
  end
end
