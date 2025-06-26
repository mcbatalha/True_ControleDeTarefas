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
      '        and id_Tipo_Prazo_Caixa = 3) as Qtd_Siags_Vencidos_True,'
      ' (Select count(*)'
      '  From Siags '
      '  where Data_Hora_Encerramento is null'
      '        and id_Tipo_Prazo_ANS = 3) as Qtd_Siags_Vencidos_Ans,'
      ''
      '     '
      ' (Select count(*) '
      '  From AutoSc '
      '  where Data_Hora_Encerramento is null) as Qtd_AutoSc,'
      ''
      ' (Select count(*) '
      '  From AutoSc '
      '  where Data_Hora_Encerramento is null'
      
        '        and id_Tipo_Prazo_Caixa = 3) as Qtd_AutoSc_Vencidos_True' +
        ','
      ''
      ' (Select count(*)'
      '  From AutoSc '
      '  where Data_Hora_Encerramento is null'
      '        and id_Tipo_Prazo_ANS = 3) as Qtd_AutoSc_Vencidos_Ans,'
      ''
      ' (Select count(*) '
      '  From ControlPc '
      '  where Data_Hora_Encerramento is null) as Qtd_ControlPc,'
      ''
      ' (Select count(*) '
      '  From ControlPc '
      '  where Data_Hora_Encerramento is null'
      '        and id_Tipo_Prazo = 6) as Qtd_ControlPc_Vencidos_True')
    Left = 77
    Top = 32
    object qryQuadroResumoQtd_Siags: TIntegerField
      FieldName = 'Qtd_Siags'
      Origin = 'Qtd_Siags'
      ReadOnly = True
    end
    object qryQuadroResumoQtd_Siags_Vencidos_True: TIntegerField
      FieldName = 'Qtd_Siags_Vencidos_True'
      Origin = 'Qtd_Siags_Vencidos_True'
      ReadOnly = True
    end
    object qryQuadroResumoQtd_Siags_Vencidos_Ans: TIntegerField
      FieldName = 'Qtd_Siags_Vencidos_Ans'
      Origin = 'Qtd_Siags_Vencidos_Ans'
      ReadOnly = True
    end
    object qryQuadroResumoQtd_AutoSc: TIntegerField
      FieldName = 'Qtd_AutoSc'
      Origin = 'Qtd_AutoSc'
      ReadOnly = True
    end
    object qryQuadroResumoQtd_AutoSc_Vencidos_True: TIntegerField
      FieldName = 'Qtd_AutoSc_Vencidos_True'
      Origin = 'Qtd_AutoSc_Vencidos_True'
      ReadOnly = True
    end
    object qryQuadroResumoQtd_AutoSc_Vencidos_Ans: TIntegerField
      FieldName = 'Qtd_AutoSc_Vencidos_Ans'
      Origin = 'Qtd_AutoSc_Vencidos_Ans'
      ReadOnly = True
    end
    object qryQuadroResumoQtd_ControlPc: TIntegerField
      FieldName = 'Qtd_ControlPc'
      Origin = 'Qtd_ControlPc'
      ReadOnly = True
    end
    object qryQuadroResumoQtd_ControlPc_Vencidos_True: TIntegerField
      FieldName = 'Qtd_ControlPc_Vencidos_True'
      Origin = 'Qtd_ControlPc_Vencidos_True'
      ReadOnly = True
    end
  end
  object qrySiagsVencidos: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'Select '
      '       Nome_Setor, '
      '       isnull(sv.Qtd,0) as Qtd_Vencido, '
      '       isnull(svh.Qtd,0) as Qtd_VenceHoje'
      'From Setores s'
      
        '     Left Outer Join (Select count(*) Qtd, isnull(id_Setor_Desig' +
        'nado,0) id_Setor_Designado'
      '                      From Siags '
      '                      where Data_Hora_Encerramento is null'
      '                            and id_Tipo_Prazo_Caixa = 3'
      
        '                      Group by id_Setor_Designado) sv on (sv.id_' +
        'Setor_Designado = s.id) '
      
        '     Left Outer Join (Select count(*) Qtd, isnull(id_Setor_Desig' +
        'nado,0) id_Setor_Designado'
      '                      From Siags '
      '                      where Data_Hora_Encerramento is null'
      '                            and id_Tipo_Prazo_Caixa = 3'
      #9#9#9#9#9#9#9'and Data_Prazo_Caixa = getdate()'
      
        '                      Group by id_Setor_Designado) svh on (svh.i' +
        'd_Setor_Designado = s.id )'
      'Order by Nome_Setor')
    Left = 77
    Top = 112
    object qrySiagsVencidosNome_Setor: TStringField
      FieldName = 'Nome_Setor'
      Origin = 'Nome_Setor'
      Size = 50
    end
    object qrySiagsVencidosQtd_Vencido: TIntegerField
      FieldName = 'Qtd_Vencido'
      Origin = 'Qtd_Vencido'
      ReadOnly = True
      Required = True
    end
    object qrySiagsVencidosQtd_VenceHoje: TIntegerField
      FieldName = 'Qtd_VenceHoje'
      Origin = 'Qtd_VenceHoje'
      ReadOnly = True
      Required = True
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
      '       isnull(cv.Qtd,0) as Qtd_Vencido, '
      #9'   isnull(cvh.Qtd,0) as Qtd_VenceHoje'
      'From Setores s'
      
        '     Left Outer Join (Select count(*) Qtd, isnull(id_Setor_Desig' +
        'nado,0) id_Setor_Designado'
      '                      From ControlPc '
      '                      where Data_Hora_Encerramento is null'
      '                            and id_Tipo_Prazo = 6'
      
        '                      Group by id_Setor_Designado) cv on (cv.id_' +
        'Setor_Designado = s.id) '
      
        '     Left Outer Join (Select count(*) Qtd, isnull(id_Setor_Desig' +
        'nado,0) id_Setor_Designado'
      '                      From ControlPc '
      '                      where Data_Hora_Encerramento is null'
      '                            and id_Tipo_Prazo = 6'
      #9#9#9#9#9#9#9'and Previsao_Solucao = getdate()'
      
        '                      Group by id_Setor_Designado) cvh on (cvh.i' +
        'd_Setor_Designado = s.id )'
      'Order by Nome_Setor')
    Left = 69
    Top = 272
    object qryControlPcVencidosNome_Setor: TStringField
      FieldName = 'Nome_Setor'
      Origin = 'Nome_Setor'
      Size = 50
    end
    object qryControlPcVencidosQtd_Vencido: TIntegerField
      FieldName = 'Qtd_Vencido'
      Origin = 'Qtd_Vencido'
      ReadOnly = True
      Required = True
    end
    object qryControlPcVencidosQtd_VenceHoje: TIntegerField
      FieldName = 'Qtd_VenceHoje'
      Origin = 'Qtd_VenceHoje'
      ReadOnly = True
      Required = True
    end
  end
end
