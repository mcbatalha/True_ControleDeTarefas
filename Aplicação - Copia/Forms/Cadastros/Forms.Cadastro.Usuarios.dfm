inherited frmCadastroUsuarios: TfrmCadastroUsuarios
  Caption = 'frmCadastroUsuarios'
  OnDestroy = FormDestroy
  PixelsPerInch = 120
  TextHeight = 16
  inherited pnlForm: TPanel
    inherited fraBotoes: TfraBotoes
      inherited btnNovo: TSpeedButton
        Left = -2
        Top = 0
        ExplicitLeft = -2
        ExplicitTop = 0
      end
      inherited btnExcluir: TSpeedButton
        OnClick = fraBotoesbtnExcluirClick
      end
      inherited btnSair: TSpeedButton
        Left = 356
        Top = 0
        ExplicitLeft = 356
        ExplicitTop = 0
      end
      inherited btnPesquisar: TSpeedButton
        OnClick = fraBotoesbtnPesquisarClick
      end
    end
    inherited pnlCentral: TPanel
      object pgcUsuarios: TPageControl
        Left = 2
        Top = 2
        Width = 816
        Height = 394
        ActivePage = tbsDadosUsuario
        Align = alClient
        TabHeight = 35
        TabOrder = 0
        TabWidth = 200
        object tbsDadosUsuario: TTabSheet
          Caption = 'Dados do Usu'#225'rio'
          object pnlDados: TPanel
            Left = 0
            Top = 0
            Width = 808
            Height = 349
            Align = alClient
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Color = clWhite
            ParentBackground = False
            TabOrder = 0
            object Label1: TLabel
              Left = 32
              Top = 40
              Width = 97
              Height = 16
              Caption = 'Nome do usu'#225'rio'
            end
            object Label2: TLabel
              Left = 464
              Top = 40
              Width = 30
              Height = 16
              Caption = 'Login'
            end
            object Label3: TLabel
              Left = 32
              Top = 111
              Width = 35
              Height = 16
              Caption = 'E-Mail'
            end
            object Label6: TLabel
              Left = 464
              Top = 111
              Width = 29
              Height = 16
              Caption = 'Perfil'
            end
            object dbeNome: TDBEdit
              Left = 32
              Top = 58
              Width = 377
              Height = 24
              DataField = 'Nome_Usuario'
              DataSource = dtsCadastro
              TabOrder = 0
            end
            object DBEdit1: TDBEdit
              Left = 464
              Top = 58
              Width = 161
              Height = 24
              CharCase = ecUpperCase
              DataField = 'Login'
              DataSource = dtsCadastro
              TabOrder = 1
            end
            object DBEdit2: TDBEdit
              Left = 32
              Top = 129
              Width = 377
              Height = 24
              DataField = 'E_Mail'
              DataSource = dtsCadastro
              TabOrder = 2
            end
            object chbForcarTrocaSenha: TDBCheckBox
              Left = 32
              Top = 224
              Width = 329
              Height = 17
              Caption = 'For'#231'ar o usu'#225'rio a alterar a senha no pr'#243'ximo login'
              DataField = 'Trocar_Senha'
              DataSource = dtsCadastro
              TabOrder = 4
              ValueChecked = 'Sim'
              ValueUnchecked = 'N'#227'o'
            end
            object chbLimparSenha: TCheckBox
              Left = 32
              Top = 179
              Width = 318
              Height = 17
              Caption = 'Limpar senha do usu'#225'rio'
              TabOrder = 5
              OnClick = chbLimparSenhaClick
            end
            object cmbPerfil: TDBComboBox
              Left = 464
              Top = 129
              Width = 145
              Height = 24
              Style = csOwnerDrawFixed
              DataField = 'Perfil'
              DataSource = dtsCadastro
              ItemHeight = 18
              Items.Strings = (
                'Usuario'
                'Supervisor'
                'Gerente')
              TabOrder = 3
            end
          end
        end
        object tbsSetores: TTabSheet
          Caption = 'Setores Associados'
          ImageIndex = 1
          object pnlSetores: TPanel
            Left = 0
            Top = 0
            Width = 808
            Height = 349
            Align = alClient
            Color = clWhite
            ParentBackground = False
            TabOrder = 0
            object Label4: TLabel
              Left = 46
              Top = 26
              Width = 119
              Height = 16
              Caption = 'Setores Cadastrados'
            end
            object Label5: TLabel
              Left = 435
              Top = 26
              Width = 176
              Height = 16
              Caption = 'Setores Associados ao Usu'#225'rio'
            end
            object btnAssociarSetor: TBitBtn
              Left = 389
              Top = 130
              Width = 30
              Height = 25
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333333333333333333333333333333333333333333333333333
                3333333333333333333333333333333333333333333FF3333333333333003333
                3333333333773FF3333333333309003333333333337F773FF333333333099900
                33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
                99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
                33333333337F3F77333333333309003333333333337F77333333333333003333
                3333333333773333333333333333333333333333333333333333333333333333
                3333333333333333333333333333333333333333333333333333}
              NumGlyphs = 2
              ParentDoubleBuffered = True
              TabOrder = 0
              OnClick = btnAssociarSetorClick
            end
            object btnDesassociarSetor: TBitBtn
              Left = 389
              Top = 194
              Width = 30
              Height = 25
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333333333333333333333333333333333333333333333333333
                3333333333333FF3333333333333003333333333333F77F33333333333009033
                333333333F7737F333333333009990333333333F773337FFFFFF330099999000
                00003F773333377777770099999999999990773FF33333FFFFF7330099999000
                000033773FF33777777733330099903333333333773FF7F33333333333009033
                33333333337737F3333333333333003333333333333377333333333333333333
                3333333333333333333333333333333333333333333333333333333333333333
                3333333333333333333333333333333333333333333333333333}
              NumGlyphs = 2
              ParentDoubleBuffered = True
              TabOrder = 1
              OnClick = btnDesassociarSetorClick
            end
            object lsbSetoresCadastrados: TDBLookupListBox
              Left = 46
              Top = 45
              Width = 327
              Height = 260
              KeyField = 'id'
              ListField = 'Nome_Setor'
              ListSource = dtsSetores
              TabOrder = 2
            end
            object lsbSetoresAssociados: TDBLookupListBox
              Left = 435
              Top = 45
              Width = 327
              Height = 260
              KeyField = 'id_Setor'
              ListField = 'Nome_Setor'
              ListSource = dtsUsuarioSetores
              TabOrder = 3
              OnDblClick = lsbSetoresAssociadosDblClick
            end
          end
        end
      end
    end
  end
  inherited dtsCadastro: TDataSource
    DataSet = dtmCadastroUsusarios.cdsCadastro
    Left = 544
    Top = 32
  end
  object dtsSetores: TDataSource
    DataSet = dtmCadastroUsusarios.cdsSetores
    Left = 664
    Top = 32
  end
  object dtsUsuarioSetores: TDataSource
    DataSet = dtmCadastroUsusarios.cdsUsuarioSetores
    Left = 760
    Top = 32
  end
end
