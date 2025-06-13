inherited dtmPainelControlPc: TdtmPainelControlPc
  Height = 761
  Width = 1326
  inherited mtbPainel: TFDMemTable
    StoreDefs = True
    object mtbPainelProtocolo: TStringField
      Alignment = taCenter
      FieldName = 'Protocolo'
      Size = 50
    end
    object mtbPainelid_Protocolo: TLargeintField
      FieldName = 'id_Protocolo'
    end
    object mtbPainelData_Abertura: TDateTimeField
      FieldName = 'Data_Abertura'
      Origin = 'Data_Abertura'
    end
    object mtbPainelData_Transferencia: TDateTimeField
      FieldName = 'Data_Transferencia'
      Origin = 'Data_Transferencia'
    end
    object mtbPainelData_Fechamento: TDateTimeField
      FieldName = 'Data_Fechamento'
      Origin = 'Data_Fechamento'
    end
    object mtbPainelPrevisao_Solucao: TDateTimeField
      FieldName = 'Previsao_Solucao'
      Origin = 'Previsao_Solucao'
    end
    object mtbPainelSolicitacao_Cliente: TStringField
      FieldName = 'Solicitacao_Cliente'
      Origin = 'Solicitacao_Cliente'
      Size = 500
    end
    object mtbPainelTipo_Reclame: TStringField
      FieldName = 'Tipo_Reclame'
      Origin = 'Tipo_Reclame'
      Size = 3
    end
    object mtbPainelTipo_Nip: TStringField
      FieldName = 'Tipo_Nip'
      Origin = 'Tipo_Nip'
      Size = 3
    end
    object mtbPainelTipo_Status: TStringField
      Alignment = taCenter
      FieldName = 'Tipo_Status'
      Origin = 'Tipo_Status'
      Size = 30
    end
    object mtbPainelTipo_Prazo_Caixa: TStringField
      FieldName = 'Tipo_Prazo_Caixa'
      Origin = 'Tipo_Prazo_Caixa'
      Size = 30
    end
    object mtbPainelTipo_Classificacao: TStringField
      FieldName = 'Tipo_Classificacao'
      Size = 350
    end
    object mtbPainelNome_Tecnico: TStringField
      FieldName = 'Nome_Tecnico'
      Origin = 'Nome_Tecnico'
      Size = 50
    end
    object mtbPainelTipo_Cliente: TStringField
      FieldName = 'Tipo_Cliente'
      Origin = 'Tipo_Cliente'
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
    object mtbPainelid_Setor_Designado: TIntegerField
      FieldName = 'id_Setor_Designado'
    end
    object mtbPainelSetor_Designado: TStringField
      FieldName = 'Setor_Designado'
      Origin = 'Setor_Designado'
      Size = 50
    end
    object mtbPainelQtd_Historicos: TIntegerField
      FieldName = 'Qtd_Historicos'
    end
    object mtbPainelQtd_Designacoes: TIntegerField
      FieldName = 'Qtd_Designacoes'
    end
    object mtbPainelQtd_Observacoes: TIntegerField
      FieldName = 'Qtd_Observacoes'
    end
  end
  inherited cdsPainel: TClientDataSet
    object cdsPainelProtocolo: TStringField
      Alignment = taCenter
      FieldName = 'Protocolo'
      Size = 50
    end
    object cdsPainelid_Protocolo: TLargeintField
      FieldName = 'id_Protocolo'
    end
    object cdsPainelid_Usuario_Designado: TIntegerField
      FieldName = 'id_Usuario_Designado'
      OnGetText = cdsPainelUsuario_DesignadoGetText
    end
    object cdsPainelid_Setor_Designado: TIntegerField
      FieldName = 'id_Setor_Designado'
      OnGetText = cdsPainelUsuario_DesignadoGetText
    end
    object cdsPainelData_Abertura: TDateTimeField
      Alignment = taCenter
      FieldName = 'Data_Abertura'
    end
    object cdsPainelData_Transferencia: TDateTimeField
      Alignment = taCenter
      FieldName = 'Data_Transferencia'
    end
    object cdsPainelData_Fechamento: TDateTimeField
      Alignment = taCenter
      FieldName = 'Data_Fechamento'
    end
    object cdsPainelPrevisao_Solucao: TDateTimeField
      Alignment = taCenter
      FieldName = 'Previsao_Solucao'
    end
    object cdsPainelSolicitacao_Cliente: TStringField
      FieldName = 'Solicitacao_Cliente'
      Size = 500
    end
    object cdsPainelTipo_Reclame: TStringField
      Alignment = taCenter
      FieldName = 'Tipo_Reclame'
      Size = 3
    end
    object cdsPainelTipo_Nip: TStringField
      Alignment = taCenter
      FieldName = 'Tipo_Nip'
      Size = 3
    end
    object cdsPainelTipo_Status: TStringField
      FieldName = 'Tipo_Status'
      Size = 30
    end
    object cdsPainelTipo_Prazo_Caixa: TStringField
      FieldName = 'Tipo_Prazo_Caixa'
      Size = 30
    end
    object cdsPainelNome_Tecnico: TStringField
      FieldName = 'Nome_Tecnico'
      Size = 50
    end
    object cdsPainelTipo_Cliente: TStringField
      FieldName = 'Tipo_Cliente'
      Size = 50
    end
    object cdsPainelTipo_Classificacao: TStringField
      FieldName = 'Tipo_Classificacao'
      Size = 350
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
  inherited mtbHistoricoAtualizacoes: TFDMemTable
    object mtbHistoricoAtualizacoesData_Hora_Historico: TDateTimeField
      FieldName = 'Data_Hora_Historico'
    end
    object mtbHistoricoAtualizacoesTipo_Status: TStringField
      FieldName = 'Tipo_Status'
      Size = 30
    end
    object mtbHistoricoAtualizacoesTipo_Prazo_Caixa: TStringField
      FieldName = 'Tipo_Prazo_Caixa'
      Size = 30
    end
    object mtbHistoricoAtualizacoesNome_Tecnico: TStringField
      FieldName = 'Nome_Tecnico'
      Size = 50
    end
    object mtbHistoricoAtualizacoesTipo_Cliente: TStringField
      FieldName = 'Tipo_Cliente'
      Size = 50
    end
    object mtbHistoricoAtualizacoesTipo_Classificacao: TStringField
      FieldName = 'Tipo_Classificacao'
      Size = 350
    end
    object mtbHistoricoAtualizacoesNome_Usuario: TStringField
      FieldName = 'Nome_Usuario'
      Size = 100
    end
    object mtbHistoricoAtualizacoesTipo_Reclame: TStringField
      FieldName = 'Tipo_Reclame'
      Size = 3
    end
    object mtbHistoricoAtualizacoesTipo_Nip: TStringField
      FieldName = 'Tipo_Nip'
      Size = 3
    end
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
  object dtsTiposStatus: TDataSource
    DataSet = mtbTiposStatus
    Left = 832
    Top = 421
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
    Left = 993
    Top = 421
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
  object dtsSetores: TDataSource
    DataSet = mtbSetores
    Left = 832
    Top = 507
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
    Left = 993
    Top = 507
    object mtbSetoresid: TIntegerField
      FieldName = 'id'
    end
    object mtbSetoresNome_Setor: TStringField
      FieldName = 'Nome_Setor'
      Size = 50
    end
  end
  object mtbTecnicos: TFDMemTable
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
    Left = 993
    Top = 163
    object mtbTecnicosid: TIntegerField
      FieldName = 'id'
    end
    object mtbTecnicosNome_Tecnico: TStringField
      FieldName = 'Nome_Tecnico'
    end
  end
  object dtsTecnicos: TDataSource
    DataSet = mtbTecnicos
    Left = 832
    Top = 163
  end
  object mtbTiposCliente: TFDMemTable
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
    Left = 993
    Top = 249
    object mtbTiposClienteid: TIntegerField
      FieldName = 'id'
    end
    object mtbTiposClienteTipo_Cliente: TStringField
      FieldName = 'Tipo_Cliente'
      Origin = 'Tipo_Cliente'
      Size = 50
    end
  end
  object dtsTiposCliente: TDataSource
    DataSet = mtbTiposCliente
    Left = 832
    Top = 249
  end
  object mtbTiposClassificacao: TFDMemTable
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
    Left = 993
    Top = 335
    object mtbTiposClassificacaoid: TIntegerField
      FieldName = 'id'
    end
    object mtbTiposClassificacaoTipo_Classificacao: TStringField
      FieldName = 'Tipo_Classificacao'
      Origin = 'Tipo_Classificacao'
      Size = 350
    end
  end
  object dtsTiposClassificacao: TDataSource
    DataSet = mtbTiposClassificacao
    Left = 832
    Top = 335
  end
  object dtsPainel: TDataSource
    DataSet = cdsPainel
    Left = 256
    Top = 328
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
    Left = 993
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
  object dtsTiposPrazo: TDataSource
    DataSet = mtbTiposPrazo
    Left = 832
    Top = 78
  end
end
