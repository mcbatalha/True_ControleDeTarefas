inherited dtmRelatoriosEncerramento: TdtmRelatoriosEncerramento
  object mtbEncerramentos: TFDMemTable
    OnCalcFields = mtbEncerramentosCalcFields
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 56
    Top = 248
    object mtbEncerramentosNumero: TStringField
      FieldName = 'Numero'
      Size = 50
    end
    object mtbEncerramentosData_Hora_Importacao: TDateTimeField
      FieldName = 'Data_Hora_Importacao'
    end
    object mtbEncerramentosData_Hora_Encerramento: TDateTimeField
      FieldName = 'Data_Hora_Encerramento'
    end
    object mtbEncerramentosJustificativa_Encerramento: TStringField
      FieldName = 'Justificativa_Encerramento'
      Size = 100
    end
    object mtbEncerramentosNome_Usuario: TStringField
      FieldName = 'Nome_Usuario'
      Size = 100
    end
    object mtbEncerramentosDias: TIntegerField
      FieldName = 'Dias'
    end
    object mtbEncerramentosHoras: TIntegerField
      FieldName = 'Horas'
    end
    object mtbEncerramentosMinutos: TIntegerField
      FieldName = 'Minutos'
    end
    object mtbEncerramentosccTempo: TStringField
      FieldKind = fkCalculated
      FieldName = 'ccTempo'
      Size = 30
      Calculated = True
    end
  end
  object frpEncerramentos: TfrxReport
    Version = '6.9.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45825.790280370400000000
    ReportOptions.LastChange = 45825.881808101800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if Frac(<Line> / 2) = 0.5 then'
      '     memBackGround.Color := $00E1E1E1'
      '  else'
      '     memBackGround.Color := clWhite;  '
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 64
    Top = 392
    Datasets = <
      item
        DataSet = fdbEncerramentos
        DataSetName = 'fdbEncerramentos'
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
        Height = 117.165430000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        Child = frpEncerramentos.Child1
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 18.897650000000000000
          Top = 7.559060000000000000
          Width = 151.000000000000000000
          Height = 50.000000000000000000
          AutoSize = True
          Frame.Typ = []
          Picture.Data = {
            0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000009700
            0000320806000000514E4924000000017352474200AECE1CE90000000467414D
            410000B18F0BFC6105000000097048597300000EC300000EC301C76FA8640000
            119F4944415478DAED5C0B7C54C5B99F99B39B4DC2C3428215482B843CC82601
            31F8C0DA8A359B04AF54F0DD6B8524888AB60AD8565B2B7D5C6BF55EAF546BBD
            4A21497DBF2A3E6AC80B2894D6AB984A42C80B8C1610544810427693ECEE99FE
            BF7D84B34B1E67B3BB3CFA3BDFEF37BF39999DF9E69B6FFE33F3CD77BE13CE0C
            32284AC44FB60006FDFB92012E83A24606B80C8A1A19E032286A6480CBA0A891
            012E83A24606B80C8A1A19E032286A6480CBA0A851D8E0EAA8CEE1D2ED4A00A7
            74FC99869484148FD48B7410A99E4959975050FF6524048ECF2B9ACC242BC263
            0A920883D511A427ECD5A5F501FC6D4567215B88340D49D1C9CB89D489B417E9
            03C9F866477549F7A0E3B0155D8CEC3A2433D23390E3DD9075612BBA0A590192
            0353F97B7B75496BE0EF0B63A1A25BF0783E92290C5D1149A4FD48BF86ACED7A
            1A8405AEF6CAE9A4A0054857227D05296680AA8790B6203D219DF69AC42B76AA
            C3ED130AFD13B2ABC254949F36405197F9FF183BE746DEED8AF91D1E6F63FA81
            D51FED467AD26D36FD4F4FF91F8E1B6B9CAD681C14FF211E27FA8AF631C153EC
            95250EDD7AC82D1CCF38DF81C731BEA24FB8CB99D2B5F139B746578B90AD62E1
            2DC260FA0D74F6533D15C305D753C86E0DA109A17F23D2F284FCBABAE1F40985
            ED423625428A6A340967F691CAE73C0018615BAC48E622B93223C4BF5AE5FC8A
            EEAA92DEA0319C83EC03760CC0764C44565775E9C77A198FB0159D0B65D66A8A
            7AA1DD49F69AD2FD9A7E56235B14A1B1F8E959806B819E8AE181ABE29C34C625
            AD9E50B75C52F67D00D823A1F60985BD86ECEA0829EA6528EA06FF1F71736E56
            B8CBDDC222075EA295E86379C018728B6640F3042EFF8E6247CA46BD36BD4CFB
            01979B3339A5ABBAEC9F1A5D95222B8CE058887E0839FF574FC5B06D2EEC5E6B
            90156B8AC8FEA0AD9956A569883E1EE79CDD3D36AFCEA5B73F28F54C28F50EE6
            3D52B4BC69B7B920A87A07121DA3F67E5891CDB51A8ADAED2F18005C644BBD8D
            34980D45E324B3C08A3499051EA9879126A19F3E9B337AE06229D8FD3EE9EBE7
            7870A93E7DECD3DB8F86E8D4F9584AF6ACA3A6F4909E069100D75464E5486F20
            ADF308C0D851AC220BD8D324E5227D97143C008B5F9915CB2F46E7BE2FC39103
            36C838D82074AC8CD014DF87097B502F8F01C0F52078DCA75B0E5B11D97004C6
            384DF11CF0A83826EB490357B5EAEA2DE8DEF8FCB06DDE502822AE8883153362
            130B3E1C7065B7579CAF30DEB3048FBF441A1BF433ED72D7E0887C231C19E26D
            C500B3A423E1AB9AE26B30617FD2CB630070DD0A1EABF4F218397B91A29A55BA
            B5256B8A178147499FAC270F5C2FA28FFF0C47CFA1D009F573B5579E93040054
            32EFF1A12552C88500D8E7C3E5ED0317F1394B537C3594F9BA5E1E9100D788BC
            8523A5144DCCEB92F15300C80D704589DAABA6939FEAAFECD835DC4F0F035CF7
            0E97EF890297E5D2EF09C5148323988DF49A213E921E5D92DD750DD28F35BA3D
            8AC773EDD5253BFB643D89C722FA5DD22F43C954E966FB1C1B4A7B863B07C174
            523CF4B0D3CE45B69505FA5F3A6033A526E46DEB180ECF13052E4CD89DC85620
            9DD10F0BC18EF729BDEC94F246674DD931FFD3C90317D16097A72EA47CC8F1DE
            70E620980605D7987BAAF9A1876D6119DA031100F632F37AA8B5743D76AF5786
            C3EF8480CB768388677164D725E960470ED1BF43A6A5F6EAB28600594F2EB886
            A28D8AC2733B2B4AC236FA070557E2B275F4EA805E8354E0F6B7D9D4E5EADCBF
            EA3B11019BEF96D914545C0A70150F87DF0901D7BC3B787C979DECC2713AD8D1
            757F09DABE75BCAC45D391FD831D03175D86085CBBF4CA0A70CD94DEDDDF4FE4
            024A058F70FD5C350A97F99D55655107D70BCCEB462022C767054EE69B0E3E76
            F991703B2602C0C8C7F4354DD1B658B52767C49CE6900776028F45724BFC04C9
            D28F2E453F3ABD09ED9F0B9035B72805B51A343C68BC1787F27E11725CC1BC2E
            0F3F754A26D31DD5655A0F7D7F7EAEC174FB19D2CFB537DB70684070252EFFB3
            894985DE076A1D93F5AACA66763C36C71989CE01AE97905DAF29DA27A44C1E53
            501FB25179226F8B71B6C2B182F1D1C1EDA5D70DB29805BE72E9842DF9357B55
            C9617F01769DD1A84B06FE999A7AF7A39F07F48FB7E8BF91FD4853443B562678
            7469EA0483EB351ED82680542EED8EAAB22F42D5FD403430B896965BA014DABA
            B56E039CC722F7F347F275ED2C31736F114A4FB770543DD3AF110970FD16D95D
            DA22309E322EBFEEB01EFE5A3A555C11F1B6C238A89526FAD8D1C9D925F6AAD2
            CD7DFDD8169A38137FC663BEA6E93E2ED5A95D357FEC1CB28FBCE2242625D96C
            5A9FDE2BF6A3476F60EFBEDA67B69CB2AE88C4E5EB62B014E9CDBD165C9B39E3
            971E58593024B830B0D9C81E469A8054C539BFBDABAA24604702B89E60DE5739
            7E3A28254B4D2CA80B393CE79401577E9119070FD94E5FD7145F0B1EAF05E987
            5EF83F15D4BC5CED31CDEDDEFC8701F51B7FD9C2114C08DAF1AFD01413A08AD1
            4759501FA726B8BEFAC34AE176AB7FC3E3859AE29D52F2ACF6DF16F40EC614DB
            FE788C96AEB35A7B8A62A77EA0AD07709157FE4A4DD11E182D53C7E4D7D95988
            74AA806B5441B1D9ED961F058DFD3AF0783540DEBCA2B18004DDF62605B12053
            E4C7C1F6576CEE4D4270135DAE7E8F7451501B3A626705C759F503AE4D825B2E
            3D5AF554543C00C13494415FC6BC81737EEA4683D4032BE7EC1DAC1D06F51FCC
            6B6C6AF9E3A89053712DEF7B4D0470FD3F0BB4E9DE97CC342B31BFF69435E887
            22BDE0F2E98902FDCA59FFF340472B9D1C0798F77DE92CDFD8E282EA75FAF857
            F4C33F185C6E5F7FBA82FDFAA13D388E7F63AF29D31577A6C715F17450F19D07
            57CEF9DD60ED701B4A07E7A620FEEB5545E675571CBBE2B66F385F61CE1E7AD1
            7B29F36EF39B13F2EBEE60C3A0D3115C96CB16084528BFC0E3FDC31933F3BA30
            EE87C9F1785750CC9857275109B9D17DF118145C09CBD6A572AF2F8A4248C8FD
            4046E8E300D7A01EDCD8824221DCFC1E3CFA231248D9B743A8AA81DAEC5B7FAE
            B0385DA3871B0E1D1170E52F52B8AA866773E5159BB1BA83C1759CCDD5D76741
            B189BBE5F7F1B832C42113B07E82BE566127E9D78C00B848EEC5C3D1E7201499
            60C17177BD63924290AF8B6E6F2B39EB6DEEB528D2DCA34C02C0868C9A8CCF2D
            B4D2351C935E87E3F0337FB958DB341B4AF9877A953522FE32A2385BA119978D
            F7F1788EAF882E0F7950C466BD3C46CE29E2AA8BBD89C7B9BE22DA65E7F7E708
            1D8846CDBE85BBCD4E5A7CE7F98A6847B9083C6A076BE78B4EFDA5AFEFC1E685
            C65583F45385CB86C19C9DE049264D59A474EC23DD614C43BE5B3CE347E5C2EC
            62E2E0CACB5D094B2BC6702EE9BD1AF971AE05C02A43958CAF6D3A8F7BCF7D8A
            B7BF5DB5985E6097A746C4C08CB71526A307726D50584FB554E50B8EF565BA03
            118900D24480945EA0D3357F0B042B71549786E4D7835930019AA53873B295AA
            24535F7154FFD1ADABADAD18B74C49660219EFE399D7C6221B670FF37AF5FF8E
            DBE2E7F6CA35BDFAF815D1258AEC5A730454BC0DE35A65AF8AF0071AB0BFE886
            42E1AD747BA4D573CBC14B263FCFE64DD5A53422EC58DF464691AB9334C5ABA1
            CCFBD5F9D6CFF4F231E8F4205DE04A58563E16AB99DE6351001CADE2659D33CF
            FE3F673C272728859E3C00700CF8D255AC6D9C80AE289A8056517CD0CFB4B35C
            A4CECFD8CA0CFAB7A250762EF247D13BB2879C16F7839D174CA1B825B2C7287E
            9CB66D723DFC05A9594AF625E71E1091616C63DE6FEB12FB614BC7E11200EB69
            1D2218749A5148F15CE396AECB507BCDAD876C13B399D76E1A3F4055D5C77B30
            FEE49F794465DDFFC5E6CF08C9E64AB766C59327BFB5A9A12ED59A95CC25FB14
            CF3D69D6AC71C02B40CC2924A6A3B5B1A116BF4F8610A31879CC25B373C16AD1
            963EE688152ADFA40A491FD79E8D3A2D283F048915B43B045E174BA77C77E7CE
            1D6E4DBF8910341B7C3E65421E60925374830BF5B7E0B7E496C68636B44BC1EF
            BBC1270BBF2540155BB0777F0575F6A75A335354B7EB1321CC67B939FFDCC4E4
            B7986771D217549C6CD0345C74B64A697272E1CEC1DF16CED40D92894968DF9A
            9A91099B979F8967BAD1B2D4CC4CDC4CD9342EF9488C7F935F4EC89041639252
            FE15F5490E0A626CF1E412B62497F514DBB81332A56564277018A752700BB276
            2E38E9261175FE86F159517F2C93EA26D879F42E95ECC04FD17F73C4C1E527D8
            4EF4D6BC68386D7D44D110F7AA9CBF049B2D64633E2D23EB0248BE1C8A2B845A
            E65238109475887B23386827F5BF70A75B5B0126E8694CD0DD50D8B35018DDE2
            C8BEA38884D11ED031F93A54711B14B9067C670264E5D879E9625009457EA099
            34F2FB6D443F2A849E8DB405CF04826D487749267F0DF381FE2613613AFADB8C
            5923C7F3BCD6C6ED4F01E83763A2DEE64CCC337175958BF3299087EC50BA18D1
            7B467284AE00DF07D0E69B14AF857C26644B44FB47D13F7D5237DBE960777EFC
            7183841E92D0C7B730F606D4DB0B593B52AC56B36002B744B59249E1C078E8F9
            45F0809DCCBFE71BEBCDE07304007F52917236F37E194F0BA59151AC1A97EF41
            2E0228002F01244E37583BF26AFC6D463F4D43CDD1B0C1C5DF681909B4D3B5F9
            76A4D8109A920F6B2DD283380A75C72E0513768942287E3B01497A769D007029
            0009052252580B760EEC344C7D02E05AAC9AC46AC5A5DE8ADD618D2A78AC909E
            880CB2195FC2A8E6A3DD3AB4A12859023F1DE3D3A0C8BE6B3726F75EFCFD90EF
            F9EE1EA63E6A61823E254B030F98009C42B7C9E54061DC4B91FEA972F1AA90F2
            BA607061A7797A6A66D628B76473214F25160A00D8B0067C290C993E1CBE0C3C
            B1486892F904B5D7B152C4C47ED7A7C3E656DA2533B2CF0410C89FD8E103C243
            AD8D3B1CE0413EB3169C1F2F31C17E061DBD8FDFAA007C72503F83740316C27A
            ECF8149C3015207C8D71F57A263D5FC63741B646F0B8110B6C63CB8E867D69D6
            4CDC9E397D2C4C27551BFAFE4BD4C0E527EC60F4529ADC12B4A228F82F38C689
            8E14876FB26855BEAA0AD7567665B6EE1B6630A54ECD8CC1D64DC06EF40DB605
            4AC1C0398E34398F00E7011797380E385DBF7382C0B504C748A9E4926C425A91
            04C02F3C724AEC789C7DC327371D25DF007097B634EE38EC03D4AFA0D815BEE7
            153D26F180C5A5FA8E3FCFFFC920FFD3324CCA0A4C4A0726C5EA395A389B8876
            8F79763ED5FD3AE3CAD581E0E26F712E17A0CE93A8B31860D8C4BDFFB22003FD
            2F81ECB7011CE46DBFCF376E1575CB50F712921540F912633A8BABCEF58AA2B0
            C6C6469966CDC6E2906417C74ADAB985700A95FD8C79FD6E1BB0F77EC8042777
            C92EA12A2FAAC25DC8BC018E7BC07B3B785FCB3DC188EA5EF47F97505D8F6217
            364945DCE396FCE18F9AB60FE99E894C0CFD5BCD8A70CB09989C2C7024C0D16E
            461EE42F70EEB709C63F715F95D115662F5E7065648FC731676D6DDAB11E0AA0
            D5F62EFAFCB6EF673A066143C991BEA111A0F19BFA261453204DBC1272520CD5
            E58CDC29521298A6C3F67A5B15AC10BCDEC4DFE4CC8C8182DFC1B133D10B36D9
            821DA10EFDE1722213B04BB672AFFF89C66A01302AA4E417269C31EA9DF6C39D
            E411A7EF372F62DE239A8E100220C62F85EA66E542E1DF279E5ED9F98CDE1853
            654C8F6B01FAB27BEB71EC7C721676960F25F77C640BFB893500B471DCEDDC26
            15F38DC89F938A89FC79D7419E039067227E5FAD72D6CB5576AD4F1F646791FC
            7BC07327F2C990B306F5BEE3EAB6BF628A8D2759B772B7A8938ABB007615816E
            19CA3AD0DF5AD4A330748ABC2533C2EC5B442A80F67A7373F390E6CC69F92F94
            525252F8AE5DBB0206F7F58C1CB1BBA9564D4A9AC563627A796CAC43D20A4E4A
            4AE27BF7EE95E37372F8FEDA5A4F1BABD5CA1D0EC1C86E99366D1AAFAFAFEF2B
            073187C3C1DADADA3C6500D40C5230C0E6F94A392D2D87BB5C873CBF27272773
            B27377EDDA26D3D3D3794B4B4B804C53A664898F3E6A50B5F2D1F3A449E7A19D
            CADBDA6AD594940B3096F73CED264FCEE22493768CD487D96C66C4DB2F2BC949
            63A37A54D6D3D3039963D8EEDDDBFBFA4F4ECE11C41FB9E762A5E2E662B11CF1
            F0D1CAEAE7E5EF2F2D23F36C00FE628CF779D2A518D5CBFD72937CA34609E6D7
            D750745A82CBA0E8527AFA34534B4B7D486F36FA23035C06458D0C7019143532
            C06550D4C80097415123035C06458D0C7019143532C06550D4C800974151A37F
            019157E69C7FE03FB40000000049454E44AE426082}
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 421.417595000000000000
          Top = 7.559060000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Relat'#243'rio de Encerramentos')
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
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 126.905690000000000000
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
            'Encerramentos efetuados entre:')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 346.118430000000000000
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
            'Respons'#225'vel pelo encerramento')
          ParentFont = False
        end
        object memFiltroPeriodo: TfrxMemoView
          AllowVectorExport = True
          Left = 126.803340000000000000
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
          Left = 346.016080000000000000
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
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 15.118120000000000000
        Top = 238.110390000000000000
        Width = 1046.929810000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = fdbEncerramentos
        DataSetName = 'fdbEncerramentos'
        RowCount = 0
        Stretched = True
        object memBackGround: TfrxMemoView
          Align = baClient
          AllowVectorExport = True
          Width = 1046.929810000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haCenter
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 109.590600000000000000
          Top = 1.889765000000000000
          Width = 83.149660000000000000
          Height = 11.338590000000000000
          DataField = 'Data_Hora_Importacao'
          DataSet = fdbEncerramentos
          DataSetName = 'fdbEncerramentos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbEncerramentos."Data_Hora_Importacao"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 1.889765000000000000
          Width = 60.472480000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DataField = 'Numero'
          DataSet = fdbEncerramentos
          DataSetName = 'fdbEncerramentos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbEncerramentos."Numero"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 295.551330000000000000
          Top = 1.889765000000000000
          Width = 86.929190000000000000
          Height = 11.338590000000000000
          DataField = 'ccTempo'
          DataSet = fdbEncerramentos
          DataSetName = 'fdbEncerramentos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbEncerramentos."ccTempo"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 397.598640000000000000
          Top = 1.889765000000000000
          Width = 166.299320000000000000
          Height = 11.338590000000000000
          DataField = 'Nome_Usuario'
          DataSet = fdbEncerramentos
          DataSetName = 'fdbEncerramentos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbEncerramentos."Nome_Usuario"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 569.354670000000000000
          Top = 1.889765000000000000
          Width = 944.882500000000000000
          Height = 11.338590000000000000
          StretchMode = smMaxHeight
          DataField = 'Justificativa_Encerramento'
          DataSet = fdbEncerramentos
          DataSetName = 'fdbEncerramentos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbEncerramentos."Justificativa_Encerramento"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 203.181200000000000000
          Top = 1.889765000000000000
          Width = 83.149660000000000000
          Height = 11.338590000000000000
          DataField = 'Data_Hora_Encerramento'
          DataSet = fdbEncerramentos
          DataSetName = 'fdbEncerramentos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[fdbEncerramentos."Data_Hora_Encerramento"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Child1: TfrxChild
        FillType = ftBrush
        Frame.Typ = [ftTop, ftBottom]
        Height = 18.897650000000000000
        Top = 158.740260000000000000
        Width = 1046.929810000000000000
        ToNRows = 0
        ToNRowsMode = rmCount
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
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 109.590600000000000000
          Top = 3.779530000000000000
          Width = 52.913420000000000000
          Height = 11.338590000000000000
          DataSet = fdbTitulos
          DataSetName = 'fdbTitulos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Importa'#231#227'o')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 203.181200000000000000
          Top = 3.779530000000000000
          Width = 56.692950000000000000
          Height = 11.338590000000000000
          DataSet = fdbTitulos
          DataSetName = 'fdbTitulos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Encerramento')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 397.598640000000000000
          Top = 3.779530000000000000
          Width = 56.692950000000000000
          Height = 11.338590000000000000
          DataSet = fdbTitulos
          DataSetName = 'fdbTitulos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Respons'#225'vel')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 295.551330000000000000
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
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 569.354670000000000000
          Top = 3.779530000000000000
          Width = 117.165430000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Justificativa')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object fdbEncerramentos: TfrxDBDataset
    UserName = 'fdbEncerramentos'
    CloseDataSource = False
    FieldAliases.Strings = (
      'Numero=Numero'
      'Data_Hora_Importacao=Data_Hora_Importacao'
      'Data_Hora_Encerramento=Data_Hora_Encerramento'
      'Justificativa_Encerramento=Justificativa_Encerramento'
      'Nome_Usuario=Nome_Usuario'
      '-Dias=Dias'
      '-Horas=Horas'
      '-Minutos=Minutos'
      'ccTempo=ccTempo')
    OpenDataSource = False
    DataSet = mtbEncerramentos
    BCDToCurrency = False
    Left = 64
    Top = 320
  end
end
