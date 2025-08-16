object SMResumos: TSMResumos
  OldCreateOrder = False
  Height = 619
  Width = 836
  object qryAux: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'Select'
      ' (Select count(*) '
      '  From Siags '
      '  where Data_Hora_Encerramento is null) as Qtd_Siags,'
      ''
      ' (Select count(*) '
      '  From Siags '
      '  where Data_Hora_Encerramento is null'
      '        and id_Tipo_Prazo_Caixa = 3) as Qtd_Siags_Prazo_True,'
      ' (Select count(*)'
      '  From Siags '
      '  where Data_Hora_Encerramento is null'
      '        and id_Tipo_Prazo_ANS = 3) as Qtd_Siags_Prazo_Ans,'
      ''
      '     '
      ' (Select count(*) '
      '  From AutoSc '
      '  where Data_Hora_Encerramento is null) as Qtd_AutoSc,'
      ''
      ' (Select count(*) '
      '  From AutoSc '
      '  where Data_Hora_Encerramento is null'
      '        and id_Tipo_Prazo_Caixa = 3) as Qtd_AutoSc_Prazo_True,'
      ' (Select count(*)'
      '  From AutoSc '
      '  where Data_Hora_Encerramento is null'
      '        and id_Tipo_Prazo_ANS = 3) as Qtd_AutoSc_Prazo_Ans,'
      ''
      ' (Select count(*) '
      '  From ControlPc '
      '  where Data_Hora_Encerramento is null) as Qtd_ControlPc,'
      ''
      ' (Select count(*) '
      '  From ControlPc '
      '  where Data_Hora_Encerramento is null'
      '        and id_Tipo_Prazo = 6) as Qtd_ControlPc_Prazo_True')
    Left = 709
    Top = 32
  end
  object qryQuadroResumo: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'Select'
      ' (Select count(*) '
      '  From Siags '
      '  where Data_Hora_Encerramento is null) as Qtd_Siags,'
      ''
      ' (Select count(*) '
      '  From Siags '
      '  where Data_Hora_Encerramento is null'
      
        '        and cast(Data_Prazo_Caixa as Date) <  cast(getDate() as ' +
        'Date)) as Qtd_Siags_Vencidos,'
      ' '
      ' (Select count(*) '
      '  From Siags '
      '  where Data_Hora_Encerramento is null'
      
        '        and cast(Data_Prazo_Caixa as Date) =  cast(getDate() as ' +
        'Date)) as Qtd_Siags_Vence_Hoje,'
      ' '
      ' (Select count(*) '
      '  From Siags '
      '  where Data_Hora_Encerramento is null'
      
        '        and cast(Data_Prazo_Caixa as Date) =  cast(getDate() + 1' +
        ' as Date)) as Qtd_Siags_Vence_Amanha,'
      ''
      ' (Select count(*) '
      '  From Siags '
      '  where Data_Hora_Encerramento is null'
      
        '        and cast(Data_Prazo_Caixa as Date) >  cast(getDate() + 1' +
        ' as Date)) as Qtd_Siags_Com_Prazo,'
      ''
      ' (Select count(*) '
      '  From ControlPc '
      '  where Data_Hora_Encerramento is null) as Qtd_ControlPc,'
      ''
      ' (Select count(*) '
      '  From ControlPc '
      '  where Data_Hora_Encerramento is null'
      
        '        and cast(Previsao_Solucao as Date) <  cast(getDate() as ' +
        'Date)) as Qtd_ControlPc_Vencidos,'
      ' '
      ' (Select count(*) '
      '  From ControlPc '
      '  where Data_Hora_Encerramento is null'
      
        '        and cast(Previsao_Solucao as Date) =  cast(getDate() as ' +
        'Date)) as Qtd_ControlPc_Vence_Hoje,'
      ' '
      ' (Select count(*) '
      '  From ControlPc '
      '  where Data_Hora_Encerramento is null'
      
        '        and cast(Previsao_Solucao as Date) =  cast(getDate() + 1' +
        ' as Date)) as Qtd_ControlPc_Vence_Amanha,'
      ''
      ' (Select count(*) '
      '  From ControlPc '
      '  where Data_Hora_Encerramento is null'
      
        '        and cast(Previsao_Solucao as Date) >  cast(getDate() + 1' +
        ' as Date)) as Qtd_ControlPc_Com_Prazo')
    Left = 77
    Top = 32
    object qryQuadroResumoQtd_Siags: TIntegerField
      FieldName = 'Qtd_Siags'
      Origin = 'Qtd_Siags'
      ReadOnly = True
    end
    object qryQuadroResumoQtd_Siags_Vencidos: TIntegerField
      FieldName = 'Qtd_Siags_Vencidos'
      Origin = 'Qtd_Siags_Vencidos'
      ReadOnly = True
    end
    object qryQuadroResumoQtd_Siags_Vence_Hoje: TIntegerField
      FieldName = 'Qtd_Siags_Vence_Hoje'
      Origin = 'Qtd_Siags_Vence_Hoje'
      ReadOnly = True
    end
    object qryQuadroResumoQtd_Siags_Vence_Amanha: TIntegerField
      FieldName = 'Qtd_Siags_Vence_Amanha'
      Origin = 'Qtd_Siags_Vence_Amanha'
      ReadOnly = True
    end
    object qryQuadroResumoQtd_Siags_Com_Prazo: TIntegerField
      FieldName = 'Qtd_Siags_Com_Prazo'
      Origin = 'Qtd_Siags_Com_Prazo'
      ReadOnly = True
    end
    object qryQuadroResumoQtd_ControlPc: TIntegerField
      FieldName = 'Qtd_ControlPc'
      Origin = 'Qtd_ControlPc'
      ReadOnly = True
    end
    object qryQuadroResumoQtd_ControlPc_Vencidos: TIntegerField
      FieldName = 'Qtd_ControlPc_Vencidos'
      Origin = 'Qtd_ControlPc_Vencidos'
      ReadOnly = True
    end
    object qryQuadroResumoQtd_ControlPc_Vence_Hoje: TIntegerField
      FieldName = 'Qtd_ControlPc_Vence_Hoje'
      Origin = 'Qtd_ControlPc_Vence_Hoje'
      ReadOnly = True
    end
    object qryQuadroResumoQtd_ControlPc_Vence_Amanha: TIntegerField
      FieldName = 'Qtd_ControlPc_Vence_Amanha'
      Origin = 'Qtd_ControlPc_Vence_Amanha'
      ReadOnly = True
    end
    object qryQuadroResumoQtd_ControlPc_Com_Prazo: TIntegerField
      FieldName = 'Qtd_ControlPc_Com_Prazo'
      Origin = 'Qtd_ControlPc_Com_Prazo'
      ReadOnly = True
    end
  end
  object qrySiagsVencidos: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'Select '
      '       Nome_Setor, '
      '       isnull(v.Qtd,0) as Qtd_Vencido, '
      '       isnull(vh.Qtd,0) as Qtd_VenceHoje,'
      '       isnull(vA.Qtd,0) as Qtd_VenceAmanha'
      'From Setores s'
      
        '     Left Outer Join (Select count(*) Qtd, isnull(id_Setor_Desig' +
        'nado,0) id_Setor_Designado'
      '                      From Siags '
      '                      where Data_Hora_Encerramento is null'
      
        '                            and cast(Data_Prazo_Caixa as Date) <' +
        '  cast(getDate() as Date)'
      
        '                      Group by id_Setor_Designado) v on (v.id_Se' +
        'tor_Designado = s.id) '
      
        '     Left Outer Join (Select count(*) Qtd, isnull(id_Setor_Desig' +
        'nado,0) id_Setor_Designado'
      '                      From Siags '
      '                      where Data_Hora_Encerramento is null'
      
        '                            and cast(Data_Prazo_Caixa as Date) =' +
        '  cast(getDate() as Date)'
      
        '                      Group by id_Setor_Designado) vh on (vh.id_' +
        'Setor_Designado = s.id )'
      
        '     Left Outer Join (Select count(*) Qtd, isnull(id_Setor_Desig' +
        'nado,0) id_Setor_Designado'
      '                      From Siags '
      '                      where Data_Hora_Encerramento is null'
      
        '                            and cast(Data_Prazo_Caixa as Date) =' +
        '  cast(getDate() as Date)'
      
        '                      Group by id_Setor_Designado) va on (va.id_' +
        'Setor_Designado = s.id )'
      'union'
      'Select '
      '       Null as Nome_Setor, '
      '      (Select count(*) Qtd'
      '       From Siags '
      '       where Data_Hora_Encerramento is null'
      
        '             and cast(Data_Prazo_Caixa as Date) <  cast(getDate(' +
        ') as Date)'
      #9#9#9' and id_Setor_Designado is null) as  Qtd_Vencido,'
      '      (Select count(*) Qtd'
      '       From Siags '
      '       where Data_Hora_Encerramento is null'
      
        '             and cast(Data_Prazo_Caixa as Date) =  cast(getDate(' +
        ') as Date)'
      #9#9#9' and id_Setor_Designado is null) as  Qtd_VenceHoje,'
      '      (Select count(*) Qtd'
      '       From Siags '
      '       where Data_Hora_Encerramento is null'
      
        '             and cast(Data_Prazo_Caixa + 1 as Date) =  cast(getD' +
        'ate() as Date)'
      #9#9#9' and id_Setor_Designado is null) as  Qtd_VenceAmanha'
      'Order by Nome_Setor')
    Left = 77
    Top = 112
    object qrySiagsVencidosNome_Setor: TStringField
      FieldName = 'Nome_Setor'
      Origin = 'Nome_Setor'
      ReadOnly = True
      Size = 50
    end
    object qrySiagsVencidosQtd_Vencido: TIntegerField
      FieldName = 'Qtd_Vencido'
      Origin = 'Qtd_Vencido'
      ReadOnly = True
    end
    object qrySiagsVencidosQtd_VenceHoje: TIntegerField
      FieldName = 'Qtd_VenceHoje'
      Origin = 'Qtd_VenceHoje'
      ReadOnly = True
    end
    object qrySiagsVencidosQtd_VenceAmanha: TIntegerField
      FieldName = 'Qtd_VenceAmanha'
      Origin = 'Qtd_VenceAmanha'
      ReadOnly = True
    end
  end
  object qryAutoScVencidos: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      ''
      'Select '
      '       Nome_Setor, '
      '       isnull(av.Qtd,0) as Qtd_Vencido, '
      #9'   isnull(avh.Qtd,0) as Qtd_VenceHoje'
      'From Setores s'
      
        '     Left Outer Join (Select count(*) Qtd, isnull(id_Setor_Desig' +
        'nado,0) id_Setor_Designado'
      '                      From AutoSc '
      '                      where Data_Hora_Encerramento is null'
      '                            and id_Tipo_Prazo_Caixa = 3'
      
        '                      Group by id_Setor_Designado) av on (av.id_' +
        'Setor_Designado = s.id) '
      
        '     Left Outer Join (Select count(*) Qtd, isnull(id_Setor_Desig' +
        'nado,0) id_Setor_Designado'
      '                      From AutoSc '
      '                      where Data_Hora_Encerramento is null'
      '                            and id_Tipo_Prazo_Caixa = 3'
      #9#9#9#9#9#9#9'and id_Tipo_Prazo_Caixa_Hoje = 5'
      
        '                      Group by id_Setor_Designado) avh on (avh.i' +
        'd_Setor_Designado = s.id)'
      'Order by Nome_Setor'
      ''
      '')
    Left = 77
    Top = 184
    object qryAutoScVencidosNome_Setor: TStringField
      FieldName = 'Nome_Setor'
      Origin = 'Nome_Setor'
      Size = 50
    end
    object qryAutoScVencidosQtd_Vencido: TIntegerField
      FieldName = 'Qtd_Vencido'
      Origin = 'Qtd_Vencido'
      ReadOnly = True
      Required = True
    end
    object qryAutoScVencidosQtd_VenceHoje: TIntegerField
      FieldName = 'Qtd_VenceHoje'
      Origin = 'Qtd_VenceHoje'
      ReadOnly = True
      Required = True
    end
  end
  object qryControlPcVencidos: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'Select '
      '       Nome_Setor, '
      '       isnull(v.Qtd,0) as Qtd_Vencido, '
      '       isnull(vh.Qtd,0) as Qtd_VenceHoje,'
      '       isnull(vA.Qtd,0) as Qtd_VenceAmanha'
      'From Setores s'
      
        '     Left Outer Join (Select count(*) Qtd, isnull(id_Setor_Desig' +
        'nado,0) id_Setor_Designado'
      '                      From ControlPc '
      '                      where Data_Hora_Encerramento is null'
      
        '                            and cast(Previsao_Solucao as Date) <' +
        '  cast(getDate() as Date)'
      
        '                      Group by id_Setor_Designado) v on (v.id_Se' +
        'tor_Designado = s.id) '
      
        '     Left Outer Join (Select count(*) Qtd, isnull(id_Setor_Desig' +
        'nado,0) id_Setor_Designado'
      '                      From ControlPc '
      '                      where Data_Hora_Encerramento is null'
      
        '                            and cast(Previsao_Solucao as Date) =' +
        '  cast(getDate() as Date)'
      
        '                      Group by id_Setor_Designado) vh on (vh.id_' +
        'Setor_Designado = s.id )'
      
        '     Left Outer Join (Select count(*) Qtd, isnull(id_Setor_Desig' +
        'nado,0) id_Setor_Designado'
      '                      From ControlPc '
      '                      where Data_Hora_Encerramento is null'
      
        '                            and cast(Previsao_Solucao as Date) =' +
        '  cast(getDate() as Date)'
      
        '                      Group by id_Setor_Designado) va on (va.id_' +
        'Setor_Designado = s.id )'
      'union'
      'Select '
      '       Null as Nome_Setor, '
      '      (Select count(*) Qtd'
      '       From ControlPc '
      '       where Data_Hora_Encerramento is null'
      
        '             and cast(Previsao_Solucao as Date) <  cast(getDate(' +
        ') as Date)'
      #9#9#9' and id_Setor_Designado is null) as  Qtd_Vencido,'
      '      (Select count(*) Qtd'
      '       From ControlPc '
      '       where Data_Hora_Encerramento is null'
      
        '             and cast(Previsao_Solucao as Date) =  cast(getDate(' +
        ') as Date)'
      #9#9#9' and id_Setor_Designado is null) as  Qtd_VenceHoje,'
      '      (Select count(*) Qtd'
      '       From ControlPc '
      '       where Data_Hora_Encerramento is null'
      
        '             and cast(Previsao_Solucao + 1 as Date) =  cast(getD' +
        'ate() as Date)'
      #9#9#9' and id_Setor_Designado is null) as  Qtd_VenceAmanha'
      'Order by Nome_Setor')
    Left = 69
    Top = 272
    object qryControlPcVencidosNome_Setor: TStringField
      FieldName = 'Nome_Setor'
      Origin = 'Nome_Setor'
      ReadOnly = True
      Size = 50
    end
    object qryControlPcVencidosQtd_Vencido: TIntegerField
      FieldName = 'Qtd_Vencido'
      Origin = 'Qtd_Vencido'
      ReadOnly = True
    end
    object qryControlPcVencidosQtd_VenceHoje: TIntegerField
      FieldName = 'Qtd_VenceHoje'
      Origin = 'Qtd_VenceHoje'
      ReadOnly = True
    end
    object qryControlPcVencidosQtd_VenceAmanha: TIntegerField
      FieldName = 'Qtd_VenceAmanha'
      Origin = 'Qtd_VenceAmanha'
      ReadOnly = True
    end
  end
end
