inherited dtmPainelControlPc: TdtmPainelControlPc
  Height = 761
  Width = 1326
  inherited mtbPainel: TFDMemTable
    StoreDefs = True
    object mtbPainelProtocolo: TStringField
      Alignment = taCenter
      FieldName = 'Protocolo'
      Size = 50
    end
    object mtbPainelid_Protocolo: TLargeintField
      FieldName = 'id_Protocolo'
    end
    object mtbPainelData_Abertura: TDateTimeField
      FieldName = 'Data_Abertura'
      Origin = 'Data_Abertura'
    end
    object mtbPainelData_Transferencia: TDateTimeField
      FieldName = 'Data_Transferencia'
      Origin = 'Data_Transferencia'
    end
    object mtbPainelData_Fechamento: TDateTimeField
      FieldName = 'Data_Fechamento'
      Origin = 'Data_Fechamento'
    end
    object mtbPainelPrevisao_Solucao: TDateTimeField
      FieldName = 'Previsao_Solucao'
      Origin = 'Previsao_Solucao'
    end
    object mtbPainelSolicitacao_Cliente: TStringField
      FieldName = 'Solicitacao_Cliente'
      Origin = 'Solicitacao_Cliente'
      Size = 500
    end
    object mtbPainelTipo_Reclame: TStringField
      FieldName = 'Tipo_Reclame'
      Origin = 'Tipo_Reclame'
      Size = 3
    end
    object mtbPainelTipo_Nip: TStringField
      FieldName = 'Tipo_Nip'
      Origin = 'Tipo_Nip'
      Size = 3
    end
    object mtbPainelTipo_Status: TStringField
      Alignment = taCenter
      FieldName = 'Tipo_Status'
      Origin = 'Tipo_Status'
      Size = 30
    end
    object mtbPainelTipo_Prazo_Caixa: TStringField
      FieldName = 'Tipo_Prazo_Caixa'
      Origin = 'Tipo_Prazo_Caixa'
      Size = 30
    end
    object mtbPainelTipo_Classificacao: TStringField
      FieldName = 'Tipo_Classificacao'
      Size = 350
    end
    object mtbPainelNome_Tecnico: TStringField
      FieldName = 'Nome_Tecnico'
      Origin = 'Nome_Tecnico'
      Size = 50
    end
    object mtbPainelTipo_Cliente: TStringField
      FieldName = 'Tipo_Cliente'
      Origin = 'Tipo_Cliente'
      Size = 50
    end
    object mtbPainelid_Usuario_Designado: TIntegerField
      FieldName = 'id_Usuario_Designado'
    end
    object mtbPainelUsuario_Designado: TStringField
      FieldName = 'Usuario_Designado'
      Origin = 'Usuario_Designado'
      Size = 100
    end
    object mtbPainelid_Setor_Designado: TIntegerField
      FieldName = 'id_Setor_Designado'
    end
    object mtbPainelSetor_Designado: TStringField
      FieldName = 'Setor_Designado'
      Origin = 'Setor_Designado'
      Size = 50
    end
    object mtbPainelQtd_Historicos: TIntegerField
      FieldName = 'Qtd_Historicos'
    end
    object mtbPainelQtd_Designacoes: TIntegerField
      FieldName = 'Qtd_Designacoes'
    end
    object mtbPainelQtd_Observacoes: TIntegerField
      FieldName = 'Qtd_Observacoes'
    end
    object mtbPainelData_Hora_Importacao: TDateTimeField
      FieldName = 'Data_Hora_Importacao'
    end
    object mtbPainelUltima_Atualizacao: TDateTimeField
      FieldName = 'Ultima_Atualizacao'
    end
    object mtbPainelData_Hora_Encerramento: TDateTimeField
      FieldName = 'Data_Hora_Encerramento'
    end
    object mtbPainelJustificativa_Encerramento: TStringField
      FieldName = 'Justificativa_Encerramento'
      Size = 100
    end
    object mtbPainelUsuario_Importacao: TStringField
      FieldName = 'Usuario_Importacao'
      Size = 100
    end
    object mtbPainelUsuario_Atualizacao: TStringField
      FieldName = 'Usuario_Atualizacao'
      Size = 100
    end
    object mtbPainelUsuario_Encerrameto: TStringField
      FieldName = 'Usuario_Encerrameto'
      Size = 100
    end
  end
  inherited cdsPainel: TClientDataSet
    object cdsPainelProtocolo: TStringField
      Alignment = taCenter
      FieldName = 'Protocolo'
      Size = 50
    end
    object cdsPainelid_Protocolo: TLargeintField
      FieldName = 'id_Protocolo'
    end
    object cdsPainelid_Usuario_Designado: TIntegerField
      FieldName = 'id_Usuario_Designado'
      OnGetText = cdsPainelUsuario_DesignadoGetText
    end
    object cdsPainelid_Setor_Designado: TIntegerField
      FieldName = 'id_Setor_Designado'
      OnGetText = cdsPainelUsuario_DesignadoGetText
    end
    object cdsPainelData_Abertura: TDateTimeField
      Alignment = taCenter
      FieldName = 'Data_Abertura'
    end
    object cdsPainelData_Transferencia: TDateTimeField
      Alignment = taCenter
      FieldName = 'Data_Transferencia'
    end
    object cdsPainelData_Fechamento: TDateTimeField
      Alignment = taCenter
      FieldName = 'Data_Fechamento'
    end
    object cdsPainelPrevisao_Solucao: TDateTimeField
      Alignment = taCenter
      FieldName = 'Previsao_Solucao'
    end
    object cdsPainelSolicitacao_Cliente: TStringField
      FieldName = 'Solicitacao_Cliente'
      Size = 500
    end
    object cdsPainelTipo_Reclame: TStringField
      Alignment = taCenter
      FieldName = 'Tipo_Reclame'
      Size = 3
    end
    object cdsPainelTipo_Nip: TStringField
      Alignment = taCenter
      FieldName = 'Tipo_Nip'
      Size = 3
    end
    object cdsPainelTipo_Status: TStringField
      FieldName = 'Tipo_Status'
      Size = 30
    end
    object cdsPainelTipo_Prazo_Caixa: TStringField
      FieldName = 'Tipo_Prazo_Caixa'
      Size = 30
    end
    object cdsPainelNome_Tecnico: TStringField
      FieldName = 'Nome_Tecnico'
      Size = 50
    end
    object cdsPainelTipo_Cliente: TStringField
      FieldName = 'Tipo_Cliente'
      Size = 50
    end
    object cdsPainelTipo_Classificacao: TStringField
      FieldName = 'Tipo_Classificacao'
      Size = 350
    end
    object cdsPainelUsuario_Designado: TStringField
      FieldName = 'Usuario_Designado'
      OnGetText = cdsPainelUsuario_DesignadoGetText
      Size = 100
    end
    object cdsPainelSetor_Designado: TStringField
      FieldName = 'Setor_Designado'
      OnGetText = cdsPainelUsuario_DesignadoGetText
      Size = 50
    end
    object cdsPainelQtd_Historicos: TIntegerField
      Alignment = taCenter
      FieldName = 'Qtd_Historicos'
    end
    object cdsPainelQtd_Designacoes: TIntegerField
      Alignment = taCenter
      FieldName = 'Qtd_Designacoes'
    end
    object cdsPainelQtd_Observacoes: TIntegerField
      Alignment = taCenter
      FieldName = 'Qtd_Observacoes'
    end
    object cdsPainelData_Hora_Importacao: TDateTimeField
      FieldName = 'Data_Hora_Importacao'
    end
    object cdsPainelUltima_Atualizacao: TDateTimeField
      FieldName = 'Ultima_Atualizacao'
    end
    object cdsPainelData_Hora_Encerramento: TDateTimeField
      FieldName = 'Data_Hora_Encerramento'
    end
    object cdsPainelJustificativa_Encerramento: TStringField
      FieldName = 'Justificativa_Encerramento'
      Size = 100
    end
    object cdsPainelUsuario_Importacao: TStringField
      FieldName = 'Usuario_Importacao'
      Size = 100
    end
    object cdsPainelUsuario_Atualizacao: TStringField
      FieldName = 'Usuario_Atualizacao'
      Size = 100
    end
    object cdsPainelUsuario_Encerrameto: TStringField
      FieldName = 'Usuario_Encerrameto'
      Size = 100
    end
  end
  inherited mtbHistoricoAtualizacoes: TFDMemTable
    object mtbHistoricoAtualizacoesData_Hora_Historico: TDateTimeField
      FieldName = 'Data_Hora_Historico'
    end
    object mtbHistoricoAtualizacoesTipo_Status: TStringField
      FieldName = 'Tipo_Status'
      Size = 30
    end
    object mtbHistoricoAtualizacoesTipo_Prazo_Caixa: TStringField
      FieldName = 'Tipo_Prazo_Caixa'
      Size = 30
    end
    object mtbHistoricoAtualizacoesNome_Tecnico: TStringField
      FieldName = 'Nome_Tecnico'
      Size = 50
    end
    object mtbHistoricoAtualizacoesTipo_Cliente: TStringField
      FieldName = 'Tipo_Cliente'
      Size = 50
    end
    object mtbHistoricoAtualizacoesTipo_Classificacao: TStringField
      FieldName = 'Tipo_Classificacao'
      Size = 350
    end
    object mtbHistoricoAtualizacoesNome_Usuario: TStringField
      FieldName = 'Nome_Usuario'
      Size = 100
    end
    object mtbHistoricoAtualizacoesTipo_Reclame: TStringField
      FieldName = 'Tipo_Reclame'
      Size = 3
    end
    object mtbHistoricoAtualizacoesTipo_Nip: TStringField
      FieldName = 'Tipo_Nip'
      Size = 3
    end
  end
  inherited frpExtrato: TfrxReport
    Datasets = <
      item
        DataSet = fdbAtualizacoes
        DataSetName = 'fdbAtualizacoes'
      end
      item
        DataSet = fdbDesignacoes
        DataSetName = 'fdbDesignacoes'
      end
      item
        DataSet = fdbExtrato
        DataSetName = 'fdbExtrato'
      end
      item
        DataSet = fdbObservacoes
        DataSetName = 'fdbObservacoes'
      end>
    Variables = <>
    Style = <>
    inherited pagExtrato: TfrxReportPage
      inherited PageHeader1: TfrxPageHeader
        inherited Memo1: TfrxMemoView
          Left = 258.897805000000000000
          Top = 7.559059999999999000
          Width = 291.023810000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Extrato de Protocolo - CONTROLPC')
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 259.787570000000000000
          Top = 46.354360000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'N'#186' do Processo:')
        end
        object fdbExtratoNumero_Processo: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 368.283705000000000000
          Top = 46.354360000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataField = 'Protocolo'
          DataSet = fdbExtrato
          DataSetName = 'fdbExtrato'
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbExtrato."Protocolo"]')
        end
      end
      inherited MasterData1: TfrxMasterData
        Height = 238.110390000000000000
        Child = frpExtrato.Child2
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338582680000000000
          Top = 53.338590000000010000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Importa'#231#227'o')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 131.047310000000000000
          Top = 53.338590000000010000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Respons'#225'vel')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 316.346630000000000000
          Top = 53.338590000000010000
          Width = 102.047310000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            #218'ltima Atualiza'#231#227'o')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 426.275820000000000000
          Top = 53.338590000000010000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Respons'#225'vel')
          ParentFont = False
        end
        object fdbExtratoNumero_Processo1: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 11.338582680000000000
          Top = 70.236239999999990000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          DataField = 'Data_Hora_Importacao'
          DataSet = fdbExtrato
          DataSetName = 'fdbExtrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbExtrato."Data_Hora_Importacao"]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 131.047310000000000000
          Top = 70.236239999999990000
          Width = 154.960730000000000000
          Height = 15.118120000000000000
          DataField = 'Usuario_Importacao'
          DataSet = fdbExtrato
          DataSetName = 'fdbExtrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbExtrato."Usuario_Importacao"]')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 316.346630000000000000
          Top = 68.456710000000010000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          DataField = 'Ultima_Atualizacao'
          DataSet = fdbExtrato
          DataSetName = 'fdbExtrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbExtrato."Ultima_Atualizacao"]')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 426.275820000000000000
          Top = 68.456710000000010000
          Width = 154.960730000000000000
          Height = 15.118120000000000000
          DataField = 'Usuario_Atualizacao'
          DataSet = fdbExtrato
          DataSetName = 'fdbExtrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbExtrato."Usuario_Atualizacao"]')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          AllowVectorExport = True
          Left = 270.236395000000000000
          Top = 17.504020000000000000
          Width = 177.637910000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Dados Atuais do Protocolo')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 102.047310000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Status')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 118.944960000000000000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          DataField = 'Tipo_Status'
          DataSet = fdbExtrato
          DataSetName = 'fdbExtrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbExtrato."Tipo_Status"]')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 151.181200000000000000
          Top = 102.047310000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Data de Abertura')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 151.181200000000000000
          Top = 118.944960000000000000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          DataField = 'Data_Abertura'
          DataSet = fdbExtrato
          DataSetName = 'fdbExtrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbExtrato."Data_Abertura"]')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 286.346630000000000000
          Top = 102.047310000000000000
          Width = 120.944960000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Data de Transfer'#234'ncia')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 286.346630000000000000
          Top = 118.944960000000000000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          DataField = 'Data_Transferencia'
          DataSet = fdbExtrato
          DataSetName = 'fdbExtrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbExtrato."Data_Transferencia"]')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 439.338900000000000000
          Top = 102.047310000000000000
          Width = 120.944960000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Data de Fechamento')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 439.338900000000000000
          Top = 118.944960000000000000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          DataField = 'Data_Fechamento'
          DataSet = fdbExtrato
          DataSetName = 'fdbExtrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbExtrato."Data_Fechamento"]')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 151.181200000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Prazo')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 168.078850000000000000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          DataField = 'Tipo_Prazo_Caixa'
          DataSet = fdbExtrato
          DataSetName = 'fdbExtrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbExtrato."Tipo_Prazo_Caixa"]')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          AllowVectorExport = True
          Left = 230.551330000000000000
          Top = 151.181200000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'T'#233'cnico')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 230.551330000000000000
          Top = 168.078850000000000000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          DataField = 'Nome_Tecnico'
          DataSet = fdbExtrato
          DataSetName = 'fdbExtrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbExtrato."Nome_Tecnico"]')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          AllowVectorExport = True
          Left = 587.724800000000000000
          Top = 102.047310000000000000
          Width = 120.944960000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Previs'#227'o de Solu'#231#227'o')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 587.724800000000000000
          Top = 118.944960000000000000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          DataField = 'Previsao_Solucao'
          DataSet = fdbExtrato
          DataSetName = 'fdbExtrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbExtrato."Previsao_Solucao"]')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          AllowVectorExport = True
          Left = 464.882190000000000000
          Top = 151.181200000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Tipo Cliente')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 464.882190000000000000
          Top = 168.078850000000000000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          DataField = 'Tipo_Cliente'
          DataSet = fdbExtrato
          DataSetName = 'fdbExtrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbExtrato."Tipo_Cliente"]')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 196.535560000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Classifica'#231#227'o')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 213.433210000000000000
          Width = 699.213050000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          DataField = 'Tipo_Prazo_Caixa'
          DataSet = fdbExtrato
          DataSetName = 'fdbExtrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbExtrato."Tipo_Prazo_Caixa"]')
          ParentFont = False
        end
      end
      object Child2: TfrxChild
        FillType = ftBrush
        Frame.Typ = []
        Height = 37.795300000000000000
        Top = 419.527830000000000000
        Width = 718.110700000000000000
        Child = frpExtrato.Child3
        Stretched = True
        ToNRows = 0
        ToNRowsMode = rmCount
        object Memo50: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Solicita'#231#227'o do Cliente')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 16.897650000000000000
          Width = 699.213050000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          DataField = 'Solicitacao_Cliente'
          DataSet = fdbExtrato
          DataSetName = 'fdbExtrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbExtrato."Solicitacao_Cliente"]')
          ParentFont = False
        end
      end
      object Child3: TfrxChild
        FillType = ftBrush
        Frame.Typ = []
        Height = 90.708720000000000000
        Top = 480.000310000000000000
        Width = 718.110700000000000000
        Child = frpExtrato.Child4
        ToNRows = 0
        ToNRowsMode = rmCount
        object Memo52: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 3.779530000000022000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Tipo Reclame')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 20.677180000000020000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          DataField = 'Tipo_Reclame'
          DataSet = fdbExtrato
          DataSetName = 'fdbExtrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[fdbExtrato."Tipo_Reclame"]')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          AllowVectorExport = True
          Left = 120.944960000000000000
          Top = 3.779530000000022000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Tipo NIP')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 120.944960000000000000
          Top = 20.677180000000020000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          DataField = 'Tipo_Nip'
          DataSet = fdbExtrato
          DataSetName = 'fdbExtrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[fdbExtrato."Tipo_Nip"]')
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 49.133889999999950000
          Width = 120.944960000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Usu'#225'rio designado')
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 66.031539999999950000
          Width = 170.078850000000000000
          Height = 15.118120000000000000
          DataField = 'Usuario_Designado'
          DataSet = fdbExtrato
          DataSetName = 'fdbExtrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbExtrato."Usuario_Designado"]')
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          AllowVectorExport = True
          Left = 211.976500000000000000
          Top = 49.133889999999950000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Setor designado')
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 211.976500000000000000
          Top = 66.031539999999950000
          Width = 170.078850000000000000
          Height = 15.118120000000000000
          DataField = 'Usuario_Designado'
          DataSet = fdbExtrato
          DataSetName = 'fdbExtrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbExtrato."Usuario_Designado"]')
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          AllowVectorExport = True
          Left = 404.732530000000000000
          Top = 49.133889999999950000
          Width = 90.708720000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Atualiza'#231#245'es')
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 404.732530000000000000
          Top = 66.031539999999950000
          Width = 90.708720000000000000
          Height = 15.118120000000000000
          DataField = 'Qtd_Historicos'
          DataSet = fdbExtrato
          DataSetName = 'fdbExtrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[fdbExtrato."Qtd_Historicos"]')
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          AllowVectorExport = True
          Left = 510.559370000000000000
          Top = 49.133889999999950000
          Width = 90.708720000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Designa'#231#245'es')
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 510.559370000000000000
          Top = 66.031539999999950000
          Width = 90.708720000000000000
          Height = 15.118120000000000000
          DataField = 'Qtd_Designacoes'
          DataSet = fdbExtrato
          DataSetName = 'fdbExtrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[fdbExtrato."Qtd_Designacoes"]')
          ParentFont = False
        end
        object Memo65: TfrxMemoView
          AllowVectorExport = True
          Left = 623.945270000000000000
          Top = 49.133889999999950000
          Width = 90.708720000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Observa'#231#245'es')
          ParentFont = False
        end
        object Memo66: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 623.945270000000000000
          Top = 66.031539999999950000
          Width = 90.708720000000000000
          Height = 15.118120000000000000
          DataField = 'Qtd_Observacoes'
          DataSet = fdbExtrato
          DataSetName = 'fdbExtrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[fdbExtrato."Qtd_Observacoes"]')
          ParentFont = False
        end
      end
      object Child4: TfrxChild
        FillType = ftBrush
        Frame.Typ = []
        Height = 41.574803150000000000
        Top = 593.386210000000000000
        Width = 718.110700000000000000
        Child = frpExtrato.Child5
        ToNRows = 0
        ToNRowsMode = rmCount
        object Memo67: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 3.779530000000022000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Encerrado em')
          ParentFont = False
        end
        object Memo68: TfrxMemoView
          AllowVectorExport = True
          Left = 130.590600000000000000
          Top = 3.779530000000022000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Respons'#225'vel')
          ParentFont = False
        end
        object Memo69: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 20.677180000000020000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          DataField = 'Data_Hora_Encerramento'
          DataSet = fdbExtrato
          DataSetName = 'fdbExtrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbExtrato."Data_Hora_Encerramento"]')
          ParentFont = False
        end
        object Memo70: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 130.590600000000000000
          Top = 20.677180000000020000
          Width = 154.960730000000000000
          Height = 15.118120000000000000
          DataField = 'Usuario_Encerrameto'
          DataSet = fdbExtrato
          DataSetName = 'fdbExtrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbExtrato."Usuario_Encerrameto"]')
          ParentFont = False
        end
        object Memo71: TfrxMemoView
          AllowVectorExport = True
          Left = 321.582870000000000000
          Top = 3.779530000000022000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Justificativa')
          ParentFont = False
        end
        object Memo72: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 321.582870000000000000
          Top = 20.677180000000020000
          Width = 389.291590000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          DataField = 'Justificativa_Encerramento'
          DataSet = fdbExtrato
          DataSetName = 'fdbExtrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbExtrato."Justificativa_Encerramento"]')
          ParentFont = False
        end
      end
      object Child5: TfrxChild
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 657.638220000000000000
        Width = 718.110700000000000000
        ToNRows = 0
        ToNRowsMode = rmCount
      end
    end
    inherited pagAtualizacoes: TfrxReportPage
      inherited GroupHeader1: TfrxGroupHeader
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        inherited Memo5: TfrxMemoView
          Width = 718.110700000000000000
          Memo.UTF8W = (
            'Atualiza'#231#245'es do Protocolo')
        end
      end
      inherited MasterData2: TfrxMasterData
        Height = 145.401670000000000000
        Top = 64.252010000000000000
        Width = 718.110700000000000000
        Child = frpExtrato.Child6
        Stretched = True
        inherited memBackGroundAtualizacoes: TfrxMemoView
          Width = 718.110700000000000000
          Height = 145.401670000000000000
        end
        object Memo73: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338582677165350000
          Top = 11.338590000000000000
          Width = 132.283550000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Data Hora da Atualiza'#231#227'o')
          ParentFont = False
        end
        object Memo74: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 11.338582680000000000
          Top = 28.236239999999990000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          DataField = 'Data_Hora_Historico'
          DataSet = fdbAtualizacoes
          DataSetName = 'fdbAtualizacoes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbAtualizacoes."Data_Hora_Historico"]')
          ParentFont = False
        end
        object Memo75: TfrxMemoView
          AllowVectorExport = True
          Left = 178.196970000000000000
          Top = 11.338590000000000000
          Width = 132.283550000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Respons'#225'vel')
          ParentFont = False
        end
        object Memo76: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 178.196970000000000000
          Top = 28.236239999999990000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          DataField = 'Nome_Usuario'
          DataSet = fdbAtualizacoes
          DataSetName = 'fdbAtualizacoes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbAtualizacoes."Nome_Usuario"]')
          ParentFont = False
        end
        object Memo77: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 56.692949999999990000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Status')
          ParentFont = False
        end
        object Memo78: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 73.590599999999970000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          DataField = 'Tipo_Status'
          DataSet = fdbAtualizacoes
          DataSetName = 'fdbAtualizacoes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbAtualizacoes."Tipo_Status"]')
          ParentFont = False
        end
        object Memo79: TfrxMemoView
          AllowVectorExport = True
          Left = 181.417440000000000000
          Top = 56.692950000000010000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Prazo')
          ParentFont = False
        end
        object Memo80: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 181.417440000000000000
          Top = 73.590599999999970000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          DataField = 'Tipo_Prazo_Caixa'
          DataSet = fdbAtualizacoes
          DataSetName = 'fdbAtualizacoes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbAtualizacoes."Tipo_Prazo_Caixa"]')
          ParentFont = False
        end
        object Memo81: TfrxMemoView
          AllowVectorExport = True
          Left = 328.819110000000000000
          Top = 56.692950000000010000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'T'#233'cnico')
          ParentFont = False
        end
        object Memo82: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 328.819110000000000000
          Top = 73.590599999999970000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          DataField = 'Nome_Tecnico'
          DataSet = fdbAtualizacoes
          DataSetName = 'fdbAtualizacoes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbAtualizacoes."Nome_Tecnico"]')
          ParentFont = False
        end
        object Memo83: TfrxMemoView
          AllowVectorExport = True
          Left = 535.149970000000100000
          Top = 56.692950000000010000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Tipo Cliente')
          ParentFont = False
        end
        object Memo84: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 535.149970000000100000
          Top = 73.590599999999970000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          DataField = 'Tipo_Cliente'
          DataSet = fdbAtualizacoes
          DataSetName = 'fdbAtualizacoes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbAtualizacoes."Tipo_Cliente"]')
          ParentFont = False
        end
        object Memo85: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 106.669450000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Classifica'#231#227'o')
          ParentFont = False
        end
        object Memo86: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 123.567100000000000000
          Width = 699.213050000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          DataField = 'Tipo_Classificacao'
          DataSet = fdbAtualizacoes
          DataSetName = 'fdbAtualizacoes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbAtualizacoes."Tipo_Classificacao"]')
          ParentFont = False
        end
      end
      inherited Footer1: TfrxFooter
        Height = 22.677180000000000000
        Top = 298.582870000000000000
        Width = 718.110700000000000000
      end
      object Child6: TfrxChild
        FillType = ftBrush
        Frame.Typ = []
        Height = 41.574830000000010000
        Top = 234.330860000000000000
        Width = 718.110700000000000000
        ToNRows = 0
        ToNRowsMode = rmCount
        object Memo87: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 5.338590000000011000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Tipo Reclame')
          ParentFont = False
        end
        object Memo88: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 22.236239999999980000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          DataField = 'Tipo_Reclame'
          DataSet = fdbAtualizacoes
          DataSetName = 'fdbAtualizacoes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[fdbAtualizacoes."Tipo_Reclame"]')
          ParentFont = False
        end
        object Memo89: TfrxMemoView
          AllowVectorExport = True
          Left = 120.944960000000000000
          Top = 5.338590000000011000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Tipo NIP')
          ParentFont = False
        end
        object Memo90: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 120.944960000000000000
          Top = 22.236239999999980000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          DataField = 'Tipo_Nip'
          DataSet = fdbAtualizacoes
          DataSetName = 'fdbAtualizacoes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[fdbAtualizacoes."Tipo_Nip"]')
          ParentFont = False
        end
      end
    end
    inherited pagDesignacoes: TfrxReportPage
      inherited GroupHeader2: TfrxGroupHeader
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        inherited Memo18: TfrxMemoView
          Width = 718.110700000000000000
        end
      end
      inherited MasterData3: TfrxMasterData
        Top = 64.252010000000000000
        Width = 718.110700000000000000
        inherited memBackgroudDesignacoes: TfrxMemoView
          Width = 718.110700000000000000
        end
        inherited Memo6: TfrxMemoView
          Left = 11.338590000000000000
          Top = 7.559060000000003000
          Width = 86.929190000000000000
          Height = 11.338590000000000000
        end
      end
      inherited GroupFooter1: TfrxGroupFooter
        Top = 158.740260000000000000
        Width = 718.110700000000000000
      end
    end
    inherited pagObservacoes: TfrxReportPage
      inherited GroupHeader3: TfrxGroupHeader
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Child = frpExtrato.Child1
        inherited Memo19: TfrxMemoView
          Width = 718.110700000000000000
        end
      end
      inherited Child1: TfrxChild
        Top = 64.252010000000000000
        Width = 718.110700000000000000
      end
      inherited MasterData4: TfrxMasterData
        Top = 109.606370000000000000
        Width = 718.110700000000000000
        inherited memBackGroundObservacoes: TfrxMemoView
          Width = 718.110700000000000000
        end
        inherited fdbObservacoesData_Hora: TfrxMemoView
          Left = 7.559060000000000000
          Top = 2.834652989999995000
          Width = 109.606370000000000000
          Height = 17.007874020000000000
        end
      end
      inherited GroupFooter2: TfrxGroupFooter
        Top = 154.960730000000000000
        Width = 718.110700000000000000
      end
    end
  end
  inherited fdbExtrato: TfrxDBDataset
    FieldAliases.Strings = (
      'Protocolo=Protocolo'
      'id_Protocolo=id_Protocolo'
      'id_Usuario_Designado=id_Usuario_Designado'
      'id_Setor_Designado=id_Setor_Designado'
      'Data_Abertura=Data_Abertura'
      'Data_Transferencia=Data_Transferencia'
      'Data_Fechamento=Data_Fechamento'
      'Previsao_Solucao=Previsao_Solucao'
      'Solicitacao_Cliente=Solicitacao_Cliente'
      'Tipo_Reclame=Tipo_Reclame'
      'Tipo_Nip=Tipo_Nip'
      'Tipo_Status=Tipo_Status'
      'Tipo_Prazo_Caixa=Tipo_Prazo_Caixa'
      'Nome_Tecnico=Nome_Tecnico'
      'Tipo_Cliente=Tipo_Cliente'
      'Tipo_Classificacao=Tipo_Classificacao'
      'Usuario_Designado=Usuario_Designado'
      'Setor_Designado=Setor_Designado'
      'Qtd_Historicos=Qtd_Historicos'
      'Qtd_Designacoes=Qtd_Designacoes'
      'Qtd_Observacoes=Qtd_Observacoes'
      'Data_Hora_Importacao=Data_Hora_Importacao'
      'Ultima_Atualizacao=Ultima_Atualizacao'
      'Data_Hora_Encerramento=Data_Hora_Encerramento'
      'Justificativa_Encerramento=Justificativa_Encerramento'
      'Usuario_Importacao=Usuario_Importacao'
      'Usuario_Atualizacao=Usuario_Atualizacao'
      'Usuario_Encerrameto=Usuario_Encerrameto')
  end
  inherited fdbAtualizacoes: TfrxDBDataset
    FieldAliases.Strings = (
      'Data_Hora_Historico=Data_Hora_Historico'
      'Tipo_Status=Tipo_Status'
      'Tipo_Prazo_Caixa=Tipo_Prazo_Caixa'
      'Nome_Tecnico=Nome_Tecnico'
      'Tipo_Cliente=Tipo_Cliente'
      'Tipo_Classificacao=Tipo_Classificacao'
      'Nome_Usuario=Nome_Usuario'
      'Tipo_Reclame=Tipo_Reclame'
      'Tipo_Nip=Tipo_Nip')
  end
  object mtbUsuarios: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 1176
    Top = 16
    object mtbUsuariosid: TIntegerField
      FieldName = 'id'
    end
    object mtbUsuariosNome_Usuario: TStringField
      FieldName = 'Nome_Usuario'
      Size = 100
    end
  end
  object dtsTiposStatus: TDataSource
    DataSet = mtbTiposStatus
    Left = 832
    Top = 421
  end
  object mtbTiposStatus: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 993
    Top = 421
    object mtbTiposStatusid: TFDAutoIncField
      AutoGenerateValue = arNone
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ServerAutoIncrement = False
      AutoIncrementSeed = 1
      AutoIncrementStep = 1
      IdentityInsert = True
    end
    object mtbTiposStatusTipo_Status: TStringField
      FieldName = 'Tipo_Status'
      Origin = 'Tipo_Status'
      Size = 15
    end
  end
  object dtsSetores: TDataSource
    DataSet = mtbSetores
    Left = 832
    Top = 507
  end
  object mtbSetores: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 993
    Top = 507
    object mtbSetoresid: TIntegerField
      FieldName = 'id'
    end
    object mtbSetoresNome_Setor: TStringField
      FieldName = 'Nome_Setor'
      Size = 50
    end
  end
  object mtbTecnicos: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 993
    Top = 163
    object mtbTecnicosid: TIntegerField
      FieldName = 'id'
    end
    object mtbTecnicosNome_Tecnico: TStringField
      FieldName = 'Nome_Tecnico'
    end
  end
  object dtsTecnicos: TDataSource
    DataSet = mtbTecnicos
    Left = 832
    Top = 163
  end
  object mtbTiposCliente: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 993
    Top = 249
    object mtbTiposClienteid: TIntegerField
      FieldName = 'id'
    end
    object mtbTiposClienteTipo_Cliente: TStringField
      FieldName = 'Tipo_Cliente'
      Origin = 'Tipo_Cliente'
      Size = 50
    end
  end
  object dtsTiposCliente: TDataSource
    DataSet = mtbTiposCliente
    Left = 832
    Top = 249
  end
  object mtbTiposClassificacao: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 993
    Top = 335
    object mtbTiposClassificacaoid: TIntegerField
      FieldName = 'id'
    end
    object mtbTiposClassificacaoTipo_Classificacao: TStringField
      FieldName = 'Tipo_Classificacao'
      Origin = 'Tipo_Classificacao'
      Size = 350
    end
  end
  object dtsTiposClassificacao: TDataSource
    DataSet = mtbTiposClassificacao
    Left = 832
    Top = 335
  end
  object dtsPainel: TDataSource
    DataSet = cdsPainel
    Left = 256
    Top = 328
  end
  object mtbTiposPrazo: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 993
    Top = 78
    object mtbTiposPrazoid: TIntegerField
      FieldName = 'id'
    end
    object mtbTiposPrazoTipo_Prazo_Caixa: TStringField
      FieldName = 'Tipo_Prazo_Caixa'
      Origin = 'Tipo_Prazo_Caixa'
      Size = 15
    end
  end
  object dtsTiposPrazo: TDataSource
    DataSet = mtbTiposPrazo
    Left = 832
    Top = 78
  end
end
