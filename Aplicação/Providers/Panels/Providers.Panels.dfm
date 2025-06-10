inherited dtmPainel: TdtmPainel
  OldCreateOrder = True
  Height = 503
  Width = 585
  inherited DSProviderConnection: TDSProviderConnection
    ServerClassName = 'TMAutoSC'
  end
  object mtbPainel: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 64
    Top = 176
  end
  object cdsPainel: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPainel'
    Left = 64
    Top = 328
  end
  object dsPainel: TDataSetProvider
    DataSet = mtbPainel
    Left = 64
    Top = 256
  end
end
