object SMSiags: TSMSiags
  OldCreateOrder = False
  Height = 795
  Width = 1255
  object qryAux: TFDQuery
    Connection = ServerContainer.FDConnection
    Left = 1112
    Top = 24
  end
  object qryTiposAutorizacao: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'select * from Tipos_Autorizacao'
      'order by Tipo_Autorizacao')
    Left = 248
    Top = 112
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
    Top = 186
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
  object qrySiags: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'Select * from Siags'
      'where Numero_Autorizacao= :pNumeroAutorizacao'
      '      or id = :pIdAutorizacao')
    Left = 616
    Top = 24
    ParamData = <
      item
        Name = 'PNUMEROAUTORIZACAO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PIDAUTORIZACAO'
        ParamType = ptInput
      end>
    object qrySiagsid: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
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
    object qrySiagsid_Beneficiario: TIntegerField
      FieldName = 'id_Beneficiario'
      Origin = 'id_Beneficiario'
    end
    object qrySiagsData_Prazo_Caixa: TDateTimeField
      FieldName = 'Data_Prazo_Caixa'
      Origin = 'Data_Prazo_Caixa'
    end
    object qrySiagsData_Prazo_ANS: TDateTimeField
      FieldName = 'Data_Prazo_ANS'
      Origin = 'Data_Prazo_ANS'
    end
    object qrySiagsData_Hora_Importacao: TDateTimeField
      FieldName = 'Data_Hora_Importacao'
      Origin = 'Data_Hora_Importacao'
    end
    object qrySiagsid_Status_True: TIntegerField
      FieldName = 'id_Status_True'
      Origin = 'id_Status_True'
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
    object qrySiagsUltima_Atualizacao: TDateTimeField
      FieldName = 'Ultima_Atualizacao'
      Origin = 'Ultima_Atualizacao'
    end
    object qrySiagsid_Usuario_Ultima_Atualizacao: TIntegerField
      FieldName = 'id_Usuario_Ultima_Atualizacao'
      Origin = 'id_Usuario_Ultima_Atualizacao'
    end
    object qrySiagsDesignacao_Pendente: TStringField
      FieldName = 'Designacao_Pendente'
      Origin = 'Designacao_Pendente'
      Size = 3
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
    object qrySiagsHistoricoid_Status_True: TIntegerField
      FieldName = 'id_Status_True'
      Origin = 'id_Status_True'
    end
    object qrySiagsHistoricoData_Prazo_Caixa: TDateTimeField
      FieldName = 'Data_Prazo_Caixa'
      Origin = 'Data_Prazo_Caixa'
    end
    object qrySiagsHistoricoData_Prazo_Ans: TDateTimeField
      FieldName = 'Data_Prazo_Ans'
      Origin = 'Data_Prazo_Ans'
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
      
        '   a.id as id_Autorizacao, a.Numero_Autorizacao, a.Data_Prazo_Ca' +
        'ixa, '
      '   a.Data_Prazo_ANS, a.Designacao_Pendente, a.id_Status_True,'
      '   b.Tipo_Autorizacao,'
      '   c.Tipo_Atendimento,'
      '   d.Numero_Beneficiario, d.Nome_Beneficiario,'
      '   e.Status as Status_True, e.Tipo_Prazo, e.Prazo, e.Encerra,'
      ''
      '   j.Nome_Usuario as Usuario_Designado,'
      '   k.Nome_Setor as Setor_Designado, '
      '   1 as Qtd_Historicos,'
      '   1 as Qtd_Designacoes,'
      '   1 as Qtd_Observacoes'
      'From Siags a'
      
        '     INNER JOIN Tipos_Autorizacao b on b.id = a.id_Tipo_Autoriza' +
        'cao'
      
        '     INNER JOIN Tipos_Atendimento c on c.id = a.id_Tipo_Atendime' +
        'nto'
      '     INNER JOIN Beneficiarios d on d.id = a.id_Beneficiario'
      '     LEFT OUTER JOIN Status_True e on e.id = a.id_Status_True'
      '     LEFT OUTER JOIN Usuarios j on j.id = a.id_Usuario_Designado'
      '     LEFT OUTER JOIN Setores k on k.id = a.id_Setor_Designado'
      'where 1 = 1')
    Left = 744
    Top = 24
    object qryPainelSiagsid_Autorizacao: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id_Autorizacao'
      Origin = 'id_Autorizacao'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object qryPainelSiagsNumero_Autorizacao: TLargeintField
      FieldName = 'Numero_Autorizacao'
      Origin = 'Numero_Autorizacao'
    end
    object qryPainelSiagsData_Prazo_Caixa: TDateTimeField
      FieldName = 'Data_Prazo_Caixa'
      Origin = 'Data_Prazo_Caixa'
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
    object qryPainelSiagsStatus_True: TStringField
      FieldName = 'Status_True'
      Origin = 'Status_True'
      Size = 30
    end
    object qryPainelSiagsTipo_Prazo: TStringField
      FieldName = 'Tipo_Prazo'
      Origin = 'Tipo_Prazo'
      Size = 10
    end
    object qryPainelSiagsPrazo: TIntegerField
      FieldName = 'Prazo'
      Origin = 'Prazo'
    end
    object qryPainelSiagsEncerra: TStringField
      FieldName = 'Encerra'
      Origin = 'Encerra'
      Size = 3
    end
    object qryPainelSiagsUsuario_Designado: TStringField
      FieldName = 'Usuario_Designado'
      Origin = 'Usuario_Designado'
      Size = 100
    end
    object qryPainelSiagsSetor_Designado: TStringField
      FieldName = 'Setor_Designado'
      Origin = 'Setor_Designado'
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
    object qryPainelSiagsDesignacao_Pendente: TStringField
      FieldName = 'Designacao_Pendente'
      Origin = 'Designacao_Pendente'
      Size = 3
    end
    object qryPainelSiagsid_Status_True: TIntegerField
      FieldName = 'id_Status_True'
      Origin = 'id_Status_True'
    end
  end
  object qrySetores: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'Select a.id, a.Nome_Setor'
      'from Setores a'
      '     Inner Join Usuarios_Setores b on b.id_Setor = a.id'
      '     Inner Join Usuarios c on c.id = b.id_Usuario'
      'where a.Ativo = '#39'Sim'#39
      '      and a.Siags = '#39'Sim'#39
      '      and b.id_Usuario = :pIdUsuario'
      #9'     and c.Ativo = '#39'Sim'#39
      'Order by Nome_Setor')
    Left = 248
    Top = 32
    ParamData = <
      item
        Name = 'PIDUSUARIO'
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
  object qryBeneficiarios: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'select * from Beneficiarios'
      'Order by Nome_Beneficiario')
    Left = 248
    Top = 272
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
  object qryDesignacoesPendentes: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'Select '
      '   a.id as id_Solicitacao,'
      '   a.Data_Solicitacao,'
      '   a.Justificativa,'
      '   a.id_Autorizacao,'
      '   b.Numero_Autorizacao,'
      '   c.Nome_Usuario as Usuario_Solicitante,'
      '   d.Nome_Usuario as Usuario_Atual,'
      '   e.Nome_Usuario as Usuario_Solicitado,'
      '   f.Nome_Setor as Setor_Atual,'
      '   g.Nome_Setor as Setor_Solicitado,'
      '   h.Status as Status_True'
      'From '
      '   Siags_Designacao_Solicitacao a'
      '   Inner Join Siags b on b.id = a.id_Autorizacao'
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
      '   b.Numero_Autorizacao')
    Left = 248
    Top = 448
    object qryDesignacoesPendentesData_Solicitacao: TDateTimeField
      FieldName = 'Data_Solicitacao'
      Origin = 'Data_Solicitacao'
    end
    object qryDesignacoesPendentesJustificativa: TStringField
      FieldName = 'Justificativa'
      Origin = 'Justificativa'
      Size = 500
    end
    object qryDesignacoesPendentesid_Autorizacao: TLargeintField
      FieldName = 'id_Autorizacao'
      Origin = 'id_Autorizacao'
    end
    object qryDesignacoesPendentesNumero_Autorizacao: TLargeintField
      FieldName = 'Numero_Autorizacao'
      Origin = 'Numero_Autorizacao'
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
  object qryIncluirDesignacao: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'Select * from Siags_Designacao_Solicitacao'
      'where 1 = 2')
    Left = 250
    Top = 360
    object qryIncluirDesignacaoid: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryIncluirDesignacaoid_Autorizacao: TLargeintField
      FieldName = 'id_Autorizacao'
      Origin = 'id_Autorizacao'
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
      Size = 100
    end
    object qryIncluirDesignacaoid_Usuario_Autorizador: TIntegerField
      FieldName = 'id_Usuario_Autorizador'
      Origin = 'id_Usuario_Autorizador'
    end
  end
end
