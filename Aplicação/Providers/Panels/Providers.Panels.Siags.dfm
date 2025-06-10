inherited dtmPainelSiags: TdtmPainelSiags
  Height = 791
  Width = 1472
  inherited mtbPainel: TFDMemTable
    StoreDefs = True
    object mtbPainelid_Processo: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id_Processo'
      Origin = 'id_Processo'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object mtbPaineluf: TStringField
      FieldName = 'uf'
      Origin = 'uf'
      Size = 2
    end
    object mtbPainelNumero_Autorizacao: TLargeintField
      FieldName = 'Numero_Autorizacao'
      Origin = 'Numero_Autorizacao'
    end
    object mtbPainelAnexo_Opme: TStringField
      FieldName = 'Anexo_Opme'
      Origin = 'Anexo_Opme'
      Size = 3
    end
    object mtbPainelAnexo_Quimio: TStringField
      FieldName = 'Anexo_Quimio'
      Origin = 'Anexo_Quimio'
      Size = 3
    end
    object mtbPainelAnexo_Radio: TStringField
      FieldName = 'Anexo_Radio'
      Origin = 'Anexo_Radio'
      Size = 3
    end
    object mtbPainelDia_Inclusao: TIntegerField
      FieldName = 'Dia_Inclusao'
      Origin = 'Dia_Inclusao'
    end
    object mtbPainelDias_Corridos_Base: TIntegerField
      FieldName = 'Dias_Corridos_Base'
      Origin = 'Dias_Corridos_Base'
    end
    object mtbPainelDias_Uteis_Base: TIntegerField
      FieldName = 'Dias_Uteis_Base'
      Origin = 'Dias_Uteis_Base'
    end
    object mtbPainelDias_Prazo_Caixa: TIntegerField
      FieldName = 'Dias_Prazo_Caixa'
      Origin = 'Dias_Prazo_Caixa'
    end
    object mtbPainelData_Prazo_Caixa: TDateTimeField
      FieldName = 'Data_Prazo_Caixa'
      Origin = 'Data_Prazo_Caixa'
    end
    object mtbPainelDias_Prazo_ANS: TIntegerField
      FieldName = 'Dias_Prazo_ANS'
      Origin = 'Dias_Prazo_ANS'
    end
    object mtbPainelData_Prazo_ANS: TDateTimeField
      FieldName = 'Data_Prazo_ANS'
      Origin = 'Data_Prazo_ANS'
    end
    object mtbPainelTipo_Autorizacao: TStringField
      FieldName = 'Tipo_Autorizacao'
      Origin = 'Tipo_Autorizacao'
      Size = 50
    end
    object mtbPainelTipo_Atendimento: TStringField
      FieldName = 'Tipo_Atendimento'
      Origin = 'Tipo_Atendimento'
      Size = 30
    end
    object mtbPainelNumero_Beneficiario: TStringField
      FieldName = 'Numero_Beneficiario'
      Origin = 'Numero_Beneficiario'
      Size = 15
    end
    object mtbPainelNome_Beneficiario: TStringField
      FieldName = 'Nome_Beneficiario'
      Origin = 'Nome_Beneficiario'
      Size = 100
    end
    object mtbPainelTipo_Situacao_Autorizacao: TStringField
      FieldName = 'Tipo_Situacao_Autorizacao'
      Origin = 'Tipo_Situacao_Autorizacao'
      Size = 30
    end
    object mtbPainelTipo_Ultima_Anotacao: TStringField
      FieldName = 'Tipo_Ultima_Anotacao'
      Origin = 'Tipo_Ultima_Anotacao'
      Size = 30
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
    object mtbPainelTipo_Prazo_Ans: TStringField
      FieldName = 'Tipo_Prazo_Ans'
      Origin = 'Tipo_Prazo_Ans'
      Size = 15
    end
    object mtbPainelid_Setor_Designado: TIntegerField
      FieldName = 'id_Setor_Designado'
    end
    object mtbPainelSetor_Designado: TStringField
      FieldName = 'Setor_Designado'
      Size = 50
    end
    object mtbPainelid_Usuario_Designado: TIntegerField
      FieldName = 'id_Usuario_Designado'
    end
    object mtbPainelUsuario_Designado: TStringField
      FieldName = 'Usuario_Designado'
      Origin = 'Usuario_Designado'
      Size = 100
    end
    object mtbPainelQtd_Historicos: TIntegerField
      FieldName = 'Qtd_Historicos'
      Origin = 'Qtd_Historicos'
      ReadOnly = True
      Required = True
    end
    object mtbPainelQtd_Designacoes: TIntegerField
      FieldName = 'Qtd_Designacoes'
      Origin = 'Qtd_Designacoes'
      ReadOnly = True
      Required = True
    end
    object mtbPainelQtd_Observacoes: TIntegerField
      FieldName = 'Qtd_Observacoes'
      Origin = 'Qtd_Observacoes'
      ReadOnly = True
      Required = True
    end
  end
  inherited cdsPainel: TClientDataSet
    object cdsPainelid_Processo: TLargeintField
      FieldName = 'id_Processo'
      ReadOnly = True
    end
    object cdsPaineluf: TStringField
      Alignment = taCenter
      FieldName = 'uf'
      Size = 2
    end
    object cdsPainelNumero_Autorizacao: TLargeintField
      Alignment = taCenter
      FieldName = 'Numero_Autorizacao'
    end
    object cdsPainelAnexo_Opme: TStringField
      Alignment = taCenter
      FieldName = 'Anexo_Opme'
      Size = 3
    end
    object cdsPainelAnexo_Quimio: TStringField
      Alignment = taCenter
      FieldName = 'Anexo_Quimio'
      Size = 3
    end
    object cdsPainelAnexo_Radio: TStringField
      Alignment = taCenter
      FieldName = 'Anexo_Radio'
      Size = 3
    end
    object cdsPainelDia_Inclusao: TIntegerField
      Alignment = taCenter
      FieldName = 'Dia_Inclusao'
    end
    object cdsPainelDias_Corridos_Base: TIntegerField
      Alignment = taCenter
      FieldName = 'Dias_Corridos_Base'
    end
    object cdsPainelDias_Uteis_Base: TIntegerField
      Alignment = taCenter
      FieldName = 'Dias_Uteis_Base'
    end
    object cdsPainelDias_Prazo_Caixa: TIntegerField
      Alignment = taCenter
      FieldName = 'Dias_Prazo_Caixa'
    end
    object cdsPainelData_Prazo_Caixa: TDateTimeField
      Alignment = taCenter
      FieldName = 'Data_Prazo_Caixa'
    end
    object cdsPainelDias_Prazo_ANS: TIntegerField
      Alignment = taCenter
      FieldName = 'Dias_Prazo_ANS'
    end
    object cdsPainelData_Prazo_ANS: TDateTimeField
      Alignment = taCenter
      FieldName = 'Data_Prazo_ANS'
    end
    object cdsPainelTipo_Autorizacao: TStringField
      FieldName = 'Tipo_Autorizacao'
      Size = 50
    end
    object cdsPainelTipo_Atendimento: TStringField
      FieldName = 'Tipo_Atendimento'
      Size = 30
    end
    object cdsPainelNumero_Beneficiario: TStringField
      FieldName = 'Numero_Beneficiario'
      Size = 15
    end
    object cdsPainelNome_Beneficiario: TStringField
      Alignment = taCenter
      FieldName = 'Nome_Beneficiario'
      Size = 100
    end
    object cdsPainelTipo_Situacao_Autorizacao: TStringField
      FieldName = 'Tipo_Situacao_Autorizacao'
      Size = 30
    end
    object cdsPainelTipo_Ultima_Anotacao: TStringField
      FieldName = 'Tipo_Ultima_Anotacao'
      Size = 30
    end
    object cdsPainelTipo_Auditoria: TStringField
      FieldName = 'Tipo_Auditoria'
      Size = 15
    end
    object cdsPainelTipo_Prazo_Caixa: TStringField
      FieldName = 'Tipo_Prazo_Caixa'
      Size = 15
    end
    object cdsPainelTipo_Prazo_Ans: TStringField
      FieldName = 'Tipo_Prazo_Ans'
      Size = 15
    end
    object cdsPainelid_Usuario_Designado: TIntegerField
      FieldName = 'id_Usuario_Designado'
    end
    object cdsPainelUsuario_Designado: TStringField
      FieldName = 'Usuario_Designado'
      Size = 100
    end
    object cdsPainelid_Setor_Designado: TIntegerField
      FieldName = 'id_Setor_Designado'
    end
    object cdsPainelSetor_Designado: TStringField
      FieldName = 'Setor_Designado'
      Size = 50
    end
    object cdsPainelQtd_Historicos: TIntegerField
      Alignment = taCenter
      FieldName = 'Qtd_Historicos'
      ReadOnly = True
      Required = True
    end
    object cdsPainelQtd_Designacoes: TIntegerField
      Alignment = taCenter
      FieldName = 'Qtd_Designacoes'
      ReadOnly = True
      Required = True
    end
    object cdsPainelQtd_Observacoes: TIntegerField
      Alignment = taCenter
      FieldName = 'Qtd_Observacoes'
      ReadOnly = True
      Required = True
    end
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
  object mtbHistoricoAtualizacoes: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 64
    Top = 480
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
      Size = 15
    end
    object mtbHistoricoAtualizacoesNome_Usuario: TStringField
      FieldName = 'Nome_Usuario'
      Size = 100
    end
  end
  object dtsHistoricoAtualizacoes: TDataSource
    DataSet = mtbHistoricoAtualizacoes
    Left = 256
    Top = 480
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
    Top = 552
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
    Top = 552
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
    Left = 1037
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
    Left = 1037
    Top = 79
    object mtbTiposPrazoid: TIntegerField
      FieldName = 'id'
    end
    object mtbTiposPrazoTipo_Prazo_Caixa: TStringField
      FieldName = 'Tipo_Prazo_Caixa'
      Origin = 'Tipo_Prazo_Caixa'
      Size = 15
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
    Top = 79
  end
  object mtbUsuarios: TFDMemTable
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
    Left = 1037
    Top = 507
    object mtbSetoresid: TIntegerField
      FieldName = 'id'
    end
    object mtbSetoresNome_Setor: TStringField
      FieldName = 'Nome_Setor'
      Size = 50
    end
  end
  object dtsSetores: TDataSource
    DataSet = mtbSetores
    Left = 832
    Top = 507
  end
  object mtbUF: TFDMemTable
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
    Left = 1037
    Top = 579
    object mtbUFSigla: TStringField
      Alignment = taCenter
      FieldName = 'Sigla'
      Size = 5
    end
  end
  object dtsUF: TDataSource
    DataSet = mtbUF
    Left = 832
    Top = 579
  end
  object mtbTiposAutorizacao: TFDMemTable
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
    Left = 1037
    Top = 222
    object mtbTiposAutorizacaoid: TIntegerField
      FieldName = 'id'
    end
    object mtbTiposAutorizacaoTipo_Autorizacao: TStringField
      FieldName = 'Tipo_Autorizacao'
      Origin = 'Tipo_Autorizacao'
      Size = 50
    end
  end
  object dtsTiposAutorizacao: TDataSource
    DataSet = mtbTiposAutorizacao
    Left = 832
    Top = 222
  end
  object mtbTiposAtendimento: TFDMemTable
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
    Left = 1037
    Top = 293
    object mtbTiposAtendimentoid: TIntegerField
      FieldName = 'id'
    end
    object mtbTiposAtendimentoTipo_Atendimento: TStringField
      FieldName = 'Tipo_Atendimento'
      Origin = 'Tipo_Atendimento'
      Size = 30
    end
  end
  object dtsTiposAtendimento: TDataSource
    DataSet = mtbTiposAtendimento
    Left = 832
    Top = 293
  end
  object mtbTiposSituacaoAutorizacao: TFDMemTable
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
    Left = 1037
    Top = 364
    object mtbTiposSituacaoAutorizacaoid: TIntegerField
      FieldName = 'id'
    end
    object mtbTiposSituacaoAutorizacaoTipo_Situacao_Autorizacao: TStringField
      FieldName = 'Tipo_Situacao_Autorizacao'
      Origin = 'Tipo_Situacao_Autorizacao'
      Size = 30
    end
  end
  object dtsTiposSituacaoAutorizacao: TDataSource
    DataSet = mtbTiposSituacaoAutorizacao
    Left = 832
    Top = 364
  end
  object mtbTiposUltimaAnotacao: TFDMemTable
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
    Left = 1037
    Top = 436
    object mtbTiposUltimaAnotacaoid: TIntegerField
      FieldName = 'id'
    end
    object mtbTiposUltimaAnotacaoTipo_Ultima_Anotacao: TStringField
      FieldName = 'Tipo_Ultima_Anotacao'
      Origin = 'Tipo_Ultima_Anotacao'
      Size = 30
    end
  end
  object dtsTiposUltimaAnotacao: TDataSource
    DataSet = mtbTiposUltimaAnotacao
    Left = 832
    Top = 436
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
    Left = 1037
    Top = 150
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
    Left = 832
    Top = 150
  end
  object dtsPainel: TDataSource
    DataSet = cdsPainel
    Left = 144
    Top = 179
  end
end
