inherited dtmCadastros: TdtmCadastros
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  inherited DSProviderConnection: TDSProviderConnection
    Left = 56
    Top = 104
  end
  object cdsCadastro: TClientDataSet
    Aggregates = <>
    Params = <>
    RemoteServer = DSProviderConnection
    Left = 56
    Top = 184
  end
end
