inherited dtmPainelAutoSC: TdtmPainelAutoSC
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 762
  Width = 1466
  inherited mtbPainel: TFDMemTable
    StoreDefs = True
    object mtbPainelid_Processo: TLargeintField
      FieldName = 'id_Processo'
    end
    object mtbPainelNumero_Processo: TLargeintField
      FieldName = 'Numero_Processo'
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
      Size = 30
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
    object mtbPainelid_Usuario_Designado: TIntegerField
      FieldName = 'id_Usuario_Designado'
    end
    object mtbPainelUsuario_Designado: TStringField
      FieldName = 'Usuario_Designado'
      Origin = 'Usuario_Designado'
      Size = 100
    end
    object mtbPainelid_Setor_Designado: TIntegerField
      FieldName = 'id_Setor_Designado'
    end
    object mtbPainelSetor_Designado: TStringField
      FieldName = 'Setor_Designado'
      Size = 50
    end
    object mtbPainelQtd_Historicos: TIntegerField
      Alignment = taCenter
      FieldName = 'Qtd_Historicos'
    end
    object mtbPainelQtd_Designacoes: TIntegerField
      Alignment = taCenter
      FieldName = 'Qtd_Designacoes'
      MinValue = 445741836
    end
    object mtbPainelQtd_Observacoes: TIntegerField
      Alignment = taCenter
      FieldName = 'Qtd_Observacoes'
    end
  end
  inherited cdsPainel: TClientDataSet
    object cdsPainelid_Processo: TLargeintField
      FieldName = 'id_Processo'
    end
    object cdsPainelNumero_Processo: TLargeintField
      Alignment = taCenter
      FieldName = 'Numero_Processo'
    end
    object cdsPainelData_Status: TDateTimeField
      Alignment = taCenter
      FieldName = 'Data_Status'
    end
    object cdsPainelQtd_Arquivos: TIntegerField
      Alignment = taCenter
      FieldName = 'Qtd_Arquivos'
    end
    object cdsPaineluf: TStringField
      Alignment = taCenter
      FieldName = 'uf'
      Size = 2
    end
    object cdsPainelTipo_Auditoria: TStringField
      Alignment = taCenter
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
      Size = 30
    end
    object cdsPainelTipo_Processo: TStringField
      FieldName = 'Tipo_Processo'
      OnGetText = cdsPainelTipo_ProcessoGetText
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
      OnGetText = cdsPainelUsuario_DesignadoGetText
      Size = 100
    end
    object cdsPainelSetor_Designado: TStringField
      FieldName = 'Setor_Designado'
      OnGetText = cdsPainelUsuario_DesignadoGetText
      Size = 50
    end
    object cdsPainelid_Usuario_Designado: TIntegerField
      FieldName = 'id_Usuario_Designado'
    end
    object cdsPainelid_Setor_Designado: TIntegerField
      FieldName = 'id_Setor_Designado'
    end
    object cdsPainelQtd_Historicos: TIntegerField
      Alignment = taCenter
      FieldName = 'Qtd_Historicos'
    end
    object cdsPainelQtd_Designacoes: TIntegerField
      Alignment = taCenter
      FieldName = 'Qtd_Designacoes'
    end
    object cdsPainelQtd_Observacoes: TIntegerField
      Alignment = taCenter
      FieldName = 'Qtd_Observacoes'
    end
  end
  object mtbTiposAuditoria: TFDMemTable [6]
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
  object mtbTiposPrazoHoje: TFDMemTable [7]
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
  object mtbTiposProcesso: TFDMemTable [8]
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
  object mtbTiposProcessoE: TFDMemTable [9]
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
  object mtbTiposStatus: TFDMemTable [10]
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
  object mtbTiposPrazo: TFDMemTable [11]
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
  object mtbSetores: TFDMemTable [12]
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
  object dtsTiposAuditoria: TDataSource [13]
    DataSet = mtbTiposAuditoria
    Left = 832
    Top = 8
  end
  object dtsTiposPrazo: TDataSource [14]
    DataSet = mtbTiposPrazo
    Left = 832
    Top = 78
  end
  object dtsTiposPrazoHoje: TDataSource [15]
    DataSet = mtbTiposPrazoHoje
    Left = 832
    Top = 149
  end
  object dtsTiposProcesso: TDataSource [16]
    DataSet = mtbTiposProcesso
    Left = 832
    Top = 295
  end
  object dtsTiposProcessoE: TDataSource [17]
    DataSet = mtbTiposProcessoE
    Left = 832
    Top = 365
  end
  object dtsTiposStatus: TDataSource [18]
    DataSet = mtbTiposStatus
    Left = 832
    Top = 436
  end
  object dtsSetores: TDataSource [19]
    DataSet = mtbSetores
    Left = 832
    Top = 507
  end
  object mtbTiposPrazoANS: TFDMemTable [20]
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
  object dtsTiposPrazoANS: TDataSource [21]
    DataSet = mtbTiposPrazoANS
    Left = 833
    Top = 219
  end
  object dtsPainel: TDataSource [22]
    DataSet = cdsPainel
    Left = 144
    Top = 179
  end
  object mtbUsuarios: TFDMemTable [23]
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 1176
    Top = 16
    object mtbUsuariosid: TIntegerField
      FieldName = 'id'
    end
    object mtbUsuariosNome_Usuario: TStringField
      FieldName = 'Nome_Usuario'
      Size = 100
    end
  end
  object mtbUF: TFDMemTable [24]
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
    Top = 579
    object mtbUFSigla: TStringField
      Alignment = taCenter
      FieldName = 'Sigla'
      Size = 5
    end
  end
  object dtsUF: TDataSource [25]
    DataSet = mtbUF
    Left = 832
    Top = 579
  end
  inherited mtbHistoricoAtualizacoes: TFDMemTable
    object mtbHistoricoAtualizacoesData_Hora_Historico: TDateTimeField
      FieldName = 'Data_Hora_Historico'
    end
    object mtbHistoricoAtualizacoesTipo_Prazo_Caixa: TStringField
      FieldName = 'Tipo_Prazo_Caixa'
      Size = 15
    end
    object mtbHistoricoAtualizacoesTipo_Prazo_Caixa_Hoje: TStringField
      FieldName = 'Tipo_Prazo_Caixa_Hoje'
      Size = 15
    end
    object mtbHistoricoAtualizacoesTipo_Prazo_ANS: TStringField
      FieldName = 'Tipo_Prazo_ANS'
      Size = 15
    end
    object mtbHistoricoAtualizacoesTipo_Status: TStringField
      FieldName = 'Tipo_Status'
      Size = 30
    end
    object mtbHistoricoAtualizacoesNome_Usuario: TStringField
      FieldName = 'Nome_Usuario'
      Size = 100
    end
  end
end
