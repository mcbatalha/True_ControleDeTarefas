inherited frmCadastroStatusTrue: TfrmCadastroStatusTrue
  Caption = 'Cadastro de Status True'
  ClientHeight = 411
  ClientWidth = 476
  OnDestroy = FormDestroy
  ExplicitWidth = 494
  ExplicitHeight = 458
  PixelsPerInch = 120
  TextHeight = 16
  inherited pnlForm: TPanel
    Width = 470
    Height = 405
    inherited fraBotoes: TfraBotoes
      Width = 466
      inherited btnExcluir: TSpeedButton
        OnClick = fraBotoesbtnExcluirClick
      end
      inherited btnPesquisar: TSpeedButton
        OnClick = fraBotoesbtnPesquisarClick
      end
    end
    inherited pnlBotoes: TPanel
      Top = 346
      Width = 466
      inherited Panel1: TPanel
        Left = 142
      end
    end
    inherited pnlCentral: TPanel
      Width = 466
      Height = 288
      object Label1: TLabel
        Left = 43
        Top = 46
        Width = 91
        Height = 16
        Caption = 'Nome do Status'
      end
      object Label2: TLabel
        Left = 43
        Top = 118
        Width = 79
        Height = 16
        Caption = 'Tipo do Prazo'
      end
      object Label3: TLabel
        Left = 43
        Top = 214
        Width = 32
        Height = 16
        Caption = 'Prazo'
      end
      object dbeNome: TDBEdit
        Left = 43
        Top = 64
        Width = 381
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        DataField = 'Status'
        DataSource = dtsCadastro
        TabOrder = 0
      end
      object dbePrazo: TDBEdit
        Left = 45
        Top = 231
        Width = 37
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        DataField = 'Prazo'
        DataSource = dtsCadastro
        TabOrder = 2
        ExplicitWidth = 44
      end
      object rdgTipoPrazo: TDBRadioGroup
        Left = 43
        Top = 136
        Width = 381
        Height = 44
        Columns = 3
        DataField = 'Tipo_Prazo'
        DataSource = dtsCadastro
        Items.Strings = (
          'N'#227'o Conta'
          'Dias'
          'Horas')
        TabOrder = 1
        Values.Strings = (
          'N'#227'o Conta'
          'Dias'
          'Horas')
        OnClick = rdgTipoPrazoClick
      end
    end
  end
  inherited dtsCadastro: TDataSource
    DataSet = dtmCadastroStatusTrue.cdsCadastro
    Left = 240
    Top = 280
  end
end
