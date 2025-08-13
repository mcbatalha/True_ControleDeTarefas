inherited frmSeguranca: TfrmSeguranca
  Caption = 'Seguran'#231'a do Sistema'
  ClientHeight = 551
  ClientWidth = 942
  OnDestroy = FormDestroy
  ExplicitWidth = 960
  ExplicitHeight = 598
  PixelsPerInch = 120
  TextHeight = 16
  inherited pnlForm: TPanel
    Width = 932
    Height = 541
    ExplicitWidth = 932
    ExplicitHeight = 541
    inherited pnlBotoes: TPanel
      Width = 928
      ExplicitWidth = 928
      inherited btnCancelar: TSpeedButton
        OnClick = btnCancelarClick
      end
      inherited btnConfirmar: TSpeedButton
        OnClick = btnConfirmarClick
        ExplicitLeft = 605
        ExplicitTop = 0
      end
      inherited pnlSair: TPanel
        Left = 791
        ExplicitLeft = 791
      end
    end
    object pgcSeguranca: TPageControl
      AlignWithMargins = True
      Left = 5
      Top = 111
      Width = 922
      Height = 425
      ActivePage = tbsPaineis
      Align = alClient
      TabOrder = 1
      TabWidth = 150
      OnChange = pgcSegurancaChange
      object tbsCadastro: TTabSheet
        Caption = 'Cadastros'
        object pnlCadastros: TPanel
          Left = 0
          Top = 0
          Width = 914
          Height = 394
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object chbMenuCadastros: TCheckBox
            Left = 55
            Top = 55
            Width = 192
            Height = 17
            Caption = 'Acesso ao Menu Cadastros'
            TabOrder = 0
            OnClick = chbMenuCadastrosClick
          end
          object chbCadastroSetores: TCheckBox
            Left = 80
            Top = 85
            Width = 192
            Height = 17
            Caption = 'Setores'
            TabOrder = 1
          end
          object chbCadastroUsuarios: TCheckBox
            Left = 80
            Top = 115
            Width = 192
            Height = 17
            Caption = 'Usu'#225'rios'
            TabOrder = 2
          end
          object chbCadastroStatusTrue: TCheckBox
            Left = 80
            Top = 145
            Width = 192
            Height = 17
            Caption = 'Status True'
            TabOrder = 3
          end
        end
      end
      object tbsImportacoes: TTabSheet
        Caption = 'Importa'#231#227'o de Planilhas'
        ImageIndex = 2
        object pnlImportacaoPlanihas: TPanel
          Left = 0
          Top = 0
          Width = 914
          Height = 394
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object chbMenuImportacoes: TCheckBox
            Left = 55
            Top = 55
            Width = 288
            Height = 17
            Caption = 'Acesso ao Menu Importa'#231#227'o de Planilhas'
            TabOrder = 0
            OnClick = chbMenuImportacoesClick
          end
          object chbImportacaoAutoSC: TCheckBox
            Left = 80
            Top = 85
            Width = 192
            Height = 17
            Caption = 'AUTOSC'
            TabOrder = 1
          end
          object chbImportacaoSiags: TCheckBox
            Left = 80
            Top = 115
            Width = 192
            Height = 17
            Caption = 'SIAGS'
            TabOrder = 2
          end
          object chbImportacaoControlPc: TCheckBox
            Left = 80
            Top = 145
            Width = 192
            Height = 17
            Caption = 'CONTROPC'
            TabOrder = 3
          end
        end
      end
      object tbsPaineis: TTabSheet
        Caption = 'Paineis'
        ImageIndex = 3
        object pnlPaineis: TPanel
          Left = 0
          Top = 0
          Width = 914
          Height = 394
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object chbMenuPaineis: TCheckBox
            Left = 55
            Top = 55
            Width = 260
            Height = 17
            Caption = 'Acesso ao Menu Paineis'
            TabOrder = 0
            OnClick = chbMenuPaineisClick
          end
          object chbPaineisAcompanhamento: TCheckBox
            Left = 80
            Top = 85
            Width = 192
            Height = 17
            Caption = 'Paineis de Acompanhamento'
            TabOrder = 1
          end
          object chbQuadroResumo: TCheckBox
            Left = 80
            Top = 145
            Width = 192
            Height = 17
            Caption = 'Quadro Resumo'
            TabOrder = 3
          end
          object chbPaineisDesigancoesPendentes: TCheckBox
            Left = 80
            Top = 115
            Width = 297
            Height = 17
            Caption = 'Designa'#231#245'es Pendentes de Autoriza'#231#227'o'
            TabOrder = 2
          end
        end
      end
      object tbsExportacaoDados: TTabSheet
        Caption = 'Exporta'#231#227'o de Dados'
        ImageIndex = 5
        object pnlExportacoes: TPanel
          Left = 0
          Top = 0
          Width = 914
          Height = 394
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object chbMenuExportacoes: TCheckBox
            Left = 55
            Top = 55
            Width = 288
            Height = 17
            Caption = 'Acesso ao Menu Exporta'#231#227'o de Dados'
            TabOrder = 0
            OnClick = chbMenuExportacoesClick
          end
          object chbExportacaoAutoSc: TCheckBox
            Left = 80
            Top = 86
            Width = 192
            Height = 17
            Caption = 'AUTOSC - Processos Ativos'
            TabOrder = 1
          end
          object chbExportacaoSiags: TCheckBox
            Left = 80
            Top = 117
            Width = 192
            Height = 17
            Caption = 'SIAGS - Autoriza'#231#245'es Ativas'
            TabOrder = 2
          end
          object chbExportacaoControlPc: TCheckBox
            Left = 80
            Top = 148
            Width = 220
            Height = 17
            Caption = 'CONTROPC - Protocolos Ativos'
            TabOrder = 3
          end
          object chbExportacaoSetores: TCheckBox
            Left = 80
            Top = 179
            Width = 220
            Height = 17
            Caption = 'Setores Cadastrados'
            TabOrder = 4
          end
          object chbExportacaoUsuarios: TCheckBox
            Left = 80
            Top = 210
            Width = 220
            Height = 17
            Caption = 'Usu'#225'rios Cadastrados'
            TabOrder = 5
          end
        end
      end
      object tbsRelatorios: TTabSheet
        Caption = 'Relat'#243'rios'
        ImageIndex = 4
        object pnlRelatorios: TPanel
          Left = 0
          Top = 0
          Width = 914
          Height = 394
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object chbMenuRelatorios: TCheckBox
            Left = 55
            Top = 55
            Width = 260
            Height = 17
            Caption = 'Acesso ao Menu Relat'#243'rios'
            TabOrder = 0
            OnClick = chbMenuRelatoriosClick
          end
          object chbRelatorioDesignacoes: TCheckBox
            Left = 80
            Top = 85
            Width = 192
            Height = 17
            Caption = 'Designa'#231#245'es'
            TabOrder = 1
          end
          object chbRelatorioEncerramentos: TCheckBox
            Left = 80
            Top = 115
            Width = 192
            Height = 17
            Caption = 'Encerramentos'
            TabOrder = 2
          end
        end
      end
      object tbsManutencao: TTabSheet
        Caption = 'Manuten'#231#227'o do Sistema'
        ImageIndex = 1
        object pnlManutencao: TPanel
          Left = 0
          Top = 0
          Width = 914
          Height = 394
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object btnMarcarTodos: TSpeedButton
            Left = 634
            Top = 12
            Width = 120
            Height = 22
            Caption = 'Marcar Todos'
            OnClick = btnMarcarTodosClick
          end
          object btnDesmarcarTodos: TSpeedButton
            Left = 762
            Top = 12
            Width = 120
            Height = 22
            Caption = 'Desmarcar Todos'
            OnClick = btnDesmarcarTodosClick
          end
          object chbMenuManutencao: TCheckBox
            Left = 55
            Top = 55
            Width = 260
            Height = 17
            Caption = 'Acesso ao Menu Manuten'#231#227'o do Sistema'
            TabOrder = 0
            OnClick = chbMenuManutencaoClick
          end
          object chbSeguranca: TCheckBox
            Left = 80
            Top = 85
            Width = 192
            Height = 17
            Caption = 'Seguran'#231'a'
            TabOrder = 1
          end
        end
      end
    end
    object pnlPesquisaUsuario: TPanel
      Left = 2
      Top = 43
      Width = 928
      Height = 65
      Align = alTop
      TabOrder = 2
      object Label1: TLabel
        Left = 40
        Top = 24
        Width = 35
        Height = 16
        Caption = 'Login:'
      end
      object Label2: TLabel
        Left = 240
        Top = 24
        Width = 38
        Height = 16
        Caption = 'Nome:'
      end
      object btnPesquisar: TSpeedButton
        Left = 687
        Top = 15
        Width = 95
        Height = 35
        Margins.Left = 5
        Margins.Right = 0
        Caption = 'Pesquisar'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33033333333333333F7F3333333333333000333333333333F777333333333333
          000333333333333F777333333333333000333333333333F77733333333333300
          033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
          33333377333777733333307F8F8F7033333337F3333337F3333377F8F8F8F773
          333337333333373F3333078F8F8F870333337F333333337F333307F8F8F8F703
          33337F333333337F3333078F8F8F8703333373F333333373333377F8F8F8F773
          333337F3333337F33333307F8F8F70333333373FF333F7333333330777770333
          333333773FF77333333333370007333333333333777333333333}
        NumGlyphs = 2
      end
      object edtLogin: TEdit
        Left = 81
        Top = 20
        Width = 121
        Height = 24
        TabOrder = 0
        OnEnter = edtLoginEnter
        OnExit = edtLoginExit
      end
      object edtNome: TEdit
        Left = 283
        Top = 20
        Width = 396
        Height = 24
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
end
