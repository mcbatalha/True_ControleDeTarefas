inherited dtmRelatoriosDesinacoes: TdtmRelatoriosDesinacoes
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 626
  Width = 1064
  inherited DSProviderConnection: TDSProviderConnection
    ServerClassName = 'TSMAutoSC'
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
  object mtbDesignacoes: TFDMemTable
    OnCalcFields = mtbDesignacoesCalcFields
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 64
    Top = 248
    object mtbDesignacoesid: TLargeintField
      FieldName = 'id'
    end
    object mtbDesignacoesUsuario_Designado: TStringField
      FieldName = 'Usuario_Designado'
      OnGetText = mtbDesignacoesUsuario_DesignadoGetText
      Size = 100
    end
    object mtbDesignacoesSetor_Designado: TStringField
      FieldName = 'Setor_Designado'
      OnGetText = mtbDesignacoesUsuario_DesignadoGetText
      Size = 50
    end
    object mtbDesignacoesUsuario_Responsavel: TStringField
      FieldName = 'Usuario_Responsavel'
      Size = 100
    end
    object mtbDesignacoesJustificativa: TStringField
      FieldName = 'Justificativa'
      Size = 100
    end
    object mtbDesignacoesNumero: TStringField
      FieldName = 'Numero'
      Size = 50
    end
    object mtbDesignacoesData_Hora_Inicial: TDateTimeField
      FieldName = 'Data_Hora_Inicial'
    end
    object mtbDesignacoesData_Hora_Final: TDateTimeField
      FieldName = 'Data_Hora_Final'
      OnGetText = mtbDesignacoesData_Hora_FinalGetText
    end
    object mtbDesignacoesDias: TIntegerField
      FieldName = 'Dias'
    end
    object mtbDesignacoesHoras: TIntegerField
      FieldName = 'Horas'
    end
    object mtbDesignacoesMinutos: TIntegerField
      FieldName = 'Minutos'
    end
    object mtbDesignacoesccTempo: TStringField
      FieldKind = fkCalculated
      FieldName = 'ccTempo'
      Size = 30
      Calculated = True
    end
  end
  object frpDesignacoes: TfrxReport
    Version = '6.9.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45825.790280370370000000
    ReportOptions.LastChange = 45825.881808101850000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 64
    Top = 392
    Datasets = <
      item
        DataSet = fdbDesignacoes
        DataSetName = 'fdbDesignacoes'
      end
      item
        DataSet = fdbTitulos
        DataSetName = 'fdbTitulos'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 113.385900000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 18.897650000000000000
          Top = 7.559060000000000000
          Width = 151.000000000000000000
          Height = 50.000000000000000000
          AutoSize = True
          Frame.Typ = []
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000970000
            00320806000000514E4924000000017352474200AECE1CE90000000467414D41
            0000B18F0BFC6105000000097048597300000EC300000EC301C76FA864000011
            9F4944415478DAED5C0B7C54C5B99F99B39B4DC2C3428215482B843CC8260131
            F8C0DA8A359B04AF54F0DD6B8524888AB60AD8565B2B7D5C6BF55EAF546BBD4A
            21497DBF2A3E6AC80B2894D6AB984A42C80B8C1610544810427693ECEE99FEBF
            7D84B34B1E67B3BB3CFA3BDFEF37BF39999DF9E69B6FFE33F3CD77BE13CE0C32
            284AC44FB60006FDFB92012E83A24606B80C8A1A19E032286A6480CBA0A89101
            2E83A24606B80C8A1A19E032286A6480CBA0A851D8E0EAA8CEE1D2ED4A00A774
            FC99869484148FD48B7410A99E4959975050FF6524048ECF2B9ACC242BC2630A
            920883D511A427ECD5A5F501FC6D4567215B88340D49D1C9CB89D489B417E903
            C9F866477549F7A0E3B0155D8CEC3A2433D23390E3DD9075612BBA0A59019203
            53F97B7B75496BE0EF0B63A1A25BF0783E92290C5D1149A4FD48BF86ACED7A1A
            8405AEF6CAE9A4A0054857227D05296680AA8790B6203D219DF69AC42B76AAC3
            ED130AFD13B2ABC254949F36405197F9FF183BE746DEED8AF91D1E6F63FA81D5
            1FED467AD26D36FD4F4FF91F8E1B6B9CAD681C14FF211E27FA8AF631C153EC95
            250EDD7AC82D1CCF38DF81C731BEA24FB8CB99D2B5F139B746578B90AD62E12D
            C260FA0D74F6533D15C305D753C86E0DA109A17F23D2F284FCBABAE1F40985ED
            423625428A6A340967F691CAE73C0018615BAC48E622B93223C4BF5AE5FC8AEE
            AA92DEA0319C83EC03760CC0764C44565775E9C77A198FB0159D0B65D66A8A7A
            A1DD49F69AD2FD9A7E56235B14A1B1F8E959806B819E8AE181ABE29C34C625AD
            9E50B75C52F67D00D823A1F60985BD86ECEA0829EA6528EA06FF1F71736E56B8
            CBDDC222075EA295E86379C018728B6640F3042EFF8E6247CA46BD36BD4CFB01
            979B3339A5ABBAEC9F1A5D95222B8CE058887E0839FF574FC5B06D2EEC5E6B90
            156B8AC8FEA0AD9956A569883E1EE79CDD3D36AFCEA5B73F28F54C28F50EE63D
            52B4BC69B7B920A87A07121DA3F67E5891CDB51A8ADAED2F18005C644BBD8D34
            980D45E324B3C08A3499051EA9879126A19F3E9B337AE06229D8FD3EE9EBE778
            70A93E7DECD3DB8F86E8D4F9584AF6ACA3A6F4909E069100D75464E5486F20AD
            F308C0D851AC220BD8D324E5227D97143C008B5F9915CB2F46E7BE2FC3910336
            C838D82074AC8CD014DF87097B502F8F01C0F52078DCA75B0E5B11D97004C638
            4DF11CF0A83826EB490357B5EAEA2DE8DEF8FCB06DDE502822AE888315336213
            0B3E1C7065B7579CAF30DEB3048FBF441A1BF433ED72D7E0887C231C19E26DC5
            00B3A423E1AB9AE26B30617FD2CB630070DD0A1EABF4F218397B91A29A55BAB5
            256B8A178147499FAC270F5C2FA28FFF0C47CFA1D009F573B5579E9304005432
            EFF1A12552C88500D8E7C3E5ED0317F1394B537C3594F9BA5E1E9100D788BC85
            23A5144DCCEB92F15300C80D704589DAABA6939FEAAFECD835DC4F0F035CF70E
            97EF890297E5D2EF09C5148323988DF49A213E921E5D92DD750DD28F35BA3D8A
            C773EDD5253BFB643D89C722FA5DD22F43C954E966FB1C1B4A7B863B07C17452
            3CF4B0D3CE45B69505FA5F3A6033A526E46DEB180ECF13052E4CD89DC856209D
            D10F0BC18EF729BDEC94F246674DD931FFD3C90317D16097A72EA47CC8F1DE70
            E620980605D7987BAAF9A1876D6119DA031100F632F37AA8B5743D76AF5786C3
            EF8480CB768388677164D725E960470ED1BF43A6A5F6EAB28600594F2EB886A2
            8D8AC2733B2B4AC236FA070557E2B275F4EA805E8354E0F6B7D9D4E5EADCBFEA
            3B11019BEF96D914545C0A70150F87DF0901D7BC3B787C979DECC2713AD8D175
            7F09DABE75BCAC45D391FD831D03175D86085CBBF4CA0A70CD94DEDDDF4FE402
            4A058F70FD5C350A97F99D55655107D70BCCEB462022C767054EE69B0E3E76F9
            91703B2602C0C8C7F4354DD1B658B52767C49CE6900776028F45724BFC04C9D2
            8F2E453F3ABD09ED9F0B9035B72805B51A343C68BC1787F27E11725CC1BC2E0F
            3F754A26D31DD5655A0F7D7F7EAEC174FB19D2CFB537DB70684070252EFFB389
            4985DE076A1D93F5AACA66763C36C71989CE01AE97905DAF29DA27A44C1E5350
            1FB25179226F8B71B6C2B182F1D1C1EDA5D70DB29805BE72E9842DF9357B55C9
            617F01769DD1A84B06FE999A7AF7A39F07F48FB7E8BF91FD4853443B56267874
            69EA0483EB351ED82680542EED8EAAB22F42D5FD403430B896965BA014DABAB5
            6E039CC722F7F347F275ED2C31736F114A4FB770543DD3AF110970FD16D95DDA
            22309E322EBFEEB01EFE5A3A555C11F1B6C238A89526FAD8D1C9D925F6AAD2CD
            7DFDD8169A38137FC663BEA6E93E2ED5A95D357FEC1CB28FBCE2242625D96C5A
            9FDE2BF6A3476F60EFBEDA67B69CB2AE88C4E5EB62B014E9CDBD165C9B39E397
            1E58593024B830B0D9C81E469A8054C539BFBDABAA24604702B89E60DE57397E
            3A28254B4D2CA80B393CE79401577E9119070FD94E5FD7145F0B1EAF05E9875E
            F83F15D4BC5CED31CDEDDEFC8701F51B7FD9C2114C08DAF1AFD01413A08AD147
            59501FA726B8BEFAC34AE176AB7FC3E3859AE29D52F2ACF6DF16F40EC614DBFE
            788C96AEB35A7B8A62A77EA0AD07709157FE4A4DD11E182D53C7E4D7D9598874
            AA806B5441B1D9ED961F058DFD3AF0783540DEBCA2B18004DDF62605B12053E4
            C7C1F6576CEE4D4270135DAE7E8F7451501B3A626705C759F503AE4D825B2E3D
            5AF554543C00C13494415FC6BC81737EEA4683D4032BE7EC1DAC1D06F51FCC6B
            6C6AF9E3A89053712DEF7B4D0470FD3F0BB4E9DE97CC342B31BFF69435E88722
            BDE0F2E98902FDCA59FFF340472B9D1C0798F77DE92CDFD8E282EA75FAF857F4
            C33F185C6E5F7FBA82FDFAA13D388E7F63AF29D31577A6C715F17450F19D0757
            CEF9DD60ED701B4A07E7A620FEEB5545E675571CBBE2B66F385F61CE1E7AD17B
            29F36EF39B13F2EBEE60C3A0D3115C96CB16084528BFC0E3FDC31933F3BA30EE
            87C9F1785750CC9857275109B9D17DF118145C09CBD6A572AF2F8A4248C8FD40
            46E8E300D7A01EDCD8824221DCFC1E3CFA231248D9B743A8AA81DAEC5B7FAEB0
            385DA3871B0E1D1170E52F52B8AA866773E5159BB1BA83C1759CCDD5D76741B1
            89BBE5F7F1B832C42113B07E82BE566127E9D78C00B848EEC5C3D1E720149960
            C17177BD63924290AF8B6E6F2B39EB6DEEB528D2DCA34C02C0868C9A8CCF2DB4
            D2351C935E87E3F0337FB958DB341B4AF9877A953522FE32A2385BA119978DF7
            F1788EAF882E0F7950C466BD3C46CE29E2AA8BBD89C7B9BE22DA65E7F7E7081D
            8846CDBE85BBCD4E5A7CE7F98A6847B9083C6A076BE78B4EFDA5AFEFC1E685C6
            5583F45385CB86C19C9DE049264D59A474EC23DD614C43BE5B3CE347E5C2EC62
            E2E0CACB5D094B2BC6702EE9BD1AF971AE05C02A43958CAF6D3A8F7BCF7D8AB7
            BF5DB5985E6097A746C4C08CB71526A307726D50584FB554E50B8EF565BA0311
            8900D24480945EA0D3357F0B042B71549786E4D7835930019AA53873B295AA24
            535F7154FFD1ADABADAD18B74C49660219EFE399D7C6221B670FF37AF5FF8EDB
            E2E7F6CA35BDFAF815D1258AEC5A730454BC0DE35A65AF8AF0071AB0BFE88642
            E1AD747BA4D573CBC14B263FCFE64DD5A53422EC58DF464691AB9334C5ABA1CC
            FBD5F9D6CFF4F231E8F4205DE04A58563E16AB99DE6351001CADE2659D33CFFE
            3F673C272728859E3C00700CF8D255AC6D9C80AE289A8056517CD0CFB4B35CA4
            CECFD8CA0CFAB7A250762EF247D13BB2879C16F7839D174CA1B825B2C7287E9C
            B66D723DFC05A9594AF625E71E1091616C63DE6FEB12FB614BC7E11200EB691D
            2218749A5148F15CE396AECB507BCDAD876C13B399D76E1A3F4055D5C77B30FE
            E49F794465DDFFC5E6CF08C9E64AB766C59327BFB5A9A12ED59A95CC25FB14CF
            3D69D6AC71C02B40CC2924A6A3B5B1A116BF4F8610A31879CC25B373C16AD196
            3EE688152ADFA40A491FD79E8D3A2D283F048915B43B045E174BA77C77E7CE1D
            6E4DBF8910341B7C3E65421E60925374830BF5B7E0B7E496C68636B44BC1EFBB
            C1270BBF2540155BB0777F0575F6A75A335354B7EB1321CC67B939FFDCC4E4B7
            986771D217549C6CD0345C74B64A697272E1CEC1DF16CED40D92894968DF9A9A
            91099B979F8967BAD1B2D4CC4CDC4CD9342EF9488C7F935F4EC89041639252FE
            15F5490E0A626CF1E412B62497F514DBB81332A56564277018A752700BB2762E
            38E9261175FE86F159517F2C93EA26D879F42E95ECC04FD17F73C4C1E527D84E
            F4D6BC68386D7D44D110F7AA9CBF049B2D64633E2D23EB0248BE1C8A2B845AE6
            5238109475887B23386827F5BF70A75B5B0126E8694CD0DD50D8B35018DDE2C8
            BEA38884D11ED031F93A54711B14B9067C670264E5D879E9625009457EA09934
            F2FB6D443F2A849E8DB405CF04826D487749267F0DF381FE2613613AFADB8C59
            23C7F3BCD6C6ED4F01E83763A2DEE64CCC337175958BF3299087EC50BA18D17B
            467284AE00DF07D0E69B14AF857C26644B44FB47D13F7D5237DBE960777EFC71
            83841E92D0C7B730F606D4DB0B593B52AC56B36002B744B59249E1C078E8F945
            F0809DCCBFE71BEBCDE07304007F52917236F37E194F0BA59151AC1A97EF412E
            0228002F01244E37583BF26AFC6D463F4D43CDD1B0C1C5DF681909B4D3B5F976
            A4D8109A920F6B2DD283380A75C72E0513768942287E3B01497A769D00702900
            09052252580B760EEC344C7D02E05AAC9AC46AC5A5DE8ADD618D2A78AC909E88
            0CB2195FC2A8E6A3DD3AB4A12859023F1DE3D3A0C8BE6B3726F75EFCFD90EFF9
            EE1EA63E6A61823E254B030F98009C42B7C9E54061DC4B91FEA972F1AA90F2BA
            607061A7797A6A66D628B76473214F25160A00D8B0067C290C993E1CBE0C3CB1
            486892F904B5D7B152C4C47ED7A7C3E656DA2533B2CF0410C89FD8E103C243AD
            8D3B1CE0413EB3169C1F2F31C17E061DBD8FDFAA007C72503F83740316C27AEC
            F8149C3015207C8D71F57A263D5FC63741B646F0B8110B6C63CB8E867D69D64C
            DC9E397D2C4C27551BFAFE4BD4C0E527EC60F4529ADC12B4A228F82F38C6898E
            14876FB26855BEAA0AD7567665B6EE1B6630A54ECD8CC1D64DC06EF40DB6054A
            C1C0398E34398F00E7011797380E385DBF7382C0B504C748A9E4926C425A9104
            C02F3C724AEC789C7DC327371D25DF007097B634EE38EC03D4AFA0D815BEE715
            3D26F180C5A5FA8E3FCFFFC920FFD3324CCA0A4C4A0726C5EA395A389B88768F
            79763ED5FD3AE3CAD581E0E26F712E17A0CE93A8B31860D8C4BDFFB22003FD2F
            81ECB7011CE46DBFCF376E1575CB50F712921540F912633A8BABCEF58AA2B0C6
            C6469966CDC6E2906417C74ADAB985700A95FD8C79FD6E1BB0F77EC8042777C9
            2EA12A2FAAC25DC8BC018E7BC07B3B785FCB3DC188EA5EF47F97505D8F621736
            4945DCE396FCE18F9AB60FE99E894C0CFD5BCD8A70CB09989C2C7024C0D16E46
            1EE42F70EEB709C63F715F95D115662F5E7065648FC731676D6DDAB11E0AA0D5
            F62EFAFCB6EF673A066143C991BEA111A0F19BFA261453204DBC1272520CD5E5
            8CDC29521298A6C3F67A5B15AC10BCDEC4DFE4CC8C8182DFC1B133D10B36D982
            1DA10EFDE1722213B04BB672AFFF89C66A01302AA4E417269C31EA9DF6C39DE4
            11A7EF372F62DE239A8E100220C62F85EA66E542E1DF279E5ED9F98CDE185365
            4C8F6B01FAB27BEB71EC7C721676960F25F77C640BFB893500B471DCEDDC2615
            F38DC89F938A89FC79D7419E039067227E5FAD72D6CB5576AD4F1F646791FC7B
            C07327F2C990B306F5BEE3EAB6BF628A8D2759B772B7A8938ABB007615816E19
            CA3AD0DF5AD4A330748ABC2533C2EC5B442A80F67A7373F390E6CC69F92F9452
            5252F8AE5DBB0206F7F58C1CB1BBA9564D4A9AC563627A796CAC43D20A4E4A4A
            E27BF7EE95E37372F8FEDA5A4F1BABD5CA1D0EC1C86E99366D1AAFAFAFEF2B07
            3187C3C1DADADA3C6500D40C5230C0E6F94A392D2D87BB5C873CBF27272773B2
            7377EDDA26D3D3D3794B4B4B804C53A664898F3E6A50B5F2D1F3A449E7A19DCA
            DBDA6AD594940B3096F73CED264FCEE22493768CD487D96C66C4DB2F2BC94963
            A37A54D6D3D3039963D8EEDDDBFBFA4F4ECE11C41FB9E762A5E2E662B11CF1F0
            D1CAEAE7E5EF2F2D23F36C00FE628CF779D2A518D5CBFD72937CA34609E6D7D7
            50745A82CBA0E8527AFA34534B4B7D486F36FA23035C06458D0C7019143532C0
            6550D4C80097415123035C06458D0C7019143532C06550D4C800974151A37F01
            9157E69C7FE03FB40000000049454E44AE426082}
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 421.417595000000000000
          Top = 7.559060000000000000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Listagem de Designa'#231#245'es')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 421.417595000000000000
          Top = 30.236240000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Tipo:')
          ParentFont = False
        end
        object memTipo: TfrxMemoView
          AllowVectorExport = True
          Left = 456.323130000000000000
          Top = 30.236240000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = 'memTipo'
          DataSet = fdbTitulos
          DataSetName = 'fdbTitulos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbTitulos."memTipo"]')
          ParentFont = False
        end
        object Page: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 964.000620000000000000
          Top = 1.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina: [Page]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 421.417595000000000000
          Top = 49.133890000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Data | Hora:')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 495.118430000000000000
          Top = 49.133890000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date] | [Time]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 79.370130000000000000
          Width = 117.165430000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Filtros Selecionados:')
          ParentFont = False
        end
        object memTituloFiltroNumero: TfrxMemoView
          AllowVectorExport = True
          Left = 132.283550000000000000
          Top = 79.370130000000000000
          Width = 117.165430000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          DataField = 'memTituloFiltroNumero'
          DataSet = fdbTitulos
          DataSetName = 'fdbTitulos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbTitulos."memTituloFiltroNumero"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 289.905690000000000000
          Top = 79.370130000000000000
          Width = 170.078850000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Designa'#231#245'es realizaadas entre:')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 509.118430000000000000
          Top = 79.370130000000000000
          Width = 170.078850000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Respons'#225'vel pela Designa'#231#227'o')
          ParentFont = False
        end
        object memFiltroNumero: TfrxMemoView
          AllowVectorExport = True
          Left = 132.181200000000000000
          Top = 98.267780000000000000
          Width = 117.165430000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          DataField = 'memFiltroNumero'
          DataSet = fdbTitulos
          DataSetName = 'fdbTitulos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbTitulos."memFiltroNumero"]')
          ParentFont = False
        end
        object memFiltroPeriodo: TfrxMemoView
          AllowVectorExport = True
          Left = 289.803340000000000000
          Top = 98.267780000000000000
          Width = 170.078850000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          DataField = 'memFiltroPeriodo'
          DataSet = fdbTitulos
          DataSetName = 'fdbTitulos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbTitulos."memFiltroPeriodo"]')
          ParentFont = False
        end
        object memFiltroResponsavel: TfrxMemoView
          AllowVectorExport = True
          Left = 509.016080000000000000
          Top = 98.267780000000000000
          Width = 170.078850000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          DataField = 'memFiltroResponsavel'
          DataSet = fdbTitulos
          DataSetName = 'fdbTitulos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbTitulos."memFiltroResponsavel"]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = [ftTop]
        Height = 18.897650000000000000
        Top = 192.756030000000000000
        Width = 1046.929810000000000000
        Condition = 'fdbDesignacoes."Numero"'
        ReprintOnNewPage = True
        object memoBackGround: TfrxMemoView
          Align = baClient
          AllowVectorExport = True
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = 14803425
          HAlign = haCenter
          ParentFont = False
        end
        object memTituloTipo: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 52.913420000000000000
          Height = 11.338590000000000000
          DataField = 'memTituloTipo'
          DataSet = fdbTitulos
          DataSetName = 'fdbTitulos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbTitulos."memTituloTipo"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object fdbDesignacoesNumero: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 62.811070000000000000
          Top = 3.779530000000000000
          Width = 400.630180000000000000
          Height = 11.338590000000000000
          DataField = 'Numero'
          DataSet = fdbDesignacoes
          DataSetName = 'fdbDesignacoes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbDesignacoes."Numero"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = [ftTop]
        Height = 68.031540000000000000
        Top = 234.330860000000000000
        Width = 1046.929810000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = fdbDesignacoes
        DataSetName = 'fdbDesignacoes'
        RowCount = 0
        Stretched = True
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 86.929190000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Designado ao usu'#225'rio')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 16.897650000000000000
          Width = 192.756030000000000000
          Height = 11.338590000000000000
          DataField = 'Usuario_Designado'
          DataSet = fdbDesignacoes
          DataSetName = 'fdbDesignacoes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbDesignacoes."Usuario_Designado"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 207.874150000000000000
          Top = 3.779530000000000000
          Width = 86.929190000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Designado ao setor')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 207.874150000000000000
          Top = 16.897650000000000000
          Width = 192.756030000000000000
          Height = 11.338590000000000000
          DataField = 'Usuario_Designado'
          DataSet = fdbDesignacoes
          DataSetName = 'fdbDesignacoes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbDesignacoes."Usuario_Designado"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 419.527830000000000000
          Top = 3.779530000000000000
          Width = 86.929190000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Designado em')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 419.527830000000000000
          Top = 16.897650000000000000
          Width = 86.929190000000000000
          Height = 11.338590000000000000
          DataField = 'Data_Hora_Inicial'
          DataSet = fdbDesignacoes
          DataSetName = 'fdbDesignacoes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbDesignacoes."Data_Hora_Inicial"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 532.913730000000000000
          Top = 3.779530000000000000
          Width = 124.724490000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Respons'#225'vel pela designa'#231#227'o')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 532.913730000000000000
          Top = 16.897650000000000000
          Width = 166.299320000000000000
          Height = 11.338590000000000000
          DataField = 'Usuario_Responsavel'
          DataSet = fdbDesignacoes
          DataSetName = 'fdbDesignacoes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbDesignacoes."Usuario_Responsavel"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 710.551640000000000000
          Top = 3.779530000000000000
          Width = 86.929190000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Redesignado em')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 710.551640000000000000
          Top = 16.897650000000000000
          Width = 86.929190000000000000
          Height = 11.338590000000000000
          DataField = 'Data_Hora_Final'
          DataSet = fdbDesignacoes
          DataSetName = 'fdbDesignacoes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbDesignacoes."Data_Hora_Final"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 823.937540000000000000
          Top = 3.779530000000000000
          Width = 86.929190000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Tempo transcorrido')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 823.937540000000000000
          Top = 16.897650000000000000
          Width = 86.929190000000000000
          Height = 11.338590000000000000
          DataField = 'ccTempo'
          DataSet = fdbDesignacoes
          DataSetName = 'fdbDesignacoes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbDesignacoes."ccTempo"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 34.015770000000000000
          Width = 117.165430000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Justificativa da designa'#231#227'o')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 49.133890000000000000
          Width = 1024.252630000000000000
          Height = 11.338590000000000000
          StretchMode = smMaxHeight
          DataField = 'Justificativa'
          DataSet = fdbDesignacoes
          DataSetName = 'fdbDesignacoes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbDesignacoes."Justificativa"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = [ftTop]
        Height = 18.897650000000000000
        Top = 325.039580000000000000
        Width = 1046.929810000000000000
      end
    end
  end
  object fdbDesignacoes: TfrxDBDataset
    UserName = 'fdbDesignacoes'
    CloseDataSource = False
    FieldAliases.Strings = (
      '-id=id'
      'Usuario_Designado=Usuario_Designado'
      'Setor_Designado=Setor_Designado'
      'Usuario_Responsavel=Usuario_Responsavel'
      'Justificativa=Justificativa'
      'Numero=Numero'
      'Data_Hora_Inicial=Data_Hora_Inicial'
      'Data_Hora_Final=Data_Hora_Final'
      '-Dias=Dias'
      '-Horas=Horas'
      '-Minutos=Minutos'
      'ccTempo=ccTempo')
    OpenDataSource = False
    DataSet = mtbDesignacoes
    BCDToCurrency = False
    Left = 64
    Top = 320
  end
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
    OnCalcFields = mtbDesignacoesCalcFields
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
end
