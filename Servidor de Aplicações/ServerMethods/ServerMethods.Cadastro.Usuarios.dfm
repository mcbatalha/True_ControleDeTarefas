object SMUsuarios: TSMUsuarios
  OldCreateOrder = False
  Height = 504
  Width = 895
  object qryCadastro: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'Select * From Usuarios')
    Left = 64
    Top = 48
    object qryCadastroid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCadastroNome_Usuario: TStringField
      FieldName = 'Nome_Usuario'
      Size = 100
    end
    object qryCadastroLogin: TStringField
      FieldName = 'Login'
      Origin = 'Login'
    end
    object qryCadastroSenha: TStringField
      FieldName = 'Senha'
      Origin = 'Senha'
      Size = 50
    end
    object qryCadastroE_Mail: TStringField
      FieldName = 'E_Mail'
      Origin = 'E_Mail'
      Size = 100
    end
    object qryCadastroTrocar_Senha: TStringField
      FieldName = 'Trocar_Senha'
      Origin = 'Trocar_Senha'
      Size = 3
    end
    object qryCadastroPerfil: TStringField
      FieldName = 'Perfil'
      Origin = 'Perfil'
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
  object dsCadastro: TDataSource
    DataSet = qryCadastro
    Left = 64
    Top = 208
  end
  object qryUsuariosSetores: TFDQuery
    MasterSource = dsCadastro
    MasterFields = 'id'
    DetailFields = 'id_Usuario'
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'Select a.id_Usuario, a.id_Setor, c.Nome_Setor '
      'From Usuarios_Setores a'
      '     Inner Join Usuarios b on b.id = a.id_Usuario'
      '     Inner Join Setores c on c.id = a.id_Setor'
      'where a.id_Usuario = :id'
      'Order By c.Nome_Setor')
    Left = 64
    Top = 288
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryUsuariosSetoresid_Usuario: TIntegerField
      FieldName = 'id_Usuario'
      Origin = 'id_Usuario'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryUsuariosSetoresid_Setor: TIntegerField
      FieldName = 'id_Setor'
      Origin = 'id_Setor'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryUsuariosSetoresNome_Setor: TStringField
      FieldName = 'Nome_Setor'
      Origin = 'Nome_Setor'
      ProviderFlags = []
      Size = 50
    end
  end
  object qrySetores: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'Select st.id, st.Nome_Setor'
      'from Setores st'
      'where st.Ativo = '#39'Sim'#39
      'Order By st.Nome_Setor')
    Left = 512
    Top = 48
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
  object dspSetores: TDataSetProvider
    DataSet = qrySetores
    ResolveToDataSet = True
    Left = 512
    Top = 120
  end
  object qryGravarLogSenha: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'Insert into Log_Senha'
      '(id_Usuario, id_Usuario_Responsavel, Data_Hora)'
      'values'
      '(:pIdUsuario, :pIdUsuarioResponsavel, getDate())')
    Left = 656
    Top = 48
    ParamData = <
      item
        Name = 'PIDUSUARIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PIDUSUARIORESPONSAVEL'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object qryAux: TFDQuery
    Connection = ServerContainer.FDConnection
    Left = 789
    Top = 32
  end
end
