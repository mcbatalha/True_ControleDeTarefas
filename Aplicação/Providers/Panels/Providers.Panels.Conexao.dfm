inherited dtmPaineisConexao: TdtmPaineisConexao
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  inherited DSProviderConnection: TDSProviderConnection
    ServerClassName = 'TMAutoSC'
  end
end
