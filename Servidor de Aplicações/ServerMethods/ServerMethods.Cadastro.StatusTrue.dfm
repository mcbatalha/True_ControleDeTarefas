object SMStatusTrue: TSMStatusTrue
  OldCreateOrder = False
  Height = 588
  Width = 1083
  object qryCadastro: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'Select * From Status_True')
    Left = 64
    Top = 48
    object qryCadastroid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCadastroStatus: TStringField
      FieldName = 'Status'
      Origin = 'Status'
      Size = 30
    end
    object qryCadastroTipo_Prazo: TStringField
      FieldName = 'Tipo_Prazo'
      Origin = 'Tipo_Prazo'
      Size = 10
    end
    object qryCadastroPrazo: TIntegerField
      FieldName = 'Prazo'
      Origin = 'Prazo'
    end
    object qryCadastroEncerra: TStringField
      FieldName = 'Encerra'
      Origin = 'Encerra'
      Size = 3
    end
    object qryCadastroAtivo: TStringField
      FieldName = 'Ativo'
      Origin = 'Ativo'
      Size = 3
    end
  end
  object dspCadastro: TDataSetProvider
    DataSet = qryCadastro
    ResolveToDataSet = True
    Left = 64
    Top = 120
  end
  object qryJaExiste: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'Select 1'
      'From Status_True'
      'where id <> :pId'
      '      and Status= :pDescricao')
    Left = 184
    Top = 48
    ParamData = <
      item
        Name = 'PID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PDESCRICAO'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object qryPesquisa: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'Select * From Status_True')
    Left = 288
    Top = 48
  end
  object dspPesquisa: TDataSetProvider
    DataSet = qryPesquisa
    Left = 288
    Top = 112
  end
end
