unit Providers.Panels.Siags;

interface

uses
  System.SysUtils,
  System.Classes,

  Data.DBXDataSnap,
  Data.DBXCommon,
  Data.DB,
  Data.SqlExpr,

  IPPeerClient,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,

  Datasnap.Provider,
  Datasnap.DBClient,
  Datasnap.DSConnect,

  Proxy.Classes,

  Providers.Panels,
  Providers.Connection;

type
  TdtmPainelSiags = class(TdtmPainel)
    mtbHistoricoDesignacoes: TFDMemTable;
    mtbHistoricoDesignacoesJustificativa: TStringField;
    mtbHistoricoDesignacoesData_Hora_Log: TDateTimeField;
    mtbHistoricoDesignacoesNome_Setor: TStringField;
    mtbHistoricoDesignacoesUsuario_Designado: TStringField;
    mtbHistoricoDesignacoesUsuario_Responsavel: TStringField;
    dtsHistoricoDesignacoes: TDataSource;
    mtbHistoricoAtualizacoes: TFDMemTable;
    mtbHistoricoAtualizacoesData_Hora_Historico: TDateTimeField;
    mtbHistoricoAtualizacoesTipo_Prazo_Caixa: TStringField;
    mtbHistoricoAtualizacoesTipo_Prazo_Caixa_Hoje: TStringField;
    mtbHistoricoAtualizacoesTipo_Prazo_ANS: TStringField;
    mtbHistoricoAtualizacoesTipo_Status: TStringField;
    mtbHistoricoAtualizacoesNome_Usuario: TStringField;
    dtsHistoricoAtualizacoes: TDataSource;
    mtbObservacoesProcesso: TFDMemTable;
    mtbObservacoesProcessoData_Hora: TDateTimeField;
    mtbObservacoesProcessoObservacao: TStringField;
    mtbObservacoesProcessoNome_Usuario: TStringField;
    dtsObservacoesProcesso: TDataSource;
    mtbTiposAuditoria: TFDMemTable;
    mtbTiposAuditoriaid: TIntegerField;
    mtbTiposAuditoriaTipo_Auditoria: TStringField;
    mtbTiposPrazo: TFDMemTable;
    mtbTiposPrazoid: TIntegerField;
    mtbTiposPrazoTipo_Prazo_Caixa: TStringField;
    dtsTiposAuditoria: TDataSource;
    dtsTiposPrazo: TDataSource;
    mtbUsuarios: TFDMemTable;
    mtbUsuariosid: TIntegerField;
    mtbUsuariosNome_Usuario: TStringField;
    mtbSetores: TFDMemTable;
    mtbSetoresid: TIntegerField;
    mtbSetoresNome_Setor: TStringField;
    dtsSetores: TDataSource;
    mtbUF: TFDMemTable;
    mtbUFSigla: TStringField;
    dtsUF: TDataSource;
    mtbTiposAutorizacao: TFDMemTable;
    dtsTiposAutorizacao: TDataSource;
    mtbTiposAutorizacaoid: TIntegerField;
    mtbTiposAutorizacaoTipo_Autorizacao: TStringField;
    mtbTiposAtendimento: TFDMemTable;
    dtsTiposAtendimento: TDataSource;
    mtbTiposAtendimentoid: TIntegerField;
    mtbTiposAtendimentoTipo_Atendimento: TStringField;
    mtbTiposSituacaoAutorizacao: TFDMemTable;
    dtsTiposSituacaoAutorizacao: TDataSource;
    mtbTiposSituacaoAutorizacaoTipo_Situacao_Autorizacao: TStringField;
    mtbTiposSituacaoAutorizacaoid: TIntegerField;
    mtbTiposUltimaAnotacao: TFDMemTable;
    dtsTiposUltimaAnotacao: TDataSource;
    mtbTiposUltimaAnotacaoTipo_Ultima_Anotacao: TStringField;
    mtbTiposUltimaAnotacaoid: TIntegerField;
    mtbPainelid_Processo: TLargeintField;
    mtbPaineluf: TStringField;
    mtbPainelNumero_Autorizacao: TLargeintField;
    mtbPainelAnexo_Opme: TStringField;
    mtbPainelAnexo_Quimio: TStringField;
    mtbPainelAnexo_Radio: TStringField;
    mtbPainelDia_Inclusao: TIntegerField;
    mtbPainelDias_Corridos_Base: TIntegerField;
    mtbPainelDias_Uteis_Base: TIntegerField;
    mtbPainelDias_Prazo_Caixa: TIntegerField;
    mtbPainelData_Prazo_Caixa: TDateTimeField;
    mtbPainelDias_Prazo_ANS: TIntegerField;
    mtbPainelData_Prazo_ANS: TDateTimeField;
    mtbPainelTipo_Autorizacao: TStringField;
    mtbPainelTipo_Atendimento: TStringField;
    mtbPainelNumero_Beneficiario: TStringField;
    mtbPainelNome_Beneficiario: TStringField;
    mtbPainelTipo_Situacao_Autorizacao: TStringField;
    mtbPainelTipo_Ultima_Anotacao: TStringField;
    mtbPainelTipo_Auditoria: TStringField;
    mtbPainelTipo_Prazo_Caixa: TStringField;
    mtbPainelTipo_Prazo_Ans: TStringField;
    mtbPainelUsuario_Designado: TStringField;
    mtbPainelQtd_Historicos: TIntegerField;
    mtbPainelQtd_Designacoes: TIntegerField;
    mtbPainelQtd_Observacoes: TIntegerField;
    cdsPainelid_Processo: TLargeintField;
    cdsPaineluf: TStringField;
    cdsPainelNumero_Autorizacao: TLargeintField;
    cdsPainelAnexo_Opme: TStringField;
    cdsPainelAnexo_Quimio: TStringField;
    cdsPainelAnexo_Radio: TStringField;
    cdsPainelDia_Inclusao: TIntegerField;
    cdsPainelDias_Corridos_Base: TIntegerField;
    cdsPainelDias_Uteis_Base: TIntegerField;
    cdsPainelDias_Prazo_Caixa: TIntegerField;
    cdsPainelData_Prazo_Caixa: TDateTimeField;
    cdsPainelDias_Prazo_ANS: TIntegerField;
    cdsPainelData_Prazo_ANS: TDateTimeField;
    cdsPainelTipo_Autorizacao: TStringField;
    cdsPainelTipo_Atendimento: TStringField;
    cdsPainelNumero_Beneficiario: TStringField;
    cdsPainelNome_Beneficiario: TStringField;
    cdsPainelTipo_Situacao_Autorizacao: TStringField;
    cdsPainelTipo_Ultima_Anotacao: TStringField;
    cdsPainelTipo_Auditoria: TStringField;
    cdsPainelTipo_Prazo_Caixa: TStringField;
    cdsPainelTipo_Prazo_Ans: TStringField;
    cdsPainelUsuario_Designado: TStringField;
    cdsPainelQtd_Historicos: TIntegerField;
    cdsPainelQtd_Designacoes: TIntegerField;
    cdsPainelQtd_Observacoes: TIntegerField;
    mtbPainelid_Setor_Designado: TIntegerField;
    mtbPainelSetor_Designado: TStringField;
    mtbPainelid_Usuario_Designado: TIntegerField;
    cdsPainelid_Setor_Designado: TIntegerField;
    cdsPainelid_Usuario_Designado: TIntegerField;
    cdsPainelSetor_Designado: TStringField;
    mtbTiposPrazoANS: TFDMemTable;
    mtbTiposPrazoANSid: TIntegerField;
    mtbTiposPrazoANSTipo_Prazo_Caixa: TStringField;
    dtsTiposPrazoANS: TDataSource;
    dtsPainel: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmPainelSiags: TdtmPainelSiags;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
