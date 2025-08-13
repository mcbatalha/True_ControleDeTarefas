inherited dtmCadastroStatusTrue: TdtmCadastroStatusTrue
  inherited DSProviderConnection: TDSProviderConnection
    ServerClassName = 'TSMStatusTrue'
  end
  inherited cdsPesquisa: TClientDataSet
    ProviderName = 'dspPesquisa'
  end
  inherited cdsCadastro: TClientDataSet
    ProviderName = 'dspCadastro'
    OnNewRecord = cdsCadastroNewRecord
    object cdsCadastroid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCadastroStatus: TStringField
      FieldName = 'Status'
      Origin = 'Status'
      Size = 30
    end
    object cdsCadastroTipo_Prazo: TStringField
      FieldName = 'Tipo_Prazo'
      Origin = 'Tipo_Prazo'
      Size = 10
    end
    object cdsCadastroPrazo: TIntegerField
      FieldName = 'Prazo'
      Origin = 'Prazo'
    end
    object cdsCadastroAutoSC: TStringField
      FieldName = 'AutoSC'
      Origin = 'AutoSC'
      Size = 3
    end
    object cdsCadastroSiags: TStringField
      FieldName = 'Siags'
      Origin = 'Siags'
      Size = 3
    end
    object cdsCadastroControlPC: TStringField
      FieldName = 'ControlPC'
      Origin = 'ControlPC'
      Size = 3
    end
    object cdsCadastroEncerra: TStringField
      FieldName = 'Encerra'
      Origin = 'Encerra'
      Size = 3
    end
    object cdsCadastroAtivo: TStringField
      FieldName = 'Ativo'
      Origin = 'Ativo'
      Size = 3
    end
  end
end
