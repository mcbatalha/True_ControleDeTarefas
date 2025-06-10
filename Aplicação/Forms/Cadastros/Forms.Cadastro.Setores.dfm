inherited frmCadastroSetores: TfrmCadastroSetores
  Caption = 'Cadastro de Setores'
  ClientHeight = 380
  ClientWidth = 481
  OnDestroy = FormDestroy
  ExplicitWidth = 499
  ExplicitHeight = 427
  PixelsPerInch = 120
  TextHeight = 16
  inherited pnlForm: TPanel
    Width = 475
    Height = 374
    ExplicitWidth = 475
    ExplicitHeight = 374
    inherited fraBotoes: TfraBotoes
      Width = 471
      ExplicitWidth = 471
      inherited btnNovo: TSpeedButton
        Left = -2
        Top = 0
        ExplicitLeft = -2
        ExplicitTop = 0
      end
      inherited btnExcluir: TSpeedButton
        OnClick = fraBotoesbtnExcluirClick
      end
      inherited btnPesquisar: TSpeedButton
        OnClick = fraBotoesbtnPesquisarClick
      end
    end
    inherited pnlBotoes: TPanel
      Top = 315
      Width = 471
      ExplicitTop = 315
      ExplicitWidth = 471
      inherited Panel1: TPanel
        Left = 147
        ExplicitLeft = 147
      end
    end
    inherited pnlCentral: TPanel
      Width = 471
      Height = 257
      ExplicitWidth = 471
      ExplicitHeight = 257
      object Label1: TLabel
        Left = 45
        Top = 50
        Width = 86
        Height = 16
        Caption = 'Nome do Setor'
      end
      object Label2: TLabel
        Left = 45
        Top = 115
        Width = 106
        Height = 16
        Caption = #193'reas de Atua'#231#227'o:'
      end
      object dbeNome: TDBEdit
        Left = 45
        Top = 68
        Width = 381
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        DataField = 'Nome_Setor'
        DataSource = dtsCadastro
        TabOrder = 0
      end
      object DBCheckBox2: TDBCheckBox
        Left = 82
        Top = 205
        Width = 97
        Height = 17
        Caption = 'CONTROLPC'
        DataField = 'CONTROLPC'
        DataSource = dtsCadastro
        TabOrder = 3
        ValueChecked = 'Sim'
        ValueUnchecked = 'N'#227'o'
      end
      object DBCheckBox3: TDBCheckBox
        Left = 82
        Top = 174
        Width = 97
        Height = 17
        Caption = 'SIAGS'
        DataField = 'SIAGS'
        DataSource = dtsCadastro
        TabOrder = 2
        ValueChecked = 'Sim'
        ValueUnchecked = 'N'#227'o'
      end
      object DBCheckBox1: TDBCheckBox
        Left = 82
        Top = 144
        Width = 97
        Height = 17
        Caption = 'AUTO SC'
        DataField = 'AUTOSC'
        DataSource = dtsCadastro
        TabOrder = 1
        ValueChecked = 'Sim'
        ValueUnchecked = 'N'#227'o'
      end
    end
  end
  inherited dtsCadastro: TDataSource
    DataSet = dtmCadastroSetores.cdsCadastro
    Left = 432
    Top = 88
  end
end
