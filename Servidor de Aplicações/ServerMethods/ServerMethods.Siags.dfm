object SMSiags: TSMSiags
  OldCreateOrder = False
  Height = 795
  Width = 1255
  object qryAux: TFDQuery
    Connection = ServerContainer.FDConnection
    Left = 1112
    Top = 24
  end
  object qryTiposPrazo: TFDQuery
    Connection = ServerContainer.FDConnection
    UpdateOptions.UpdateTableName = 'ControleDeTarefas.dbo.Tipos_Prazo'
    SQL.Strings = (
      'Declare @SIAGS int;'
      'Set @SIAGS = :SIAGS;'
      ''
      'select * from Tipos_Prazo'
      'where @SIAGS = 9 or SIAGS = @SIAGS'
      'Order by Tipo_Prazo_Caixa')
    Left = 248
    Top = 180
    ParamData = <
      item
        Name = 'SIAGS'
        ParamType = ptInput
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
      Size = 15
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
  object qryTiposAutorizacao: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'select * from Tipos_Autorizacao'
      'order by Tipo_Autorizacao')
    Left = 248
    Top = 264
    object qryTiposAutorizacaoid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryTiposAutorizacaoTipo_Autorizacao: TStringField
      FieldName = 'Tipo_Autorizacao'
      Origin = 'Tipo_Autorizacao'
      Size = 50
    end
  end
  object qryTiposAtendimento: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'select * from Tipos_Atendimento'
      'Order by Tipo_Atendimento')
    Left = 248
    Top = 338
    object qryTiposAtendimentoid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryTiposAtendimentoTipo_Atendimento: TStringField
      FieldName = 'Tipo_Atendimento'
      Origin = 'Tipo_Atendimento'
      Size = 30
    end
  end
  object qryTiposSituacaoAutorizacao: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'select * from Tipos_Situacao_Autorizacao'
      'Order by Tipo_Situacao_Autorizacao')
    Left = 248
    Top = 412
    object qryTiposSituacaoAutorizacaoid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryTiposSituacaoAutorizacaoTipo_Situacao_Autorizacao: TStringField
      FieldName = 'Tipo_Situacao_Autorizacao'
      Origin = 'Tipo_Situacao_Autorizacao'
      Size = 30
    end
  end
  object qrySiags: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'Select * from Siags'
      'where Numero_Autorizacao= :pNumeroAutorizacao')
    Left = 616
    Top = 24
    ParamData = <
      item
        Name = 'PNUMEROAUTORIZACAO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qrySiagsid: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qrySiagsUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
    object qrySiagsid_Tipo_Autorizacao: TIntegerField
      FieldName = 'id_Tipo_Autorizacao'
      Origin = 'id_Tipo_Autorizacao'
    end
    object qrySiagsNumero_Autorizacao: TLargeintField
      FieldName = 'Numero_Autorizacao'
      Origin = 'Numero_Autorizacao'
    end
    object qrySiagsid_Tipo_Atendimento: TIntegerField
      FieldName = 'id_Tipo_Atendimento'
      Origin = 'id_Tipo_Atendimento'
    end
    object qrySiagsAnexo_Opme: TStringField
      FieldName = 'Anexo_Opme'
      Origin = 'Anexo_Opme'
      Size = 3
    end
    object qrySiagsAnexo_Quimio: TStringField
      FieldName = 'Anexo_Quimio'
      Origin = 'Anexo_Quimio'
      Size = 3
    end
    object qrySiagsAnexo_Radio: TStringField
      FieldName = 'Anexo_Radio'
      Origin = 'Anexo_Radio'
      Size = 3
    end
    object qrySiagsid_Beneficiario: TIntegerField
      FieldName = 'id_Beneficiario'
      Origin = 'id_Beneficiario'
    end
    object qrySiagsid_Tipo_Situacao_Autorizacao: TIntegerField
      FieldName = 'id_Tipo_Situacao_Autorizacao'
      Origin = 'id_Tipo_Situacao_Autorizacao'
    end
    object qrySiagsid_Tipo_Ultima_Anotacao: TIntegerField
      FieldName = 'id_Tipo_Ultima_Anotacao'
      Origin = 'id_Tipo_Ultima_Anotacao'
    end
    object qrySiagsid_Tipo_Auditoria: TIntegerField
      FieldName = 'id_Tipo_Auditoria'
      Origin = 'id_Tipo_Auditoria'
    end
    object qrySiagsDia_Inclusao: TIntegerField
      FieldName = 'Dia_Inclusao'
      Origin = 'Dia_Inclusao'
    end
    object qrySiagsDias_Corridos_Base: TIntegerField
      FieldName = 'Dias_Corridos_Base'
      Origin = 'Dias_Corridos_Base'
    end
    object qrySiagsDias_Uteis_Base: TIntegerField
      FieldName = 'Dias_Uteis_Base'
      Origin = 'Dias_Uteis_Base'
    end
    object qrySiagsDias_Prazo_Caixa: TIntegerField
      FieldName = 'Dias_Prazo_Caixa'
      Origin = 'Dias_Prazo_Caixa'
    end
    object qrySiagsData_Prazo_Caixa: TDateTimeField
      FieldName = 'Data_Prazo_Caixa'
      Origin = 'Data_Prazo_Caixa'
    end
    object qrySiagsid_Tipo_Prazo_Caixa: TIntegerField
      FieldName = 'id_Tipo_Prazo_Caixa'
      Origin = 'id_Tipo_Prazo_Caixa'
    end
    object qrySiagsDias_Prazo_ANS: TIntegerField
      FieldName = 'Dias_Prazo_ANS'
      Origin = 'Dias_Prazo_ANS'
    end
    object qrySiagsData_Prazo_ANS: TDateTimeField
      FieldName = 'Data_Prazo_ANS'
      Origin = 'Data_Prazo_ANS'
    end
    object qrySiagsid_Tipo_Prazo_ANS: TIntegerField
      FieldName = 'id_Tipo_Prazo_ANS'
      Origin = 'id_Tipo_Prazo_ANS'
    end
    object qrySiagsData_Hora_Importacao: TDateTimeField
      FieldName = 'Data_Hora_Importacao'
      Origin = 'Data_Hora_Importacao'
    end
    object qrySiagsid_Usuario_Importacao: TIntegerField
      FieldName = 'id_Usuario_Importacao'
      Origin = 'id_Usuario_Importacao'
    end
    object qrySiagsid_Setor_Designado: TIntegerField
      FieldName = 'id_Setor_Designado'
      Origin = 'id_Setor_Designado'
    end
    object qrySiagsid_Usuario_Designado: TIntegerField
      FieldName = 'id_Usuario_Designado'
      Origin = 'id_Usuario_Designado'
    end
    object qrySiagsid_Responsavel_Designacao: TIntegerField
      FieldName = 'id_Responsavel_Designacao'
      Origin = 'id_Responsavel_Designacao'
    end
    object qrySiagsData_Hora_Designacao: TDateTimeField
      FieldName = 'Data_Hora_Designacao'
      Origin = 'Data_Hora_Designacao'
    end
    object qrySiagsJustificativa_Designacao: TStringField
      FieldName = 'Justificativa_Designacao'
      Origin = 'Justificativa_Designacao'
      Size = 100
    end
    object qrySiagsData_Hora_Encerramento: TDateTimeField
      FieldName = 'Data_Hora_Encerramento'
      Origin = 'Data_Hora_Encerramento'
    end
    object qrySiagsid_Usuario_Encerramento: TIntegerField
      FieldName = 'id_Usuario_Encerramento'
      Origin = 'id_Usuario_Encerramento'
    end
    object qrySiagsJustificativa_Encerramento: TStringField
      FieldName = 'Justificativa_Encerramento'
      Origin = 'Justificativa_Encerramento'
      Size = 100
    end
  end
  object qrySiagsHistorico: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'Select * from Siags_Historico'
      'where id_Siags = :pIdSiags')
    Left = 616
    Top = 104
    ParamData = <
      item
        Name = 'PIDSIAGS'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qrySiagsHistoricoid: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qrySiagsHistoricoid_Siags: TLargeintField
      FieldName = 'id_Siags'
      Origin = 'id_Siags'
    end
    object qrySiagsHistoricoid_Tipo_Autorizacao: TIntegerField
      FieldName = 'id_Tipo_Autorizacao'
      Origin = 'id_Tipo_Autorizacao'
    end
    object qrySiagsHistoricoid_Tipo_Atendimento: TIntegerField
      FieldName = 'id_Tipo_Atendimento'
      Origin = 'id_Tipo_Atendimento'
    end
    object qrySiagsHistoricoAnexo_Opme: TStringField
      FieldName = 'Anexo_Opme'
      Origin = 'Anexo_Opme'
      Size = 3
    end
    object qrySiagsHistoricoAnexo_Quimio: TStringField
      FieldName = 'Anexo_Quimio'
      Origin = 'Anexo_Quimio'
      Size = 3
    end
    object qrySiagsHistoricoAnexo_Radio: TStringField
      FieldName = 'Anexo_Radio'
      Origin = 'Anexo_Radio'
      Size = 3
    end
    object qrySiagsHistoricoid_Tipo_Situacao_Autorizacao: TIntegerField
      FieldName = 'id_Tipo_Situacao_Autorizacao'
      Origin = 'id_Tipo_Situacao_Autorizacao'
    end
    object qrySiagsHistoricoid_Tipo_Ultima_Anotacao: TIntegerField
      FieldName = 'id_Tipo_Ultima_Anotacao'
      Origin = 'id_Tipo_Ultima_Anotacao'
    end
    object qrySiagsHistoricoid_Tipo_Auditoria: TIntegerField
      FieldName = 'id_Tipo_Auditoria'
      Origin = 'id_Tipo_Auditoria'
    end
    object qrySiagsHistoricoDias_Corridos_Base: TIntegerField
      FieldName = 'Dias_Corridos_Base'
      Origin = 'Dias_Corridos_Base'
    end
    object qrySiagsHistoricoDias_Uteis_Base: TIntegerField
      FieldName = 'Dias_Uteis_Base'
      Origin = 'Dias_Uteis_Base'
    end
    object qrySiagsHistoricoDias_Prazo_Caixa: TIntegerField
      FieldName = 'Dias_Prazo_Caixa'
      Origin = 'Dias_Prazo_Caixa'
    end
    object qrySiagsHistoricoid_Tipo_Prazo_Caixa: TIntegerField
      FieldName = 'id_Tipo_Prazo_Caixa'
      Origin = 'id_Tipo_Prazo_Caixa'
    end
    object qrySiagsHistoricoDias_Prazo_ANS: TIntegerField
      FieldName = 'Dias_Prazo_ANS'
      Origin = 'Dias_Prazo_ANS'
    end
    object qrySiagsHistoricoid_Tipo_Prazo_ANS: TIntegerField
      FieldName = 'id_Tipo_Prazo_ANS'
      Origin = 'id_Tipo_Prazo_ANS'
    end
    object qrySiagsHistoricoid_Usuario_Responsavel: TIntegerField
      FieldName = 'id_Usuario_Responsavel'
      Origin = 'id_Usuario_Responsavel'
    end
    object qrySiagsHistoricoData_Hora_Historico: TDateTimeField
      FieldName = 'Data_Hora_Historico'
      Origin = 'Data_Hora_Historico'
    end
  end
  object qryPainelSiags: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'select '
      
        '   a.id as id_Processo, a.uf, a.Numero_Autorizacao, a.Anexo_Opme' +
        ', a.Anexo_Quimio, a.Anexo_Radio,'
      
        '   a.Dia_Inclusao, a.Dias_Corridos_Base, a.Dias_Uteis_Base, a.Di' +
        'as_Prazo_Caixa, a.Data_Prazo_Caixa,'
      '   a.Dias_Prazo_ANS, a.Data_Prazo_ANS, '
      '   b.Tipo_Autorizacao,'
      '   c.Tipo_Atendimento,'
      '   d.Numero_Beneficiario, d.Nome_Beneficiario,'
      '   e.Tipo_Situacao_Autorizacao,'
      '   f.Tipo_Ultima_Anotacao,'
      '   g.Tipo_Auditoria,'
      '   h.Tipo_Prazo_Caixa,'
      '   i.Tipo_Prazo_Caixa as Tipo_Prazo_Ans,'
      '   j.Nome_Usuario as Usuario_Designado,'
      '   k.Nome_Setor, '
      '   1 as Qtd_Historicos,'
      '   1 as Qtd_Designacoes,'
      '   1 as Qtd_Observacoes'
      'From Siags a'
      
        '     INNER JOIN Tipos_Autorizacao b on b.id = a.id_Tipo_Autoriza' +
        'cao'
      
        '     INNER JOIN Tipos_Atendimento c on c.id = a.id_Tipo_Atendime' +
        'nto'
      #9' INNER JOIN Beneficiarios d on d.id = a.id_Beneficiario'
      
        #9' INNER JOIN Tipos_Situacao_Autorizacao e on e.id = a.id_Tipo_Si' +
        'tuacao_Autorizacao'
      
        #9' INNER JOIN Tipos_Ultima_Anotacao f on f.id = a.id_Tipo_Ultima_' +
        'Anotacao'
      #9' INNER JOIN Tipos_Auditoria g on g.id = a.id_Tipo_Auditoria '
      #9' INNER JOIN Tipos_Prazo h on h.id = a.id_Tipo_Prazo_Caixa '
      #9' INNER JOIN Tipos_Prazo i on i.id = a.id_Tipo_Prazo_ANS'
      #9' LEFT OUTER JOIN Usuarios j on j.id = a.id_Usuario_Designado'
      #9' LEFT OUTER JOIN Setores k on k.id = a.id_Setor_Designado'
      'where 1 = 1')
    Left = 744
    Top = 24
    object qryPainelSiagsid_Processo: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id_Processo'
      Origin = 'id_Processo'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object qryPainelSiagsuf: TStringField
      FieldName = 'uf'
      Origin = 'uf'
      Size = 2
    end
    object qryPainelSiagsNumero_Autorizacao: TLargeintField
      FieldName = 'Numero_Autorizacao'
      Origin = 'Numero_Autorizacao'
    end
    object qryPainelSiagsAnexo_Opme: TStringField
      FieldName = 'Anexo_Opme'
      Origin = 'Anexo_Opme'
      Size = 3
    end
    object qryPainelSiagsAnexo_Quimio: TStringField
      FieldName = 'Anexo_Quimio'
      Origin = 'Anexo_Quimio'
      Size = 3
    end
    object qryPainelSiagsAnexo_Radio: TStringField
      FieldName = 'Anexo_Radio'
      Origin = 'Anexo_Radio'
      Size = 3
    end
    object qryPainelSiagsDia_Inclusao: TIntegerField
      FieldName = 'Dia_Inclusao'
      Origin = 'Dia_Inclusao'
    end
    object qryPainelSiagsDias_Corridos_Base: TIntegerField
      FieldName = 'Dias_Corridos_Base'
      Origin = 'Dias_Corridos_Base'
    end
    object qryPainelSiagsDias_Uteis_Base: TIntegerField
      FieldName = 'Dias_Uteis_Base'
      Origin = 'Dias_Uteis_Base'
    end
    object qryPainelSiagsDias_Prazo_Caixa: TIntegerField
      FieldName = 'Dias_Prazo_Caixa'
      Origin = 'Dias_Prazo_Caixa'
    end
    object qryPainelSiagsData_Prazo_Caixa: TDateTimeField
      FieldName = 'Data_Prazo_Caixa'
      Origin = 'Data_Prazo_Caixa'
    end
    object qryPainelSiagsDias_Prazo_ANS: TIntegerField
      FieldName = 'Dias_Prazo_ANS'
      Origin = 'Dias_Prazo_ANS'
    end
    object qryPainelSiagsData_Prazo_ANS: TDateTimeField
      FieldName = 'Data_Prazo_ANS'
      Origin = 'Data_Prazo_ANS'
    end
    object qryPainelSiagsTipo_Autorizacao: TStringField
      FieldName = 'Tipo_Autorizacao'
      Origin = 'Tipo_Autorizacao'
      Size = 50
    end
    object qryPainelSiagsTipo_Atendimento: TStringField
      FieldName = 'Tipo_Atendimento'
      Origin = 'Tipo_Atendimento'
      Size = 30
    end
    object qryPainelSiagsNumero_Beneficiario: TStringField
      FieldName = 'Numero_Beneficiario'
      Origin = 'Numero_Beneficiario'
      Size = 15
    end
    object qryPainelSiagsNome_Beneficiario: TStringField
      FieldName = 'Nome_Beneficiario'
      Origin = 'Nome_Beneficiario'
      Size = 100
    end
    object qryPainelSiagsTipo_Situacao_Autorizacao: TStringField
      FieldName = 'Tipo_Situacao_Autorizacao'
      Origin = 'Tipo_Situacao_Autorizacao'
      Size = 30
    end
    object qryPainelSiagsTipo_Ultima_Anotacao: TStringField
      FieldName = 'Tipo_Ultima_Anotacao'
      Origin = 'Tipo_Ultima_Anotacao'
      Size = 30
    end
    object qryPainelSiagsTipo_Auditoria: TStringField
      FieldName = 'Tipo_Auditoria'
      Origin = 'Tipo_Auditoria'
      Size = 15
    end
    object qryPainelSiagsTipo_Prazo_Caixa: TStringField
      FieldName = 'Tipo_Prazo_Caixa'
      Origin = 'Tipo_Prazo_Caixa'
      Size = 15
    end
    object qryPainelSiagsTipo_Prazo_Ans: TStringField
      FieldName = 'Tipo_Prazo_Ans'
      Origin = 'Tipo_Prazo_Ans'
      Size = 15
    end
    object qryPainelSiagsUsuario_Designado: TStringField
      FieldName = 'Usuario_Designado'
      Origin = 'Usuario_Designado'
      Size = 100
    end
    object qryPainelSiagsNome_Setor: TStringField
      FieldName = 'Nome_Setor'
      Origin = 'Nome_Setor'
      Size = 50
    end
    object qryPainelSiagsQtd_Historicos: TIntegerField
      FieldName = 'Qtd_Historicos'
      Origin = 'Qtd_Historicos'
      ReadOnly = True
      Required = True
    end
    object qryPainelSiagsQtd_Designacoes: TIntegerField
      FieldName = 'Qtd_Designacoes'
      Origin = 'Qtd_Designacoes'
      ReadOnly = True
      Required = True
    end
    object qryPainelSiagsQtd_Observacoes: TIntegerField
      FieldName = 'Qtd_Observacoes'
      Origin = 'Qtd_Observacoes'
      ReadOnly = True
      Required = True
    end
  end
  object qrySetores: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'Select id, Nome_Setor'
      'from Setores'
      'where Ativo = '#39'Sim'#39
      '      and Siags = '#39'Sim'#39
      'Order by Nome_Setor')
    Left = 248
    Top = 32
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
  object qrySiagsLog: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'Select * from Siags_Log'
      'where id_Siags = :pIdSiags')
    Left = 616
    Top = 176
    ParamData = <
      item
        Name = 'PIDSIAGS'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qrySiagsLogid: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qrySiagsLogid_Siags: TLargeintField
      FieldName = 'id_Siags'
      Origin = 'id_Siags'
    end
    object qrySiagsLogid_Setor_Designado: TIntegerField
      FieldName = 'id_Setor_Designado'
      Origin = 'id_Setor_Designado'
    end
    object qrySiagsLogid_Usuario_Designado: TIntegerField
      FieldName = 'id_Usuario_Designado'
      Origin = 'id_Usuario_Designado'
    end
    object qrySiagsLogid_Usuario_Responsavel: TIntegerField
      FieldName = 'id_Usuario_Responsavel'
      Origin = 'id_Usuario_Responsavel'
    end
    object qrySiagsLogJustificativa: TStringField
      FieldName = 'Justificativa'
      Origin = 'Justificativa'
      Size = 100
    end
    object qrySiagsLogData_Hora_Log: TDateTimeField
      FieldName = 'Data_Hora_Log'
      Origin = 'Data_Hora_Log'
    end
  end
  object qryTiposAuditoria: TFDQuery
    Connection = ServerContainer.FDConnection
    UpdateOptions.UpdateTableName = 'ControleDeTarefas.dbo.Tipos_Auditoria'
    SQL.Strings = (
      'Declare @SIAGS int;'
      'Set @SIAGS = :SIAGS;'
      ''
      'select * from Tipos_Auditoria'
      'where @SIAGS = 9 or SIAGS = @SIAGS '
      'Order by Tipo_Auditoria')
    Left = 248
    Top = 106
    ParamData = <
      item
        Name = 'SIAGS'
        ParamType = ptInput
      end>
    object qryTiposAuditoriaid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ReadOnly = True
    end
    object qryTiposAuditoriaTipo_Auditoria: TStringField
      FieldName = 'Tipo_Auditoria'
      Origin = 'Tipo_Auditoria'
      Size = 15
    end
    object qryTiposAuditoriaAUTOSC: TIntegerField
      FieldName = 'AUTOSC'
      Origin = 'AUTOSC'
    end
    object qryTiposAuditoriaSIAGS: TIntegerField
      FieldName = 'SIAGS'
      Origin = 'SIAGS'
    end
    object qryTiposAuditoriaCONTROLPC: TIntegerField
      FieldName = 'CONTROLPC'
      Origin = 'CONTROLPC'
    end
  end
  object qryTiposUltimaAnotacao: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'select * from Tipos_Ultima_Anotacao'
      'Order by Tipo_Ultima_Anotacao')
    Left = 248
    Top = 486
    object qryTiposUltimaAnotacaoid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryTiposUltimaAnotacaoTipo_Ultima_Anotacao: TStringField
      FieldName = 'Tipo_Ultima_Anotacao'
      Origin = 'Tipo_Ultima_Anotacao'
      Size = 30
    end
  end
  object qryBeneficiarios: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'select * from Beneficiarios'
      'Order by Nome_Beneficiario')
    Left = 248
    Top = 560
    object qryBeneficiariosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryBeneficiariosNumero_Beneficiario: TStringField
      FieldName = 'Numero_Beneficiario'
      Origin = 'Numero_Beneficiario'
      Size = 15
    end
    object qryBeneficiariosNome_Beneficiario: TStringField
      FieldName = 'Nome_Beneficiario'
      Origin = 'Nome_Beneficiario'
      Size = 100
    end
  end
end
