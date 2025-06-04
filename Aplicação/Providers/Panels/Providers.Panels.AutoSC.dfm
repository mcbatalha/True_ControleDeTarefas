inherited dtmPainelAutoSC: TdtmPainelAutoSC
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 762
  Width = 1466
  inherited mtbPainel: TFDMemTable
    StoreDefs = True
    object mtbPainelid_Processo: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id_Processo'
      Origin = 'id_Processo'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object mtbPainelNumero_Processo: TLargeintField
      FieldName = 'Numero_Processo'
      Origin = 'Numero_Processo'
    end
    object mtbPainelData_Status: TDateTimeField
      FieldName = 'Data_Status'
      Origin = 'Data_Status'
    end
    object mtbPainelQtd_Arquivos: TIntegerField
      FieldName = 'Qtd_Arquivos'
      Origin = 'Qtd_Arquivos'
    end
    object mtbPaineluf: TStringField
      FieldName = 'uf'
      Origin = 'uf'
      Size = 2
    end
    object mtbPainelTipo_Auditoria: TStringField
      FieldName = 'Tipo_Auditoria'
      Origin = 'Tipo_Auditoria'
      Size = 15
    end
    object mtbPainelTipo_Prazo_Caixa: TStringField
      FieldName = 'Tipo_Prazo_Caixa'
      Origin = 'Tipo_Prazo_Caixa'
      Size = 15
    end
    object mtbPainelTipo_Prazo_Caixa_Hoje: TStringField
      FieldName = 'Tipo_Prazo_Caixa_Hoje'
      Origin = 'Tipo_Prazo_Caixa_Hoje'
      Size = 15
    end
    object mtbPainelTipo_Status: TStringField
      FieldName = 'Tipo_Status'
      Origin = 'Tipo_Status'
      Size = 15
    end
    object mtbPainelTipo_Processo: TStringField
      FieldName = 'Tipo_Processo'
      Origin = 'Tipo_Processo'
      Size = 50
    end
    object mtbPainelTipo_Processo_E: TStringField
      FieldName = 'Tipo_Processo_E'
      Origin = 'Tipo_Processo_E'
    end
    object mtbPainelTipo_Prazo_Ans: TStringField
      FieldName = 'Tipo_Prazo_Ans'
      Origin = 'Tipo_Prazo_Ans'
      Size = 15
    end
    object mtbPainelUsuario_Designado: TStringField
      FieldName = 'Usuario_Designado'
      Origin = 'Usuario_Designado'
      Size = 100
    end
  end
  inherited cdsPainel: TClientDataSet
    object cdsPainelid_Processo: TLargeintField
      FieldName = 'id_Processo'
      ReadOnly = True
    end
    object cdsPainelNumero_Processo: TLargeintField
      FieldName = 'Numero_Processo'
    end
    object cdsPainelData_Status: TDateTimeField
      FieldName = 'Data_Status'
    end
    object cdsPainelQtd_Arquivos: TIntegerField
      FieldName = 'Qtd_Arquivos'
    end
    object cdsPaineluf: TStringField
      FieldName = 'uf'
      Size = 2
    end
    object cdsPainelTipo_Auditoria: TStringField
      FieldName = 'Tipo_Auditoria'
      Size = 15
    end
    object cdsPainelTipo_Prazo_Caixa: TStringField
      FieldName = 'Tipo_Prazo_Caixa'
      Size = 15
    end
    object cdsPainelTipo_Prazo_Caixa_Hoje: TStringField
      FieldName = 'Tipo_Prazo_Caixa_Hoje'
      Size = 15
    end
    object cdsPainelTipo_Status: TStringField
      FieldName = 'Tipo_Status'
      Size = 15
    end
    object cdsPainelTipo_Processo: TStringField
      FieldName = 'Tipo_Processo'
      Size = 50
    end
    object cdsPainelTipo_Processo_E: TStringField
      FieldName = 'Tipo_Processo_E'
    end
    object cdsPainelTipo_Prazo_Ans: TStringField
      FieldName = 'Tipo_Prazo_Ans'
      Size = 15
    end
    object cdsPainelUsuario_Designado: TStringField
      FieldName = 'Usuario_Designado'
      Size = 100
    end
  end
  object mtbTiposAuditoria: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 1008
    Top = 8
    object mtbTiposAuditoriaid: TIntegerField
      FieldName = 'id'
    end
    object mtbTiposAuditoriaTipo_Auditoria: TStringField
      FieldName = 'Tipo_Auditoria'
      Origin = 'Tipo_Auditoria'
      Size = 15
    end
  end
  object mtbTiposPrazoHoje: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 1008
    Top = 149
    object mtbTiposPrazoHojeid: TIntegerField
      FieldName = 'id'
    end
    object mtbTiposPrazoHojeTipo_Prazo_Caixa_Hoje: TStringField
      FieldName = 'Tipo_Prazo_Caixa_Hoje'
      Origin = 'Tipo_Prazo_Caixa_Hoje'
      Size = 15
    end
  end
  object mtbTiposProcesso: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 1008
    Top = 295
    object mtbTiposProcessoid: TFDAutoIncField
      AutoGenerateValue = arNone
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ServerAutoIncrement = False
      AutoIncrementSeed = 1
      AutoIncrementStep = 1
      IdentityInsert = True
    end
    object mtbTiposProcessoTipo_Processo: TStringField
      FieldName = 'Tipo_Processo'
      Origin = 'Tipo_Processo'
      Size = 50
    end
  end
  object mtbTiposProcessoE: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 1008
    Top = 365
    object mtbTiposProcessoEid: TFDAutoIncField
      AutoGenerateValue = arNone
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ServerAutoIncrement = False
      AutoIncrementSeed = 1
      AutoIncrementStep = 1
      IdentityInsert = True
    end
    object mtbTiposProcessoETipo_Processo_E: TStringField
      FieldName = 'Tipo_Processo_E'
      Origin = 'Tipo_Processo_E'
    end
  end
  object mtbTiposStatus: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 1008
    Top = 436
    object mtbTiposStatusid: TFDAutoIncField
      AutoGenerateValue = arNone
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ServerAutoIncrement = False
      AutoIncrementSeed = 1
      AutoIncrementStep = 1
      IdentityInsert = True
    end
    object mtbTiposStatusTipo_Status: TStringField
      FieldName = 'Tipo_Status'
      Origin = 'Tipo_Status'
      Size = 15
    end
  end
  object mtbTiposPrazo: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 1008
    Top = 78
    object mtbTiposPrazoid: TIntegerField
      FieldName = 'id'
    end
    object mtbTiposPrazoTipo_Prazo_Caixa: TStringField
      FieldName = 'Tipo_Prazo_Caixa'
      Origin = 'Tipo_Prazo_Caixa'
      Size = 15
    end
  end
  object mtbSetores: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 1008
    Top = 507
    object mtbSetoresid: TIntegerField
      FieldName = 'id'
    end
    object mtbSetoresNome_Setor: TStringField
      FieldName = 'Nome_Setor'
      Size = 50
    end
  end
  object dtsTiposAuditoria: TDataSource
    DataSet = mtbTiposAuditoria
    Left = 832
    Top = 8
  end
  object dtsTiposPrazo: TDataSource
    DataSet = mtbTiposPrazo
    Left = 832
    Top = 78
  end
  object dtsTiposPrazoHoje: TDataSource
    DataSet = mtbTiposPrazoHoje
    Left = 832
    Top = 149
  end
  object dtsTiposProcesso: TDataSource
    DataSet = mtbTiposProcesso
    Left = 832
    Top = 295
  end
  object dtsTiposProcessoE: TDataSource
    DataSet = mtbTiposProcessoE
    Left = 832
    Top = 365
  end
  object dtsTiposStatus: TDataSource
    DataSet = mtbTiposStatus
    Left = 832
    Top = 436
  end
  object dtsSetores: TDataSource
    DataSet = mtbSetores
    Left = 832
    Top = 507
  end
  object mtbTiposPrazoANS: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 1009
    Top = 219
    object mtbTiposPrazoANSid: TIntegerField
      FieldName = 'id'
    end
    object mtbTiposPrazoANSTipo_Prazo_Caixa: TStringField
      FieldName = 'Tipo_Prazo_Caixa'
      Origin = 'Tipo_Prazo_Caixa'
      Size = 15
    end
  end
  object dtsTiposPrazoANS: TDataSource
    DataSet = mtbTiposPrazoANS
    Left = 833
    Top = 219
  end
end
