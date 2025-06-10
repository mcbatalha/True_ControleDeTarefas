inherited dtmCadastroUsusarios: TdtmCadastroUsusarios
  Height = 409
  inherited DSProviderConnection: TDSProviderConnection
    ServerClassName = 'TSMUsuarios'
  end
  inherited cdsPesquisa: TClientDataSet
    ProviderName = 'dspPesquisa'
    Left = 184
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
    object cdsCadastroNome_Usuario: TStringField
      FieldName = 'Nome_Usuario'
      Size = 100
    end
    object cdsCadastroLogin: TStringField
      FieldName = 'Login'
      Origin = 'Login'
    end
    object cdsCadastroSenha: TStringField
      FieldName = 'Senha'
      Origin = 'Senha'
      Size = 50
    end
    object cdsCadastroE_Mail: TStringField
      FieldName = 'E_Mail'
      Origin = 'E_Mail'
      Size = 100
    end
    object cdsCadastroTrocar_Senha: TStringField
      FieldName = 'Trocar_Senha'
      Origin = 'Trocar_Senha'
      Size = 3
    end
    object cdsCadastroPerfil: TStringField
      FieldName = 'Perfil'
    end
    object cdsCadastroAtivo: TStringField
      FieldName = 'Ativo'
      Origin = 'Ativo'
      Size = 3
    end
    object cdsCadastroqryUsuariosSetores: TDataSetField
      FieldName = 'qryUsuariosSetores'
    end
  end
  object cdsUsuarioSetores: TClientDataSet
    Aggregates = <>
    DataSetField = cdsCadastroqryUsuariosSetores
    IndexFieldNames = 'Nome_Setor'
    Params = <>
    Left = 56
    Top = 264
    object cdsUsuarioSetoresid_Usuario: TIntegerField
      FieldName = 'id_Usuario'
      Required = True
    end
    object cdsUsuarioSetoresid_Setor: TIntegerField
      FieldName = 'id_Setor'
      Required = True
    end
    object cdsUsuarioSetoresNome_Setor: TStringField
      FieldName = 'Nome_Setor'
      ProviderFlags = []
      Size = 50
    end
  end
  object cdsSetores: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Nome_Setor'
    Params = <>
    ProviderName = 'dspSetores'
    RemoteServer = DSProviderConnection
    Left = 320
    Top = 24
    object cdsSetoresid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cdsSetoresNome_Setor: TStringField
      FieldName = 'Nome_Setor'
      Size = 50
    end
  end
end
