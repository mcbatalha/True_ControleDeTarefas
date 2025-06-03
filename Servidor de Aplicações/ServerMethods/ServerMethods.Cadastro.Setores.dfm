object SMSetores: TSMSetores
  OldCreateOrder = False
  Height = 371
  Width = 861
  object qryCadastro: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'Select * From Setores')
    Left = 64
    Top = 48
    object qryCadastroid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCadastroNome_Setor: TStringField
      FieldName = 'Nome_Setor'
      Origin = 'Nome_Setor'
      Size = 50
    end
    object qryCadastroAtivo: TStringField
      FieldName = 'Ativo'
      Origin = 'Ativo'
      Size = 3
    end
    object qryCadastroSIAGS: TStringField
      FieldName = 'SIAGS'
      Origin = 'SIAGS'
      Size = 3
    end
    object qryCadastroCONTROLPC: TStringField
      FieldName = 'CONTROLPC'
      Origin = 'CONTROLPC'
      Size = 3
    end
    object qryCadastroAUTOSC: TStringField
      FieldName = 'AUTOSC'
      Origin = 'AUTOSC'
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
      'From Setores'
      'where id <> :pId'
      '      and Nome_Setor = :pDescricao')
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
      'Select * From Setores')
    Left = 288
    Top = 48
  end
  object dspPesquisa: TDataSetProvider
    DataSet = qryPesquisa
    Left = 288
    Top = 112
  end
end
