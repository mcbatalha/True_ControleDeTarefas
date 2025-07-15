inherited dtmCadastroStatusTrue: TdtmCadastroStatusTrue
  inherited SQLConnection: TSQLConnection
    Connected = True
  end
  inherited DSProviderConnection: TDSProviderConnection
    ServerClassName = 'TSMStatusTrue'
    Connected = True
  end
  inherited cdsPesquisa: TClientDataSet
    ProviderName = 'dspPesquisa'
  end
  inherited cdsCadastro: TClientDataSet
    ProviderName = 'dspCadastro'
    OnNewRecord = cdsCadastroNewRecord
    object cdsCadastroid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cdsCadastroStatus: TStringField
      FieldName = 'Status'
      Size = 30
    end
    object cdsCadastroTipo_Prazo: TStringField
      FieldName = 'Tipo_Prazo'
      Size = 10
    end
    object cdsCadastroPrazo: TIntegerField
      FieldName = 'Prazo'
    end
    object cdsCadastroEncerra: TStringField
      FieldName = 'Encerra'
      Size = 3
    end
    object cdsCadastroAtivo: TStringField
      FieldName = 'Ativo'
      Size = 3
    end
  end
end
