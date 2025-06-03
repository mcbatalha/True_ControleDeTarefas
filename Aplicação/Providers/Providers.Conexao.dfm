object dtmConexao: TdtmConexao
  OldCreateOrder = False
  Height = 301
  Width = 528
  object SQLConnection: TSQLConnection
    DriverName = 'DataSnap'
    KeepConnection = False
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXDataSnap'
      'Port=211'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=24.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'Filters={}'
      'HostName=localhost'
      'DSAuthenticationUser=ConotroladorDeTarefas@2025'
      'DSAuthenticationPassword=!Tarefas@2025#True-Auditoria')
    Left = 57
    Top = 26
    UniqueId = '{0C555D51-8ACE-4105-AB12-DC63C5A603AF}'
  end
  object DSProviderConnection: TDSProviderConnection
    SQLConnection = SQLConnection
    Left = 216
    Top = 24
  end
  object cdsPesquisa: TClientDataSet
    Aggregates = <>
    Params = <>
    RemoteServer = DSProviderConnection
    Left = 400
    Top = 24
  end
end
