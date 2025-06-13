object frmPaineis: TfrmPaineis
  AlignWithMargins = True
  Left = 0
  Top = 0
  Caption = 'Paineis de Acompanhamento'
  ClientHeight = 756
  ClientWidth = 1405
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  Scaled = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object pnlForm: TPanel
    Left = 0
    Top = 0
    Width = 1405
    Height = 756
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = clWhite
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    ParentBackground = False
    TabOrder = 0
    object pnlBotoes: TPanel
      Left = 7
      Top = 7
      Width = 1391
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      Color = 16772846
      ParentBackground = False
      TabOrder = 0
      object btnFiltrar: TSpeedButton
        AlignWithMargins = True
        Left = 5
        Top = 3
        Width = 95
        Height = 35
        Margins.Left = 5
        Margins.Right = 0
        Align = alLeft
        Caption = 'Filtrar'
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000074120000741200000000000000000000FFFFFFFFFFFF
          FFFFFFB4E0EBF7F8F9FEFEFEDFE7E8C2D5DABAD1D6C9D9DDF3F5F5FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFA64D3ED7BD9EF67D4EE57CFEC57
          CFEC57CFEC57CFEC5CD0ED90D8E9E9EEF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          BED7DD57CFEC57CFEC57CFEC57CFEC57CFEC57CFEC57CFEC57CFEC57CFEC65D3
          EED7E5E9FFFFFFFFFFFFFFFFFFFFFFFF86D8EB57CFEC57CFEC5CD1EDA0D8E5A9
          D0D9A4D1DC89DAEF5ED0EC57CFEC57CFEC66D3EEEAEFF0FFFFFFFFFFFFFFFFFF
          A6D4E08ADAED6CD5EE58CFECC5DDE3FFFFFFF8F9F960C3E772CCEB5FCDEB57CF
          EC57CFEC8DD9ECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F4F4E2EBEDFF
          FFFFBAD6DE46BBE544B9E444B9E452C9EA57CFEC58CFECDDE7E9CCD3B2B7C486
          C1C8A3F2F2F0FFFFFFFFFFFFFFFFFFFFFFFFF7F8F966D3ED8DD2E86BC6E847BD
          E557CFEC57CFECA0D5E2B3C2779AB43298B23097AB4DF6F7F4C8D1A4E1E3DAFF
          FFFFFFFFFFADD7E2E2EAECFFFFFFCCDDE3A6D2DDC3D9DEE9EEEFB1C1719AB432
          96B02F7A951A93AA4198B232D9DCCFFFFFFFFFFFFFF9FAFAFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFB7C4849AB43299B331879F2E7A951A839E20D2D6C4FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCAD0B49AB432
          9AB432C2D18C8CA43995AA49F3F3F1FFFFFFFFFFFFFFFFFFE6E8DFB6C285B3C4
          72B0C45EA5BC49DCDFD3F8F8F6A3BB449AB432A1B940DFE6C6F2F3F0FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFBFCD879AB4329AB4329AB432E8EAE3FFFFFFCCD4AE
          9AB4329AB432A3BB44D0D6B8FEFEFEFFFFFFFFFFFFFFFFFFD3D8C0A5BD499AB4
          329AB4329AB433F7F7F6FFFFFFFFFFFFBECB889AB4329AB4329AB432A6BD4AB5
          C571B4C471A7BE4D9AB4329AB4329AB432AFC45D9FB83CFFFFFFFFFFFFFFFFFF
          FFFFFFC8D1A39EB73B9AB4329AB4329AB4329AB4329AB4329AB4329DB638C5D0
          99FEFEFED6DDBBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEFEAC1CB99B3C666A6
          BD4BA5BD49B2C663C1CC95EBECE6FFFFFFFFFFFFFFFFFFFFFFFF}
        Visible = False
        OnClick = btnFiltrarClick
        ExplicitTop = 0
      end
      object btnExportar: TSpeedButton
        AlignWithMargins = True
        Left = 105
        Top = 3
        Width = 95
        Height = 35
        Margins.Left = 5
        Margins.Right = 0
        Align = alLeft
        Caption = 'Exportar'
        Flat = True
        Glyph.Data = {
          5A010000424D5A01000000000000760000002800000013000000130000000100
          040000000000E400000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888000008222222222222222228000008277888888888887728000008277
          888888888887728000008288FFFFFFFFFFF8828000008288FFFFFFF888888280
          00008288222222272278828000008288F222227222F8828000008288FF227722
          2278828000008288FF882222FFF8828000008288FF882222FFF8828000008288
          F87222222FF88280000082888722772222F88280000082882227FFF222788280
          00008288FFFFFFFFFFF882800000827788888888888772800000827788888888
          888772800000822222222222222222800000888888888888888888800000}
        Visible = False
        OnClick = btnExportarClick
        ExplicitLeft = 298
        ExplicitHeight = 32
      end
      object btnImprimir: TSpeedButton
        AlignWithMargins = True
        Left = 205
        Top = 3
        Width = 95
        Height = 35
        Margins.Left = 5
        Margins.Right = 0
        Align = alLeft
        Caption = 'Imprimir'
        Flat = True
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          0800000000000001000000000000000000000001000000010000FFFFFF006363
          63006B6B6B00848484008C8C8C0094949400A5A5A500ADADAD00B5B5B500BDBD
          BD00C6C6C600DEDEDE00E7E7E700EFEFEF009CB5A500F7FFF70052524A00FFF7
          E700FFEFD600FFE7C600FFDEBD00FFD6AD00DEAD8400F7DED600C6ADA500A58C
          8C00D6CED6009484940000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000FFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF08010101FFFFFFFFFFFFFF0606
          060619180606060101FFFFFF06060D0D09081002040A1A060601FF060F0F0D0C
          080706040204070A0401FF060F0B0806030403070808030401FFFF0607061A1A
          0B08080304030E0302FFFF060B1A1A04050605050403030301FFFFFF0808081A
          0B0D0D0D0C0C080401FFFFFFFFFF160A0A0A090A1A060601FFFFFFFFFFFF1615
          13121716060101FFFFFFFFFFFF1614141414141601FFFFFFFFFFFFFFFF161712
          1312121601FFFFFFFFFFFFFFFF1611111111111601FFFFFFFFFFFFFF16000000
          00001601FFFFFFFFFFFFFFFF16161616161601FFFFFFFFFFFFFF}
        Visible = False
        OnClick = btnImprimirClick
        ExplicitLeft = 210
      end
      object btnDesignar: TSpeedButton
        AlignWithMargins = True
        Left = 305
        Top = 3
        Width = 95
        Height = 35
        Margins.Left = 5
        Margins.Right = 0
        Align = alLeft
        Caption = 'Designar'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
          300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
          330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
          333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
          339977FF777777773377000BFB03333333337773FF733333333F333000333333
          3300333777333333337733333333333333003333333333333377333333333333
          333333333333333333FF33333333333330003333333333333777333333333333
          3000333333333333377733333333333333333333333333333333}
        NumGlyphs = 2
        Visible = False
        OnClick = btnDesignarClick
        ExplicitLeft = 368
        ExplicitTop = 1
        ExplicitHeight = 37
      end
      object btnHistoricoDesignacoes: TSpeedButton
        AlignWithMargins = True
        Left = 526
        Top = 3
        Width = 175
        Height = 35
        Margins.Left = 5
        Margins.Right = 0
        Align = alLeft
        Caption = 'Hist'#243'rico de Designa'#231#245'es'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
          F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
          F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
          F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
          F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
          F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
          F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
          333337FFFFFFFF77333330000000000333333777777777733333}
        NumGlyphs = 2
        Visible = False
        OnClick = btnHistoricoDesignacoesClick
        ExplicitTop = 0
      end
      object btnEncerrar: TSpeedButton
        AlignWithMargins = True
        Left = 886
        Top = 3
        Width = 95
        Height = 35
        Margins.Left = 5
        Margins.Right = 0
        Align = alLeft
        Caption = 'Encerrar'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555555555555555555555555555555555555555555555555555555555
          55555555FFFFFFFFFF5555500000000005555557777777777F55550BFBFBFBFB
          0555557F555555557F55550FBFBFBFBF0555557F555555557F55550BFBFBFBFB
          0555557F555555557F55550FBFBFBFBF0555557F555555557F55550BFBFBFBFB
          0555557F555555557F55550FBFBFBFBF0555557FFFFFFFFF7555550000000000
          555555777777777755555550FBFB0555555555575FFF75555555555700007555
          5555555577775555555555555555555555555555555555555555555555555555
          5555555555555555555555555555555555555555555555555555}
        NumGlyphs = 2
        Visible = False
        OnClick = btnEncerrarClick
        ExplicitLeft = 619
        ExplicitTop = 0
      end
      object btnHistoricoAtualizacoes: TSpeedButton
        AlignWithMargins = True
        Left = 706
        Top = 3
        Width = 175
        Height = 35
        Margins.Left = 5
        Margins.Right = 0
        Align = alLeft
        Caption = 'Hist'#243'rico de Atualiza'#231#245'es'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
          F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
          F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
          F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
          F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
          F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
          F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
          333337FFFFFFFF77333330000000000333333777777777733333}
        NumGlyphs = 2
        Visible = False
        OnClick = btnHistoricoAtualizacoesClick
        ExplicitLeft = 585
      end
      object btnObservacoes: TSpeedButton
        AlignWithMargins = True
        Left = 405
        Top = 3
        Width = 116
        Height = 35
        Margins.Left = 5
        Margins.Right = 0
        Align = alLeft
        Caption = 'Observa'#231#245'es'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
          F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
          F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
          F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
          F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
          F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
          F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
          333337FFFFFFFF77333330000000000333333777777777733333}
        NumGlyphs = 2
        Visible = False
        OnClick = btnObservacoesClick
      end
      object pnlSair: TPanel
        Left = 1254
        Top = 0
        Width = 137
        Height = 41
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
        object btnSair: TSpeedButton
          Tag = 1
          AlignWithMargins = True
          Left = 21
          Top = 3
          Width = 95
          Height = 32
          Margins.Left = 5
          Margins.Right = 5
          Caption = 'Sair'
          Flat = True
          Glyph.Data = {
            D6060000424DD606000000000000360400002800000019000000180000000100
            080000000000A0020000C30E0000C30E00000001000000000000000000007B00
            0000FF000000007B00007B7B000000FF0000FFFF0000007B7B007B7B7B00BDBD
            BD0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00090909090909
            0000000809090909090809090909090909090900000009090909090909090909
            0909090908080809090909090909090000000909090909090909090909090909
            0804040809090909090909000000090909090909090909090909090908060604
            0809090909090900000009090909090909090909090909090806060404080909
            0909090000000909090909090909090909090909080606040404080909090900
            0000000000000000000000000909090908060604040400000000080000000909
            0909090909090900080808080006060404040008090909000000090909090909
            090808000A0A0A0A070606040404000809090900000009090909090908000400
            0A0A0A0A0706060404040008090909000000090909090909080004000A0A0A0A
            070606040404000809090900000009090908080808040404070A0A0A07060404
            000400080909090000000909080808080804060404070A0A0706040800040008
            090909000000090400000000000406060404070A070606040404000809090900
            0000080406060606060606060604040707060604040400080909090000000804
            060B0B0B0B0B0B0B060604070706060404040008090909000000090404040404
            040406060604070A070606040404000809090900000009090808080808040606
            04070A0A070606040404000809090900000009090909090908040604070A0A0A
            0706060404040008090909000000090909090909080404000A0A0A0A07040604
            04040008090909000000090909090909080000000A0A0A0A0A07040604040008
            0909090000000909090909090909080A0A0A0A0A0A0A0A040604000809090900
            0000090909090909090908070707070707070700040400080909090000000909
            0909090909090908080808080808080808080809090909000000}
          OnClick = btnSairClick
        end
      end
    end
    object pgcPaineis: TPageControl
      Left = 7
      Top = 48
      Width = 1391
      Height = 701
      ActivePage = tbsControlPc
      Align = alClient
      TabHeight = 45
      TabOrder = 1
      TabWidth = 250
      object tbsAutoSC: TTabSheet
        Caption = 'AUTOSC'
        ImageIndex = 2
        object pnlGridAutoSC: TPanel
          Left = 0
          Top = 0
          Width = 1383
          Height = 646
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object dbgAutoSC: TwwDBGrid
            AlignWithMargins = True
            Left = 5
            Top = 37
            Width = 1373
            Height = 604
            Margins.Top = 0
            ControlType.Strings = (
              'Codigo_Produto;CustomEdit;ExpB_Produto;F'
              'Selecionado;CheckBox;1;0'
              'Prioridade;CustomEdit;Cb_Prioridade;F')
            Selected.Strings = (
              'Tipo_Auditoria'#9'15'#9'Auditoria'#9'F'
              'Numero_Processo'#9'15'#9'Processo'#9'F'
              'Tipo_Status'#9'15'#9'Tipo'#9'F'#9'Status'
              'Data_Status'#9'15'#9'Data'#9'F'#9'Status'
              'Qtd_Arquivos'#9'10'#9'Qtd de~Arquivos'#9'F'
              'Tipo_Prazo_Caixa'#9'15'#9'Caixa'#9'F'#9'Prazos'
              'Tipo_Prazo_Caixa_Hoje'#9'15'#9'Hoje'#9'F'#9'Prazos'
              'Tipo_Prazo_Ans'#9'15'#9'ANS'#9'F'#9'Prazos'
              'Tipo_Processo'#9'50'#9'Tipo do Processo'#9'F'
              'uf'#9'5'#9'UF'#9'F'
              'Setor_Designado'#9'50'#9'Setor'#9'F'#9'Designa'#231#227'o'
              'Usuario_Designado'#9'50'#9'Usu'#225'rio'#9'F'#9'Designa'#231#227'o'
              'Qtd_Designacoes'#9'10'#9'Qtd de~Designa'#231#245'es'#9'F'
              'Qtd_Historicos'#9'10'#9'Qtd de~Altera'#231#245'es'#9'F'
              'Qtd_Observacoes'#9'10'#9'Qtd de~Observa'#231#245'es'#9'F')
            IniAttributes.Delimiter = ';;'
            IniAttributes.UnicodeIniFile = False
            TitleColor = clBtnFace
            OnRowChanged = dbgAutoSCRowChanged
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dtmPainelAutoSC.dtsPainel
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Roboto'
            Font.Style = []
            KeyOptions = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFooter3DCells]
            ParentFont = False
            PopupMenu = ppmAutoSc
            RowHeightPercent = 120
            TabOrder = 0
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Roboto'
            TitleFont.Style = [fsBold]
            TitleLines = 3
            TitleButtons = True
            UseTFields = False
            OnTitleButtonClick = dbgAutoSCTitleButtonClick
            OnDblClick = dbgAutoSCDblClick
            FooterHeight = 20
            PaintOptions.AlternatingRowColor = 16053492
          end
          object pnlTituloAutoSC: TPanel
            Left = 2
            Top = 2
            Width = 1379
            Height = 35
            Margins.Bottom = 0
            Align = alTop
            BevelOuter = bvNone
            Caption = 'Processos AUTOSC'
            Color = 8404992
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -20
            Font.Name = 'Roboto'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 1
          end
        end
      end
      object tbsSiags: TTabSheet
        Caption = 'SIAGS'
        object pnlGridSiags: TPanel
          Left = 0
          Top = 0
          Width = 1383
          Height = 646
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object dbgSiags: TwwDBGrid
            AlignWithMargins = True
            Left = 5
            Top = 37
            Width = 1373
            Height = 604
            Margins.Top = 0
            ControlType.Strings = (
              'Codigo_Produto;CustomEdit;ExpB_Produto;F'
              'Selecionado;CheckBox;1;0'
              'Prioridade;CustomEdit;Cb_Prioridade;F')
            Selected.Strings = (
              'uf'#9'5'#9'UF do~Prestador'#9'F'
              'Tipo_Autorizacao'#9'50'#9'Tipo de~Autoriza'#231#227'o'#9'F'
              'Numero_Autorizacao'#9'15'#9'N'#250'mero~da Autoriza'#231#227'o'#9'F'
              'Tipo_Atendimento'#9'30'#9'Tipo do~Atendimento'#9'F'
              'Anexo_Opme'#9'3'#9'OPEM'#9'F'#9'Anexos'
              'Anexo_Quimio'#9'3'#9'Quimio'#9'F'#9'Anexos'
              'Anexo_Radio'#9'3'#9'Radio'#9'F'#9'Anexos'
              'Numero_Beneficiario'#9'15'#9'N'#250'mero'#9'F'#9'Benefici'#225'rio'
              'Nome_Beneficiario'#9'50'#9'Nome'#9'F'#9'Benefici'#225'rio'
              'Tipo_Situacao_Autorizacao'#9'30'#9'Situa'#231#227'o~da Autoriza'#231#227'o'#9'F'
              'Tipo_Ultima_Anotacao'#9'30'#9#218'ltima Anota'#231#227'o~ADM'#9'F'
              'Tipo_Auditoria'#9'15'#9'Auditoria'#9'F'
              'Dia_Inclusao'#9'10'#9'Dia da~Inclus'#227'o'#9'F'
              'Dias_Corridos_Base'#9'10'#9'Dias Corridos~Base'#9'F'
              'Dias_Uteis_Base'#9'10'#9'Dias '#218'teis~Base'#9'F'
              'Data_Prazo_Caixa'#9'18'#9'Data'#9'F'#9'Prazo Caixa'
              'Tipo_Prazo_Caixa'#9'15'#9'Situa'#231#227'o'#9'F'#9'Prazo Caixa'
              'Dias_Prazo_Caixa'#9'10'#9'Dias'#9'F'#9'Prazo Caixa'
              'Data_Prazo_ANS'#9'18'#9'Data'#9'F'#9'Prazo ANS'
              'Dias_Prazo_ANS'#9'10'#9'Dias'#9'F'#9'Prazo ANS'
              'Tipo_Prazo_Ans'#9'15'#9'Status'#9'F'#9'Prazo ANS'
              'Usuario_Designado'#9'50'#9'Usu'#225'rio'#9'F'#9'Designa'#231#227'o'
              'Setor_Designado'#9'50'#9'Setor'#9'F'#9'Designa'#231#227'o'
              'Qtd_Designacoes'#9'10'#9'Qtd de~Designa'#231#245'es'#9'F'
              'Qtd_Historicos'#9'10'#9'Qtd de~Altera'#231#245'es'#9'F'
              'Qtd_Observacoes'#9'10'#9'Qtd de~Observa'#231#245'es'#9'F')
            IniAttributes.Delimiter = ';;'
            IniAttributes.UnicodeIniFile = False
            TitleColor = clBtnFace
            OnRowChanged = dbgSiagsRowChanged
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dtmPainelSiags.dtsPainel
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Roboto'
            Font.Style = []
            KeyOptions = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFooter3DCells]
            ParentFont = False
            PopupMenu = ppmAutoSc
            RowHeightPercent = 120
            TabOrder = 0
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Roboto'
            TitleFont.Style = [fsBold]
            TitleLines = 3
            TitleButtons = True
            UseTFields = False
            OnTitleButtonClick = dbgSiagsTitleButtonClick
            OnDblClick = dbgAutoSCDblClick
            FooterHeight = 20
            PaintOptions.AlternatingRowColor = 16053492
          end
          object pnlTituloSiags: TPanel
            Left = 2
            Top = 2
            Width = 1379
            Height = 35
            Margins.Bottom = 0
            Align = alTop
            BevelOuter = bvNone
            Caption = 'Autoriza'#231#245'es SIAGS'
            Color = 8404992
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -20
            Font.Name = 'Roboto'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 1
          end
        end
      end
      object tbsControlPc: TTabSheet
        Caption = 'CONTROLPC'
        ImageIndex = 1
        object pnlGridControlPc: TPanel
          Left = 0
          Top = 0
          Width = 1383
          Height = 646
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object dbgControlPc: TwwDBGrid
            AlignWithMargins = True
            Left = 5
            Top = 37
            Width = 1373
            Height = 604
            Margins.Top = 0
            ControlType.Strings = (
              'Codigo_Produto;CustomEdit;ExpB_Produto;F'
              'Selecionado;CheckBox;1;0'
              'Prioridade;CustomEdit;Cb_Prioridade;F')
            Selected.Strings = (
              'Protocolo'#9'50'#9'Protocolo'#9'F'
              'Tipo_Status'#9'30'#9'Status'#9'F'
              'Data_Abertura'#9'18'#9'Data de~Abertura'#9'F'
              'Data_Fechamento'#9'18'#9'Data de~Fechamento'#9'F'
              'Data_Transferencia'#9'18'#9'Data de~Transferencia'#9'F'
              'Previsao_Solucao'#9'18'#9'Previs'#227'o~de Solu'#231#227'o'#9'F'
              'Tipo_Prazo_Caixa'#9'15'#9'Prazo'#9'F'
              'Nome_Tecnico'#9'50'#9'T'#233'cnico'#9'F'
              'Tipo_Cliente'#9'50'#9'Tipo Cliente'#9'F'
              'Tipo_Classificacao'#9'100'#9'Classifica'#231#227'o'#9'F'
              'Solicitacao_Cliente'#9'100'#9'Solicita'#231#227'o do Cliente'#9'F'
              'Tipo_Reclame'#9'5'#9'Tipo~Reclame'#9'F'
              'Tipo_Nip'#9'5'#9'Tipo~Nip'#9'F'
              'Usuario_Designado'#9'50'#9'Usu'#225'rio'#9'F'#9'Designa'#231#227'o'
              'Setor_Designado'#9'50'#9'Setor'#9'F'#9'Designa'#231#227'o'
              'Qtd_Designacoes'#9'10'#9'Qtd de~Designa'#231#245'es'#9'F'
              'Qtd_Historicos'#9'10'#9'Qtd de~Altera'#231#245'es'#9'F'
              'Qtd_Observacoes'#9'10'#9'Qtd de~Observa'#231#245'es'#9'F')
            IniAttributes.Delimiter = ';;'
            IniAttributes.UnicodeIniFile = False
            TitleColor = clBtnFace
            OnRowChanged = dbgControlPcRowChanged
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dtmPainelControlPc.dtsPainel
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Roboto'
            Font.Style = []
            KeyOptions = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFooter3DCells]
            ParentFont = False
            PopupMenu = ppmAutoSc
            RowHeightPercent = 120
            TabOrder = 0
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Roboto'
            TitleFont.Style = [fsBold]
            TitleLines = 3
            TitleButtons = True
            UseTFields = False
            OnTitleButtonClick = dbgControlPcTitleButtonClick
            OnDblClick = dbgAutoSCDblClick
            FooterHeight = 20
            PaintOptions.AlternatingRowColor = 16053492
          end
          object pnlTituloControlPc: TPanel
            Left = 2
            Top = 2
            Width = 1379
            Height = 35
            Margins.Bottom = 0
            Align = alTop
            BevelOuter = bvNone
            Caption = 'Protocolos CONTROLPC'
            Color = 8404992
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -20
            Font.Name = 'Roboto'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 1
          end
        end
      end
    end
  end
  object pgcPaineisConteiner: TPageControl
    Left = 52
    Top = 357
    Width = 1345
    Height = 657
    ActivePage = TabSheet9
    TabOrder = 1
    Visible = False
    object TabSheet1: TTabSheet
      Caption = 'pnlFiltrosAutoSC'
      object pnlFiltrosAutoSC: TPanel
        Left = 67
        Top = 81
        Width = 625
        Height = 544
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Color = 8404992
        Padding.Left = 5
        Padding.Top = 5
        Padding.Right = 5
        Padding.Bottom = 5
        ParentBackground = False
        TabOrder = 0
        object Label1: TLabel
          AlignWithMargins = True
          Left = 10
          Top = 10
          Width = 605
          Height = 24
          Margins.Bottom = 10
          Align = alTop
          Alignment = taCenter
          Caption = 'Filtros AUTOSC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -20
          Font.Name = 'Roboto'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 139
        end
        object pnlCamposFiltroAutoSc: TPanel
          Left = 7
          Top = 44
          Width = 611
          Height = 493
          Align = alClient
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          object pnlBotoesFiltroAutoSc: TPanel
            Left = 0
            Top = 432
            Width = 611
            Height = 61
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              611
              61)
            object btnFiltrarAutoSC: TBitBtn
              Left = 174
              Top = 14
              Width = 119
              Height = 33
              Anchors = [akLeft, akBottom]
              Caption = 'Filtrar'
              Glyph.Data = {
                BE060000424DBE06000000000000360400002800000024000000120000000100
                0800000000008802000000000000000000000001000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
                A400000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
                0303030303030303030303030303030303030303030303030303030303030303
                03030303030303030303030303030303030303030303FF030303030303030303
                03030303030303040403030303030303030303030303030303F8F8FF03030303
                03030303030303030303040202040303030303030303030303030303F80303F8
                FF030303030303030303030303040202020204030303030303030303030303F8
                03030303F8FF0303030303030303030304020202020202040303030303030303
                0303F8030303030303F8FF030303030303030304020202FA0202020204030303
                0303030303F8FF0303F8FF030303F8FF03030303030303020202FA03FA020202
                040303030303030303F8FF03F803F8FF0303F8FF03030303030303FA02FA0303
                03FA0202020403030303030303F8FFF8030303F8FF0303F8FF03030303030303
                FA0303030303FA0202020403030303030303F80303030303F8FF0303F8FF0303
                0303030303030303030303FA0202020403030303030303030303030303F8FF03
                03F8FF03030303030303030303030303FA020202040303030303030303030303
                0303F8FF0303F8FF03030303030303030303030303FA02020204030303030303
                03030303030303F8FF0303F8FF03030303030303030303030303FA0202020403
                030303030303030303030303F8FF0303F8FF03030303030303030303030303FA
                0202040303030303030303030303030303F8FF03F8FF03030303030303030303
                03030303FA0202030303030303030303030303030303F8FFF803030303030303
                030303030303030303FA0303030303030303030303030303030303F803030303
                0303030303030303030303030303030303030303030303030303030303030303
                0303}
              NumGlyphs = 2
              TabOrder = 0
              OnClick = btnFiltrarAutoSCClick
            end
            object btnCancelarFiltroAutoSC: TBitBtn
              Left = 318
              Top = 14
              Width = 119
              Height = 33
              Anchors = [akLeft, akBottom]
              Caption = 'Cancelar'
              Glyph.Data = {
                BE060000424DBE06000000000000360400002800000024000000120000000100
                0800000000008802000000000000000000000001000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
                A400000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
                0303030303030303030303030303030303030303030303030303030303030303
                0303F8F80303030303030303030303030303030303FF03030303030303030303
                0303030303F90101F80303030303F9F80303030303030303F8F8FF0303030303
                03FF03030303030303F9010101F8030303F90101F8030303030303F8FF03F8FF
                030303FFF8F8FF030303030303F901010101F803F901010101F80303030303F8
                FF0303F8FF03FFF80303F8FF030303030303F901010101F80101010101F80303
                030303F8FF030303F8FFF803030303F8FF030303030303F90101010101010101
                F803030303030303F8FF030303F803030303FFF80303030303030303F9010101
                010101F8030303030303030303F8FF030303030303FFF8030303030303030303
                030101010101F80303030303030303030303F8FF0303030303F8030303030303
                0303030303F901010101F8030303030303030303030303F8FF030303F8030303
                0303030303030303F90101010101F8030303030303030303030303F803030303
                F8FF030303030303030303F9010101F8010101F803030303030303030303F803
                03030303F8FF0303030303030303F9010101F803F9010101F803030303030303
                03F8030303F8FF0303F8FF03030303030303F90101F8030303F9010101F80303
                03030303F8FF0303F803F8FF0303F8FF03030303030303F9010303030303F901
                0101030303030303F8FFFFF8030303F8FF0303F8FF0303030303030303030303
                030303F901F903030303030303F8F80303030303F8FFFFFFF803030303030303
                03030303030303030303030303030303030303030303030303F8F8F803030303
                0303030303030303030303030303030303030303030303030303030303030303
                0303}
              NumGlyphs = 2
              TabOrder = 1
              OnClick = btnCancelarFiltroAutoSCClick
            end
          end
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 611
            Height = 316
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object Label2: TLabel
              Left = 40
              Top = 20
              Width = 51
              Height = 16
              Caption = 'Auditoria'
            end
            object Label3: TLabel
              Left = 40
              Top = 79
              Width = 67
              Height = 16
              Caption = 'Prazo Caixa'
            end
            object Label4: TLabel
              Left = 328
              Top = 79
              Width = 97
              Height = 16
              Caption = 'Prazo Caixa Hoje'
            end
            object Label5: TLabel
              Left = 40
              Top = 196
              Width = 98
              Height = 16
              Caption = 'Tipo de Processo'
            end
            object Label6: TLabel
              Left = 328
              Top = 196
              Width = 109
              Height = 16
              Caption = 'Tipo de Processo E'
            end
            object Label7: TLabel
              Left = 40
              Top = 256
              Width = 36
              Height = 16
              Caption = 'Status'
            end
            object Label10: TLabel
              Left = 328
              Top = 256
              Width = 93
              Height = 16
              Caption = 'Data do Status: '
            end
            object Label11: TLabel
              Left = 464
              Top = 277
              Width = 7
              Height = 16
              Caption = 'e'
            end
            object Label12: TLabel
              Left = 40
              Top = 138
              Width = 60
              Height = 16
              Caption = 'Prazo ANS'
            end
            object Label14: TLabel
              Left = 328
              Top = 277
              Width = 30
              Height = 16
              Caption = 'entre'
            end
            object Label9: TLabel
              Left = 328
              Top = 138
              Width = 15
              Height = 16
              Caption = 'UF'
            end
            object cmbAuditoriasAutoSc: TDBLookupComboBox
              Left = 40
              Top = 37
              Width = 239
              Height = 24
              KeyField = 'id'
              ListField = 'Tipo_Auditoria'
              ListSource = dtmPainelAutoSC.dtsTiposAuditoria
              TabOrder = 0
            end
            object cmbPrazosCaixaAutoSc: TDBLookupComboBox
              Left = 40
              Top = 96
              Width = 239
              Height = 24
              KeyField = 'id'
              ListField = 'Tipo_Prazo_Caixa'
              ListSource = dtmPainelAutoSC.dtsTiposPrazo
              TabOrder = 1
            end
            object cmbPrazosCaixaHojeAutoSc: TDBLookupComboBox
              Left = 328
              Top = 96
              Width = 239
              Height = 24
              KeyField = 'id'
              ListField = 'Tipo_Prazo_Caixa_Hoje'
              ListSource = dtmPainelAutoSC.dtsTiposPrazoHoje
              TabOrder = 2
            end
            object cmbTipoProcessoAutoSc: TDBLookupComboBox
              Left = 40
              Top = 218
              Width = 239
              Height = 24
              KeyField = 'id'
              ListField = 'Tipo_Processo'
              ListSource = dtmPainelAutoSC.dtsTiposProcesso
              TabOrder = 5
            end
            object cmbTipoProcessoEAutoSc: TDBLookupComboBox
              Left = 328
              Top = 214
              Width = 239
              Height = 24
              KeyField = 'id'
              ListField = 'Tipo_Processo_E'
              ListSource = dtmPainelAutoSC.dtsTiposProcessoE
              TabOrder = 6
            end
            object cmbStatusAutoSc: TDBLookupComboBox
              Left = 40
              Top = 273
              Width = 239
              Height = 24
              KeyField = 'id'
              ListField = 'Tipo_Status'
              ListSource = dtmPainelAutoSC.dtsTiposStatus
              TabOrder = 7
            end
            object edtDataInicio: TMaskEdit
              Left = 367
              Top = 273
              Width = 87
              Height = 24
              EditMask = '99/99/9999'
              MaxLength = 10
              TabOrder = 8
              Text = '  /  /    '
            end
            object edtDataFim: TMaskEdit
              Left = 477
              Top = 273
              Width = 88
              Height = 24
              EditMask = '99/99/9999'
              MaxLength = 10
              TabOrder = 9
              Text = '  /  /    '
            end
            object cmbPrazosAnsAutoSc: TDBLookupComboBox
              Left = 40
              Top = 155
              Width = 241
              Height = 24
              KeyField = 'id'
              ListField = 'Tipo_Prazo_Caixa'
              ListSource = dtmPainelAutoSC.dtsTiposPrazoANS
              TabOrder = 3
            end
            object cmbUFAutoSc: TDBLookupComboBox
              Left = 328
              Top = 155
              Width = 81
              Height = 24
              KeyField = 'Sigla'
              ListField = 'Sigla'
              ListSource = dtmPainelAutoSC.dtsUF
              TabOrder = 4
            end
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'pnlDesignacao'
      ImageIndex = 1
      object pnlDesignacao: TPanel
        Left = 125
        Top = 65
        Width = 625
        Height = 368
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Color = 8404992
        Padding.Left = 5
        Padding.Top = 5
        Padding.Right = 5
        Padding.Bottom = 5
        ParentBackground = False
        TabOrder = 0
        object lblTituloDesignacao: TLabel
          AlignWithMargins = True
          Left = 10
          Top = 10
          Width = 605
          Height = 24
          Margins.Bottom = 10
          Align = alTop
          Alignment = taCenter
          Caption = 'Designi'#231#227'o de Processo - AUTOSC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -20
          Font.Name = 'Roboto'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 308
        end
        object pnlCamposDesignacao: TPanel
          Left = 7
          Top = 44
          Width = 611
          Height = 317
          Align = alClient
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          object pnlBotoesAutoSc: TPanel
            Left = 0
            Top = 245
            Width = 611
            Height = 72
            Align = alBottom
            TabOrder = 0
            DesignSize = (
              611
              72)
            object btnConfirmarDesignacao: TBitBtn
              Left = 174
              Top = 20
              Width = 119
              Height = 33
              Anchors = [akLeft, akBottom]
              Caption = 'Confirmar'
              Glyph.Data = {
                BE060000424DBE06000000000000360400002800000024000000120000000100
                0800000000008802000000000000000000000001000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
                A400000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
                0303030303030303030303030303030303030303030303030303030303030303
                03030303030303030303030303030303030303030303FF030303030303030303
                03030303030303040403030303030303030303030303030303F8F8FF03030303
                03030303030303030303040202040303030303030303030303030303F80303F8
                FF030303030303030303030303040202020204030303030303030303030303F8
                03030303F8FF0303030303030303030304020202020202040303030303030303
                0303F8030303030303F8FF030303030303030304020202FA0202020204030303
                0303030303F8FF0303F8FF030303F8FF03030303030303020202FA03FA020202
                040303030303030303F8FF03F803F8FF0303F8FF03030303030303FA02FA0303
                03FA0202020403030303030303F8FFF8030303F8FF0303F8FF03030303030303
                FA0303030303FA0202020403030303030303F80303030303F8FF0303F8FF0303
                0303030303030303030303FA0202020403030303030303030303030303F8FF03
                03F8FF03030303030303030303030303FA020202040303030303030303030303
                0303F8FF0303F8FF03030303030303030303030303FA02020204030303030303
                03030303030303F8FF0303F8FF03030303030303030303030303FA0202020403
                030303030303030303030303F8FF0303F8FF03030303030303030303030303FA
                0202040303030303030303030303030303F8FF03F8FF03030303030303030303
                03030303FA0202030303030303030303030303030303F8FFF803030303030303
                030303030303030303FA0303030303030303030303030303030303F803030303
                0303030303030303030303030303030303030303030303030303030303030303
                0303}
              NumGlyphs = 2
              TabOrder = 0
              OnClick = btnConfirmarDesignacaoClick
            end
            object btnCancelarDesignacao: TBitBtn
              Left = 318
              Top = 20
              Width = 119
              Height = 33
              Anchors = [akLeft, akBottom]
              Caption = 'Cancelar'
              Glyph.Data = {
                BE060000424DBE06000000000000360400002800000024000000120000000100
                0800000000008802000000000000000000000001000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
                A400000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
                0303030303030303030303030303030303030303030303030303030303030303
                0303F8F80303030303030303030303030303030303FF03030303030303030303
                0303030303F90101F80303030303F9F80303030303030303F8F8FF0303030303
                03FF03030303030303F9010101F8030303F90101F8030303030303F8FF03F8FF
                030303FFF8F8FF030303030303F901010101F803F901010101F80303030303F8
                FF0303F8FF03FFF80303F8FF030303030303F901010101F80101010101F80303
                030303F8FF030303F8FFF803030303F8FF030303030303F90101010101010101
                F803030303030303F8FF030303F803030303FFF80303030303030303F9010101
                010101F8030303030303030303F8FF030303030303FFF8030303030303030303
                030101010101F80303030303030303030303F8FF0303030303F8030303030303
                0303030303F901010101F8030303030303030303030303F8FF030303F8030303
                0303030303030303F90101010101F8030303030303030303030303F803030303
                F8FF030303030303030303F9010101F8010101F803030303030303030303F803
                03030303F8FF0303030303030303F9010101F803F9010101F803030303030303
                03F8030303F8FF0303F8FF03030303030303F90101F8030303F9010101F80303
                03030303F8FF0303F803F8FF0303F8FF03030303030303F9010303030303F901
                0101030303030303F8FFFFF8030303F8FF0303F8FF0303030303030303030303
                030303F901F903030303030303F8F80303030303F8FFFFFFF803030303030303
                03030303030303030303030303030303030303030303030303F8F8F803030303
                0303030303030303030303030303030303030303030303030303030303030303
                0303}
              NumGlyphs = 2
              TabOrder = 1
              OnClick = btnCancelarDesignacaoClick
            end
          end
          object pnlSelecaoDesignacao: TPanel
            Left = 0
            Top = 121
            Width = 611
            Height = 124
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 2
            object Label8: TLabel
              Left = 40
              Top = 0
              Width = 31
              Height = 16
              Caption = 'Setor'
            end
            inline fraPesquisaUsuario: TfraPesquisaUsuario
              AlignWithMargins = True
              Left = 0
              Top = 45
              Width = 611
              Height = 71
              Margins.Left = 0
              Margins.Top = 45
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alTop
              Color = clWhite
              ParentBackground = False
              ParentColor = False
              TabOrder = 1
              ExplicitTop = 45
              ExplicitWidth = 611
              ExplicitHeight = 71
              inherited Label9: TLabel
                Left = 40
                ExplicitLeft = 40
              end
              inherited btnPesquisarUsuario: TSpeedButton
                Left = 544
                ExplicitLeft = 544
              end
              inherited cmbUsuarios: TDBLookupComboBox
                Left = 40
                ExplicitLeft = 40
              end
            end
            object cmbSetores: TDBLookupComboBox
              Left = 40
              Top = 19
              Width = 239
              Height = 24
              KeyField = 'id'
              ListField = 'Nome_Setor'
              ListSource = dtmPainelAutoSC.dtsSetores
              TabOrder = 0
            end
          end
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 611
            Height = 121
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object Label13: TLabel
              Left = 40
              Top = 24
              Width = 65
              Height = 16
              Caption = 'Justificativa'
            end
            object memJustificativa: TMemo
              Left = 40
              Top = 40
              Width = 505
              Height = 57
              Lines.Strings = (
                'memJustificativa')
              MaxLength = 100
              TabOrder = 0
            end
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'pnlHistoricoDesignacoes'
      ImageIndex = 2
      object pnlHistoricoDesignacoes: TPanel
        Left = 133
        Top = 73
        Width = 625
        Height = 408
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Color = 8404992
        Padding.Left = 5
        Padding.Top = 5
        Padding.Right = 5
        Padding.Bottom = 5
        ParentBackground = False
        TabOrder = 0
        object lblTituloHistoricoDesignacoes: TLabel
          AlignWithMargins = True
          Left = 10
          Top = 10
          Width = 605
          Height = 24
          Margins.Bottom = 10
          Align = alTop
          Alignment = taCenter
          Caption = 'Designa'#231#245'es'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -20
          Font.Name = 'Roboto'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 113
        end
        object Panel3: TPanel
          Left = 7
          Top = 44
          Width = 611
          Height = 357
          Align = alClient
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          object Label15: TLabel
            Left = 21
            Top = 77
            Width = 153
            Height = 16
            Caption = 'Data | Hora da designa'#231#227'o'
          end
          object Label16: TLabel
            Left = 215
            Top = 77
            Width = 71
            Height = 16
            Caption = 'Respons'#225'vel'
          end
          object Label17: TLabel
            Left = 21
            Top = 141
            Width = 101
            Height = 16
            Caption = 'Setor Desiganado'
          end
          object Label18: TLabel
            Left = 215
            Top = 141
            Width = 117
            Height = 16
            Caption = 'Usu'#225'rio  Desiganado'
          end
          object Label19: TLabel
            Left = 21
            Top = 204
            Width = 65
            Height = 16
            Caption = 'Justificativa'
          end
          object Panel5: TPanel
            Left = 0
            Top = 285
            Width = 611
            Height = 72
            Align = alBottom
            TabOrder = 0
            DesignSize = (
              611
              72)
            object btnFecharHistoricoDesignacao: TBitBtn
              Left = 246
              Top = 20
              Width = 119
              Height = 33
              Anchors = [akLeft, akBottom]
              Caption = 'Fechar'
              NumGlyphs = 2
              TabOrder = 0
              OnClick = btnFecharHistoricoDesignacaoClick
            end
          end
          object dbnHistoricoDesignacoes: TDBNavigator
            Left = 174
            Top = 16
            Width = 264
            Height = 25
            DataSource = dtmPainelAutoSC.dtsHistoricoDesignacoes
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Hints.Strings = (
              'Primeiro'
              'Anterior'
              'Pr'#243'ximo'
              #218'ltimo')
            TabOrder = 1
          end
          object edtDataHoraDesignacao: TDBEdit
            Left = 21
            Top = 94
            Width = 154
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Data_Hora_Log'
            DataSource = dtmPainelAutoSC.dtsHistoricoDesignacoes
            ReadOnly = True
            TabOrder = 2
          end
          object edtResponsavelDesignacao: TDBEdit
            Left = 215
            Top = 94
            Width = 377
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Usuario_Responsavel'
            DataSource = dtmPainelAutoSC.dtsHistoricoDesignacoes
            ReadOnly = True
            TabOrder = 3
          end
          object edtSetorDesignacao: TDBEdit
            Left = 21
            Top = 158
            Width = 154
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Nome_Setor'
            DataSource = dtmPainelAutoSC.dtsHistoricoDesignacoes
            ReadOnly = True
            TabOrder = 4
          end
          object edtUsuarioDesignacao: TDBEdit
            Left = 215
            Top = 158
            Width = 377
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Usuario_Designado'
            DataSource = dtmPainelAutoSC.dtsHistoricoDesignacoes
            ReadOnly = True
            TabOrder = 5
          end
          object memJustificativaDesignacao: TDBMemo
            Left = 21
            Top = 222
            Width = 572
            Height = 57
            TabStop = False
            Color = clBtnFace
            DataField = 'Justificativa'
            DataSource = dtmPainelAutoSC.dtsHistoricoDesignacoes
            ReadOnly = True
            TabOrder = 6
          end
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'pnlHistoricoAtualizacoesAutoSc'
      ImageIndex = 3
      object pnlHistoricoAtualizacoesAutoSc: TPanel
        Left = 141
        Top = 81
        Width = 625
        Height = 408
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Color = 8404992
        Padding.Left = 5
        Padding.Top = 5
        Padding.Right = 5
        Padding.Bottom = 5
        ParentBackground = False
        TabOrder = 0
        object lblTituloHistoricoAtualizacoesAUTOSC: TLabel
          AlignWithMargins = True
          Left = 10
          Top = 10
          Width = 605
          Height = 24
          Margins.Bottom = 10
          Align = alTop
          Alignment = taCenter
          Caption = 'Atualiza'#231#245'es de Processo - AUTOSC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -20
          Font.Name = 'Roboto'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 324
        end
        object Panel6: TPanel
          Left = 7
          Top = 44
          Width = 611
          Height = 357
          Align = alClient
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          object Label21: TLabel
            Left = 21
            Top = 77
            Width = 153
            Height = 16
            Caption = 'Data | Hora da atualiza'#231#227'o'
          end
          object Label22: TLabel
            Left = 215
            Top = 77
            Width = 71
            Height = 16
            Caption = 'Respons'#225'vel'
          end
          object Label23: TLabel
            Left = 21
            Top = 141
            Width = 67
            Height = 16
            Caption = 'Prazo Caixa'
          end
          object Label24: TLabel
            Left = 21
            Top = 205
            Width = 60
            Height = 16
            Caption = 'Prazo ANS'
          end
          object Label25: TLabel
            Left = 323
            Top = 141
            Width = 97
            Height = 16
            Caption = 'Prazo Caixa Hoje'
          end
          object Label26: TLabel
            Left = 323
            Top = 205
            Width = 36
            Height = 16
            Caption = 'Status'
          end
          object Panel7: TPanel
            Left = 0
            Top = 285
            Width = 611
            Height = 72
            Align = alBottom
            TabOrder = 0
            DesignSize = (
              611
              72)
            object btnFecharHistoricoAtualizacoes: TBitBtn
              Left = 246
              Top = 20
              Width = 119
              Height = 33
              Anchors = [akLeft, akBottom]
              Caption = 'Fechar'
              NumGlyphs = 2
              TabOrder = 0
              OnClick = btnFecharHistoricoAtualizacoesClick
            end
          end
          object dbnHistoricoAtualizacoes: TDBNavigator
            Left = 174
            Top = 16
            Width = 264
            Height = 25
            DataSource = dtmPainelAutoSC.dtsHistoricoAtualizacoes
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Hints.Strings = (
              'Primeiro'
              'Anterior'
              'Pr'#243'ximo'
              #218'ltimo')
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
          end
          object DBEdit5: TDBEdit
            Left = 21
            Top = 94
            Width = 154
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Data_Hora_Historico'
            DataSource = dtmPainelAutoSC.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 2
          end
          object DBEdit6: TDBEdit
            Left = 215
            Top = 94
            Width = 377
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Nome_Usuario'
            DataSource = dtmPainelAutoSC.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 3
          end
          object DBEdit7: TDBEdit
            Left = 21
            Top = 158
            Width = 269
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Tipo_Prazo_Caixa'
            DataSource = dtmPainelAutoSC.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 4
          end
          object DBEdit8: TDBEdit
            Left = 21
            Top = 222
            Width = 269
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Tipo_Prazo_ANS'
            DataSource = dtmPainelAutoSC.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 5
          end
          object DBEdit9: TDBEdit
            Left = 323
            Top = 158
            Width = 269
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Tipo_Prazo_Caixa_Hoje'
            DataSource = dtmPainelAutoSC.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 6
          end
          object DBEdit10: TDBEdit
            Left = 323
            Top = 222
            Width = 269
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Tipo_Status'
            DataSource = dtmPainelAutoSC.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 7
          end
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'pnlEncerramento'
      ImageIndex = 4
      object pnlEncerramento: TPanel
        Left = 149
        Top = 89
        Width = 625
        Height = 224
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Color = 8404992
        Padding.Left = 5
        Padding.Top = 5
        Padding.Right = 5
        Padding.Bottom = 5
        ParentBackground = False
        TabOrder = 0
        object lblTituloEncerramento: TLabel
          AlignWithMargins = True
          Left = 10
          Top = 10
          Width = 605
          Height = 24
          Margins.Bottom = 10
          Align = alTop
          Alignment = taCenter
          Caption = 'Designi'#231#227'o de Processo - AUTOSC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -20
          Font.Name = 'Roboto'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 308
        end
        object Panel8: TPanel
          Left = 7
          Top = 44
          Width = 611
          Height = 173
          Align = alClient
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          object Panel9: TPanel
            Left = 0
            Top = 101
            Width = 611
            Height = 72
            Align = alBottom
            TabOrder = 0
            DesignSize = (
              611
              72)
            object btnConfirmaEncerramento: TBitBtn
              Left = 174
              Top = 24
              Width = 119
              Height = 33
              Anchors = [akLeft, akBottom]
              Caption = 'Confirmar'
              Glyph.Data = {
                BE060000424DBE06000000000000360400002800000024000000120000000100
                0800000000008802000000000000000000000001000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
                A400000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
                0303030303030303030303030303030303030303030303030303030303030303
                03030303030303030303030303030303030303030303FF030303030303030303
                03030303030303040403030303030303030303030303030303F8F8FF03030303
                03030303030303030303040202040303030303030303030303030303F80303F8
                FF030303030303030303030303040202020204030303030303030303030303F8
                03030303F8FF0303030303030303030304020202020202040303030303030303
                0303F8030303030303F8FF030303030303030304020202FA0202020204030303
                0303030303F8FF0303F8FF030303F8FF03030303030303020202FA03FA020202
                040303030303030303F8FF03F803F8FF0303F8FF03030303030303FA02FA0303
                03FA0202020403030303030303F8FFF8030303F8FF0303F8FF03030303030303
                FA0303030303FA0202020403030303030303F80303030303F8FF0303F8FF0303
                0303030303030303030303FA0202020403030303030303030303030303F8FF03
                03F8FF03030303030303030303030303FA020202040303030303030303030303
                0303F8FF0303F8FF03030303030303030303030303FA02020204030303030303
                03030303030303F8FF0303F8FF03030303030303030303030303FA0202020403
                030303030303030303030303F8FF0303F8FF03030303030303030303030303FA
                0202040303030303030303030303030303F8FF03F8FF03030303030303030303
                03030303FA0202030303030303030303030303030303F8FFF803030303030303
                030303030303030303FA0303030303030303030303030303030303F803030303
                0303030303030303030303030303030303030303030303030303030303030303
                0303}
              NumGlyphs = 2
              TabOrder = 0
              OnClick = btnConfirmaEncerramentoClick
            end
            object btnCancelaEncerramento: TBitBtn
              Left = 318
              Top = 24
              Width = 119
              Height = 33
              Anchors = [akLeft, akBottom]
              Caption = 'Cancelar'
              Glyph.Data = {
                BE060000424DBE06000000000000360400002800000024000000120000000100
                0800000000008802000000000000000000000001000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
                A400000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
                0303030303030303030303030303030303030303030303030303030303030303
                0303F8F80303030303030303030303030303030303FF03030303030303030303
                0303030303F90101F80303030303F9F80303030303030303F8F8FF0303030303
                03FF03030303030303F9010101F8030303F90101F8030303030303F8FF03F8FF
                030303FFF8F8FF030303030303F901010101F803F901010101F80303030303F8
                FF0303F8FF03FFF80303F8FF030303030303F901010101F80101010101F80303
                030303F8FF030303F8FFF803030303F8FF030303030303F90101010101010101
                F803030303030303F8FF030303F803030303FFF80303030303030303F9010101
                010101F8030303030303030303F8FF030303030303FFF8030303030303030303
                030101010101F80303030303030303030303F8FF0303030303F8030303030303
                0303030303F901010101F8030303030303030303030303F8FF030303F8030303
                0303030303030303F90101010101F8030303030303030303030303F803030303
                F8FF030303030303030303F9010101F8010101F803030303030303030303F803
                03030303F8FF0303030303030303F9010101F803F9010101F803030303030303
                03F8030303F8FF0303F8FF03030303030303F90101F8030303F9010101F80303
                03030303F8FF0303F803F8FF0303F8FF03030303030303F9010303030303F901
                0101030303030303F8FFFFF8030303F8FF0303F8FF0303030303030303030303
                030303F901F903030303030303F8F80303030303F8FFFFFFF803030303030303
                03030303030303030303030303030303030303030303030303F8F8F803030303
                0303030303030303030303030303030303030303030303030303030303030303
                0303}
              NumGlyphs = 2
              TabOrder = 1
              OnClick = btnCancelaEncerramentoClick
            end
          end
          object Panel11: TPanel
            Left = 0
            Top = 0
            Width = 611
            Height = 121
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object Label28: TLabel
              Left = 53
              Top = 24
              Width = 65
              Height = 16
              Caption = 'Justificativa'
            end
            object memJustificativaEncerramento: TMemo
              Left = 53
              Top = 40
              Width = 505
              Height = 57
              Lines.Strings = (
                'memJustificativa')
              MaxLength = 100
              TabOrder = 0
            end
          end
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'pnlObservacoesProcesso'
      ImageIndex = 5
      object pnlObservacoesProcesso: TPanel
        Left = 157
        Top = 97
        Width = 625
        Height = 400
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Color = 8404992
        Padding.Left = 5
        Padding.Top = 5
        Padding.Right = 5
        Padding.Bottom = 5
        ParentBackground = False
        TabOrder = 0
        object lblTituloObservacoesProcesso: TLabel
          AlignWithMargins = True
          Left = 10
          Top = 10
          Width = 605
          Height = 24
          Margins.Bottom = 10
          Align = alTop
          Alignment = taCenter
          Caption = 'Designi'#231#227'o de Processo - AUTOSC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -20
          Font.Name = 'Roboto'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 308
        end
        object Panel10: TPanel
          Left = 7
          Top = 44
          Width = 611
          Height = 349
          Align = alClient
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          object Label27: TLabel
            Left = 41
            Top = 133
            Width = 65
            Height = 16
            Caption = 'Justificativa'
          end
          object btnIncluirObservacao: TSpeedButton
            Left = 330
            Top = 16
            Width = 80
            Height = 25
            Caption = 'Incluir'
            Glyph.Data = {
              CE070000424DCE07000000000000360000002800000024000000120000000100
              18000000000098070000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF50AF4C50AF
              4C50AF4C50AF4C50AF4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E0E0E0E0E0E0E0E0E0E0E0E0E0
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4CFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E0E0E0E0E0E0E0
              E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50
              AF4C50AF4C50AF4C50AF4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0
              E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF50AF4C50AF4C50AF4C50AF4C50
              AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4CFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFE0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0
              E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF50
              AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C
              50AF4C50AF4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E0E0E0E0E0E0E0E0E0
              E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0FFFFFFFF
              FFFFFFFFFFFFFFFF50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4CFFFFFF
              50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4CFFFFFFFFFFFFFFFFFFE0E0
              E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0646464E0E0E0E0E0E0E0E0E0E0
              E0E0E0E0E0E0E0E0E0E0E0FFFFFFFFFFFFFFFFFF50AF4C50AF4C50AF4C50AF4C
              50AF4C50AF4C50AF4CFFFFFF50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF
              4CFFFFFFFFFFFFFFFFFFE0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E064
              6464E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0FFFFFFFFFFFFFFFFFF
              50AF4C50AF4C50AF4C50AF4C50AF4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF50AF
              4C50AF4C50AF4C50AF4C50AF4CFFFFFFFFFFFFFFFFFFE0E0E0E0E0E0E0E0E0E0
              E0E0E0E0E0646464646464646464646464646464E0E0E0E0E0E0E0E0E0E0E0E0
              E0E0E0FFFFFFFFFFFFFFFFFF50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF
              4CFFFFFF50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4CFFFFFFFFFFFFFF
              FFFFE0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0646464E0E0E0E0E0E0
              E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0FFFFFFFFFFFFFFFFFF50AF4C50AF4C50AF
              4C50AF4C50AF4C50AF4C50AF4CFFFFFF50AF4C50AF4C50AF4C50AF4C50AF4C50
              AF4C50AF4CFFFFFFFFFFFFFFFFFFE0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0
              E0E0E0646464E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0FFFFFFFFFF
              FFFFFFFFFFFFFF50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50
              AF4C50AF4C50AF4C50AF4C50AF4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E0
              E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0
              E0E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF50AF4C50AF4C50AF4C50AF4C50
              AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4CFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFE0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0
              E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C
              50AF4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E0E0E0E0E0E0
              E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0FFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF50AF4C50AF4C50AF4C50AF4C50AF4C
              50AF4C50AF4C50AF4C50AF4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFE0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0
              E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF50AF4C50AF4C50AF4C50AF4C50AF4CFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E0E0E0E0E0
              E0E0E0E0E0E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            NumGlyphs = 2
            OnClick = btnIncluirObservacaoClick
          end
          object btnGravarObservacao: TSpeedButton
            Left = 410
            Top = 16
            Width = 80
            Height = 25
            Caption = 'Gravar'
            Glyph.Data = {
              BE060000424DBE06000000000000360400002800000024000000120000000100
              0800000000008802000000000000000000000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
              A400000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
              0303030303030303030303030303030303030303030303030303030303030303
              03030303030303030303030303030303030303030303FF030303030303030303
              03030303030303040403030303030303030303030303030303F8F8FF03030303
              03030303030303030303040202040303030303030303030303030303F80303F8
              FF030303030303030303030303040202020204030303030303030303030303F8
              03030303F8FF0303030303030303030304020202020202040303030303030303
              0303F8030303030303F8FF030303030303030304020202FA0202020204030303
              0303030303F8FF0303F8FF030303F8FF03030303030303020202FA03FA020202
              040303030303030303F8FF03F803F8FF0303F8FF03030303030303FA02FA0303
              03FA0202020403030303030303F8FFF8030303F8FF0303F8FF03030303030303
              FA0303030303FA0202020403030303030303F80303030303F8FF0303F8FF0303
              0303030303030303030303FA0202020403030303030303030303030303F8FF03
              03F8FF03030303030303030303030303FA020202040303030303030303030303
              0303F8FF0303F8FF03030303030303030303030303FA02020204030303030303
              03030303030303F8FF0303F8FF03030303030303030303030303FA0202020403
              030303030303030303030303F8FF0303F8FF03030303030303030303030303FA
              0202040303030303030303030303030303F8FF03F8FF03030303030303030303
              03030303FA0202030303030303030303030303030303F8FFF803030303030303
              030303030303030303FA0303030303030303030303030303030303F803030303
              0303030303030303030303030303030303030303030303030303030303030303
              0303}
            NumGlyphs = 2
            OnClick = btnGravarObservacaoClick
          end
          object btnCancelarObservacao: TSpeedButton
            Left = 490
            Top = 16
            Width = 80
            Height = 25
            Caption = 'Cancelar'
            Glyph.Data = {
              BE060000424DBE06000000000000360400002800000024000000120000000100
              0800000000008802000000000000000000000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
              A400000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
              0303030303030303030303030303030303030303030303030303030303030303
              0303F8F80303030303030303030303030303030303FF03030303030303030303
              0303030303F90101F80303030303F9F80303030303030303F8F8FF0303030303
              03FF03030303030303F9010101F8030303F90101F8030303030303F8FF03F8FF
              030303FFF8F8FF030303030303F901010101F803F901010101F80303030303F8
              FF0303F8FF03FFF80303F8FF030303030303F901010101F80101010101F80303
              030303F8FF030303F8FFF803030303F8FF030303030303F90101010101010101
              F803030303030303F8FF030303F803030303FFF80303030303030303F9010101
              010101F8030303030303030303F8FF030303030303FFF8030303030303030303
              030101010101F80303030303030303030303F8FF0303030303F8030303030303
              0303030303F901010101F8030303030303030303030303F8FF030303F8030303
              0303030303030303F90101010101F8030303030303030303030303F803030303
              F8FF030303030303030303F9010101F8010101F803030303030303030303F803
              03030303F8FF0303030303030303F9010101F803F9010101F803030303030303
              03F8030303F8FF0303F8FF03030303030303F90101F8030303F9010101F80303
              03030303F8FF0303F803F8FF0303F8FF03030303030303F9010303030303F901
              0101030303030303F8FFFFF8030303F8FF0303F8FF0303030303030303030303
              030303F901F903030303030303F8F80303030303F8FFFFFFF803030303030303
              03030303030303030303030303030303030303030303030303F8F8F803030303
              0303030303030303030303030303030303030303030303030303030303030303
              0303}
            NumGlyphs = 2
            OnClick = btnCancelarObservacaoClick
          end
          object Label20: TLabel
            Left = 41
            Top = 69
            Width = 67
            Height = 16
            Caption = 'Data | Hora'
          end
          object Label29: TLabel
            Left = 234
            Top = 69
            Width = 67
            Height = 16
            Caption = 'Data | Hora'
          end
          object Panel12: TPanel
            Left = 0
            Top = 277
            Width = 611
            Height = 72
            Align = alBottom
            TabOrder = 0
            DesignSize = (
              611
              72)
            object btnFecharObservacao: TBitBtn
              Left = 246
              Top = 20
              Width = 119
              Height = 33
              Anchors = [akLeft, akBottom]
              Caption = 'Fechar'
              NumGlyphs = 2
              TabOrder = 0
              OnClick = btnFecharObservacaoClick
            end
          end
          object dbnObservacoes: TDBNavigator
            Left = 41
            Top = 16
            Width = 248
            Height = 25
            DataSource = dtmPainelAutoSC.dtsObservacoesProcesso
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Hints.Strings = (
              'Primeiro'
              'Anterior'
              'Pr'#243'ximo'
              #218'ltimo'
              'Incluir'
              ''
              ''
              'Gravar'
              'Cancelar')
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
          end
          object memObservacao: TDBMemo
            Left = 41
            Top = 155
            Width = 529
            Height = 112
            DataField = 'Observacao'
            DataSource = dtmPainelAutoSC.dtsObservacoesProcesso
            TabOrder = 3
          end
          object edtDataHoraObservacao: TDBEdit
            Left = 41
            Top = 86
            Width = 154
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Data_Hora'
            DataSource = dtmPainelAutoSC.dtsObservacoesProcesso
            ReadOnly = True
            TabOrder = 1
          end
          object edtUsuarioObservacao: TDBEdit
            Left = 234
            Top = 86
            Width = 336
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Nome_Usuario'
            DataSource = dtmPainelAutoSC.dtsObservacoesProcesso
            ReadOnly = True
            TabOrder = 2
          end
        end
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'pnlFiltrosSiags'
      ImageIndex = 6
      object pnlFiltrosSiags: TPanel
        Left = 75
        Top = 82
        Width = 625
        Height = 544
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Color = 8404992
        Padding.Left = 5
        Padding.Top = 5
        Padding.Right = 5
        Padding.Bottom = 5
        ParentBackground = False
        TabOrder = 0
        object Label30: TLabel
          AlignWithMargins = True
          Left = 10
          Top = 10
          Width = 605
          Height = 24
          Margins.Bottom = 10
          Align = alTop
          Alignment = taCenter
          Caption = 'Filtros SIAGS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -20
          Font.Name = 'Roboto'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 118
        end
        object pnlCamposFiltroSiags: TPanel
          Left = 7
          Top = 44
          Width = 611
          Height = 493
          Align = alClient
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          object Panel14: TPanel
            Left = 0
            Top = 432
            Width = 611
            Height = 61
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              611
              61)
            object btnFiltrarSiags: TBitBtn
              Left = 174
              Top = 14
              Width = 119
              Height = 33
              Anchors = [akLeft, akBottom]
              Caption = 'Filtrar'
              Glyph.Data = {
                BE060000424DBE06000000000000360400002800000024000000120000000100
                0800000000008802000000000000000000000001000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
                A400000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
                0303030303030303030303030303030303030303030303030303030303030303
                03030303030303030303030303030303030303030303FF030303030303030303
                03030303030303040403030303030303030303030303030303F8F8FF03030303
                03030303030303030303040202040303030303030303030303030303F80303F8
                FF030303030303030303030303040202020204030303030303030303030303F8
                03030303F8FF0303030303030303030304020202020202040303030303030303
                0303F8030303030303F8FF030303030303030304020202FA0202020204030303
                0303030303F8FF0303F8FF030303F8FF03030303030303020202FA03FA020202
                040303030303030303F8FF03F803F8FF0303F8FF03030303030303FA02FA0303
                03FA0202020403030303030303F8FFF8030303F8FF0303F8FF03030303030303
                FA0303030303FA0202020403030303030303F80303030303F8FF0303F8FF0303
                0303030303030303030303FA0202020403030303030303030303030303F8FF03
                03F8FF03030303030303030303030303FA020202040303030303030303030303
                0303F8FF0303F8FF03030303030303030303030303FA02020204030303030303
                03030303030303F8FF0303F8FF03030303030303030303030303FA0202020403
                030303030303030303030303F8FF0303F8FF03030303030303030303030303FA
                0202040303030303030303030303030303F8FF03F8FF03030303030303030303
                03030303FA0202030303030303030303030303030303F8FFF803030303030303
                030303030303030303FA0303030303030303030303030303030303F803030303
                0303030303030303030303030303030303030303030303030303030303030303
                0303}
              NumGlyphs = 2
              TabOrder = 0
              OnClick = btnFiltrarSiagsClick
            end
            object btnCancelarFiltroSiags: TBitBtn
              Left = 318
              Top = 14
              Width = 119
              Height = 33
              Anchors = [akLeft, akBottom]
              Caption = 'Cancelar'
              Glyph.Data = {
                BE060000424DBE06000000000000360400002800000024000000120000000100
                0800000000008802000000000000000000000001000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
                A400000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
                0303030303030303030303030303030303030303030303030303030303030303
                0303F8F80303030303030303030303030303030303FF03030303030303030303
                0303030303F90101F80303030303F9F80303030303030303F8F8FF0303030303
                03FF03030303030303F9010101F8030303F90101F8030303030303F8FF03F8FF
                030303FFF8F8FF030303030303F901010101F803F901010101F80303030303F8
                FF0303F8FF03FFF80303F8FF030303030303F901010101F80101010101F80303
                030303F8FF030303F8FFF803030303F8FF030303030303F90101010101010101
                F803030303030303F8FF030303F803030303FFF80303030303030303F9010101
                010101F8030303030303030303F8FF030303030303FFF8030303030303030303
                030101010101F80303030303030303030303F8FF0303030303F8030303030303
                0303030303F901010101F8030303030303030303030303F8FF030303F8030303
                0303030303030303F90101010101F8030303030303030303030303F803030303
                F8FF030303030303030303F9010101F8010101F803030303030303030303F803
                03030303F8FF0303030303030303F9010101F803F9010101F803030303030303
                03F8030303F8FF0303F8FF03030303030303F90101F8030303F9010101F80303
                03030303F8FF0303F803F8FF0303F8FF03030303030303F9010303030303F901
                0101030303030303F8FFFFF8030303F8FF0303F8FF0303030303030303030303
                030303F901F903030303030303F8F80303030303F8FFFFFFF803030303030303
                03030303030303030303030303030303030303030303030303F8F8F803030303
                0303030303030303030303030303030303030303030303030303030303030303
                0303}
              NumGlyphs = 2
              TabOrder = 1
              OnClick = btnCancelarFiltroSiagsClick
            end
          end
          object Panel15: TPanel
            Left = 0
            Top = 0
            Width = 611
            Height = 316
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object Label31: TLabel
              Left = 40
              Top = 20
              Width = 51
              Height = 16
              Caption = 'Auditoria'
            end
            object Label32: TLabel
              Left = 40
              Top = 255
              Width = 67
              Height = 16
              Caption = 'Prazo Caixa'
            end
            object Label39: TLabel
              Left = 328
              Top = 255
              Width = 60
              Height = 16
              Caption = 'Prazo ANS'
            end
            object Label41: TLabel
              Left = 328
              Top = 20
              Width = 15
              Height = 16
              Caption = 'UF'
            end
            object Label33: TLabel
              Left = 40
              Top = 97
              Width = 114
              Height = 16
              Caption = 'Tipo de Autoriza'#231#227'o'
            end
            object Label42: TLabel
              Left = 328
              Top = 97
              Width = 119
              Height = 16
              Caption = 'Tipo de Atendimento'
            end
            object Label43: TLabel
              Left = 40
              Top = 176
              Width = 138
              Height = 16
              Caption = 'Situa'#231#227'o da Autoriza'#231#227'o'
            end
            object Label44: TLabel
              Left = 328
              Top = 176
              Width = 93
              Height = 16
              Caption = 'Ultima Anota'#231#227'o'
            end
            object cmbAuditoriasSiags: TDBLookupComboBox
              Left = 40
              Top = 37
              Width = 239
              Height = 24
              KeyField = 'id'
              ListField = 'Tipo_Auditoria'
              ListSource = dtmPainelSiags.dtsTiposAuditoria
              TabOrder = 0
            end
            object cmbPrazosCaixaSiags: TDBLookupComboBox
              Left = 40
              Top = 273
              Width = 239
              Height = 24
              KeyField = 'id'
              ListField = 'Tipo_Prazo_Caixa'
              ListSource = dtmPainelAutoSC.dtsTiposPrazo
              TabOrder = 1
            end
            object cmbPrazosANSSiags: TDBLookupComboBox
              Left = 328
              Top = 273
              Width = 241
              Height = 24
              KeyField = 'id'
              ListField = 'Tipo_Prazo_Caixa'
              ListSource = dtmPainelAutoSC.dtsTiposPrazoANS
              TabOrder = 2
            end
            object cmbUFSiags: TDBLookupComboBox
              Left = 328
              Top = 37
              Width = 81
              Height = 24
              KeyField = 'Sigla'
              ListField = 'Sigla'
              ListSource = dtmPainelSiags.dtsUF
              TabOrder = 3
            end
            object cmbAutorizacoesSiags: TDBLookupComboBox
              Left = 40
              Top = 115
              Width = 239
              Height = 24
              KeyField = 'id'
              ListField = 'Tipo_Autorizacao'
              ListSource = dtmPainelSiags.dtsTiposAutorizacao
              TabOrder = 4
            end
            object cmbAtendimentosSiags: TDBLookupComboBox
              Left = 328
              Top = 115
              Width = 239
              Height = 24
              KeyField = 'id'
              ListField = 'Tipo_Atendimento'
              ListSource = dtmPainelSiags.dtsTiposAtendimento
              TabOrder = 5
            end
            object cmbSituacoesSiags: TDBLookupComboBox
              Left = 40
              Top = 194
              Width = 239
              Height = 24
              KeyField = 'id'
              ListField = 'Tipo_Situacao_Autorizacao'
              ListSource = dtmPainelSiags.dtsTiposSituacaoAutorizacao
              TabOrder = 6
            end
            object cmbUltimasAnotacoesSiags: TDBLookupComboBox
              Left = 328
              Top = 194
              Width = 239
              Height = 24
              KeyField = 'id'
              ListField = 'Tipo_Ultima_Anotacao'
              ListSource = dtmPainelSiags.dtsTiposUltimaAnotacao
              TabOrder = 7
            end
          end
        end
      end
    end
    object TabSheet8: TTabSheet
      Caption = 'pnlHistoricoAtualizacoesSiags'
      ImageIndex = 7
      object pnlHistoricoAtualizacoesSiags: TPanel
        Left = 69
        Top = 58
        Width = 932
        Height = 495
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Color = 8404992
        Padding.Left = 5
        Padding.Top = 5
        Padding.Right = 5
        Padding.Bottom = 5
        ParentBackground = False
        TabOrder = 0
        object lblTituloHistoricoAtualizacoesSiags: TLabel
          AlignWithMargins = True
          Left = 10
          Top = 10
          Width = 912
          Height = 24
          Margins.Bottom = 10
          Align = alTop
          Alignment = taCenter
          Caption = 'Atualiza'#231#245'es de Processo - SIAGS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -20
          Font.Name = 'Roboto'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 303
        end
        object Panel13: TPanel
          Left = 7
          Top = 44
          Width = 918
          Height = 444
          Align = alClient
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          object Label35: TLabel
            Left = 21
            Top = 56
            Width = 153
            Height = 16
            Caption = 'Data | Hora da atualiza'#231#227'o'
          end
          object Label36: TLabel
            Left = 215
            Top = 56
            Width = 71
            Height = 16
            Caption = 'Respons'#225'vel'
          end
          object Label37: TLabel
            Left = 21
            Top = 120
            Width = 114
            Height = 16
            Caption = 'Tipo de Autoriza'#231#227'o'
          end
          object Label38: TLabel
            Left = 625
            Top = 120
            Width = 138
            Height = 16
            Caption = 'Situacao da Autoriza'#231#227'o'
          end
          object Label40: TLabel
            Left = 323
            Top = 120
            Width = 119
            Height = 16
            Caption = 'Tipo de Atendimento'
          end
          object Label45: TLabel
            Left = 21
            Top = 184
            Width = 123
            Height = 16
            Caption = #218'ltima Anota'#231#227'o ADM'
          end
          object Label46: TLabel
            Left = 323
            Top = 184
            Width = 51
            Height = 16
            Caption = 'Auditoria'
          end
          object Label47: TLabel
            Left = 625
            Top = 184
            Width = 123
            Height = 16
            Caption = #218'ltima Anota'#231#227'o ADM'
          end
          object Label48: TLabel
            Left = 21
            Top = 256
            Width = 60
            Height = 16
            Caption = 'Dias Base:'
          end
          object Label49: TLabel
            Left = 89
            Top = 256
            Width = 48
            Height = 16
            Caption = 'Corridos'
          end
          object Label50: TLabel
            Left = 184
            Top = 256
            Width = 28
            Height = 16
            Caption = #218'teis'
          end
          object Label51: TLabel
            Left = 119
            Top = 327
            Width = 24
            Height = 16
            Caption = 'Dias'
          end
          object Label52: TLabel
            Left = 21
            Top = 327
            Width = 78
            Height = 16
            Caption = 'Prazos Caixa:'
          end
          object Label54: TLabel
            Left = 168
            Top = 327
            Width = 32
            Height = 16
            Caption = 'Prazo'
          end
          object Label53: TLabel
            Left = 579
            Top = 327
            Width = 24
            Height = 16
            Caption = 'Dias'
          end
          object Label55: TLabel
            Left = 494
            Top = 327
            Width = 71
            Height = 16
            Caption = 'Prazos ANS:'
          end
          object Label56: TLabel
            Left = 625
            Top = 327
            Width = 32
            Height = 16
            Caption = 'Prazo'
          end
          object Label57: TLabel
            Left = 325
            Top = 256
            Width = 46
            Height = 16
            Caption = 'Anexos:'
          end
          object Label58: TLabel
            Left = 390
            Top = 256
            Width = 33
            Height = 16
            Caption = 'OPME'
          end
          object Label59: TLabel
            Left = 467
            Top = 256
            Width = 40
            Height = 16
            Caption = 'Quimio'
          end
          object Label60: TLabel
            Left = 552
            Top = 255
            Width = 32
            Height = 16
            Caption = 'Radio'
          end
          object Panel16: TPanel
            Left = 0
            Top = 372
            Width = 918
            Height = 72
            Align = alBottom
            TabOrder = 18
            DesignSize = (
              918
              72)
            object btnFecharHistoricoSiags: TBitBtn
              Left = 399
              Top = 20
              Width = 119
              Height = 33
              Anchors = [akLeft, akBottom]
              Caption = 'Fechar'
              NumGlyphs = 2
              TabOrder = 0
              OnClick = btnFecharHistoricoSiagsClick
            end
          end
          object DBNavigator1: TDBNavigator
            Left = 327
            Top = 16
            Width = 264
            Height = 25
            DataSource = dtmPainelSiags.dtsHistoricoAtualizacoes
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Hints.Strings = (
              'Primeiro'
              'Anterior'
              'Pr'#243'ximo'
              #218'ltimo')
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
          object DBEdit1: TDBEdit
            Left = 21
            Top = 73
            Width = 154
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Data_Hora_Historico'
            DataSource = dtmPainelSiags.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 1
          end
          object DBEdit2: TDBEdit
            Left = 215
            Top = 73
            Width = 377
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Nome_Usuario'
            DataSource = dtmPainelSiags.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 2
          end
          object DBEdit3: TDBEdit
            Left = 21
            Top = 137
            Width = 269
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Tipo_Autorizacao'
            DataSource = dtmPainelSiags.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 3
          end
          object DBEdit4: TDBEdit
            Left = 625
            Top = 137
            Width = 269
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Tipo_Situacao_Autorizacao'
            DataSource = dtmPainelSiags.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 5
          end
          object DBEdit11: TDBEdit
            Left = 323
            Top = 137
            Width = 269
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Tipo_Atendimento'
            DataSource = dtmPainelSiags.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 4
          end
          object DBEdit12: TDBEdit
            Left = 21
            Top = 201
            Width = 269
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Tipo_Ultima_Anotacao'
            DataSource = dtmPainelSiags.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 6
          end
          object DBEdit13: TDBEdit
            Left = 323
            Top = 206
            Width = 269
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Tipo_Auditoria'
            DataSource = dtmPainelSiags.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 7
          end
          object DBEdit14: TDBEdit
            Left = 625
            Top = 201
            Width = 269
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Tipo_Ultima_Anotacao'
            DataSource = dtmPainelSiags.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 8
          end
          object DBEdit15: TDBEdit
            Left = 89
            Top = 273
            Width = 48
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Dias_Corridos_Base'
            DataSource = dtmPainelSiags.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 9
          end
          object DBEdit16: TDBEdit
            Left = 174
            Top = 273
            Width = 48
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Dias_Uteis_Base'
            DataSource = dtmPainelSiags.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 10
          end
          object DBEdit17: TDBEdit
            Left = 111
            Top = 344
            Width = 43
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Dias_Prazo_Caixa'
            DataSource = dtmPainelSiags.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 14
          end
          object DBEdit19: TDBEdit
            Left = 169
            Top = 344
            Width = 269
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Tipo_Prazo_Caixa'
            DataSource = dtmPainelSiags.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 15
          end
          object DBEdit18: TDBEdit
            Left = 571
            Top = 344
            Width = 43
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Dias_Prazo_ANS'
            DataSource = dtmPainelSiags.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 16
          end
          object DBEdit20: TDBEdit
            Left = 625
            Top = 344
            Width = 269
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Tipo_Prazo_ANS'
            DataSource = dtmPainelSiags.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 17
          end
          object DBEdit21: TDBEdit
            Left = 382
            Top = 273
            Width = 48
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Anexo_Opme'
            DataSource = dtmPainelSiags.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 11
          end
          object DBEdit22: TDBEdit
            Left = 463
            Top = 273
            Width = 48
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Anexo_Quimio'
            DataSource = dtmPainelSiags.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 12
          end
          object DBEdit23: TDBEdit
            Left = 544
            Top = 272
            Width = 48
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Anexo_Radio'
            DataSource = dtmPainelSiags.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 13
          end
        end
      end
    end
    object TabSheet9: TTabSheet
      Caption = 'pnlFiltrosControlPc'
      ImageIndex = 8
      object pnlFiltrosControlPc: TPanel
        Left = 367
        Top = 26
        Width = 625
        Height = 544
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Color = 8404992
        Padding.Left = 5
        Padding.Top = 5
        Padding.Right = 5
        Padding.Bottom = 5
        ParentBackground = False
        TabOrder = 0
        object Label34: TLabel
          AlignWithMargins = True
          Left = 10
          Top = 10
          Width = 605
          Height = 24
          Margins.Bottom = 10
          Align = alTop
          Alignment = taCenter
          Caption = 'Filtros CONTROLPC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -20
          Font.Name = 'Roboto'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 178
        end
        object pnlCamposFiltroControlPc: TPanel
          Left = 7
          Top = 44
          Width = 611
          Height = 493
          Align = alClient
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          object Panel18: TPanel
            Left = 0
            Top = 432
            Width = 611
            Height = 61
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              611
              61)
            object btnFiltrarControlPc: TBitBtn
              Left = 174
              Top = 14
              Width = 119
              Height = 33
              Anchors = [akLeft, akBottom]
              Caption = 'Filtrar'
              Glyph.Data = {
                BE060000424DBE06000000000000360400002800000024000000120000000100
                0800000000008802000000000000000000000001000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
                A400000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
                0303030303030303030303030303030303030303030303030303030303030303
                03030303030303030303030303030303030303030303FF030303030303030303
                03030303030303040403030303030303030303030303030303F8F8FF03030303
                03030303030303030303040202040303030303030303030303030303F80303F8
                FF030303030303030303030303040202020204030303030303030303030303F8
                03030303F8FF0303030303030303030304020202020202040303030303030303
                0303F8030303030303F8FF030303030303030304020202FA0202020204030303
                0303030303F8FF0303F8FF030303F8FF03030303030303020202FA03FA020202
                040303030303030303F8FF03F803F8FF0303F8FF03030303030303FA02FA0303
                03FA0202020403030303030303F8FFF8030303F8FF0303F8FF03030303030303
                FA0303030303FA0202020403030303030303F80303030303F8FF0303F8FF0303
                0303030303030303030303FA0202020403030303030303030303030303F8FF03
                03F8FF03030303030303030303030303FA020202040303030303030303030303
                0303F8FF0303F8FF03030303030303030303030303FA02020204030303030303
                03030303030303F8FF0303F8FF03030303030303030303030303FA0202020403
                030303030303030303030303F8FF0303F8FF03030303030303030303030303FA
                0202040303030303030303030303030303F8FF03F8FF03030303030303030303
                03030303FA0202030303030303030303030303030303F8FFF803030303030303
                030303030303030303FA0303030303030303030303030303030303F803030303
                0303030303030303030303030303030303030303030303030303030303030303
                0303}
              NumGlyphs = 2
              TabOrder = 0
              OnClick = btnFiltrarControlPcClick
            end
            object btnCancelarFiltroControlPc: TBitBtn
              Left = 318
              Top = 14
              Width = 119
              Height = 33
              Anchors = [akLeft, akBottom]
              Caption = 'Cancelar'
              Glyph.Data = {
                BE060000424DBE06000000000000360400002800000024000000120000000100
                0800000000008802000000000000000000000001000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
                A400000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
                0303030303030303030303030303030303030303030303030303030303030303
                0303F8F80303030303030303030303030303030303FF03030303030303030303
                0303030303F90101F80303030303F9F80303030303030303F8F8FF0303030303
                03FF03030303030303F9010101F8030303F90101F8030303030303F8FF03F8FF
                030303FFF8F8FF030303030303F901010101F803F901010101F80303030303F8
                FF0303F8FF03FFF80303F8FF030303030303F901010101F80101010101F80303
                030303F8FF030303F8FFF803030303F8FF030303030303F90101010101010101
                F803030303030303F8FF030303F803030303FFF80303030303030303F9010101
                010101F8030303030303030303F8FF030303030303FFF8030303030303030303
                030101010101F80303030303030303030303F8FF0303030303F8030303030303
                0303030303F901010101F8030303030303030303030303F8FF030303F8030303
                0303030303030303F90101010101F8030303030303030303030303F803030303
                F8FF030303030303030303F9010101F8010101F803030303030303030303F803
                03030303F8FF0303030303030303F9010101F803F9010101F803030303030303
                03F8030303F8FF0303F8FF03030303030303F90101F8030303F9010101F80303
                03030303F8FF0303F803F8FF0303F8FF03030303030303F9010303030303F901
                0101030303030303F8FFFFF8030303F8FF0303F8FF0303030303030303030303
                030303F901F903030303030303F8F80303030303F8FFFFFFF803030303030303
                03030303030303030303030303030303030303030303030303F8F8F803030303
                0303030303030303030303030303030303030303030303030303030303030303
                0303}
              NumGlyphs = 2
              TabOrder = 1
              OnClick = btnCancelarFiltroControlPcClick
            end
          end
          object pnlCampos: TPanel
            Left = 0
            Top = 0
            Width = 611
            Height = 316
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object Label62: TLabel
              Left = 40
              Top = 163
              Width = 32
              Height = 16
              Caption = 'Prazo'
            end
            object Label63: TLabel
              Left = 328
              Top = 163
              Width = 44
              Height = 16
              Caption = 'T'#233'cnico'
            end
            object Label66: TLabel
              Left = 40
              Top = 33
              Width = 36
              Height = 16
              Caption = 'Status'
            end
            object Label67: TLabel
              Left = 40
              Top = 98
              Width = 74
              Height = 16
              Caption = 'DT. Abertura'
            end
            object Label69: TLabel
              Left = 40
              Top = 230
              Width = 68
              Height = 16
              Caption = 'Tipo Cliente'
            end
            object Label71: TLabel
              Left = 328
              Top = 230
              Width = 78
              Height = 16
              Caption = 'Tipo Reclame'
            end
            object Label61: TLabel
              Left = 448
              Top = 230
              Width = 47
              Height = 16
              Caption = 'Tipo Nip'
            end
            object Label64: TLabel
              Left = 181
              Top = 98
              Width = 94
              Height = 16
              Caption = 'DT. Fechamento'
            end
            object Label65: TLabel
              Left = 322
              Top = 98
              Width = 103
              Height = 16
              Caption = 'DT. Transfer'#234'ncia'
            end
            object Label70: TLabel
              Left = 464
              Top = 98
              Width = 78
              Height = 16
              Caption = 'Prev. Solu'#231#227'o'
            end
            object cmbPrazos: TDBLookupComboBox
              Left = 40
              Top = 181
              Width = 239
              Height = 24
              KeyField = 'id'
              ListField = 'Tipo_Prazo_Caixa'
              ListSource = dtmPainelControlPc.dtsTiposPrazo
              TabOrder = 5
            end
            object cmbTecnicos: TDBLookupComboBox
              Left = 328
              Top = 181
              Width = 239
              Height = 24
              KeyField = 'id'
              ListField = 'Nome_Tecnico'
              ListSource = dtmPainelControlPc.dtsTecnicos
              TabOrder = 6
            end
            object cmbTiposStatusControlPc: TDBLookupComboBox
              Left = 40
              Top = 51
              Width = 239
              Height = 24
              KeyField = 'id'
              ListField = 'Tipo_Status'
              ListSource = dtmPainelControlPc.dtsTiposStatus
              TabOrder = 0
            end
            object edtDataAbertura: TMaskEdit
              Left = 40
              Top = 116
              Width = 103
              Height = 24
              EditMask = '99/99/9999'
              MaxLength = 10
              TabOrder = 1
              Text = '  /  /    '
            end
            object cmbTiposCliente: TDBLookupComboBox
              Left = 40
              Top = 247
              Width = 241
              Height = 24
              KeyField = 'id'
              ListField = 'Tipo_Cliente'
              ListSource = dtmPainelControlPc.dtsTiposCliente
              TabOrder = 7
            end
            object cmbTipoReclame: TComboBox
              Left = 330
              Top = 247
              Width = 78
              Height = 24
              TabOrder = 8
              Text = 'cmbTipoReclame'
              Items.Strings = (
                'Sim'
                'N'#227'o'
                'Todos')
            end
            object cmbTipoNip: TComboBox
              Left = 450
              Top = 247
              Width = 78
              Height = 24
              TabOrder = 9
              Text = 'cmbComboBox'
              Items.Strings = (
                'Sim'
                'N'#227'o'
                'Todos')
            end
            object edtDataFechamento: TMaskEdit
              Left = 181
              Top = 116
              Width = 103
              Height = 24
              EditMask = '99/99/9999'
              MaxLength = 10
              TabOrder = 2
              Text = '  /  /    '
            end
            object edtDataTransferencia: TMaskEdit
              Left = 322
              Top = 116
              Width = 103
              Height = 24
              EditMask = '99/99/9999'
              MaxLength = 10
              TabOrder = 3
              Text = '  /  /    '
            end
            object edtPrevisaoSolucao: TMaskEdit
              Left = 464
              Top = 116
              Width = 103
              Height = 24
              EditMask = '99/99/9999'
              MaxLength = 10
              TabOrder = 4
              Text = '  /  /    '
            end
          end
        end
      end
    end
    object TabSheet10: TTabSheet
      Caption = 'pnlHistoricoAtualizacoesControlPc'
      ImageIndex = 9
      object pnlHistoricoAtualizacoesControlPc: TPanel
        Left = 77
        Top = 34
        Width = 932
        Height = 495
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Color = 8404992
        Padding.Left = 5
        Padding.Top = 5
        Padding.Right = 5
        Padding.Bottom = 5
        ParentBackground = False
        TabOrder = 0
        object lblTituloHistoricoAtualizacoesControlPc: TLabel
          AlignWithMargins = True
          Left = 10
          Top = 10
          Width = 912
          Height = 24
          Margins.Bottom = 10
          Align = alTop
          Alignment = taCenter
          Caption = 'Atualiza'#231#245'es de Processo - CONTROLPC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -20
          Font.Name = 'Roboto'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 363
        end
        object Panel19: TPanel
          Left = 7
          Top = 44
          Width = 918
          Height = 444
          Align = alClient
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          object Label72: TLabel
            Left = 21
            Top = 56
            Width = 153
            Height = 16
            Caption = 'Data | Hora da atualiza'#231#227'o'
          end
          object Label73: TLabel
            Left = 215
            Top = 56
            Width = 71
            Height = 16
            Caption = 'Respons'#225'vel'
          end
          object Label74: TLabel
            Left = 21
            Top = 120
            Width = 114
            Height = 16
            Caption = 'Tipo de Autoriza'#231#227'o'
          end
          object Label75: TLabel
            Left = 625
            Top = 120
            Width = 138
            Height = 16
            Caption = 'Situacao da Autoriza'#231#227'o'
          end
          object Label76: TLabel
            Left = 323
            Top = 120
            Width = 119
            Height = 16
            Caption = 'Tipo de Atendimento'
          end
          object Label77: TLabel
            Left = 21
            Top = 184
            Width = 123
            Height = 16
            Caption = #218'ltima Anota'#231#227'o ADM'
          end
          object Label78: TLabel
            Left = 323
            Top = 184
            Width = 51
            Height = 16
            Caption = 'Auditoria'
          end
          object Label79: TLabel
            Left = 625
            Top = 184
            Width = 123
            Height = 16
            Caption = #218'ltima Anota'#231#227'o ADM'
          end
          object Label80: TLabel
            Left = 21
            Top = 256
            Width = 60
            Height = 16
            Caption = 'Dias Base:'
          end
          object Label81: TLabel
            Left = 89
            Top = 256
            Width = 48
            Height = 16
            Caption = 'Corridos'
          end
          object Label82: TLabel
            Left = 184
            Top = 256
            Width = 28
            Height = 16
            Caption = #218'teis'
          end
          object Label83: TLabel
            Left = 119
            Top = 327
            Width = 24
            Height = 16
            Caption = 'Dias'
          end
          object Label84: TLabel
            Left = 21
            Top = 327
            Width = 78
            Height = 16
            Caption = 'Prazos Caixa:'
          end
          object Label85: TLabel
            Left = 168
            Top = 327
            Width = 32
            Height = 16
            Caption = 'Prazo'
          end
          object Label86: TLabel
            Left = 579
            Top = 327
            Width = 24
            Height = 16
            Caption = 'Dias'
          end
          object Label87: TLabel
            Left = 494
            Top = 327
            Width = 71
            Height = 16
            Caption = 'Prazos ANS:'
          end
          object Label88: TLabel
            Left = 625
            Top = 327
            Width = 32
            Height = 16
            Caption = 'Prazo'
          end
          object Label89: TLabel
            Left = 325
            Top = 256
            Width = 46
            Height = 16
            Caption = 'Anexos:'
          end
          object Label90: TLabel
            Left = 390
            Top = 256
            Width = 33
            Height = 16
            Caption = 'OPME'
          end
          object Label91: TLabel
            Left = 467
            Top = 256
            Width = 40
            Height = 16
            Caption = 'Quimio'
          end
          object Label92: TLabel
            Left = 552
            Top = 255
            Width = 32
            Height = 16
            Caption = 'Radio'
          end
          object Panel20: TPanel
            Left = 0
            Top = 372
            Width = 918
            Height = 72
            Align = alBottom
            TabOrder = 18
            DesignSize = (
              918
              72)
            object btnFechraHistoricoControlPc: TBitBtn
              Left = 399
              Top = 20
              Width = 119
              Height = 33
              Anchors = [akLeft, akBottom]
              Caption = 'Fechar'
              NumGlyphs = 2
              TabOrder = 0
              OnClick = btnFecharHistoricoSiagsClick
            end
          end
          object dbnControlPc: TDBNavigator
            Left = 327
            Top = 16
            Width = 264
            Height = 25
            DataSource = dtmPainelSiags.dtsHistoricoAtualizacoes
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Hints.Strings = (
              'Primeiro'
              'Anterior'
              'Pr'#243'ximo'
              #218'ltimo')
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
          object DBEdit24: TDBEdit
            Left = 21
            Top = 73
            Width = 154
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Data_Hora_Historico'
            DataSource = dtmPainelSiags.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 1
          end
          object DBEdit25: TDBEdit
            Left = 215
            Top = 73
            Width = 377
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Nome_Usuario'
            DataSource = dtmPainelSiags.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 2
          end
          object DBEdit26: TDBEdit
            Left = 21
            Top = 137
            Width = 269
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Tipo_Autorizacao'
            DataSource = dtmPainelSiags.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 3
          end
          object DBEdit27: TDBEdit
            Left = 625
            Top = 137
            Width = 269
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Tipo_Situacao_Autorizacao'
            DataSource = dtmPainelSiags.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 5
          end
          object DBEdit28: TDBEdit
            Left = 323
            Top = 137
            Width = 269
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Tipo_Atendimento'
            DataSource = dtmPainelSiags.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 4
          end
          object DBEdit29: TDBEdit
            Left = 21
            Top = 201
            Width = 269
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Tipo_Ultima_Anotacao'
            DataSource = dtmPainelSiags.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 6
          end
          object DBEdit30: TDBEdit
            Left = 323
            Top = 206
            Width = 269
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Tipo_Auditoria'
            DataSource = dtmPainelSiags.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 7
          end
          object DBEdit31: TDBEdit
            Left = 625
            Top = 201
            Width = 269
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Tipo_Ultima_Anotacao'
            DataSource = dtmPainelSiags.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 8
          end
          object DBEdit32: TDBEdit
            Left = 89
            Top = 273
            Width = 48
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Dias_Corridos_Base'
            DataSource = dtmPainelSiags.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 9
          end
          object DBEdit33: TDBEdit
            Left = 174
            Top = 273
            Width = 48
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Dias_Uteis_Base'
            DataSource = dtmPainelSiags.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 10
          end
          object DBEdit34: TDBEdit
            Left = 111
            Top = 344
            Width = 43
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Dias_Prazo_Caixa'
            DataSource = dtmPainelSiags.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 14
          end
          object DBEdit35: TDBEdit
            Left = 169
            Top = 344
            Width = 269
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Tipo_Prazo_Caixa'
            DataSource = dtmPainelSiags.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 15
          end
          object DBEdit36: TDBEdit
            Left = 571
            Top = 344
            Width = 43
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Dias_Prazo_ANS'
            DataSource = dtmPainelSiags.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 16
          end
          object DBEdit37: TDBEdit
            Left = 625
            Top = 344
            Width = 269
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Tipo_Prazo_ANS'
            DataSource = dtmPainelSiags.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 17
          end
          object DBEdit38: TDBEdit
            Left = 382
            Top = 273
            Width = 48
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Anexo_Opme'
            DataSource = dtmPainelSiags.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 11
          end
          object DBEdit39: TDBEdit
            Left = 463
            Top = 273
            Width = 48
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Anexo_Quimio'
            DataSource = dtmPainelSiags.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 12
          end
          object DBEdit40: TDBEdit
            Left = 544
            Top = 272
            Width = 48
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'Anexo_Radio'
            DataSource = dtmPainelSiags.dtsHistoricoAtualizacoes
            ReadOnly = True
            TabOrder = 13
          end
        end
      end
    end
  end
  object ppmAutoSc: TPopupMenu
    Left = 1128
    Top = 208
    object Designar1: TMenuItem
      Caption = 'Designar'
      OnClick = btnDesignarClick
    end
    object Encerrar1: TMenuItem
      Caption = 'Encerrar'
      OnClick = btnHistoricoDesignacoesClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object VerHistricodedesignaes1: TMenuItem
      Caption = 'Ver Hist'#243'rico de designa'#231#245'es'
    end
    object VerHistricodealteraes1: TMenuItem
      Caption = 'Ver Hist'#243'rico de altera'#231#245'es'
    end
  end
end
