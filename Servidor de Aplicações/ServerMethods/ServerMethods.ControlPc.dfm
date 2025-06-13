object SMControlPc: TSMControlPc
  OldCreateOrder = False
  Height = 681
  Width = 1005
  object qrySetores: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'Select id, Nome_Setor'
      'from Setores'
      'where Ativo = '#39'Sim'#39
      '      and AutoSC = '#39'Sim'#39
      'Order by Nome_Setor')
    Left = 80
    Top = 456
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
  object qryTiposStatus: TFDQuery
    Connection = ServerContainer.FDConnection
    UpdateOptions.UpdateTableName = 'ControleDeTarefas.dbo.Tipos_Status'
    SQL.Strings = (
      'Declare @CONTROLPC int;'
      'Set @CONTROLPC = :CONTROLPC;'
      ''
      'Select * from Tipos_Status'
      'where @CONTROLPC = 9 or CONTROLPC = @CONTROLPC '
      'Order by Tipo_Status')
    Left = 80
    Top = 376
    ParamData = <
      item
        Name = 'CONTROLPC'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryTiposStatusid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryTiposStatusTipo_Status: TStringField
      FieldName = 'Tipo_Status'
      Origin = 'Tipo_Status'
      Size = 30
    end
    object qryTiposStatusAUTOSC: TIntegerField
      FieldName = 'AUTOSC'
      Origin = 'AUTOSC'
    end
    object qryTiposStatusSIAGS: TIntegerField
      FieldName = 'SIAGS'
      Origin = 'SIAGS'
    end
    object qryTiposStatusCONTROLPC: TIntegerField
      FieldName = 'CONTROLPC'
      Origin = 'CONTROLPC'
    end
  end
  object qryTiposPrazo: TFDQuery
    Connection = ServerContainer.FDConnection
    UpdateOptions.UpdateTableName = 'ControleDeTarefas.dbo.Tipos_Prazo'
    SQL.Strings = (
      'Declare @CONTROLPC int;'
      'Set @CONTROLPC = :CONTROLPC;'
      ''
      'select * from Tipos_Prazo'
      'where @CONTROLPC = 9 or CONTROLPC = @CONTROLPC '
      'Order by Tipo_Prazo_Caixa')
    Left = 80
    Top = 136
    ParamData = <
      item
        Name = 'CONTROLPC'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryTiposPrazoid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryTiposPrazoTipo_Prazo_Caixa: TStringField
      FieldName = 'Tipo_Prazo_Caixa'
      Origin = 'Tipo_Prazo_Caixa'
      Size = 30
    end
    object qryTiposPrazoAUTOSC: TIntegerField
      FieldName = 'AUTOSC'
      Origin = 'AUTOSC'
    end
    object qryTiposPrazoSIAGS: TIntegerField
      FieldName = 'SIAGS'
      Origin = 'SIAGS'
    end
    object qryTiposPrazoCONTROLPC: TIntegerField
      FieldName = 'CONTROLPC'
      Origin = 'CONTROLPC'
    end
  end
  object qryControlPc: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'Select * from ControlPc'
      'where Protocolo = :pProtocolo')
    Left = 320
    Top = 40
    ParamData = <
      item
        Name = 'PPROTOCOLO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
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
    object qryControlPcid_Tipo_Status: TIntegerField
      FieldName = 'id_Tipo_Status'
      Origin = 'id_Tipo_Status'
    end
    object qryControlPcData_Abertura: TDateTimeField
      FieldName = 'Data_Abertura'
      Origin = 'Data_Abertura'
    end
    object qryControlPcData_Transferencia: TDateTimeField
      FieldName = 'Data_Transferencia'
      Origin = 'Data_Transferencia'
    end
    object qryControlPcData_Fechamento: TDateTimeField
      FieldName = 'Data_Fechamento'
      Origin = 'Data_Fechamento'
    end
    object qryControlPcPrevisao_Solucao: TDateTimeField
      FieldName = 'Previsao_Solucao'
      Origin = 'Previsao_Solucao'
    end
    object qryControlPcid_Tipo_Prazo: TIntegerField
      FieldName = 'id_Tipo_Prazo'
      Origin = 'id_Tipo_Prazo'
    end
    object qryControlPcid_Tipo_Cliente: TIntegerField
      FieldName = 'id_Tipo_Cliente'
      Origin = 'id_Tipo_Cliente'
    end
    object qryControlPcid_Tipo_Classificacao: TIntegerField
      FieldName = 'id_Tipo_Classificacao'
      Origin = 'id_Tipo_Classificacao'
    end
    object qryControlPcid_Tecnico: TIntegerField
      FieldName = 'id_Tecnico'
      Origin = 'id_Tecnico'
    end
    object qryControlPcSolicitacao_Cliente: TStringField
      FieldName = 'Solicitacao_Cliente'
      Origin = 'Solicitacao_Cliente'
      Size = 500
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
  end
  object qryControlPcHistorico: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'Select * from ControlPc_Historico'
      'where id_ControlPc = :pIdControlPc')
    Left = 320
    Top = 120
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
    object qryControlPcHistoricoid_Tipo_Status: TIntegerField
      FieldName = 'id_Tipo_Status'
      Origin = 'id_Tipo_Status'
    end
    object qryControlPcHistoricoid_Tipo_Prazo: TIntegerField
      FieldName = 'id_Tipo_Prazo'
      Origin = 'id_Tipo_Prazo'
    end
    object qryControlPcHistoricoid_Tecnico: TIntegerField
      FieldName = 'id_Tecnico'
      Origin = 'id_Tecnico'
    end
    object qryControlPcHistoricoid_Tipo_Cliente: TIntegerField
      FieldName = 'id_Tipo_Cliente'
      Origin = 'id_Tipo_Cliente'
    end
    object qryControlPcHistoricoid_Tipo_Classifiacao: TIntegerField
      FieldName = 'id_Tipo_Classifiacao'
      Origin = 'id_Tipo_Classifiacao'
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
    Left = 320
    Top = 192
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
      
        '   a.id as id_Protocolo, a.Protocolo, a.Data_Abertura, a.Data_Tr' +
        'ansferencia, a.Data_Fechamento,'
      
        '   a.Previsao_Solucao, a.Solicitacao_Cliente, a.Tipo_Reclame, a.' +
        'Tipo_Nip,'
      '   b.Tipo_Status,'
      '   c.Tipo_Prazo_Caixa,'
      '   d.Nome_Tecnico,'
      '   e.Tipo_Cliente,'
      '   f.Tipo_Classificacao,'
      '   g.Nome_Usuario as Usuario_Designado,'
      '   h.Nome_Setor as Setor_Designado,'
      '   1 as Qtd_Historicos,'
      '   1 as Qtd_Designacoes,'
      '   1 as Qtd_Observacoes'
      'From ControlPc a'
      '     INNER JOIN Tipos_Status b on b.id = a.id_Tipo_Status'
      '     INNER JOIN Tipos_Prazo c on c.id = a.id_Tipo_Prazo'
      '     INNER JOIN Tecnicos d on d.id = a.id_Tecnico'
      '     INNER JOIN Tipos_Cliente e on e.id = a.id_Tipo_Cliente'
      
        '     INNER JOIN Tipos_Classificacao f on f.id = a.id_Tipo_Classi' +
        'ficacao'
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
    object qryPainelControlPcData_Transferencia: TDateTimeField
      FieldName = 'Data_Transferencia'
      Origin = 'Data_Transferencia'
    end
    object qryPainelControlPcData_Fechamento: TDateTimeField
      FieldName = 'Data_Fechamento'
      Origin = 'Data_Fechamento'
    end
    object qryPainelControlPcPrevisao_Solucao: TDateTimeField
      FieldName = 'Previsao_Solucao'
      Origin = 'Previsao_Solucao'
    end
    object qryPainelControlPcSolicitacao_Cliente: TStringField
      FieldName = 'Solicitacao_Cliente'
      Origin = 'Solicitacao_Cliente'
      Size = 500
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
    object qryPainelControlPcTipo_Status: TStringField
      FieldName = 'Tipo_Status'
      Origin = 'Tipo_Status'
      Size = 30
    end
    object qryPainelControlPcTipo_Prazo_Caixa: TStringField
      FieldName = 'Tipo_Prazo_Caixa'
      Origin = 'Tipo_Prazo_Caixa'
      Size = 30
    end
    object qryPainelControlPcTipo_Classificacao: TStringField
      FieldName = 'Tipo_Classificacao'
      Origin = 'Tipo_Classificacao'
      Size = 350
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
    Left = 80
    Top = 208
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
  object qryTiposClassificacao: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'select * from Tipos_Classificacao'
      'Order by Tipo_Classificacao')
    Left = 80
    Top = 296
    object qryTiposClassificacaoid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryTiposClassificacaoTipo_Classificacao: TStringField
      FieldName = 'Tipo_Classificacao'
      Origin = 'Tipo_Classificacao'
      Size = 350
    end
  end
  object qryClassificacao: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'select * '
      'from Tipos_Classificacao'
      'where Tipo_Classificacao = :pTipoClassificacao'
      'Order by Tipo_Classificacao')
    Left = 224
    Top = 304
    ParamData = <
      item
        Name = 'PTIPOCLASSIFICACAO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qryClassificacaoid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryClassificacaoTipo_Classificacao: TStringField
      FieldName = 'Tipo_Classificacao'
      Origin = 'Tipo_Classificacao'
      Size = 350
    end
  end
end
