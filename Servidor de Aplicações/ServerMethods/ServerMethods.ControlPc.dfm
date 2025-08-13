object SMControlPc: TSMControlPc
  OldCreateOrder = False
  Height = 681
  Width = 1005
  object qrySetores: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'Select a.id, a.Nome_Setor'
      'from Setores a'
      '     Inner Join Usuarios_Setores b on b.id_Setor = a.id'
      '     Inner Join Usuarios c on c.id = b.id_Usuario'
      'where a.Ativo = '#39'Sim'#39
      '      and a.ControlPc = '#39'Sim'#39
      '      and b.id_Usuario = :pIdUsuario'
      #9'     and c.Ativo = '#39'Sim'#39
      'Order by Nome_Setor')
    Left = 72
    Top = 240
    ParamData = <
      item
        Name = 'PIDUSUARIO'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qrySetoresid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrySetoresNome_Setor: TStringField
      FieldName = 'Nome_Setor'
      Origin = 'Nome_Setor'
      Size = 50
    end
  end
  object qryControlPc: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'Select * from ControlPc'
      'where Protocolo = :pProtocolo'
      '      or id = :pIdProtocolo')
    Left = 234
    Top = 48
    ParamData = <
      item
        Name = 'PPROTOCOLO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PIDPROTOCOLO'
        ParamType = ptInput
      end>
    object qryControlPcid: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryControlPcProtocolo: TStringField
      FieldName = 'Protocolo'
      Origin = 'Protocolo'
      Size = 50
    end
    object qryControlPcData_Abertura: TDateTimeField
      FieldName = 'Data_Abertura'
      Origin = 'Data_Abertura'
    end
    object qryControlPcPrevisao_Solucao: TDateTimeField
      FieldName = 'Previsao_Solucao'
      Origin = 'Previsao_Solucao'
    end
    object qryControlPcid_Tipo_Cliente: TIntegerField
      FieldName = 'id_Tipo_Cliente'
      Origin = 'id_Tipo_Cliente'
    end
    object qryControlPcid_Tecnico: TIntegerField
      FieldName = 'id_Tecnico'
      Origin = 'id_Tecnico'
    end
    object qryControlPcid_Status_True: TIntegerField
      FieldName = 'id_Status_True'
      Origin = 'id_Status_True'
    end
    object qryControlPcTipo_Reclame: TStringField
      FieldName = 'Tipo_Reclame'
      Origin = 'Tipo_Reclame'
      Size = 3
    end
    object qryControlPcTipo_Nip: TStringField
      FieldName = 'Tipo_Nip'
      Origin = 'Tipo_Nip'
      Size = 3
    end
    object qryControlPcData_Hora_Importacao: TDateTimeField
      FieldName = 'Data_Hora_Importacao'
      Origin = 'Data_Hora_Importacao'
    end
    object qryControlPcid_Usuario_Importacao: TIntegerField
      FieldName = 'id_Usuario_Importacao'
      Origin = 'id_Usuario_Importacao'
    end
    object qryControlPcid_Setor_Designado: TIntegerField
      FieldName = 'id_Setor_Designado'
      Origin = 'id_Setor_Designado'
    end
    object qryControlPcid_Usuario_Designado: TIntegerField
      FieldName = 'id_Usuario_Designado'
      Origin = 'id_Usuario_Designado'
    end
    object qryControlPcid_Responsavel_Designacao: TIntegerField
      FieldName = 'id_Responsavel_Designacao'
      Origin = 'id_Responsavel_Designacao'
    end
    object qryControlPcData_Hora_Designacao: TDateTimeField
      FieldName = 'Data_Hora_Designacao'
      Origin = 'Data_Hora_Designacao'
    end
    object qryControlPcJustificativa_Designacao: TStringField
      FieldName = 'Justificativa_Designacao'
      Origin = 'Justificativa_Designacao'
      Size = 100
    end
    object qryControlPcData_Hora_Encerramento: TDateTimeField
      FieldName = 'Data_Hora_Encerramento'
      Origin = 'Data_Hora_Encerramento'
    end
    object qryControlPcid_Usuario_Encerramento: TIntegerField
      FieldName = 'id_Usuario_Encerramento'
      Origin = 'id_Usuario_Encerramento'
    end
    object qryControlPcJustificativa_Encerramento: TStringField
      FieldName = 'Justificativa_Encerramento'
      Origin = 'Justificativa_Encerramento'
      Size = 100
    end
    object qryControlPcUltima_Atualizacao: TDateTimeField
      FieldName = 'Ultima_Atualizacao'
      Origin = 'Ultima_Atualizacao'
    end
    object qryControlPcid_Usuario_Ultima_Atualizacao: TIntegerField
      FieldName = 'id_Usuario_Ultima_Atualizacao'
      Origin = 'id_Usuario_Ultima_Atualizacao'
    end
    object qryControlPcDesignacao_Pendente: TStringField
      FieldName = 'Designacao_Pendente'
      Origin = 'Designacao_Pendente'
      Size = 3
    end
  end
  object qryControlPcHistorico: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'Select * from ControlPc_Historico'
      'where id_ControlPc = :pIdControlPc')
    Left = 234
    Top = 128
    ParamData = <
      item
        Name = 'PIDCONTROLPC'
        DataType = ftLargeint
        ParamType = ptInput
        Value = Null
      end>
    object qryControlPcHistoricoid: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryControlPcHistoricoid_ControlPc: TLargeintField
      FieldName = 'id_ControlPc'
      Origin = 'id_ControlPc'
    end
    object qryControlPcHistoricoid_Tecnico: TIntegerField
      FieldName = 'id_Tecnico'
      Origin = 'id_Tecnico'
    end
    object qryControlPcHistoricoid_Tipo_Cliente: TIntegerField
      FieldName = 'id_Tipo_Cliente'
      Origin = 'id_Tipo_Cliente'
    end
    object qryControlPcHistoricoid_Status_True: TIntegerField
      FieldName = 'id_Status_True'
      Origin = 'id_Status_True'
    end
    object qryControlPcHistoricoTipo_Reclame: TStringField
      FieldName = 'Tipo_Reclame'
      Origin = 'Tipo_Reclame'
      Size = 3
    end
    object qryControlPcHistoricoTipo_Nip: TStringField
      FieldName = 'Tipo_Nip'
      Origin = 'Tipo_Nip'
      Size = 3
    end
    object qryControlPcHistoricoid_Usuario_Responsavel: TIntegerField
      FieldName = 'id_Usuario_Responsavel'
      Origin = 'id_Usuario_Responsavel'
    end
    object qryControlPcHistoricoData_Hora_Historico: TDateTimeField
      FieldName = 'Data_Hora_Historico'
      Origin = 'Data_Hora_Historico'
    end
  end
  object qryControlPcLog: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'Select * from ControlPc_Log'
      'where id_ControlPc = :pIdControlPc')
    Left = 234
    Top = 200
    ParamData = <
      item
        Name = 'PIDCONTROLPC'
        DataType = ftLargeint
        ParamType = ptInput
        Value = Null
      end>
    object qryControlPcLogid: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryControlPcLogid_ControlPc: TLargeintField
      FieldName = 'id_ControlPc'
      Origin = 'id_ControlPc'
    end
    object qryControlPcLogid_Setor_Designado: TIntegerField
      FieldName = 'id_Setor_Designado'
      Origin = 'id_Setor_Designado'
    end
    object qryControlPcLogid_Usuario_Designado: TIntegerField
      FieldName = 'id_Usuario_Designado'
      Origin = 'id_Usuario_Designado'
    end
    object qryControlPcLogid_Usuario_Responsavel: TIntegerField
      FieldName = 'id_Usuario_Responsavel'
      Origin = 'id_Usuario_Responsavel'
    end
    object qryControlPcLogJustificativa: TStringField
      FieldName = 'Justificativa'
      Origin = 'Justificativa'
      Size = 100
    end
    object qryControlPcLogData_Hora_Log: TDateTimeField
      FieldName = 'Data_Hora_Log'
      Origin = 'Data_Hora_Log'
    end
  end
  object qryPainelControlPc: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'select '
      '   a.id as id_Protocolo, a.Protocolo, a.Data_Abertura, '
      '   a.Previsao_Solucao, a.Tipo_Reclame, a.Tipo_Nip,'
      '   a.id_Usuario_Designado, a.id_Setor_Designado,'
      '   a.Designacao_Pendente,'
      '   d.Nome_Tecnico,'
      '   e.Tipo_Cliente,'
      '   f.Status as Status_True,'
      '   g.Nome_Usuario as Usuario_Designado,'
      '   h.Nome_Setor as Setor_Designado,'
      '   1 as Qtd_Historicos,'
      '   1 as Qtd_Designacoes,'
      '   1 as Qtd_Observacoes'
      'From ControlPc a'
      '     INNER JOIN Tecnicos d on d.id = a.id_Tecnico'
      '     INNER JOIN Tipos_Cliente e on e.id = a.id_Tipo_Cliente'
      '     INNER JOIN Status_True f on f.id = a.id_Status_True'
      '     LEFT OUTER JOIN Usuarios g on g.id = a.id_Usuario_Designado'
      '     LEFT OUTER JOIN Setores h on h.id = a.id_Setor_Designado'
      'where 1 = 1')
    Left = 448
    Top = 40
    object qryPainelControlPcid_Protocolo: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id_Protocolo'
      Origin = 'id_Protocolo'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object qryPainelControlPcProtocolo: TStringField
      FieldName = 'Protocolo'
      Origin = 'Protocolo'
      Size = 50
    end
    object qryPainelControlPcData_Abertura: TDateTimeField
      FieldName = 'Data_Abertura'
      Origin = 'Data_Abertura'
    end
    object qryPainelControlPcPrevisao_Solucao: TDateTimeField
      FieldName = 'Previsao_Solucao'
      Origin = 'Previsao_Solucao'
    end
    object qryPainelControlPcTipo_Reclame: TStringField
      FieldName = 'Tipo_Reclame'
      Origin = 'Tipo_Reclame'
      Size = 3
    end
    object qryPainelControlPcTipo_Nip: TStringField
      FieldName = 'Tipo_Nip'
      Origin = 'Tipo_Nip'
      Size = 3
    end
    object qryPainelControlPcNome_Tecnico: TStringField
      FieldName = 'Nome_Tecnico'
      Origin = 'Nome_Tecnico'
      Size = 50
    end
    object qryPainelControlPcTipo_Cliente: TStringField
      FieldName = 'Tipo_Cliente'
      Origin = 'Tipo_Cliente'
      Size = 50
    end
    object qryPainelControlPcid_Status_True: TIntegerField
      FieldName = 'id_Status_True'
    end
    object qryPainelControlPcStatus_True: TStringField
      FieldName = 'Status_True'
      Origin = 'Status_True'
      Size = 30
    end
    object qryPainelControlPcUsuario_Designado: TStringField
      FieldName = 'Usuario_Designado'
      Origin = 'Usuario_Designado'
      Size = 100
    end
    object qryPainelControlPcSetor_Designado: TStringField
      FieldName = 'Setor_Designado'
      Origin = 'Setor_Designado'
      Size = 50
    end
    object qryPainelControlPcQtd_Historicos: TIntegerField
      FieldName = 'Qtd_Historicos'
      Origin = 'Qtd_Historicos'
      ReadOnly = True
      Required = True
    end
    object qryPainelControlPcQtd_Designacoes: TIntegerField
      FieldName = 'Qtd_Designacoes'
      Origin = 'Qtd_Designacoes'
      ReadOnly = True
      Required = True
    end
    object qryPainelControlPcQtd_Observacoes: TIntegerField
      FieldName = 'Qtd_Observacoes'
      Origin = 'Qtd_Observacoes'
      ReadOnly = True
      Required = True
    end
    object qryPainelControlPcid_Usuario_Designado: TIntegerField
      FieldName = 'id_Usuario_Designado'
      Origin = 'id_Usuario_Designado'
    end
    object qryPainelControlPcid_Setor_Designado: TIntegerField
      FieldName = 'id_Setor_Designado'
      Origin = 'id_Setor_Designado'
    end
    object qryPainelControlPcDesignacao_Pendente: TStringField
      FieldName = 'Designacao_Pendente'
      Origin = 'Designacao_Pendente'
      Size = 3
    end
  end
  object qryAux: TFDQuery
    Connection = ServerContainer.FDConnection
    Left = 789
    Top = 32
  end
  object qryTecnicos: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'Select * from Tecnicos'
      'Order by Nome_Tecnico')
    Left = 80
    Top = 72
    object qryTecnicosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryTecnicosNome_Tecnico: TStringField
      FieldName = 'Nome_Tecnico'
      Origin = 'Nome_Tecnico'
      Size = 50
    end
  end
  object qryTiposCliente: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'select * from Tipos_Cliente'
      'Order by Tipo_Cliente')
    Left = 72
    Top = 152
    object qryTiposClienteid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryTiposClienteTipo_Cliente: TStringField
      FieldName = 'Tipo_Cliente'
      Origin = 'Tipo_Cliente'
      Size = 50
    end
  end
  object qryIncluirDesignacao: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'Select * from ControlPc_Designacao_Solicitacao'
      'where 1 = 2')
    Left = 234
    Top = 296
    object qryIncluirDesignacaoid: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryIncluirDesignacaoid_Protocolo: TLargeintField
      FieldName = 'id_Protocolo'
      Origin = 'id_Protocolo'
    end
    object qryIncluirDesignacaoid_Usuario_Solicitante: TIntegerField
      FieldName = 'id_Usuario_Solicitante'
      Origin = 'id_Usuario_Solicitante'
    end
    object qryIncluirDesignacaoData_Solicitacao: TDateTimeField
      FieldName = 'Data_Solicitacao'
      Origin = 'Data_Solicitacao'
    end
    object qryIncluirDesignacaoid_Usuario_Designado: TIntegerField
      FieldName = 'id_Usuario_Designado'
      Origin = 'id_Usuario_Designado'
    end
    object qryIncluirDesignacaoid_Usuario_Solicitado: TIntegerField
      FieldName = 'id_Usuario_Solicitado'
      Origin = 'id_Usuario_Solicitado'
    end
    object qryIncluirDesignacaoid_Setor_Designado: TIntegerField
      FieldName = 'id_Setor_Designado'
      Origin = 'id_Setor_Designado'
    end
    object qryIncluirDesignacaoid_Setor_Solicitado: TIntegerField
      FieldName = 'id_Setor_Solicitado'
      Origin = 'id_Setor_Solicitado'
    end
    object qryIncluirDesignacaoAutorizado: TStringField
      FieldName = 'Autorizado'
      Origin = 'Autorizado'
      Size = 10
    end
    object qryIncluirDesignacaoData_Hora_Autorizacao: TDateTimeField
      FieldName = 'Data_Hora_Autorizacao'
      Origin = 'Data_Hora_Autorizacao'
    end
    object qryIncluirDesignacaoJustificativa: TStringField
      FieldName = 'Justificativa'
      Origin = 'Justificativa'
      Size = 500
    end
    object qryIncluirDesignacaoid_Usuario_Autorizador: TIntegerField
      FieldName = 'id_Usuario_Autorizador'
      Origin = 'id_Usuario_Autorizador'
    end
  end
  object qryDesignacoesPendentes: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'Select '
      '   a.id as id_Solicitacao,'
      '   a.Data_Solicitacao,'
      '   a.Justificativa,'
      '   a.id_Protocolo,'
      '   b.Protocolo,'
      '   c.Nome_Usuario as Usuario_Solicitante,'
      '   d.Nome_Usuario as Usuario_Atual,'
      '   e.Nome_Usuario as Usuario_Solicitado,'
      '   f.Nome_Setor as Setor_Atual,'
      '   g.Nome_Setor as Setor_Solicitado,'
      '   h.Status as Status_True'
      'From '
      '   ControlPc_Designacao_Solicitacao a'
      '   Inner Join ControlPc b on b.id = a.id_Protocolo'
      '   Inner Join Usuarios c on c.id = a.id_Usuario_Solicitante'
      '   Left Outer Join Usuarios d on d.id = a.id_Usuario_Designado'
      '   Left Outer Join Usuarios e on e.id = a.id_Usuario_Solicitado'
      '   Left Outer Join Setores f on f.id = a.id_Setor_Designado'
      '   Left Outer Join Setores g on g.id = a.id_Setor_Solicitado'
      '   Left Outer Join Status_True h on h.id = b.id_Status_True'
      'where'
      '   b.Designacao_Pendente = '#39'Sim'#39
      'Order by'
      '   a.Data_Solicitacao,'
      '   b.Protocolo')
    Left = 234
    Top = 400
    object qryDesignacoesPendentesData_Solicitacao: TDateTimeField
      FieldName = 'Data_Solicitacao'
      Origin = 'Data_Solicitacao'
    end
    object qryDesignacoesPendentesJustificativa: TStringField
      FieldName = 'Justificativa'
      Origin = 'Justificativa'
      Size = 500
    end
    object qryDesignacoesPendentesid_Protocolo: TLargeintField
      FieldName = 'id_Protocolo'
      Origin = 'id_Protocolo'
    end
    object qryDesignacoesPendentesProtocolo: TStringField
      FieldName = 'Protocolo'
      Origin = 'Protocolo'
      Size = 50
    end
    object qryDesignacoesPendentesUsuario_Solicitante: TStringField
      FieldName = 'Usuario_Solicitante'
      Origin = 'Usuario_Solicitante'
      Size = 100
    end
    object qryDesignacoesPendentesUsuario_Atual: TStringField
      FieldName = 'Usuario_Atual'
      Origin = 'Usuario_Atual'
      Size = 100
    end
    object qryDesignacoesPendentesUsuario_Solicitado: TStringField
      FieldName = 'Usuario_Solicitado'
      Origin = 'Usuario_Solicitado'
      Size = 100
    end
    object qryDesignacoesPendentesSetor_Atual: TStringField
      FieldName = 'Setor_Atual'
      Origin = 'Setor_Atual'
      Size = 50
    end
    object qryDesignacoesPendentesSetor_Solicitado: TStringField
      FieldName = 'Setor_Solicitado'
      Origin = 'Setor_Solicitado'
      Size = 50
    end
    object qryDesignacoesPendentesStatus_True: TStringField
      FieldName = 'Status_True'
      Origin = 'Status_True'
      Size = 30
    end
    object qryDesignacoesPendentesid_Solicitacao: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id_Solicitacao'
      Origin = 'id_Solicitacao'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
  end
end
