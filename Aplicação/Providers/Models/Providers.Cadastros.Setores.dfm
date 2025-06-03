inherited dtmCadastroSetores: TdtmCadastroSetores
  inherited DSProviderConnection: TDSProviderConnection
    ServerClassName = 'TSMSetores'
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
    object cdsCadastroNome_Setor: TStringField
      FieldName = 'Nome_Setor'
      Origin = 'Nome_Setor'
      Size = 50
    end
    object cdsCadastroSIAGS: TStringField
      FieldName = 'SIAGS'
      Size = 3
    end
    object cdsCadastroCONTROLPC: TStringField
      FieldName = 'CONTROLPC'
      Size = 3
    end
    object cdsCadastroAUTOSC: TStringField
      FieldName = 'AUTOSC'
      Size = 3
    end
    object cdsCadastroAtivo: TStringField
      Alignment = taCenter
      FieldName = 'Ativo'
      Origin = 'Ativo'
      Size = 3
    end
  end
end
