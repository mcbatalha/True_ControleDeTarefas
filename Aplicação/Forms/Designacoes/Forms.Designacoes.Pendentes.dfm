object frmDesignacoesPendentes: TfrmDesignacoesPendentes
  Left = 0
  Top = 0
  Caption = 'Designa'#231#245'es Pendentes'
  ClientHeight = 700
  ClientWidth = 1183
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PrintScale = poNone
  Scaled = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object pnlForm: TPanel
    Left = 0
    Top = 0
    Width = 1183
    Height = 700
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
      Width = 1169
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      Color = 16772846
      ParentBackground = False
      TabOrder = 0
      object btnResponder: TSpeedButton
        AlignWithMargins = True
        Left = 105
        Top = 3
        Width = 176
        Height = 35
        Margins.Left = 5
        Margins.Right = 0
        Align = alLeft
        Caption = 'Responder Solicita'#231#227'o'
        Flat = True
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
        Visible = False
        OnClick = btnResponderClick
      end
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
      object pnlSair: TPanel
        Left = 1032
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
      Width = 1169
      Height = 645
      ActivePage = tbsSiags
      Align = alClient
      TabHeight = 45
      TabOrder = 1
      TabWidth = 250
      OnChange = pgcPaineisChange
      object tbsAutoSC: TTabSheet
        Caption = 'AUTOSC'
        ImageIndex = 2
        object pnlGridAutoSC: TPanel
          Left = 0
          Top = 0
          Width = 1161
          Height = 590
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object dbgAutoSC: TwwDBGrid
            AlignWithMargins = True
            Left = 5
            Top = 37
            Width = 1151
            Height = 548
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
            FooterHeight = 20
            PaintOptions.AlternatingRowColor = 16053492
          end
          object pnlTituloAutoSC: TPanel
            Left = 2
            Top = 2
            Width = 1157
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
          Width = 1161
          Height = 590
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object dbgSiags: TwwDBGrid
            AlignWithMargins = True
            Left = 5
            Top = 37
            Width = 1151
            Height = 548
            Margins.Top = 0
            ControlType.Strings = (
              'Codigo_Produto;CustomEdit;ExpB_Produto;F'
              'Selecionado;CheckBox;1;0'
              'Prioridade;CustomEdit;Cb_Prioridade;F')
            Selected.Strings = (
              'Numero_Autorizacao'#9'15'#9'N'#250'mero~da Autoriza'#231#227'o'#9'F'
              'Data_Solicitacao'#9'20'#9'Data da~Solicita'#231#227'o'#9'F'
              'Usuario_Solicitante'#9'50'#9'Solicitante'#9'F'
              'Setor_Atual'#9'50'#9'Designado Atual'#9'F'#9'Setor'
              'Setor_Solicitado'#9'50'#9'Designar para'#9'F'#9'Setor'
              'Usuario_Atual'#9'50'#9'Designado Atual'#9'F'#9'Usu'#225'rio'
              'Usuario_Solicitado'#9'50'#9'Designar para'#9'F'#9'Usu'#225'rio'
              'Status_True'#9'30'#9'Status True'#9'F'
              'Justificativa'#9'50'#9'Justificativa'#9'F')
            IniAttributes.Delimiter = ';;'
            IniAttributes.UnicodeIniFile = False
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dtmDesignacoesPendentesSiags.dtsPainel
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Roboto'
            Font.Style = []
            KeyOptions = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFooter3DCells]
            ParentFont = False
            ReadOnly = True
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
            FooterHeight = 20
            PaintOptions.AlternatingRowColor = 16053492
            ExplicitLeft = 2
          end
          object pnlTituloSiags: TPanel
            Left = 2
            Top = 2
            Width = 1157
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
          Width = 1161
          Height = 590
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object dbgControlPc: TwwDBGrid
            AlignWithMargins = True
            Left = 5
            Top = 37
            Width = 1151
            Height = 548
            Margins.Top = 0
            ControlType.Strings = (
              'Codigo_Produto;CustomEdit;ExpB_Produto;F'
              'Selecionado;CheckBox;1;0'
              'Prioridade;CustomEdit;Cb_Prioridade;F')
            Selected.Strings = (
              'Protocolo'#9'25'#9'N'#186' do Protocolo'#9'F'
              'Data_Solicitacao'#9'20'#9'Data da~Solicita'#231#227'o'#9'F'
              'Usuario_Solicitante'#9'50'#9'Solicitante'#9'F'
              'Setor_Atual'#9'50'#9'Designado Atual'#9'F'#9'Setor'
              'Setor_Solicitado'#9'50'#9'Designar para'#9'F'#9'Setor'
              'Usuario_Atual'#9'50'#9'Designado Atual'#9'F'#9'Usu'#225'rio'
              'Usuario_Solicitado'#9'50'#9'Designar para'#9'F'#9'Usu'#225'rio'
              'Status_True'#9'30'#9'Status True'#9'F'
              'Justificativa'#9'50'#9'Justificativa'#9'F')
            IniAttributes.Delimiter = ';;'
            IniAttributes.UnicodeIniFile = False
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
            Align = alClient
            DataSource = dtmDesignacoesPendentesControlPC.dtsPainel
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Roboto'
            Font.Style = []
            KeyOptions = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFooter3DCells]
            ParentFont = False
            ReadOnly = True
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
            OnDblClick = dbgControlPcDblClick
            FooterHeight = 20
            PaintOptions.AlternatingRowColor = 16053492
          end
          object pnlTituloControlPc: TPanel
            Left = 2
            Top = 2
            Width = 1157
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
  object PageControl1: TPageControl
    Left = 192
    Top = 75
    Width = 931
    Height = 625
    ActivePage = TabSheet2
    TabOrder = 1
    Visible = False
    object TabSheet1: TTabSheet
      Caption = 'pnlJustificativaDesignacao'
      object pnlJustificativaDesignacao: TPanel
        Left = 90
        Top = 106
        Width = 671
        Height = 394
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Color = 8404992
        Padding.Left = 5
        Padding.Top = 5
        Padding.Right = 5
        Padding.Bottom = 5
        ParentBackground = False
        TabOrder = 0
        object lblTituloNumero: TLabel
          AlignWithMargins = True
          Left = 10
          Top = 47
          Width = 651
          Height = 24
          Margins.Bottom = 10
          Align = alTop
          Alignment = taCenter
          Caption = 'Protocolo - 31292420250211041530'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -20
          Font.Name = 'Roboto'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 325
        end
        object lblTituloJustificativa: TLabel
          AlignWithMargins = True
          Left = 10
          Top = 10
          Width = 651
          Height = 24
          Margins.Bottom = 10
          Align = alTop
          Alignment = taCenter
          Caption = 'Justificativa para Solicita'#231#227'o de Designa'#231#227'o - CONTROLPC '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -20
          Font.Name = 'Roboto'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 534
        end
        object Panel19: TPanel
          Left = 7
          Top = 81
          Width = 657
          Height = 306
          Align = alClient
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          object Panel20: TPanel
            Left = 0
            Top = 256
            Width = 657
            Height = 50
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              657
              50)
            object btnFechraJustificativa: TBitBtn
              Left = 269
              Top = 8
              Width = 119
              Height = 33
              Anchors = [akLeft, akBottom]
              Caption = 'Fechar'
              NumGlyphs = 2
              TabOrder = 0
              OnClick = btnFechraJustificativaClick
            end
          end
          object memJustificativa: TDBMemo
            AlignWithMargins = True
            Left = 20
            Top = 20
            Width = 617
            Height = 226
            Margins.Left = 20
            Margins.Top = 20
            Margins.Right = 20
            Margins.Bottom = 10
            Align = alClient
            Color = clBtnFace
            DataField = 'Justificativa'
            ReadOnly = True
            TabOrder = 1
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'pnlAutorizarDesignacao'
      ImageIndex = 1
      object pnlAutorizarDesignacao: TPanel
        Left = 106
        Top = 18
        Width = 671
        Height = 543
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Color = 8404992
        Padding.Left = 5
        Padding.Top = 5
        Padding.Right = 5
        Padding.Bottom = 5
        ParentBackground = False
        TabOrder = 0
        object lblTituloSolicitacaoDesignacao: TLabel
          AlignWithMargins = True
          Left = 10
          Top = 10
          Width = 651
          Height = 24
          Margins.Bottom = 10
          Align = alTop
          Alignment = taCenter
          Caption = 'Autorizar Designa'#231#227'o  - CONTROLPC '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -20
          Font.Name = 'Roboto'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 337
        end
        object lblTituloSolicitacaoNumero: TLabel
          AlignWithMargins = True
          Left = 10
          Top = 47
          Width = 651
          Height = 24
          Margins.Bottom = 10
          Align = alTop
          Alignment = taCenter
          Caption = 'Protocolo - 31292420250211041530'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -20
          Font.Name = 'Roboto'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 325
        end
        object Panel2: TPanel
          Left = 7
          Top = 81
          Width = 657
          Height = 455
          Align = alClient
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          object Label3: TLabel
            Left = 22
            Top = 216
            Width = 69
            Height = 16
            Caption = 'Status Atual'
          end
          object Label4: TLabel
            Left = 22
            Top = 23
            Width = 59
            Height = 16
            Caption = 'Solicitante'
          end
          object Label5: TLabel
            Left = 440
            Top = 23
            Width = 109
            Height = 16
            Caption = 'Data da Solicita'#231#227'o'
          end
          object Label6: TLabel
            Left = 22
            Top = 87
            Width = 84
            Height = 16
            Caption = 'Desigado atual'
          end
          object Label7: TLabel
            Left = 339
            Top = 87
            Width = 80
            Height = 16
            Caption = 'Designar para'
          end
          object Label8: TLabel
            Left = 22
            Top = 151
            Width = 63
            Height = 16
            Caption = 'Setor atual'
          end
          object Label9: TLabel
            Left = 339
            Top = 151
            Width = 80
            Height = 16
            Caption = 'Designar para'
          end
          object Label10: TLabel
            Left = 22
            Top = 280
            Width = 174
            Height = 16
            Caption = 'Justificativa para a designa'#231#227'o'
          end
          object Panel3: TPanel
            Left = 0
            Top = 405
            Width = 657
            Height = 50
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 8
            DesignSize = (
              657
              50)
            object btnNegarDesigacao: TBitBtn
              Left = 269
              Top = 8
              Width = 119
              Height = 33
              Anchors = [akLeft, akBottom]
              Caption = 'Negar'
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
              OnClick = btnNegarDesigacaoClick
            end
            object btnCancelarDesingacao: TBitBtn
              Left = 405
              Top = 8
              Width = 119
              Height = 33
              Anchors = [akLeft, akBottom]
              Caption = 'Cancelar'
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000130B0000130B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333FFFFF3333333333AAAAA3333333333F77777FFF333333AAAAAAAAA
                3333333777333777FF3333AAA37C73AAA33333773337F3777FF33AAA33CCC33A
                AA33377333777F3377F33AA3337C7333AA3337733337333337FFAA3333333333
                3AA377F33333F333377FAA33333C33333AA377F33337FF333373AA33337C7333
                333377F333777F333333AA33331C1333333377F333777F3FFFFFAA3333CCC3AA
                AAA377FF33777F77777F3AA333CCC33AAAA3373FF3777F37777F3AAA33CCC333
                AAA33773FF777F3F777F33AAA37C73AAAAA333773F373F77777F333AAAAAAAAA
                33A3333777333777337333333AAAAA3333333333377777333333}
              NumGlyphs = 2
              TabOrder = 2
              OnClick = btnCancelarDesingacaoClick
            end
            object btnAutorizarDesignacao: TBitBtn
              Left = 133
              Top = 8
              Width = 119
              Height = 33
              Anchors = [akLeft, akBottom]
              Caption = 'Autorizar'
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
              OnClick = btnAutorizarDesignacaoClick
            end
          end
          object edtStatusAtual: TDBEdit
            Left = 22
            Top = 233
            Width = 441
            Height = 24
            Color = clBtnFace
            DataField = 'Status_True'
            DataSource = dtmDesignacoesPendentesControlPC.dtsPainel
            ReadOnly = True
            TabOrder = 6
          end
          object edtUsuarioSolicitante: TDBEdit
            Left = 22
            Top = 40
            Width = 348
            Height = 24
            Color = clBtnFace
            DataField = 'Usuario_Solicitante'
            DataSource = dtmDesignacoesPendentesControlPC.dtsPainel
            ReadOnly = True
            TabOrder = 0
          end
          object edtDataSolicitacao: TDBEdit
            Left = 440
            Top = 40
            Width = 121
            Height = 24
            Color = clBtnFace
            DataField = 'Data_Solicitacao'
            DataSource = dtmDesignacoesPendentesControlPC.dtsPainel
            ReadOnly = True
            TabOrder = 1
          end
          object edtUsuarioAtual: TDBEdit
            Left = 22
            Top = 104
            Width = 297
            Height = 24
            Color = clBtnFace
            DataField = 'Usuario_Atual'
            DataSource = dtmDesignacoesPendentesControlPC.dtsPainel
            ReadOnly = True
            TabOrder = 2
          end
          object edtUsuarioSolicitado: TDBEdit
            Left = 339
            Top = 104
            Width = 297
            Height = 24
            Color = clBtnFace
            DataField = 'Usuario_Solicitado'
            DataSource = dtmDesignacoesPendentesControlPC.dtsPainel
            ReadOnly = True
            TabOrder = 3
          end
          object edtSetorAtual: TDBEdit
            Left = 22
            Top = 169
            Width = 297
            Height = 24
            Color = clBtnFace
            DataField = 'Setor_Atual'
            DataSource = dtmDesignacoesPendentesControlPC.dtsPainel
            ReadOnly = True
            TabOrder = 4
          end
          object edtSetorSolicitado: TDBEdit
            Left = 339
            Top = 169
            Width = 297
            Height = 24
            Color = clBtnFace
            DataField = 'Setor_Solicitado'
            DataSource = dtmDesignacoesPendentesControlPC.dtsPainel
            ReadOnly = True
            TabOrder = 5
          end
          object memJustificativaSolicitacao: TDBMemo
            Left = 22
            Top = 298
            Width = 441
            Height = 71
            Color = clBtnFace
            DataField = 'Justificativa'
            DataSource = dtmDesignacoesPendentesControlPC.dtsPainel
            ReadOnly = True
            TabOrder = 7
          end
        end
      end
    end
  end
end
