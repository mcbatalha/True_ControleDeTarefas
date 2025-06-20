inherited dtmRelatorios: TdtmRelatorios
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 462
  Width = 948
  object frxPDFExport: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 184
    Top = 392
  end
  object mtbTitulos: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 184
    Top = 248
    object mtbTitulosmemTipo: TStringField
      FieldName = 'memTipo'
      Size = 50
    end
    object mtbTitulosmemTituloFiltroNumero: TStringField
      FieldName = 'memTituloFiltroNumero'
      Size = 50
    end
    object mtbTitulosmemFiltroNumero: TStringField
      FieldName = 'memFiltroNumero'
      Size = 50
    end
    object mtbTitulosmemFiltroPeriodo: TStringField
      FieldName = 'memFiltroPeriodo'
      Size = 50
    end
    object mtbTitulosmemFiltroResponsavel: TStringField
      FieldName = 'memFiltroResponsavel'
      Size = 50
    end
    object mtbTitulosmemTituloTipo: TStringField
      FieldName = 'memTituloTipo'
      Size = 50
    end
  end
  object fdbTitulos: TfrxDBDataset
    UserName = 'fdbTitulos'
    CloseDataSource = True
    FieldAliases.Strings = (
      'memTipo=memTipo'
      'memTituloFiltroNumero=memTituloFiltroNumero'
      'memFiltroNumero=memFiltroNumero'
      'memFiltroPeriodo=memFiltroPeriodo'
      'memFiltroResponsavel=memFiltroResponsavel'
      'memTituloTipo=memTituloTipo')
    OpenDataSource = False
    DataSet = mtbTitulos
    BCDToCurrency = False
    Left = 184
    Top = 320
  end
  object mtbUsuariosAutoSc: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 576
    Top = 32
    object mtbUsuariosAutoScid: TIntegerField
      FieldName = 'id'
    end
    object mtbUsuariosAutoScNome_Usuario: TStringField
      FieldName = 'Nome_Usuario'
      Size = 100
    end
  end
  object mtbUsuariosSiags: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 576
    Top = 108
    object mtbUsuariosSiagsid: TIntegerField
      FieldName = 'id'
    end
    object mtbUsuariosSiagsNome_Usuario: TStringField
      FieldName = 'Nome_Usuario'
      Size = 100
    end
  end
  object mtbUsuariosControlPc: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 576
    Top = 184
    object mtbUsuariosControlPcid: TIntegerField
      FieldName = 'id'
    end
    object mtbUsuariosControlPcNome_Usuario: TStringField
      FieldName = 'Nome_Usuario'
      Size = 100
    end
  end
end
