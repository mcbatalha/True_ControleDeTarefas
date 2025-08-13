inherited dtmDesignacoesPendentesSiags: TdtmDesignacoesPendentesSiags
  OldCreateOrder = True
  Height = 577
  Width = 773
  object mtbPainel: TFDMemTable
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
    Left = 64
    Top = 152
    object mtbPainelData_Solicitacao: TDateTimeField
      FieldName = 'Data_Solicitacao'
      Origin = 'Data_Solicitacao'
    end
    object mtbPainelJustificativa: TStringField
      FieldName = 'Justificativa'
      Origin = 'Justificativa'
      Size = 500
    end
    object mtbPainelid_Autorizacao: TLargeintField
      FieldName = 'id_Autorizacao'
      Origin = 'id_Autorizacao'
    end
    object mtbPainelNumero_Autorizacao: TLargeintField
      FieldName = 'Numero_Autorizacao'
    end
    object mtbPainelUsuario_Solicitante: TStringField
      FieldName = 'Usuario_Solicitante'
      Origin = 'Usuario_Solicitante'
      Size = 100
    end
    object mtbPainelUsuario_Atual: TStringField
      FieldName = 'Usuario_Atual'
      Origin = 'Usuario_Atual'
      Size = 100
    end
    object mtbPainelUsuario_Solicitado: TStringField
      FieldName = 'Usuario_Solicitado'
      Origin = 'Usuario_Solicitado'
      Size = 100
    end
    object mtbPainelSetor_Atual: TStringField
      FieldName = 'Setor_Atual'
      Origin = 'Setor_Atual'
      Size = 50
    end
    object mtbPainelSetor_Solicitado: TStringField
      FieldName = 'Setor_Solicitado'
      Origin = 'Setor_Solicitado'
      Size = 50
    end
    object mtbPainelStatus_True: TStringField
      FieldName = 'Status_True'
      Origin = 'Status_True'
      Size = 30
    end
    object mtbPainelid_Solicitacao: TLargeintField
      FieldName = 'id_Solicitacao'
    end
  end
  object cdsPainel: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPainel'
    Left = 64
    Top = 288
    object cdsPainelNumero_Autorizacao: TLargeintField
      Alignment = taCenter
      FieldName = 'Numero_Autorizacao'
    end
    object cdsPainelData_Solicitacao: TDateTimeField
      Alignment = taCenter
      FieldName = 'Data_Solicitacao'
      Origin = 'Data_Solicitacao'
    end
    object cdsPainelJustificativa: TStringField
      Alignment = taCenter
      FieldName = 'Justificativa'
      Origin = 'Justificativa'
      Size = 500
    end
    object cdsPainelUsuario_Solicitante: TStringField
      FieldName = 'Usuario_Solicitante'
      Origin = 'Usuario_Solicitante'
      Size = 100
    end
    object cdsPainelUsuario_Atual: TStringField
      FieldName = 'Usuario_Atual'
      Origin = 'Usuario_Atual'
      OnGetText = cdsPainelUsuario_AtualGetText
      Size = 100
    end
    object cdsPainelUsuario_Solicitado: TStringField
      FieldName = 'Usuario_Solicitado'
      Origin = 'Usuario_Solicitado'
      Size = 100
    end
    object cdsPainelSetor_Atual: TStringField
      FieldName = 'Setor_Atual'
      Origin = 'Setor_Atual'
      OnGetText = cdsPainelUsuario_AtualGetText
      Size = 50
    end
    object cdsPainelSetor_Solicitado: TStringField
      FieldName = 'Setor_Solicitado'
      Origin = 'Setor_Solicitado'
      Size = 50
    end
    object cdsPainelStatus_True: TStringField
      FieldName = 'Status_True'
      Origin = 'Status_True'
      Size = 30
    end
    object cdsPainelid_Solicitacao: TLargeintField
      FieldName = 'id_Solicitacao'
    end
    object cdsPainelid_Autorizacao: TLargeintField
      FieldName = 'id_Autorizacao'
    end
  end
  object dspPainel: TDataSetProvider
    DataSet = mtbPainel
    Left = 64
    Top = 216
  end
  object dtsPainel: TDataSource
    DataSet = cdsPainel
    Left = 61
    Top = 376
  end
end
