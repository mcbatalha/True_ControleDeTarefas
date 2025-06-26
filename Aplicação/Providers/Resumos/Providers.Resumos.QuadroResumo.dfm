inherited dtmQuadroResumo: TdtmQuadroResumo
  Width = 803
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
    object mtbQuadroResumoQtd_Siags_Vencidos_True: TIntegerField
      FieldName = 'Qtd_Siags_Vencidos_True'
      Origin = 'Qtd_Siags_Vencidos_True'
    end
    object mtbQuadroResumoQtd_Siags_Vencidos_Ans: TIntegerField
      FieldName = 'Qtd_Siags_Vencidos_Ans'
      Origin = 'Qtd_Siags_Vencidos_Ans'
    end
    object mtbQuadroResumoQtd_AutoSc: TIntegerField
      FieldName = 'Qtd_AutoSc'
      Origin = 'Qtd_AutoSc'
    end
    object mtbQuadroResumoQtd_AutoSc_Vencidos_True: TIntegerField
      FieldName = 'Qtd_AutoSc_Vencidos_True'
      Origin = 'Qtd_AutoSc_Vencidos_True'
    end
    object mtbQuadroResumoQtd_AutoSc_Vencidos_Ans: TIntegerField
      FieldName = 'Qtd_AutoSc_Vencidos_Ans'
      Origin = 'Qtd_AutoSc_Vencidos_Ans'
    end
    object mtbQuadroResumoQtd_ControlPc: TIntegerField
      FieldName = 'Qtd_ControlPc'
      Origin = 'Qtd_ControlPc'
    end
    object mtbQuadroResumoQtd_ControlPc_Vencidos_True: TIntegerField
      FieldName = 'Qtd_ControlPc_Vencidos_True'
      Origin = 'Qtd_ControlPc_Vencidos_True'
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
end
