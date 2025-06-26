object ServerContainer: TServerContainer
  OldCreateOrder = False
  Height = 470
  Width = 1205
  object DSServer: TDSServer
    OnConnect = DSServerConnect
    OnDisconnect = DSServerDisconnect
    AutoStart = False
    Left = 48
    Top = 19
  end
  object DSTCPServerTransport: TDSTCPServerTransport
    Server = DSServer
    Filters = <>
    AuthenticationManager = DSAuthenticationManager
    Left = 180
    Top = 19
  end
  object dsscCadastro: TDSServerClass
    OnGetClass = dsscMetodosGerais
    Server = DSServer
    Left = 48
    Top = 91
  end
  object DSAuthenticationManager: TDSAuthenticationManager
    OnUserAuthenticate = DSAuthenticationManagerUserAuthenticate
    OnUserAuthorize = DSAuthenticationManagerUserAuthorize
    Roles = <>
    Left = 336
    Top = 19
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'User_Name=sa'
      'Database=ControleDeTarefas'
      'Password=mccb01'
      'Server=localhost\sqlexpress'
      'DriverID=MSSQL')
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    FormatOptions.AssignedValues = [fvMapRules, fvMaxBcdScale, fvDataSnapCompatibility]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        PrecMin = 16
        SizeMin = 16
        SourceDataType = dtDateTimeStamp
        TargetDataType = dtDateTime
      end
      item
        PrecMin = 16
        SizeMin = 16
        SourceDataType = dtFmtBCD
        TargetDataType = dtBCD
      end>
    FormatOptions.MaxBcdScale = 6
    FormatOptions.DataSnapCompatibility = True
    LoginPrompt = False
    Left = 496
    Top = 19
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 657
    Top = 19
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 819
    Top = 19
  end
  object FDSP_ProximoId: TFDStoredProc
    Connection = FDConnection
    StoredProcName = 'dbo.ProximoId'
    Left = 968
    Top = 19
    ParamData = <
      item
        Position = 1
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        ParamType = ptResult
      end
      item
        Position = 2
        Name = '@NomeDaTabela'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 3
        Name = '@NovoId'
        DataType = ftInteger
        ParamType = ptInputOutput
      end>
  end
  object dsscSetores: TDSServerClass
    OnGetClass = dsscSetoresGetClass
    Server = DSServer
    Left = 184
    Top = 91
  end
  object dsscUsuarios: TDSServerClass
    OnGetClass = dsscUsuariosGetClass
    Server = DSServer
    Left = 280
    Top = 91
  end
  object dsscImportacaoAutoSC: TDSServerClass
    OnGetClass = dsscImportacaoAutoSCGetClass
    Server = DSServer
    Left = 416
    Top = 91
  end
  object dsscImportacaoSiags: TDSServerClass
    OnGetClass = dsscImportacaoSiagsGetClass
    Server = DSServer
    Left = 576
    Top = 91
  end
  object dsscImportacaoControlPc: TDSServerClass
    OnGetClass = dsscImportacaoControlPcGetClass
    Server = DSServer
    Left = 736
    Top = 91
  end
  object dsscResumos: TDSServerClass
    OnGetClass = dsscResumosGetClass
    Server = DSServer
    Left = 880
    Top = 91
  end
end
