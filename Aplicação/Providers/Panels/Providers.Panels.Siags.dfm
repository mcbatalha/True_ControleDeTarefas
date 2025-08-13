inherited dtmPainelSiags: TdtmPainelSiags
  Height = 791
  Width = 1472
  inherited mtbPainel: TFDMemTable
    StoreDefs = True
    object mtbPainelSelecionado: TIntegerField
      FieldName = 'Selecionado'
    end
    object mtbPainelid_Autorizacao: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id_Autorizacao'
      Origin = 'id_Processo'
      ProviderFlags = [pfInWhere]
    end
    object mtbPainelNumero_Autorizacao: TLargeintField
      FieldName = 'Numero_Autorizacao'
      Origin = 'Numero_Autorizacao'
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
    object mtbPainelData_Prazo_Caixa: TDateTimeField
      Alignment = taCenter
      FieldName = 'Data_Prazo_Caixa'
    end
    object mtbPainelData_Prazo_ANS: TDateTimeField
      FieldName = 'Data_Prazo_ANS'
      Origin = 'Data_Prazo_ANS'
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
    object mtbPainelid_Status_True: TIntegerField
      FieldName = 'id_Status_True'
    end
    object mtbPainelStatus_True: TStringField
      FieldName = 'Status_True'
      Origin = 'Status_True'
      Size = 30
    end
    object mtbPainelTipo_Prazo: TStringField
      FieldName = 'Tipo_Prazo'
      Origin = 'Tipo_Prazo'
      Size = 10
    end
    object mtbPainelPrazo: TIntegerField
      FieldName = 'Prazo'
      Origin = 'Prazo'
    end
    object mtbPainelEncerra: TStringField
      FieldName = 'Encerra'
      Origin = 'Encerra'
      Size = 3
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
    object mtbPainelDesignacao_Pendente: TStringField
      FieldName = 'Designacao_Pendente'
      Size = 3
    end
  end
  inherited cdsPainel: TClientDataSet
    object cdsPainelSelecionado: TIntegerField
      FieldName = 'Selecionado'
    end
    object cdsPainelid_Autorizacao: TLargeintField
      FieldName = 'id_Autorizacao'
    end
    object cdsPainelNumero_Autorizacao: TLargeintField
      Alignment = taCenter
      FieldName = 'Numero_Autorizacao'
      Origin = 'Numero_Autorizacao'
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
    object cdsPainelData_Prazo_ANS: TDateTimeField
      Alignment = taCenter
      FieldName = 'Data_Prazo_ANS'
      Origin = 'Data_Prazo_ANS'
    end
    object cdsPainelData_Prazo_Caixa: TDateTimeField
      Alignment = taCenter
      FieldName = 'Data_Prazo_Caixa'
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
    object cdsPainelid_Setor_Designado: TIntegerField
      FieldName = 'id_Setor_Designado'
    end
    object cdsPainelSetor_Designado: TStringField
      FieldName = 'Setor_Designado'
      OnGetText = cdsPainelUsuario_DesignadoGetText
      Size = 50
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
    object cdsPainelid_Status_True: TIntegerField
      FieldName = 'id_Status_True'
    end
    object cdsPainelStatus_True: TStringField
      FieldName = 'Status_True'
      Origin = 'Status_True'
      Size = 30
    end
    object cdsPainelTipo_Prazo: TStringField
      FieldName = 'Tipo_Prazo'
      Origin = 'Tipo_Prazo'
      Size = 10
    end
    object cdsPainelPrazo: TIntegerField
      FieldName = 'Prazo'
      Origin = 'Prazo'
    end
    object cdsPainelEncerra: TStringField
      FieldName = 'Encerra'
      Origin = 'Encerra'
      Size = 3
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
    object cdsPainelDesignacao_Pendente: TStringField
      FieldName = 'Designacao_Pendente'
      Size = 3
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
    object mtbHistoricoAtualizacoesData_Prazo_Caixa: TDateTimeField
      FieldName = 'Data_Prazo_Caixa'
      Origin = 'Data_Prazo_Caixa'
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
    object mtbHistoricoAtualizacoesStatus_True: TStringField
      FieldName = 'Status_True'
      Origin = 'Status_True'
      Size = 30
    end
  end
  inherited frpExtrato: TfrxReport
    ScriptText.Strings = (
      'procedure MasterData4OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if Frac(<Line> / 2) = 0.5 then'
      '     memBackGroundObservacoes.Color := $00E1E1E1'
      '  else'
      '     memBackGroundObservacoes.Color := clWhite;  '
      'end;'
      ''
      'procedure MasterData2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if Frac(<Line> / 2) = 0.5 then'
      '     memBackGroundAtualizacoes.Color := $00E1E1E1'
      '  else'
      '     memBackGroundAtualizacoes.Color := clWhite;  '
      'end;'
      ''
      'procedure MasterData3OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if Frac(<Line> / 2) = 0.5 then'
      '     memBackgroudDesignacoes.Color := $00E1E1E1'
      '  else'
      '     memBackgroudDesignacoes.Color := clWhite;  '
      'end;'
      ''
      'begin'
      ''
      'end.')
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
          Width = 306.141930000000000000
        end
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
        Height = 282.858370240000000000
        Child = frpExtrato.Child2
        object Memo56: TfrxMemoView
          AllowVectorExport = True
          Left = 266.456865000000000000
          Top = 7.255870120000000000
          Width = 177.637910000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
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
          Left = 11.338590000000000000
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
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
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
          Left = 188.008040000000000000
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
          Left = 188.008040000000000000
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
        object Memo46: TfrxMemoView
          AllowVectorExport = True
          Left = 328.819110000000000000
          Top = 109.000009760000000000
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
          Left = 328.819110000000000000
          Top = 126.897650000000000000
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
          Left = 461.102660000000000000
          Top = 109.000009760000000000
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
          Left = 461.102660000000000000
          Top = 126.897650000000000000
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
        object Memo76: TfrxMemoView
          AllowVectorExport = True
          Left = 106.905690000000000000
          Top = 197.488250000000000000
          Width = 64.252010000000000000
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
        object Memo79: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 166.299320000000000000
          Width = 64.252010000000000000
          Height = 26.456700240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Data Prazo'
            'Caixa')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo83: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 197.488250000000000000
          Width = 64.252010000000000000
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
        object Memo86: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 237.260050000000000000
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
          Top = 254.157700000000000000
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
          Top = 237.260050000000000000
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
          Top = 254.157700000000000000
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
          Top = 237.260050000000000000
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
          Top = 254.157700000000000000
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
          Top = 237.260050000000000000
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
          Top = 254.157700000000000000
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
          Top = 237.260050000000000000
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
          Top = 254.157700000000000000
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
        object Memo118: TfrxMemoView
          AllowVectorExport = True
          Left = 102.047310000000000000
          Top = 166.299320000000000000
          Width = 64.252010000000000000
          Height = 26.456700240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Data Prazo'
            'ANS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo122: TfrxMemoView
          AllowVectorExport = True
          Left = 188.976500000000000000
          Top = 177.637910000000000000
          Width = 128.504020000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Staus True')
          ParentFont = False
        end
        object Memo125: TfrxMemoView
          AllowVectorExport = True
          Left = 188.976500000000000000
          Top = 197.488250000000000000
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          AutoWidth = True
          DataField = 'Status_True'
          DataSet = fdbExtrato
          DataSetName = 'fdbExtrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbExtrato."Status_True"]')
          ParentFont = False
        end
      end
      object Child2: TfrxChild
        FillType = ftBrush
        Frame.Typ = []
        Height = 41.574803150000000000
        Top = 464.882190000000000000
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
        Top = 529.134200000000000000
        Width = 718.110700000000000000
        ToNRows = 0
        ToNRowsMode = rmCount
      end
    end
    inherited pagAtualizacoes: TfrxReportPage
      inherited GroupHeader1: TfrxGroupHeader
        inherited Memo5: TfrxMemoView
          Font.Color = clNavy
          Font.Style = [fsBold, fsUnderline]
          Memo.UTF8W = (
            'Atualiza'#231#245'es da Autoriza'#231#227'o')
        end
      end
      inherited MasterData2: TfrxMasterData
        Height = 98.267779999999990000
        inherited memBackGroundAtualizacoes: TfrxMemoView
          Height = 98.267779999999990000
        end
        object Memo93: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338582680000000000
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
            'Status True')
          ParentFont = False
        end
        object Memo102: TfrxMemoView
          AllowVectorExport = True
          Left = 369.173470000000000000
          Top = 75.370120240000000000
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          AutoWidth = True
          DataField = 'Status_True'
          DataSet = fdbAtualizacoes
          DataSetName = 'fdbAtualizacoes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbAtualizacoes."Status_True"]')
          ParentFont = False
        end
        object Memo123: TfrxMemoView
          AllowVectorExport = True
          Left = 623.622450000000000000
          Top = 75.370120240000000000
          Width = 64.252010000000000000
          Height = 15.118110240000000000
          AutoWidth = True
          DataField = 'Data_Prazo_ANS'
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
            '[fdbAtualizacoes."Data_Prazo_ANS"]')
          ParentFont = False
        end
        object Memo131: TfrxMemoView
          AllowVectorExport = True
          Left = 532.913730000000000000
          Top = 75.370120240000000000
          Width = 64.252010000000000000
          Height = 15.118110240000000000
          AutoWidth = True
          DataField = 'Data_Prazo_Caixa'
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
            '[fdbAtualizacoes."Data_Prazo_Caixa"]')
          ParentFont = False
        end
        object Memo80: TfrxMemoView
          AllowVectorExport = True
          Left = 532.913730000000000000
          Top = 46.133890000000000000
          Width = 64.252010000000000000
          Height = 26.456700240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Data Prazo'
            'Caixa')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo81: TfrxMemoView
          AllowVectorExport = True
          Left = 623.622450000000000000
          Top = 46.133890000000000000
          Width = 64.252010000000000000
          Height = 26.456700240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Data Prazo'
            'ANS')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      inherited Footer1: TfrxFooter
        Top = 185.196970000000000000
      end
    end
    inherited pagDesignacoes: TfrxReportPage
      inherited GroupHeader2: TfrxGroupHeader
        inherited Memo18: TfrxMemoView
          Font.Color = clNavy
          Font.Style = [fsBold, fsUnderline]
        end
      end
    end
    inherited pagObservacoes: TfrxReportPage
      inherited GroupHeader3: TfrxGroupHeader
        Child = frpExtrato.Child1
        inherited Memo19: TfrxMemoView
          Font.Color = clNavy
          Font.Style = [fsBold, fsUnderline]
        end
      end
    end
  end
  inherited fdbExtrato: TfrxDBDataset
    FieldAliases.Strings = (
      'Selecionado=Selecionado'
      'id_Autorizacao=id_Autorizacao'
      'Numero_Autorizacao=Numero_Autorizacao'
      'Tipo_Autorizacao=Tipo_Autorizacao'
      'Tipo_Atendimento=Tipo_Atendimento'
      'Data_Prazo_ANS=Data_Prazo_ANS'
      'Data_Prazo_Caixa=Data_Prazo_Caixa'
      'Numero_Beneficiario=Numero_Beneficiario'
      'Nome_Beneficiario=Nome_Beneficiario'
      'id_Setor_Designado=id_Setor_Designado'
      'Setor_Designado=Setor_Designado'
      'id_Usuario_Designado=id_Usuario_Designado'
      'Usuario_Designado=Usuario_Designado'
      'Qtd_Historicos=Qtd_Historicos'
      'Qtd_Designacoes=Qtd_Designacoes'
      'Qtd_Observacoes=Qtd_Observacoes'
      'Data_Hora_Importacao=Data_Hora_Importacao'
      'Ultima_Atualizacao=Ultima_Atualizacao'
      'Data_Hora_Encerramento=Data_Hora_Encerramento'
      'Justificativa_Encerramento=Justificativa_Encerramento'
      'Status_True=Status_True'
      'Tipo_Prazo=Tipo_Prazo'
      'Prazo=Prazo'
      'Encerra=Encerra'
      'Usuario_Importacao=Usuario_Importacao'
      'Usuario_Atualizacao=Usuario_Atualizacao'
      'Usuario_Encerrameto=Usuario_Encerrameto'
      'Designacao_Pendente=Designacao_Pendente')
  end
  inherited fdbDesignacoes: TfrxDBDataset
    FieldAliases.Strings = (
      'id=id'
      'Usuario_Designado=Usuario_Designado'
      'Setor_Designado=Setor_Designado'
      'Usuario_Responsavel=Usuario_Responsavel'
      'Justificativa=Justificativa'
      'Numero=Numero'
      'Data_Hora_Inicial=Data_Hora_Inicial'
      'Data_Hora_Final=Data_Hora_Final'
      'Dias=Dias'
      'Horas=Horas'
      'Minutos=Minutos'
      'ccTempo=ccTempo')
  end
  inherited fdbAtualizacoes: TfrxDBDataset
    FieldAliases.Strings = (
      'Nome_Usuario=Nome_Usuario'
      'Data_Hora_Historico=Data_Hora_Historico'
      'Data_Prazo_Caixa=Data_Prazo_Caixa'
      'Data_Prazo_ANS=Data_Prazo_ANS'
      'Tipo_Autorizacao=Tipo_Autorizacao'
      'Tipo_Atendimento=Tipo_Atendimento'
      'Status_True=Status_True')
  end
  object mtbUsuarios: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 1232
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
    Left = 1029
    Top = 219
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
    Left = 824
    Top = 219
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
    Top = 38
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
    Top = 38
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
    Top = 109
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
    Top = 109
  end
  object dtsPainel: TDataSource
    DataSet = cdsPainel
    Left = 144
    Top = 179
  end
  object mtbStatusTrue: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 1032
    Top = 336
    object mtbStatusTrueid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object mtbStatusTrueStatus: TStringField
      FieldName = 'Status'
      Origin = 'Status'
      Size = 30
    end
    object mtbStatusTrueTipo_Prazo: TStringField
      FieldName = 'Tipo_Prazo'
      Origin = 'Tipo_Prazo'
      Size = 10
    end
    object mtbStatusTruePrazo: TIntegerField
      FieldName = 'Prazo'
      Origin = 'Prazo'
    end
    object mtbStatusTrueEncerra: TStringField
      FieldName = 'Encerra'
      Origin = 'Encerra'
      Size = 3
    end
  end
  object dtsStatusTrue: TDataSource
    DataSet = mtbStatusTrue
    Left = 832
    Top = 331
  end
  object mtbUsuariosDoSetor: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 1232
    Top = 104
    object mtbUsuariosDoSetorid: TIntegerField
      FieldName = 'id'
    end
    object mtbUsuariosDoSetorNome_Usuario: TStringField
      FieldName = 'Nome_Usuario'
      Size = 100
    end
  end
end
