inherited dtmQuadroResumo: TdtmQuadroResumo
  Height = 523
  Width = 1125
  inherited DSProviderConnection: TDSProviderConnection
    ServerClassName = 'TSMResumos'
  end
  object mtbQuadroResumo: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 72
    Top = 136
    object mtbQuadroResumoQtd_Siags: TIntegerField
      FieldName = 'Qtd_Siags'
      Origin = 'Qtd_Siags'
    end
    object mtbQuadroResumoQtd_Siags_Vencidos: TIntegerField
      FieldName = 'Qtd_Siags_Vencidos'
      Origin = 'Qtd_Siags_Vencidos'
    end
    object mtbQuadroResumoQtd_Siags_Vence_Hoje: TIntegerField
      FieldName = 'Qtd_Siags_Vence_Hoje'
      Origin = 'Qtd_Siags_Vence_Hoje'
    end
    object mtbQuadroResumoQtd_Siags_Vence_Amanha: TIntegerField
      FieldName = 'Qtd_Siags_Vence_Amanha'
      Origin = 'Qtd_Siags_Vence_Amanha'
    end
    object mtbQuadroResumoQtd_Siags_Com_Prazo: TIntegerField
      FieldName = 'Qtd_Siags_Com_Prazo'
      Origin = 'Qtd_Siags_Com_Prazo'
    end
    object mtbQuadroResumoQtd_ControlPc: TIntegerField
      FieldName = 'Qtd_ControlPc'
      Origin = 'Qtd_ControlPc'
    end
    object mtbQuadroResumoQtd_ControlPc_Vencidos: TIntegerField
      FieldName = 'Qtd_ControlPc_Vencidos'
      Origin = 'Qtd_ControlPc_Vencidos'
    end
    object mtbQuadroResumoQtd_ControlPc_Vence_Hoje: TIntegerField
      FieldName = 'Qtd_ControlPc_Vence_Hoje'
      Origin = 'Qtd_ControlPc_Vence_Hoje'
    end
    object mtbQuadroResumoQtd_ControlPc_Vence_Amanha: TIntegerField
      FieldName = 'Qtd_ControlPc_Vence_Amanha'
      Origin = 'Qtd_ControlPc_Vence_Amanha'
    end
    object mtbQuadroResumoQtd_ControlPc_Com_Prazo: TIntegerField
      FieldName = 'Qtd_ControlPc_Com_Prazo'
      Origin = 'Qtd_ControlPc_Com_Prazo'
    end
  end
  object mtbSiagsVencidos: TFDMemTable
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
    Left = 248
    Top = 136
    object mtbSiagsVencidosNome_Setor: TStringField
      FieldName = 'Nome_Setor'
      Origin = 'Nome_Setor'
      OnGetText = mtbSiagsVencidosNome_SetorGetText
      Size = 50
    end
    object mtbSiagsVencidosQtd_Vencido: TIntegerField
      Alignment = taCenter
      FieldName = 'Qtd_Vencido'
      Origin = 'Qtd_Vencido'
    end
    object mtbSiagsVencidosQtd_VenceHoje: TIntegerField
      Alignment = taCenter
      FieldName = 'Qtd_VenceHoje'
      Origin = 'Qtd_VenceHoje'
    end
    object mtbSiagsVencidosQtd_VenceAmanha: TIntegerField
      Alignment = taCenter
      FieldName = 'Qtd_VenceAmanha'
      Origin = 'Qtd_VenceAmanha'
    end
  end
  object mtbAutoScVencidos: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 384
    Top = 136
    object mtbAutoScVencidosNome_Setor: TStringField
      DisplayWidth = 30
      FieldName = 'Nome_Setor'
      Origin = 'Nome_Setor'
      Size = 50
    end
    object mtbAutoScVencidosQtd_Vencido: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Vencidos'
      DisplayWidth = 10
      FieldName = 'Qtd_Vencido'
      Origin = 'Qtd_Vencido'
    end
    object mtbAutoScVencidosQtd_VenceHoje: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'VenceHoje'
      DisplayWidth = 10
      FieldName = 'Qtd_VenceHoje'
      Origin = 'Qtd_VenceHoje'
    end
  end
  object mtbControlPcVencidos: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 528
    Top = 136
    object mtbControlPcVencidosNome_Setor: TStringField
      FieldName = 'Nome_Setor'
      Origin = 'Nome_Setor'
      OnGetText = mtbSiagsVencidosNome_SetorGetText
      Size = 50
    end
    object mtbControlPcVencidosQtd_Vencido: TIntegerField
      Alignment = taCenter
      FieldName = 'Qtd_Vencido'
      Origin = 'Qtd_Vencido'
    end
    object mtbControlPcVencidosQtd_VenceHoje: TIntegerField
      Alignment = taCenter
      FieldName = 'Qtd_VenceHoje'
      Origin = 'Qtd_VenceHoje'
    end
    object mtbControlPcVencidosQtd_VenceAmanha: TIntegerField
      Alignment = taCenter
      FieldName = 'Qtd_VenceAmanha'
      Origin = 'Qtd_VenceAmanha'
    end
  end
  object dtsSiagsVencidos: TDataSource
    DataSet = mtbSiagsVencidos
    Left = 248
    Top = 208
  end
  object dtsAutoScVencidos: TDataSource
    DataSet = mtbAutoScVencidos
    Left = 384
    Top = 200
  end
  object dtsControlPcVencidos: TDataSource
    DataSet = mtbControlPcVencidos
    Left = 520
    Top = 200
  end
  object mtbTitulos: TFDMemTable
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
    Left = 696
    Top = 136
    object mtbTitulosSetor: TStringField
      Alignment = taCenter
      FieldName = 'Setor'
    end
    object mtbTitulosVencido: TStringField
      Alignment = taCenter
      FieldName = 'Vencido'
    end
    object mtbTitulosVence_Hoje: TStringField
      Alignment = taCenter
      FieldName = 'Vence_Hoje'
    end
    object mtbTitulosVence_Amanha: TStringField
      Alignment = taCenter
      FieldName = 'Vence_Amanha'
    end
  end
  object dtsTitulos: TDataSource
    DataSet = mtbTitulos
    Left = 696
    Top = 208
  end
end
