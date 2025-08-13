inherited frmCadastroStatusTrue: TfrmCadastroStatusTrue
  Caption = 'Cadastro de Status True'
  ClientHeight = 500
  ClientWidth = 476
  OnDestroy = FormDestroy
  ExplicitWidth = 494
  ExplicitHeight = 547
  PixelsPerInch = 120
  TextHeight = 16
  inherited pnlForm: TPanel
    Width = 470
    Height = 494
    ExplicitWidth = 470
    ExplicitHeight = 494
    inherited fraBotoes: TfraBotoes
      Width = 466
      ExplicitWidth = 466
      inherited btnExcluir: TSpeedButton
        OnClick = fraBotoesbtnExcluirClick
      end
      inherited btnPesquisar: TSpeedButton
        OnClick = fraBotoesbtnPesquisarClick
      end
    end
    inherited pnlBotoes: TPanel
      Top = 435
      Width = 466
      ExplicitTop = 435
      ExplicitWidth = 466
      inherited Panel1: TPanel
        Left = 142
        ExplicitLeft = 142
      end
    end
    inherited pnlCentral: TPanel
      Width = 466
      Height = 377
      ExplicitWidth = 466
      ExplicitHeight = 377
      object Label1: TLabel
        Left = 43
        Top = 46
        Width = 91
        Height = 16
        Caption = 'Nome do Status'
      end
      object Label2: TLabel
        Left = 43
        Top = 204
        Width = 79
        Height = 16
        Caption = 'Tipo do Prazo'
      end
      object Label3: TLabel
        Left = 43
        Top = 296
        Width = 32
        Height = 16
        Caption = 'Prazo'
      end
      object Label4: TLabel
        Left = 142
        Top = 296
        Width = 44
        Height = 16
        Caption = 'Encerra'
      end
      object Label5: TLabel
        Left = 43
        Top = 118
        Width = 109
        Height = 16
        Caption = #193'reas de Aplica'#231#227'o'
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
        Left = 43
        Top = 313
        Width = 37
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        DataField = 'Prazo'
        DataSource = dtsCadastro
        TabOrder = 3
      end
      object rdgTipoPrazo: TDBRadioGroup
        Left = 43
        Top = 221
        Width = 381
        Height = 44
        Columns = 3
        DataField = 'Tipo_Prazo'
        DataSource = dtsCadastro
        Items.Strings = (
          'N'#227'o Conta'
          'Dias'
          'Horas')
        TabOrder = 2
        Values.Strings = (
          'N'#227'o Conta'
          'Dias'
          'Horas')
        OnClick = rdgTipoPrazoClick
      end
      object cmbEncerra: TDBComboBox
        Left = 142
        Top = 313
        Width = 59
        Height = 24
        Style = csDropDownList
        DataField = 'Encerra'
        DataSource = dtsCadastro
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 4
      end
      object GroupBox1: TGroupBox
        Left = 43
        Top = 136
        Width = 381
        Height = 44
        TabOrder = 1
        object chbAutoSC: TDBCheckBox
          Left = 10
          Top = 20
          Width = 97
          Height = 17
          Caption = 'AUTOSC'
          DataField = 'AUTOSC'
          DataSource = dtsCadastro
          TabOrder = 0
          ValueChecked = 'Sim'
          ValueUnchecked = 'N'#227'o'
        end
        object chbSiags: TDBCheckBox
          Left = 131
          Top = 20
          Width = 97
          Height = 17
          Caption = 'SIAGS'
          DataField = 'SIAGS'
          DataSource = dtsCadastro
          TabOrder = 1
          ValueChecked = 'Sim'
          ValueUnchecked = 'N'#227'o'
        end
        object chbControlPC: TDBCheckBox
          Left = 252
          Top = 20
          Width = 97
          Height = 17
          Caption = 'CONTROLPC'
          DataField = 'CONTROLPC'
          DataSource = dtsCadastro
          TabOrder = 2
          ValueChecked = 'Sim'
          ValueUnchecked = 'N'#227'o'
        end
      end
    end
  end
  inherited dtsCadastro: TDataSource
    DataSet = dtmCadastroStatusTrue.cdsCadastro
    Left = 368
    Top = 376
  end
end
