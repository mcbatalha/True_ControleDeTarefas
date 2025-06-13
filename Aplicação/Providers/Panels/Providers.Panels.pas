unit Providers.Panels;

interface

uses
  System.SysUtils, System.Classes, Providers.Conexao, Data.DBXDataSnap, Data.DBXCommon, IPPeerClient, Data.DB, Datasnap.DBClient, Datasnap.DSConnect, Data.SqlExpr, Proxy.Classes, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, Datasnap.Provider, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdtmPainel = class(TdtmConexao)
    mtbPainel: TFDMemTable;
    cdsPainel: TClientDataSet;
    dspPainel: TDataSetProvider;
    mtbHistoricoDesignacoes: TFDMemTable;
    mtbHistoricoDesignacoesJustificativa: TStringField;
    mtbHistoricoDesignacoesData_Hora_Log: TDateTimeField;
    mtbHistoricoDesignacoesNome_Setor: TStringField;
    mtbHistoricoDesignacoesUsuario_Designado: TStringField;
    mtbHistoricoDesignacoesUsuario_Responsavel: TStringField;
    dtsHistoricoDesignacoes: TDataSource;
    mtbObservacoesProcesso: TFDMemTable;
    mtbObservacoesProcessoData_Hora: TDateTimeField;
    mtbObservacoesProcessoObservacao: TStringField;
    mtbObservacoesProcessoNome_Usuario: TStringField;
    dtsObservacoesProcesso: TDataSource;
    mtbHistoricoAtualizacoes: TFDMemTable;
    dtsHistoricoAtualizacoes: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmPainel: TdtmPainel;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
