inherited dtmPainelSiags: TdtmPainelSiags
  Height = 791
  Width = 1472
  inherited mtbPainel: TFDMemTable
    StoreDefs = True
    object mtbPainelid_Autorizacao: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id_Autorizacao'
      Origin = 'id_Processo'
      ProviderFlags = [pfInWhere]
    end
    object mtbPaineluf: TStringField
      FieldName = 'uf'
      Origin = 'uf'
      Size = 2
    end
    object mtbPainelNumero_Autorizacao: TLargeintField
      FieldName = 'Numero_Autorizacao'
      Origin = 'Numero_Autorizacao'
    end
    object mtbPainelAnexo_Opme: TStringField
      FieldName = 'Anexo_Opme'
      Origin = 'Anexo_Opme'
      Size = 3
    end
    object mtbPainelAnexo_Quimio: TStringField
      FieldName = 'Anexo_Quimio'
      Origin = 'Anexo_Quimio'
      Size = 3
    end
    object mtbPainelAnexo_Radio: TStringField
      FieldName = 'Anexo_Radio'
      Origin = 'Anexo_Radio'
      Size = 3
    end
    object mtbPainelDia_Inclusao: TIntegerField
      FieldName = 'Dia_Inclusao'
      Origin = 'Dia_Inclusao'
    end
    object mtbPainelDias_Corridos_Base: TIntegerField
      FieldName = 'Dias_Corridos_Base'
      Origin = 'Dias_Corridos_Base'
    end
    object mtbPainelDias_Uteis_Base: TIntegerField
      FieldName = 'Dias_Uteis_Base'
      Origin = 'Dias_Uteis_Base'
    end
    object mtbPainelDias_Prazo_Caixa: TIntegerField
      FieldName = 'Dias_Prazo_Caixa'
      Origin = 'Dias_Prazo_Caixa'
    end
    object mtbPainelData_Prazo_Caixa: TDateTimeField
      FieldName = 'Data_Prazo_Caixa'
      Origin = 'Data_Prazo_Caixa'
    end
    object mtbPainelDias_Prazo_ANS: TIntegerField
      FieldName = 'Dias_Prazo_ANS'
      Origin = 'Dias_Prazo_ANS'
    end
    object mtbPainelData_Prazo_ANS: TDateTimeField
      FieldName = 'Data_Prazo_ANS'
      Origin = 'Data_Prazo_ANS'
    end
    object mtbPainelTipo_Autorizacao: TStringField
      FieldName = 'Tipo_Autorizacao'
      Origin = 'Tipo_Autorizacao'
      Size = 50
    end
    object mtbPainelTipo_Atendimento: TStringField
      FieldName = 'Tipo_Atendimento'
      Origin = 'Tipo_Atendimento'
      Size = 30
    end
    object mtbPainelNumero_Beneficiario: TStringField
      FieldName = 'Numero_Beneficiario'
      Origin = 'Numero_Beneficiario'
      Size = 15
    end
    object mtbPainelNome_Beneficiario: TStringField
      FieldName = 'Nome_Beneficiario'
      Origin = 'Nome_Beneficiario'
      Size = 100
    end
    object mtbPainelTipo_Situacao_Autorizacao: TStringField
      FieldName = 'Tipo_Situacao_Autorizacao'
      Origin = 'Tipo_Situacao_Autorizacao'
      Size = 30
    end
    object mtbPainelTipo_Ultima_Anotacao: TStringField
      FieldName = 'Tipo_Ultima_Anotacao'
      Origin = 'Tipo_Ultima_Anotacao'
      Size = 30
    end
    object mtbPainelTipo_Auditoria: TStringField
      FieldName = 'Tipo_Auditoria'
      Origin = 'Tipo_Auditoria'
      Size = 15
    end
    object mtbPainelTipo_Prazo_Caixa: TStringField
      FieldName = 'Tipo_Prazo_Caixa'
      Origin = 'Tipo_Prazo_Caixa'
      Size = 15
    end
    object mtbPainelTipo_Prazo_Ans: TStringField
      FieldName = 'Tipo_Prazo_Ans'
      Origin = 'Tipo_Prazo_Ans'
      Size = 15
    end
    object mtbPainelid_Setor_Designado: TIntegerField
      FieldName = 'id_Setor_Designado'
    end
    object mtbPainelSetor_Designado: TStringField
      FieldName = 'Setor_Designado'
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
    object cdsPainelid_Autorizacao: TLargeintField
      FieldName = 'id_Autorizacao'
    end
    object cdsPaineluf: TStringField
      Alignment = taCenter
      FieldName = 'uf'
      Origin = 'uf'
      Size = 2
    end
    object cdsPainelNumero_Autorizacao: TLargeintField
      Alignment = taCenter
      FieldName = 'Numero_Autorizacao'
      Origin = 'Numero_Autorizacao'
    end
    object cdsPainelAnexo_Opme: TStringField
      Alignment = taCenter
      FieldName = 'Anexo_Opme'
      Origin = 'Anexo_Opme'
      Size = 3
    end
    object cdsPainelAnexo_Quimio: TStringField
      Alignment = taCenter
      FieldName = 'Anexo_Quimio'
      Origin = 'Anexo_Quimio'
      Size = 3
    end
    object cdsPainelAnexo_Radio: TStringField
      Alignment = taCenter
      FieldName = 'Anexo_Radio'
      Origin = 'Anexo_Radio'
      Size = 3
    end
    object cdsPainelDia_Inclusao: TIntegerField
      Alignment = taCenter
      FieldName = 'Dia_Inclusao'
      Origin = 'Dia_Inclusao'
    end
    object cdsPainelDias_Corridos_Base: TIntegerField
      Alignment = taCenter
      FieldName = 'Dias_Corridos_Base'
      Origin = 'Dias_Corridos_Base'
    end
    object cdsPainelDias_Uteis_Base: TIntegerField
      Alignment = taCenter
      FieldName = 'Dias_Uteis_Base'
      Origin = 'Dias_Uteis_Base'
    end
    object cdsPainelDias_Prazo_Caixa: TIntegerField
      Alignment = taCenter
      FieldName = 'Dias_Prazo_Caixa'
      Origin = 'Dias_Prazo_Caixa'
    end
    object cdsPainelData_Prazo_Caixa: TDateTimeField
      Alignment = taCenter
      FieldName = 'Data_Prazo_Caixa'
      Origin = 'Data_Prazo_Caixa'
    end
    object cdsPainelDias_Prazo_ANS: TIntegerField
      Alignment = taCenter
      FieldName = 'Dias_Prazo_ANS'
      Origin = 'Dias_Prazo_ANS'
    end
    object cdsPainelData_Prazo_ANS: TDateTimeField
      Alignment = taCenter
      FieldName = 'Data_Prazo_ANS'
      Origin = 'Data_Prazo_ANS'
    end
    object cdsPainelTipo_Autorizacao: TStringField
      FieldName = 'Tipo_Autorizacao'
      Origin = 'Tipo_Autorizacao'
      Size = 50
    end
    object cdsPainelTipo_Atendimento: TStringField
      FieldName = 'Tipo_Atendimento'
      Origin = 'Tipo_Atendimento'
      Size = 30
    end
    object cdsPainelNumero_Beneficiario: TStringField
      FieldName = 'Numero_Beneficiario'
      Origin = 'Numero_Beneficiario'
      Size = 15
    end
    object cdsPainelNome_Beneficiario: TStringField
      FieldName = 'Nome_Beneficiario'
      Origin = 'Nome_Beneficiario'
      Size = 100
    end
    object cdsPainelTipo_Situacao_Autorizacao: TStringField
      FieldName = 'Tipo_Situacao_Autorizacao'
      Origin = 'Tipo_Situacao_Autorizacao'
      Size = 30
    end
    object cdsPainelTipo_Ultima_Anotacao: TStringField
      FieldName = 'Tipo_Ultima_Anotacao'
      Origin = 'Tipo_Ultima_Anotacao'
      Size = 30
    end
    object cdsPainelTipo_Auditoria: TStringField
      Alignment = taCenter
      FieldName = 'Tipo_Auditoria'
      Origin = 'Tipo_Auditoria'
      Size = 15
    end
    object cdsPainelTipo_Prazo_Caixa: TStringField
      Alignment = taCenter
      FieldName = 'Tipo_Prazo_Caixa'
      Origin = 'Tipo_Prazo_Caixa'
      Size = 15
    end
    object cdsPainelTipo_Prazo_Ans: TStringField
      Alignment = taCenter
      FieldName = 'Tipo_Prazo_Ans'
      Origin = 'Tipo_Prazo_Ans'
      Size = 15
    end
    object cdsPainelid_Usuario_Designado: TIntegerField
      FieldName = 'id_Usuario_Designado'
    end
    object cdsPainelUsuario_Designado: TStringField
      FieldName = 'Usuario_Designado'
      Origin = 'Usuario_Designado'
      OnGetText = cdsPainelUsuario_DesignadoGetText
      Size = 100
    end
    object cdsPainelid_Setor_Designado: TIntegerField
      FieldName = 'id_Setor_Designado'
    end
    object cdsPainelSetor_Designado: TStringField
      FieldName = 'Setor_Designado'
      OnGetText = cdsPainelUsuario_DesignadoGetText
      Size = 50
    end
    object cdsPainelQtd_Historicos: TIntegerField
      Alignment = taCenter
      FieldName = 'Qtd_Historicos'
      ProviderFlags = []
    end
    object cdsPainelQtd_Designacoes: TIntegerField
      Alignment = taCenter
      FieldName = 'Qtd_Designacoes'
      ProviderFlags = []
    end
    object cdsPainelQtd_Observacoes: TIntegerField
      Alignment = taCenter
      FieldName = 'Qtd_Observacoes'
      ProviderFlags = []
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
    object mtbHistoricoAtualizacoesNome_Usuario: TStringField
      FieldName = 'Nome_Usuario'
      Size = 100
    end
    object mtbHistoricoAtualizacoesData_Hora_Historico: TDateTimeField
      FieldName = 'Data_Hora_Historico'
    end
    object mtbHistoricoAtualizacoesAnexo_Opme: TStringField
      FieldName = 'Anexo_Opme'
      Origin = 'Anexo_Opme'
      Size = 3
    end
    object mtbHistoricoAtualizacoesAnexo_Quimio: TStringField
      FieldName = 'Anexo_Quimio'
      Origin = 'Anexo_Quimio'
      Size = 3
    end
    object mtbHistoricoAtualizacoesAnexo_Radio: TStringField
      FieldName = 'Anexo_Radio'
      Origin = 'Anexo_Radio'
      Size = 3
    end
    object mtbHistoricoAtualizacoesDias_Corridos_Base: TIntegerField
      FieldName = 'Dias_Corridos_Base'
      Origin = 'Dias_Corridos_Base'
    end
    object mtbHistoricoAtualizacoesDias_Uteis_Base: TIntegerField
      FieldName = 'Dias_Uteis_Base'
      Origin = 'Dias_Uteis_Base'
    end
    object mtbHistoricoAtualizacoesDias_Prazo_Caixa: TIntegerField
      FieldName = 'Dias_Prazo_Caixa'
      Origin = 'Dias_Prazo_Caixa'
    end
    object mtbHistoricoAtualizacoesData_Prazo_Caixa: TDateTimeField
      FieldName = 'Data_Prazo_Caixa'
      Origin = 'Data_Prazo_Caixa'
    end
    object mtbHistoricoAtualizacoesDias_Prazo_ANS: TIntegerField
      FieldName = 'Dias_Prazo_ANS'
      Origin = 'Dias_Prazo_ANS'
    end
    object mtbHistoricoAtualizacoesData_Prazo_ANS: TDateTimeField
      FieldName = 'Data_Prazo_ANS'
      Origin = 'Data_Prazo_ANS'
    end
    object mtbHistoricoAtualizacoesTipo_Autorizacao: TStringField
      FieldName = 'Tipo_Autorizacao'
      Origin = 'Tipo_Autorizacao'
      Size = 50
    end
    object mtbHistoricoAtualizacoesTipo_Atendimento: TStringField
      FieldName = 'Tipo_Atendimento'
      Origin = 'Tipo_Atendimento'
      Size = 30
    end
    object mtbHistoricoAtualizacoesTipo_Situacao_Autorizacao: TStringField
      FieldName = 'Tipo_Situacao_Autorizacao'
      Origin = 'Tipo_Situacao_Autorizacao'
      Size = 30
    end
    object mtbHistoricoAtualizacoesTipo_Ultima_Anotacao: TStringField
      FieldName = 'Tipo_Ultima_Anotacao'
      Origin = 'Tipo_Ultima_Anotacao'
      Size = 30
    end
    object mtbHistoricoAtualizacoesTipo_Auditoria: TStringField
      FieldName = 'Tipo_Auditoria'
      Origin = 'Tipo_Auditoria'
      Size = 15
    end
    object mtbHistoricoAtualizacoesTipo_Prazo_Caixa: TStringField
      FieldName = 'Tipo_Prazo_Caixa'
      Origin = 'Tipo_Prazo_Caixa'
      Size = 15
    end
    object mtbHistoricoAtualizacoesTipo_Prazo_Ans: TStringField
      FieldName = 'Tipo_Prazo_Ans'
      Origin = 'Tipo_Prazo_Ans'
      Size = 15
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
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 367.393940000000000000
          Top = 50.913420000000000000
          Width = 113.385900000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          DataField = 'Numero_Autorizacao'
          DataSet = fdbExtrato
          DataSetName = 'fdbExtrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbExtrato."Numero_Autorizacao"]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 258.897805000000000000
          Top = 50.913420000000000000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          DataSet = fdbExtrato
          DataSetName = 'fdbExtrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'N'#186' da Autoriza'#231#227'o:')
          ParentFont = False
        end
      end
      inherited MasterData1: TfrxMasterData
        Height = 366.008030240000000000
        Child = frpExtrato.Child2
        object Memo56: TfrxMemoView
          AllowVectorExport = True
          Left = 266.456865000000000000
          Top = 7.255870120000000000
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
            'Dados Atuais da Autoriza'#231#227'o')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 51.661410000000000000
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
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 130.267780000000000000
          Top = 51.661410000000000000
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
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 315.567100000000000000
          Top = 51.661410000000000000
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
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 425.496290000000000000
          Top = 51.661410000000000000
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
        object Memo34: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 315.567100000000000000
          Top = 65.779530000000000000
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
        object Memo35: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 425.496290000000000000
          Top = 65.779530000000000000
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
        object fdbExtratoNumero_Processo1: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 67.559060000000000000
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
        object Memo33: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 130.267780000000000000
          Top = 67.559060000000000000
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
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 91.929190000000000000
          Top = 109.000009760000000000
          Width = 105.826840000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Tipo da Autoriza'#231#227'o')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 126.897650000000000000
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          DataField = 'uf'
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
            '[fdbExtrato."uf"]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 91.929190000000000000
          Top = 126.897650000000000000
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          AutoWidth = True
          DataField = 'Tipo_Autorizacao'
          DataSet = fdbExtrato
          DataSetName = 'fdbExtrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbExtrato."Tipo_Autorizacao"]')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 270.008040000000000000
          Top = 109.000009760000000000
          Width = 109.606370000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Tipo de Atendimento')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 270.008040000000000000
          Top = 126.897650000000000000
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          AutoWidth = True
          DataField = 'Tipo_Atendimento'
          DataSet = fdbExtrato
          DataSetName = 'fdbExtrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbExtrato."Tipo_Atendimento"]')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 443.850650000000000000
          Top = 109.606370000000000000
          Width = 49.133890000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'OPME')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Left = 506.882190000000000000
          Top = 109.606370000000000000
          Width = 49.133890000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Quimio')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Left = 572.354670000000000000
          Top = 109.606370000000000000
          Width = 49.133890000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Radio')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Left = 443.850650000000000000
          Top = 90.708720000000000000
          Width = 177.637910000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Anexos')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          AllowVectorExport = True
          Left = 443.850650000000000000
          Top = 126.897650000000000000
          Width = 49.133890000000000000
          Height = 15.118110240000000000
          AutoWidth = True
          DataField = 'Anexo_Opme'
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
            '[fdbExtrato."Anexo_Opme"]')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          AllowVectorExport = True
          Left = 508.102660000000000000
          Top = 126.897650000000000000
          Width = 49.133890000000000000
          Height = 15.118110240000000000
          AutoWidth = True
          DataField = 'Anexo_Quimio'
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
            '[fdbExtrato."Anexo_Quimio"]')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          AllowVectorExport = True
          Left = 572.354670000000000000
          Top = 126.897650000000000000
          Width = 49.133890000000000000
          Height = 15.118110240000000000
          AutoWidth = True
          DataField = 'Anexo_Radio'
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
            '[fdbExtrato."Anexo_Radio"]')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 97.661419760000000000
          Width = 60.472480000000000000
          Height = 26.456700240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'UF do'
            'Prestador')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 158.740260000000000000
          Width = 105.826840000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'N'#186' do Benefici'#225'rio')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 175.637900240000000000
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          AutoWidth = True
          DataField = 'Numero_Beneficiario'
          DataSet = fdbExtrato
          DataSetName = 'fdbExtrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbExtrato."Numero_Beneficiario"]')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          AllowVectorExport = True
          Left = 143.622140000000000000
          Top = 158.740260000000000000
          Width = 128.504020000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Nome do Benefici'#225'rio')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          AllowVectorExport = True
          Left = 143.622140000000000000
          Top = 175.637900240000000000
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          AutoWidth = True
          DataField = 'Nome_Beneficiario'
          DataSet = fdbExtrato
          DataSetName = 'fdbExtrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbExtrato."Nome_Beneficiario"]')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          AllowVectorExport = True
          Left = 393.071120000000000000
          Top = 158.740260000000000000
          Width = 128.504020000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Situa'#231#227'o da Autoriza'#231#227'o')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          AllowVectorExport = True
          Left = 393.071120000000000000
          Top = 175.637900240000000000
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          AutoWidth = True
          DataField = 'Tipo_Situacao_Autorizacao'
          DataSet = fdbExtrato
          DataSetName = 'fdbExtrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbExtrato."Tipo_Situacao_Autorizacao"]')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 210.094620000000000000
          Width = 128.504020000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            #218'ltima Anota'#231#227'o ADM')
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 226.992260240000000000
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          AutoWidth = True
          DataField = 'Tipo_Ultima_Anotacao'
          DataSet = fdbExtrato
          DataSetName = 'fdbExtrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbExtrato."Tipo_Ultima_Anotacao"]')
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          AllowVectorExport = True
          Left = 270.008040000000000000
          Top = 210.094620000000000000
          Width = 128.504020000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Auditoria')
          ParentFont = False
        end
        object Memo65: TfrxMemoView
          AllowVectorExport = True
          Left = 270.008040000000000000
          Top = 226.992260240000000000
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          AutoWidth = True
          DataField = 'Tipo_Auditoria'
          DataSet = fdbExtrato
          DataSetName = 'fdbExtrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbExtrato."Tipo_Auditoria"]')
          ParentFont = False
        end
        object Memo66: TfrxMemoView
          AllowVectorExport = True
          Left = 419.527830000000000000
          Top = 226.992260240000000000
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          DataField = 'Dia_Inclusao'
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
            '[fdbExtrato."Dia_Inclusao"]')
          ParentFont = False
        end
        object Memo67: TfrxMemoView
          AllowVectorExport = True
          Left = 419.527830000000000000
          Top = 198.756030000000000000
          Width = 60.472480000000000000
          Height = 26.456700240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Dia da'
            'Inclus'#227'o')
          ParentFont = False
        end
        object Memo68: TfrxMemoView
          AllowVectorExport = True
          Left = 498.897960000000000000
          Top = 226.992260240000000000
          Width = 75.590600000000000000
          Height = 15.118110240000000000
          DataField = 'Dias_Corridos_Base'
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
            '[fdbExtrato."Dias_Corridos_Base"]')
          ParentFont = False
        end
        object Memo69: TfrxMemoView
          AllowVectorExport = True
          Left = 498.897960000000000000
          Top = 198.756030000000000000
          Width = 75.590600000000000000
          Height = 26.456700240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Dias Corridos'
            'Base')
          ParentFont = False
        end
        object Memo70: TfrxMemoView
          AllowVectorExport = True
          Left = 600.945270000000000000
          Top = 228.551320240000000000
          Width = 75.590600000000000000
          Height = 15.118110240000000000
          DataField = 'Dias_Uteis_Base'
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
            '[fdbExtrato."Dias_Uteis_Base"]')
          ParentFont = False
        end
        object Memo71: TfrxMemoView
          AllowVectorExport = True
          Left = 600.945270000000000000
          Top = 200.315090000000000000
          Width = 75.590600000000000000
          Height = 26.456700240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Dias '#218'teis'
            'Base')
          ParentFont = False
        end
        object Memo72: TfrxMemoView
          AllowVectorExport = True
          Left = 269.425480000000000000
          Top = 272.126160000000000000
          Width = 49.133890000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
        object Memo73: TfrxMemoView
          AllowVectorExport = True
          Left = 392.929500000000000000
          Top = 272.126160000000000000
          Width = 49.133890000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Status')
          ParentFont = False
        end
        object Memo74: TfrxMemoView
          AllowVectorExport = True
          Left = 332.457020000000000000
          Top = 272.126160000000000000
          Width = 49.133890000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Dias')
          ParentFont = False
        end
        object Memo75: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 253.228510000000000000
          Width = 192.756030000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Prazo Caixa')
          ParentFont = False
        end
        object Memo76: TfrxMemoView
          AllowVectorExport = True
          Left = 269.425480000000000000
          Top = 289.417440000000000000
          Width = 49.133890000000000000
          Height = 15.118110240000000000
          AutoWidth = True
          DataField = 'Data_Prazo_ANS'
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
            '[fdbExtrato."Data_Prazo_ANS"]')
          ParentFont = False
        end
        object Memo77: TfrxMemoView
          AllowVectorExport = True
          Left = 392.929500000000000000
          Top = 289.417440000000000000
          Width = 49.133890000000000000
          Height = 15.118110240000000000
          AutoWidth = True
          DataField = 'Tipo_Prazo_Ans'
          DataSet = fdbExtrato
          DataSetName = 'fdbExtrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbExtrato."Tipo_Prazo_Ans"]')
          ParentFont = False
        end
        object Memo78: TfrxMemoView
          AllowVectorExport = True
          Left = 332.457020000000000000
          Top = 289.417440000000000000
          Width = 49.133890000000000000
          Height = 15.118110240000000000
          AutoWidth = True
          DataField = 'Dias_Prazo_ANS'
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
            '[fdbExtrato."Dias_Prazo_ANS"]')
          ParentFont = False
        end
        object Memo79: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 272.126160000000000000
          Width = 49.133890000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
        object Memo80: TfrxMemoView
          AllowVectorExport = True
          Left = 76.378170000000000000
          Top = 272.126160000000000000
          Width = 49.133890000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Situa'#231#227'o')
          ParentFont = False
        end
        object Memo81: TfrxMemoView
          AllowVectorExport = True
          Left = 155.850650000000000000
          Top = 272.126160000000000000
          Width = 49.133890000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Dias')
          ParentFont = False
        end
        object Memo82: TfrxMemoView
          AllowVectorExport = True
          Left = 268.346630000000000000
          Top = 253.228510000000000000
          Width = 192.756030000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Prazo ANS')
          ParentFont = False
        end
        object Memo83: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 289.417440000000000000
          Width = 49.133890000000000000
          Height = 15.118110240000000000
          AutoWidth = True
          DataField = 'Data_Prazo_Caixa'
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
            '[fdbExtrato."Data_Prazo_Caixa"]')
          ParentFont = False
        end
        object Memo84: TfrxMemoView
          AllowVectorExport = True
          Left = 77.598640000000000000
          Top = 289.417440000000000000
          Width = 49.133890000000000000
          Height = 15.118110240000000000
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
        object Memo85: TfrxMemoView
          AllowVectorExport = True
          Left = 155.850650000000000000
          Top = 289.417440000000000000
          Width = 49.133890000000000000
          Height = 15.118110240000000000
          AutoWidth = True
          DataField = 'Dias_Prazo_Caixa'
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
            '[fdbExtrato."Dias_Prazo_Caixa"]')
          ParentFont = False
        end
        object Memo86: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 321.260050000000000000
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
        object Memo87: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 338.157700000000000000
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
        object Memo88: TfrxMemoView
          AllowVectorExport = True
          Left = 211.976500000000000000
          Top = 321.260050000000000000
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
        object Memo89: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 211.976500000000000000
          Top = 338.157700000000000000
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
        object Memo90: TfrxMemoView
          AllowVectorExport = True
          Left = 404.732530000000000000
          Top = 321.260050000000000000
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
        object Memo91: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 404.732530000000000000
          Top = 338.157700000000000000
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
        object Memo92: TfrxMemoView
          AllowVectorExport = True
          Left = 510.559370000000000000
          Top = 321.260050000000000000
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
        object Memo53: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 510.559370000000000000
          Top = 338.157700000000000000
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
        object Memo54: TfrxMemoView
          AllowVectorExport = True
          Left = 623.945270000000000000
          Top = 321.260050000000000000
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
        object Memo55: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 623.945270000000000000
          Top = 338.157700000000000000
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
      object Child2: TfrxChild
        FillType = ftBrush
        Frame.Typ = []
        Height = 41.574803150000000000
        Top = 548.031849999999900000
        Width = 718.110700000000000000
        Child = frpExtrato.Child3
        ToNRows = 0
        ToNRowsMode = rmCount
        object Memo57: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 4.779530000000000000
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
        object Memo58: TfrxMemoView
          AllowVectorExport = True
          Left = 130.590600000000000000
          Top = 4.779530000000000000
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
        object Memo59: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 21.677180000000000000
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
        object Memo60: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 130.590600000000000000
          Top = 21.677180000000000000
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
        object Memo61: TfrxMemoView
          AllowVectorExport = True
          Left = 321.582870000000000000
          Top = 4.779530000000000000
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
        object Memo62: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 321.582870000000000000
          Top = 21.677180000000000000
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
      object Child3: TfrxChild
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 612.283860000000000000
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
            'Atualiza'#231#245'es da Autoriza'#231#227'o')
        end
      end
      inherited MasterData2: TfrxMasterData
        Height = 238.110390000000000000
        Top = 64.252010000000000000
        Width = 718.110700000000000000
        inherited memBackGroundAtualizacoes: TfrxMemoView
          Width = 718.110700000000000000
          Height = 238.110390000000000000
        end
        object Memo93: TfrxMemoView
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
        object Memo94: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 11.338582677165350000
          Top = 28.236240000000000000
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
        object Memo95: TfrxMemoView
          AllowVectorExport = True
          Left = 177.976500000000000000
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
        object Memo96: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 177.976500000000000000
          Top = 28.236240000000000000
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
        object Memo97: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 57.472480000000000000
          Width = 105.826840000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Tipo da Autoriza'#231#227'o')
          ParentFont = False
        end
        object Memo98: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 75.370120240000000000
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          AutoWidth = True
          DataField = 'Tipo_Autorizacao'
          DataSet = fdbAtualizacoes
          DataSetName = 'fdbAtualizacoes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbAtualizacoes."Tipo_Autorizacao"]')
          ParentFont = False
        end
        object Memo99: TfrxMemoView
          AllowVectorExport = True
          Left = 189.417440000000000000
          Top = 57.472480000000000000
          Width = 109.606370000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Tipo de Atendimento')
          ParentFont = False
        end
        object Memo100: TfrxMemoView
          AllowVectorExport = True
          Left = 189.417440000000000000
          Top = 75.370120240000000000
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          AutoWidth = True
          DataField = 'Tipo_Atendimento'
          DataSet = fdbAtualizacoes
          DataSetName = 'fdbAtualizacoes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbAtualizacoes."Tipo_Atendimento"]')
          ParentFont = False
        end
        object Memo101: TfrxMemoView
          AllowVectorExport = True
          Left = 369.173470000000000000
          Top = 57.472480000000000000
          Width = 128.504020000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Situa'#231#227'o da Autoriza'#231#227'o')
          ParentFont = False
        end
        object Memo102: TfrxMemoView
          AllowVectorExport = True
          Left = 369.173470000000000000
          Top = 75.370120240000000000
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          AutoWidth = True
          DataField = 'Tipo_Situacao_Autorizacao'
          DataSet = fdbAtualizacoes
          DataSetName = 'fdbAtualizacoes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbAtualizacoes."Tipo_Situacao_Autorizacao"]')
          ParentFont = False
        end
        object Memo103: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 120.944960000000000000
          Width = 128.504020000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            #218'ltima Anota'#231#227'o ADM')
          ParentFont = False
        end
        object Memo104: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 138.236240000000000000
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          AutoWidth = True
          DataField = 'Tipo_Ultima_Anotacao'
          DataSet = fdbAtualizacoes
          DataSetName = 'fdbAtualizacoes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbAtualizacoes."Tipo_Ultima_Anotacao"]')
          ParentFont = False
        end
        object Memo105: TfrxMemoView
          AllowVectorExport = True
          Left = 245.008040000000000000
          Top = 120.944960000000000000
          Width = 128.504020000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Auditoria')
          ParentFont = False
        end
        object Memo106: TfrxMemoView
          AllowVectorExport = True
          Left = 245.008040000000000000
          Top = 138.236240000000000000
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          AutoWidth = True
          DataField = 'Tipo_Auditoria'
          DataSet = fdbAtualizacoes
          DataSetName = 'fdbAtualizacoes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbAtualizacoes."Tipo_Auditoria"]')
          ParentFont = False
        end
        object Memo107: TfrxMemoView
          AllowVectorExport = True
          Left = 341.984540000000000000
          Top = 120.944960000000000000
          Width = 49.133890000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'OPME')
          ParentFont = False
        end
        object Memo108: TfrxMemoView
          AllowVectorExport = True
          Left = 405.016080000000000000
          Top = 120.944960000000000000
          Width = 49.133890000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Quimio')
          ParentFont = False
        end
        object Memo109: TfrxMemoView
          AllowVectorExport = True
          Left = 470.488560000000000000
          Top = 120.944960000000000000
          Width = 49.133890000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Radio')
          ParentFont = False
        end
        object Memo110: TfrxMemoView
          AllowVectorExport = True
          Left = 341.984540000000000000
          Top = 102.047310000000000000
          Width = 177.637910000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Anexos')
          ParentFont = False
        end
        object Memo111: TfrxMemoView
          AllowVectorExport = True
          Left = 341.984540000000000000
          Top = 138.236240000000000000
          Width = 49.133890000000000000
          Height = 15.118110240000000000
          AutoWidth = True
          DataField = 'Anexo_Opme'
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
            '[fdbAtualizacoes."Anexo_Opme"]')
          ParentFont = False
        end
        object Memo112: TfrxMemoView
          AllowVectorExport = True
          Left = 406.236550000000000000
          Top = 138.236240000000000000
          Width = 49.133890000000000000
          Height = 15.118110240000000000
          AutoWidth = True
          DataField = 'Anexo_Quimio'
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
            '[fdbAtualizacoes."Anexo_Quimio"]')
          ParentFont = False
        end
        object Memo113: TfrxMemoView
          AllowVectorExport = True
          Left = 470.488560000000000000
          Top = 138.236240000000000000
          Width = 49.133890000000000000
          Height = 15.118110240000000000
          AutoWidth = True
          DataField = 'Anexo_Radio'
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
            '[fdbAtualizacoes."Anexo_Radio"]')
          ParentFont = False
        end
        object Memo114: TfrxMemoView
          AllowVectorExport = True
          Left = 544.370440000000000000
          Top = 138.236240000000000000
          Width = 75.590600000000000000
          Height = 15.118110240000000000
          DataField = 'Dias_Corridos_Base'
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
            '[fdbAtualizacoes."Dias_Corridos_Base"]')
          ParentFont = False
        end
        object Memo115: TfrxMemoView
          AllowVectorExport = True
          Left = 544.370440000000000000
          Top = 109.606370000000000000
          Width = 75.590600000000000000
          Height = 26.456700240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Dias Corridos'
            'Base')
          ParentFont = False
        end
        object Memo116: TfrxMemoView
          AllowVectorExport = True
          Left = 635.417750000000000000
          Top = 138.236240000000000000
          Width = 75.590600000000000000
          Height = 15.118110240000000000
          DataField = 'Dias_Uteis_Base'
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
            '[fdbAtualizacoes."Dias_Uteis_Base"]')
          ParentFont = False
        end
        object Memo117: TfrxMemoView
          AllowVectorExport = True
          Left = 635.417750000000000000
          Top = 109.606370000000000000
          Width = 75.590600000000000000
          Height = 26.456700240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Dias '#218'teis'
            'Base')
          ParentFont = False
        end
        object Memo119: TfrxMemoView
          AllowVectorExport = True
          Left = 358.929500000000000000
          Top = 188.976500000000000000
          Width = 49.133890000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Status')
          ParentFont = False
        end
        object Memo120: TfrxMemoView
          AllowVectorExport = True
          Left = 268.346630000000000000
          Top = 188.976500000000000000
          Width = 49.133890000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Dias')
          ParentFont = False
        end
        object Memo121: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 170.078850000000000000
          Width = 139.842610000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Prazo Caixa')
          ParentFont = False
        end
        object Memo123: TfrxMemoView
          AllowVectorExport = True
          Left = 358.929500000000000000
          Top = 206.267780000000000000
          Width = 49.133890000000000000
          Height = 15.118110240000000000
          AutoWidth = True
          DataField = 'Tipo_Prazo_Ans'
          DataSet = fdbAtualizacoes
          DataSetName = 'fdbAtualizacoes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbAtualizacoes."Tipo_Prazo_Ans"]')
          ParentFont = False
        end
        object Memo124: TfrxMemoView
          AllowVectorExport = True
          Left = 268.346630000000000000
          Top = 206.267780000000000000
          Width = 49.133890000000000000
          Height = 15.118110240000000000
          AutoWidth = True
          DataField = 'Dias_Prazo_ANS'
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
            '[fdbAtualizacoes."Dias_Prazo_ANS"]')
          ParentFont = False
        end
        object Memo126: TfrxMemoView
          AllowVectorExport = True
          Left = 12.378170000000000000
          Top = 188.976500000000000000
          Width = 49.133890000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Situa'#231#227'o')
          ParentFont = False
        end
        object Memo127: TfrxMemoView
          AllowVectorExport = True
          Left = 101.850650000000000000
          Top = 188.976500000000000000
          Width = 49.133890000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Dias')
          ParentFont = False
        end
        object Memo128: TfrxMemoView
          AllowVectorExport = True
          Left = 268.346630000000000000
          Top = 170.078850000000000000
          Width = 192.756030000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Prazo ANS')
          ParentFont = False
        end
        object Memo130: TfrxMemoView
          AllowVectorExport = True
          Left = 13.598640000000000000
          Top = 206.267780000000000000
          Width = 49.133890000000000000
          Height = 15.118110240000000000
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
        object Memo131: TfrxMemoView
          AllowVectorExport = True
          Left = 101.850650000000000000
          Top = 206.267780000000000000
          Width = 49.133890000000000000
          Height = 15.118110240000000000
          AutoWidth = True
          DataField = 'Dias_Prazo_Caixa'
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
            '[fdbAtualizacoes."Dias_Prazo_Caixa"]')
          ParentFont = False
        end
      end
      inherited Footer1: TfrxFooter
        Top = 325.039580000000000000
        Width = 718.110700000000000000
      end
    end
    inherited pagObservacoes: TfrxReportPage
      inherited GroupHeader3: TfrxGroupHeader
        Child = frpExtrato.Child1
      end
    end
  end
  inherited fdbExtrato: TfrxDBDataset
    FieldAliases.Strings = (
      'id_Autorizacao=id_Autorizacao'
      'uf=uf'
      'Numero_Autorizacao=Numero_Autorizacao'
      'Anexo_Opme=Anexo_Opme'
      'Anexo_Quimio=Anexo_Quimio'
      'Anexo_Radio=Anexo_Radio'
      'Dia_Inclusao=Dia_Inclusao'
      'Dias_Corridos_Base=Dias_Corridos_Base'
      'Dias_Uteis_Base=Dias_Uteis_Base'
      'Dias_Prazo_Caixa=Dias_Prazo_Caixa'
      'Data_Prazo_Caixa=Data_Prazo_Caixa'
      'Dias_Prazo_ANS=Dias_Prazo_ANS'
      'Data_Prazo_ANS=Data_Prazo_ANS'
      'Tipo_Autorizacao=Tipo_Autorizacao'
      'Tipo_Atendimento=Tipo_Atendimento'
      'Numero_Beneficiario=Numero_Beneficiario'
      'Nome_Beneficiario=Nome_Beneficiario'
      'Tipo_Situacao_Autorizacao=Tipo_Situacao_Autorizacao'
      'Tipo_Ultima_Anotacao=Tipo_Ultima_Anotacao'
      'Tipo_Auditoria=Tipo_Auditoria'
      'Tipo_Prazo_Caixa=Tipo_Prazo_Caixa'
      'Tipo_Prazo_Ans=Tipo_Prazo_Ans'
      'id_Usuario_Designado=id_Usuario_Designado'
      'Usuario_Designado=Usuario_Designado'
      'id_Setor_Designado=id_Setor_Designado'
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
      'Nome_Usuario=Nome_Usuario'
      'Data_Hora_Historico=Data_Hora_Historico'
      'Anexo_Opme=Anexo_Opme'
      'Anexo_Quimio=Anexo_Quimio'
      'Anexo_Radio=Anexo_Radio'
      'Dias_Corridos_Base=Dias_Corridos_Base'
      'Dias_Uteis_Base=Dias_Uteis_Base'
      'Dias_Prazo_Caixa=Dias_Prazo_Caixa'
      'Data_Prazo_Caixa=Data_Prazo_Caixa'
      'Dias_Prazo_ANS=Dias_Prazo_ANS'
      'Data_Prazo_ANS=Data_Prazo_ANS'
      'Tipo_Autorizacao=Tipo_Autorizacao'
      'Tipo_Atendimento=Tipo_Atendimento'
      'Tipo_Situacao_Autorizacao=Tipo_Situacao_Autorizacao'
      'Tipo_Ultima_Anotacao=Tipo_Ultima_Anotacao'
      'Tipo_Auditoria=Tipo_Auditoria'
      'Tipo_Prazo_Caixa=Tipo_Prazo_Caixa'
      'Tipo_Prazo_Ans=Tipo_Prazo_Ans')
  end
  object mtbTiposAuditoria: TFDMemTable
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
    Left = 1037
    Top = 8
    object mtbTiposAuditoriaid: TIntegerField
      FieldName = 'id'
    end
    object mtbTiposAuditoriaTipo_Auditoria: TStringField
      FieldName = 'Tipo_Auditoria'
      Origin = 'Tipo_Auditoria'
      Size = 15
    end
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
    Left = 1037
    Top = 79
    object mtbTiposPrazoid: TIntegerField
      FieldName = 'id'
    end
    object mtbTiposPrazoTipo_Prazo_Caixa: TStringField
      FieldName = 'Tipo_Prazo_Caixa'
      Origin = 'Tipo_Prazo_Caixa'
      Size = 15
    end
  end
  object dtsTiposAuditoria: TDataSource
    DataSet = mtbTiposAuditoria
    Left = 832
    Top = 8
  end
  object dtsTiposPrazo: TDataSource
    DataSet = mtbTiposPrazo
    Left = 832
    Top = 79
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
    Left = 1037
    Top = 507
    object mtbSetoresid: TIntegerField
      FieldName = 'id'
    end
    object mtbSetoresNome_Setor: TStringField
      FieldName = 'Nome_Setor'
      Size = 50
    end
  end
  object dtsSetores: TDataSource
    DataSet = mtbSetores
    Left = 832
    Top = 507
  end
  object mtbUF: TFDMemTable
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
    Left = 1037
    Top = 579
    object mtbUFSigla: TStringField
      Alignment = taCenter
      FieldName = 'Sigla'
      Size = 5
    end
  end
  object dtsUF: TDataSource
    DataSet = mtbUF
    Left = 832
    Top = 579
  end
  object mtbTiposAutorizacao: TFDMemTable
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
    Left = 1037
    Top = 222
    object mtbTiposAutorizacaoid: TIntegerField
      FieldName = 'id'
    end
    object mtbTiposAutorizacaoTipo_Autorizacao: TStringField
      FieldName = 'Tipo_Autorizacao'
      Origin = 'Tipo_Autorizacao'
      Size = 50
    end
  end
  object dtsTiposAutorizacao: TDataSource
    DataSet = mtbTiposAutorizacao
    Left = 832
    Top = 222
  end
  object mtbTiposAtendimento: TFDMemTable
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
    Left = 1037
    Top = 293
    object mtbTiposAtendimentoid: TIntegerField
      FieldName = 'id'
    end
    object mtbTiposAtendimentoTipo_Atendimento: TStringField
      FieldName = 'Tipo_Atendimento'
      Origin = 'Tipo_Atendimento'
      Size = 30
    end
  end
  object dtsTiposAtendimento: TDataSource
    DataSet = mtbTiposAtendimento
    Left = 832
    Top = 293
  end
  object mtbTiposSituacaoAutorizacao: TFDMemTable
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
    Left = 1037
    Top = 364
    object mtbTiposSituacaoAutorizacaoid: TIntegerField
      FieldName = 'id'
    end
    object mtbTiposSituacaoAutorizacaoTipo_Situacao_Autorizacao: TStringField
      FieldName = 'Tipo_Situacao_Autorizacao'
      Origin = 'Tipo_Situacao_Autorizacao'
      Size = 30
    end
  end
  object dtsTiposSituacaoAutorizacao: TDataSource
    DataSet = mtbTiposSituacaoAutorizacao
    Left = 832
    Top = 364
  end
  object mtbTiposUltimaAnotacao: TFDMemTable
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
    Left = 1037
    Top = 436
    object mtbTiposUltimaAnotacaoid: TIntegerField
      FieldName = 'id'
    end
    object mtbTiposUltimaAnotacaoTipo_Ultima_Anotacao: TStringField
      FieldName = 'Tipo_Ultima_Anotacao'
      Origin = 'Tipo_Ultima_Anotacao'
      Size = 30
    end
  end
  object dtsTiposUltimaAnotacao: TDataSource
    DataSet = mtbTiposUltimaAnotacao
    Left = 832
    Top = 436
  end
  object mtbTiposPrazoANS: TFDMemTable
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
    Left = 1037
    Top = 150
    object mtbTiposPrazoANSid: TIntegerField
      FieldName = 'id'
    end
    object mtbTiposPrazoANSTipo_Prazo_Caixa: TStringField
      FieldName = 'Tipo_Prazo_Caixa'
      Origin = 'Tipo_Prazo_Caixa'
      Size = 15
    end
  end
  object dtsTiposPrazoANS: TDataSource
    DataSet = mtbTiposPrazoANS
    Left = 832
    Top = 150
  end
  object dtsPainel: TDataSource
    DataSet = cdsPainel
    Left = 144
    Top = 179
  end
end
