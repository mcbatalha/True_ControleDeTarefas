object SMAutoSC: TSMAutoSC
  OldCreateOrder = False
  Height = 445
  Width = 1227
  object qryAux: TFDQuery
    Connection = ServerContainer.FDConnection
    Left = 1112
    Top = 24
  end
  object qryTiposAuditoria: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'select * from Tipos_Auditoria')
    Left = 80
    Top = 24
    object qryTiposAuditoriaid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryTiposAuditoriaTipo_Auditoria: TStringField
      FieldName = 'Tipo_Auditoria'
      Origin = 'Tipo_Auditoria'
      Size = 15
    end
  end
  object qryTiposPrazo: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'select * from Tipos_Prazo')
    Left = 80
    Top = 104
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
  end
  object qryTiposPrazoHoje: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'select * from Tipos_Prazo_Hoje')
    Left = 80
    Top = 176
    object qryTiposPrazoHojeid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryTiposPrazoHojeTipo_Prazo_Caixa_Hoje: TStringField
      FieldName = 'Tipo_Prazo_Caixa_Hoje'
      Origin = 'Tipo_Prazo_Caixa_Hoje'
      Size = 15
    end
  end
  object qryTiposProcesso: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'select * from Tipos_Processo')
    Left = 80
    Top = 248
    object qryTiposProcessoid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryTiposProcessoTipo_Processo: TStringField
      FieldName = 'Tipo_Processo'
      Origin = 'Tipo_Processo'
      Size = 50
    end
  end
  object qryTiposProcessoE: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'select * from Tipos_Processo_E')
    Left = 80
    Top = 312
    object qryTiposProcessoEid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryTiposProcessoETipo_Processo_E: TStringField
      FieldName = 'Tipo_Processo_E'
      Origin = 'Tipo_Processo_E'
    end
  end
  object qryTiposStatus: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'select * from Tipos_Status')
    Left = 80
    Top = 376
    object qryTiposStatusid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryTiposStatusTipo_Status: TStringField
      FieldName = 'Tipo_Status'
      Origin = 'Tipo_Status'
      Size = 15
    end
  end
  object qryAutoSc: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'Select * from AutoSC'
      'where Numero_Processo = :pNumeroProcesso')
    Left = 240
    Top = 24
    ParamData = <
      item
        Name = 'PNUMEROPROCESSO'
        DataType = ftLargeint
        ParamType = ptInput
        Value = Null
      end>
    object qryAutoScid: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryAutoScNumero_Processo: TLargeintField
      FieldName = 'Numero_Processo'
      Origin = 'Numero_Processo'
    end
    object qryAutoScid_Tipo_Auditoria: TIntegerField
      FieldName = 'id_Tipo_Auditoria'
      Origin = 'id_Tipo_Auditoria'
    end
    object qryAutoScid_Tipo_Prazo_Caixa: TIntegerField
      FieldName = 'id_Tipo_Prazo_Caixa'
      Origin = 'id_Tipo_Prazo_Caixa'
    end
    object qryAutoScid_Tipo_Prazo_Caixa_Hoje: TIntegerField
      FieldName = 'id_Tipo_Prazo_Caixa_Hoje'
      Origin = 'id_Tipo_Prazo_Caixa_Hoje'
    end
    object qryAutoScid_Tipo_Status: TIntegerField
      FieldName = 'id_Tipo_Status'
      Origin = 'id_Tipo_Status'
    end
    object qryAutoScid_Tipo_Processo: TIntegerField
      FieldName = 'id_Tipo_Processo'
      Origin = 'id_Tipo_Processo'
    end
    object qryAutoScData_Status: TDateTimeField
      FieldName = 'Data_Status'
      Origin = 'Data_Status'
    end
    object qryAutoScQtd_Arquivos: TIntegerField
      FieldName = 'Qtd_Arquivos'
      Origin = 'Qtd_Arquivos'
    end
    object qryAutoScUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
    object qryAutoScid_Tipo_Processo_E: TIntegerField
      FieldName = 'id_Tipo_Processo_E'
      Origin = 'id_Tipo_Processo_E'
    end
    object qryAutoScid_Tipo_Prazo_ANS: TIntegerField
      FieldName = 'id_Tipo_Prazo_ANS'
      Origin = 'id_Tipo_Prazo_ANS'
    end
    object qryAutoScData_Hora_Importacao: TDateTimeField
      FieldName = 'Data_Hora_Importacao'
      Origin = 'Data_Hora_Importacao'
    end
    object qryAutoScid_Usuario_Importacao: TIntegerField
      FieldName = 'id_Usuario_Importacao'
      Origin = 'id_Usuario_Importacao'
    end
    object qryAutoScid_Setor_Designado: TIntegerField
      FieldName = 'id_Setor_Designado'
      Origin = 'id_Setor_Designado'
    end
    object qryAutoScid_Usuario_Designado: TIntegerField
      FieldName = 'id_Usuario_Designado'
      Origin = 'id_Usuario_Designado'
    end
  end
  object qryAutoScHistorico: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'Select * from AutoSC_Historico'
      'where id_AutoSC = :pIdAutoSC')
    Left = 240
    Top = 112
    ParamData = <
      item
        Name = 'PIDAUTOSC'
        DataType = ftLargeint
        ParamType = ptInput
        Value = Null
      end>
    object qryAutoScHistoricoid: TLargeintField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryAutoScHistoricoid_AutoSC: TLargeintField
      FieldName = 'id_AutoSC'
      Origin = 'id_AutoSC'
    end
    object qryAutoScHistoricoid_Tipo_Prazo_Caixa: TIntegerField
      FieldName = 'id_Tipo_Prazo_Caixa'
      Origin = 'id_Tipo_Prazo_Caixa'
    end
    object qryAutoScHistoricoid_Tipo_Prazo_Caixa_Hoje: TIntegerField
      FieldName = 'id_Tipo_Prazo_Caixa_Hoje'
      Origin = 'id_Tipo_Prazo_Caixa_Hoje'
    end
    object qryAutoScHistoricoid_Tipo_Status: TIntegerField
      FieldName = 'id_Tipo_Status'
      Origin = 'id_Tipo_Status'
    end
    object qryAutoScHistoricoData_Status: TDateTimeField
      FieldName = 'Data_Status'
      Origin = 'Data_Status'
    end
    object qryAutoScHistoricoid_Usuario_Responsavel: TIntegerField
      FieldName = 'id_Usuario_Responsavel'
      Origin = 'id_Usuario_Responsavel'
    end
  end
  object qryPainelAutoSc: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'select '
      
        '   a.id as id_Processo, a.Numero_Processo, a.Data_Status, a.Qtd_' +
        'Arquivos, a.uf,'
      '   b.Tipo_Auditoria,'
      '   c.Tipo_Prazo_Caixa,'
      '   d.Tipo_Prazo_Caixa_Hoje,'
      '   e.Tipo_Status,'
      '   f.Tipo_Processo,'
      '   g.Tipo_Processo_E,'
      '   h.Tipo_Prazo_Caixa as Tipo_Prazo_Ans,'
      '   i.Nome_Usuario as Usuario_Designado'
      'From AutoSc a'
      '     INNER JOIN Tipos_Auditoria b on b.id = a.id_Tipo_Auditoria'
      #9' INNER JOIN Tipos_Prazo c on c.id = a.id_Tipo_Prazo_Caixa '
      
        #9' INNER JOIN Tipos_Prazo_Hoje d on d.id = a.id_Tipo_Prazo_Caixa_' +
        'Hoje '
      #9' INNER JOIN Tipos_Status e on e.id = a.id_Tipo_Status'
      'left outer join Tipos_Processo f on f.id = a.id_Tipo_Processo'
      #9' INNER JOIN Tipos_Processo_E g on g.id = a.id_Tipo_Processo_E'
      #9' INNER JOIN Tipos_Prazo h on h.id = a.id_Tipo_Prazo_ANS'
      #9' LEFT OUTER JOIN Usuarios i on i.id = a.id_Usuario_Designado'
      #9' LEFT OUTER JOIN Setores j on j.id = a.id_Setor_Designado'
      'where 1 = 1')
    Left = 368
    Top = 24
    object qryPainelAutoScid_Processo: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id_Processo'
      Origin = 'id_Processo'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object qryPainelAutoScNumero_Processo: TLargeintField
      FieldName = 'Numero_Processo'
      Origin = 'Numero_Processo'
    end
    object qryPainelAutoScData_Status: TDateTimeField
      FieldName = 'Data_Status'
      Origin = 'Data_Status'
    end
    object qryPainelAutoScQtd_Arquivos: TIntegerField
      FieldName = 'Qtd_Arquivos'
      Origin = 'Qtd_Arquivos'
    end
    object qryPainelAutoScuf: TStringField
      FieldName = 'uf'
      Origin = 'uf'
      Size = 2
    end
    object qryPainelAutoScTipo_Auditoria: TStringField
      FieldName = 'Tipo_Auditoria'
      Origin = 'Tipo_Auditoria'
      Size = 15
    end
    object qryPainelAutoScTipo_Prazo_Caixa: TStringField
      FieldName = 'Tipo_Prazo_Caixa'
      Origin = 'Tipo_Prazo_Caixa'
      Size = 15
    end
    object qryPainelAutoScTipo_Prazo_Caixa_Hoje: TStringField
      FieldName = 'Tipo_Prazo_Caixa_Hoje'
      Origin = 'Tipo_Prazo_Caixa_Hoje'
      Size = 15
    end
    object qryPainelAutoScTipo_Status: TStringField
      FieldName = 'Tipo_Status'
      Origin = 'Tipo_Status'
      Size = 15
    end
    object qryPainelAutoScTipo_Processo: TStringField
      FieldName = 'Tipo_Processo'
      Origin = 'Tipo_Processo'
      Size = 50
    end
    object qryPainelAutoScTipo_Processo_E: TStringField
      FieldName = 'Tipo_Processo_E'
      Origin = 'Tipo_Processo_E'
    end
    object qryPainelAutoScTipo_Prazo_Ans: TStringField
      FieldName = 'Tipo_Prazo_Ans'
      Origin = 'Tipo_Prazo_Ans'
      Size = 15
    end
    object qryPainelAutoScUsuario_Designado: TStringField
      FieldName = 'Usuario_Designado'
      Origin = 'Usuario_Designado'
      Size = 100
    end
  end
end
