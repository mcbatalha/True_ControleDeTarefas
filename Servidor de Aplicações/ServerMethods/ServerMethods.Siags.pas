unit ServerMethods.Siags;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer, 
  Datasnap.DSAuth, Datasnap.DSProviderDataModuleAdapter, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSMSiags = class(TDSServerModule)
    qryAux: TFDQuery;
    qryTiposPrazo: TFDQuery;
    qryTiposPrazoid: TFDAutoIncField;
    qryTiposPrazoTipo_Prazo_Caixa: TStringField;
    qryTiposPrazoAUTOSC: TIntegerField;
    qryTiposPrazoSIAGS: TIntegerField;
    qryTiposPrazoCONTROLPC: TIntegerField;
    qryTiposPrazoHoje: TFDQuery;
    qryTiposPrazoHojeid: TFDAutoIncField;
    qryTiposPrazoHojeTipo_Prazo_Caixa_Hoje: TStringField;
    qryTiposPrazoHojeAUTOSC: TIntegerField;
    qryTiposPrazoHojeSIAGS: TIntegerField;
    qryTiposPrazoHojeCONTROLPC: TIntegerField;
    qryTiposAutorizacao: TFDQuery;
    qryTiposAtendimento: TFDQuery;
    qryTiposSituacaoAutorizacao: TFDQuery;
    qrySiags: TFDQuery;
    qrySiagsHistorico: TFDQuery;
    qryPainelSiags: TFDQuery;
    qrySetores: TFDQuery;
    qrySetoresid: TIntegerField;
    qrySetoresNome_Setor: TStringField;
    qrySiagsLog: TFDQuery;
    qryTiposAuditoria: TFDQuery;
    qryTiposAuditoriaid: TFDAutoIncField;
    qryTiposAuditoriaTipo_Auditoria: TStringField;
    qryTiposAuditoriaAUTOSC: TIntegerField;
    qryTiposAuditoriaSIAGS: TIntegerField;
    qryTiposAuditoriaCONTROLPC: TIntegerField;
    qryTiposAutorizacaoid: TFDAutoIncField;
    qryTiposAutorizacaoTipo_Autorizacao: TStringField;
    qryTiposSituacaoAutorizacaoid: TFDAutoIncField;
    qryTiposSituacaoAutorizacaoTipo_Situacao_Autorizacao: TStringField;
    qryTiposAtendimentoid: TFDAutoIncField;
    qryTiposAtendimentoTipo_Atendimento: TStringField;
    qryTiposUltimaAnotacao: TFDQuery;
    qryTiposUltimaAnotacaoid: TFDAutoIncField;
    qryTiposUltimaAnotacaoTipo_Ultima_Anotacao: TStringField;
    qryBeneficiarios: TFDQuery;
    qryBeneficiariosid: TFDAutoIncField;
    qryBeneficiariosNumero_Beneficiario: TStringField;
    qryBeneficiariosNome_Beneficiario: TStringField;
    qrySiagsid: TLargeintField;
    qrySiagsUF: TStringField;
    qrySiagsid_Tipo_Autorizacao: TIntegerField;
    qrySiagsNumero_Autorizacao: TLargeintField;
    qrySiagsid_Tipo_Atendimento: TIntegerField;
    qrySiagsAnexo_Opme: TStringField;
    qrySiagsAnexo_Quimio: TStringField;
    qrySiagsAnexo_Radio: TStringField;
    qrySiagsid_Beneficiario: TIntegerField;
    qrySiagsid_Tipo_Situacao_Autorizacao: TIntegerField;
    qrySiagsid_Tipo_Ultima_Anotacao: TIntegerField;
    qrySiagsid_Tipo_Auditoria: TIntegerField;
    qrySiagsDia_Inclusao: TIntegerField;
    qrySiagsDias_Corridos_Base: TIntegerField;
    qrySiagsDias_Uteis_Base: TIntegerField;
    qrySiagsDias_Prazo_Caixa: TIntegerField;
    qrySiagsData_Prazo_Caixa: TDateTimeField;
    qrySiagsid_Tipo_Prazo_Caixa: TIntegerField;
    qrySiagsDias_Prazo_ANS: TIntegerField;
    qrySiagsData_Prazo_ANS: TDateTimeField;
    qrySiagsid_Tipo_Prazo_ANS: TIntegerField;
    qrySiagsData_Hora_Importacao: TDateTimeField;
    qrySiagsid_Usuario_Importacao: TIntegerField;
    qrySiagsid_Setor_Designado: TIntegerField;
    qrySiagsid_Usuario_Desiginado: TIntegerField;
    qrySiagsid_Responsavel_Designacao: TIntegerField;
    qrySiagsData_Hora_Designacao: TDateTimeField;
    qrySiagsJustificativa_Designacao: TStringField;
    qrySiagsData_Hora_Encerramento: TDateTimeField;
    qrySiagsid_Usuario_Encerramento: TIntegerField;
    qrySiagsJustificativa_Encerramento: TStringField;
    qrySiagsHistoricoid: TLargeintField;
    qrySiagsHistoricoid_Siags: TLargeintField;
    qrySiagsHistoricoid_Tipo_Autorizacao: TIntegerField;
    qrySiagsHistoricoid_Tipo_Atendimento: TIntegerField;
    qrySiagsHistoricoAnexo_Opme: TStringField;
    qrySiagsHistoricoAnexo_Quimio: TStringField;
    qrySiagsHistoricoAnexo_Radio: TStringField;
    qrySiagsHistoricoid_Tipo_Situacao_Autorizacao: TIntegerField;
    qrySiagsHistoricoid_Tipo_Ultima_Anotacao: TIntegerField;
    qrySiagsHistoricoid_Tipo_Auditoria: TIntegerField;
    qrySiagsHistoricoDias_Corridos_Base: TIntegerField;
    qrySiagsHistoricoDias_Uteis_Base: TIntegerField;
    qrySiagsHistoricoDias_Prazo_Caixa: TIntegerField;
    qrySiagsHistoricoid_Tipo_Prazo_Caixa: TIntegerField;
    qrySiagsHistoricoDias_Prazo_ANS: TIntegerField;
    qrySiagsHistoricoid_Tipo_Prazo_ANS: TIntegerField;
    qrySiagsHistoricoid_Usuario_Responsavel: TIntegerField;
    qrySiagsHistoricoData_Hora_Historico: TDateTimeField;
    qrySiagsLogid: TLargeintField;
    qrySiagsLogid_Siags: TLargeintField;
    qrySiagsLogid_Setor_Designado: TIntegerField;
    qrySiagsLogid_Usuario_Designado: TIntegerField;
    qrySiagsLogid_Usuario_Responsavel: TIntegerField;
    qrySiagsLogJustificativa: TStringField;
    qrySiagsLogData_Hora_Log: TDateTimeField;
    qryPainelSiagsid_Processo: TLargeintField;
    qryPainelSiagsuf: TStringField;
    qryPainelSiagsNumero_Autorizacao: TLargeintField;
    qryPainelSiagsAnexo_Opme: TStringField;
    qryPainelSiagsAnexo_Quimio: TStringField;
    qryPainelSiagsAnexo_Radio: TStringField;
    qryPainelSiagsDia_Inclusao: TIntegerField;
    qryPainelSiagsDias_Corridos_Base: TIntegerField;
    qryPainelSiagsDias_Uteis_Base: TIntegerField;
    qryPainelSiagsDias_Prazo_Caixa: TIntegerField;
    qryPainelSiagsData_Prazo_Caixa: TDateTimeField;
    qryPainelSiagsDias_Prazo_ANS: TIntegerField;
    qryPainelSiagsData_Prazo_ANS: TDateTimeField;
    qryPainelSiagsTipo_Autorizacao: TStringField;
    qryPainelSiagsTipo_Atendimento: TStringField;
    qryPainelSiagsNumero_Beneficiario: TStringField;
    qryPainelSiagsNome_Beneficiario: TStringField;
    qryPainelSiagsTipo_Situacao_Autorizacao: TStringField;
    qryPainelSiagsTipo_Ultima_Anotacao: TStringField;
    qryPainelSiagsTipo_Auditoria: TStringField;
    qryPainelSiagsTipo_Prazo_Caixa: TStringField;
    qryPainelSiagsTipo_Prazo_Ans: TStringField;
    qryPainelSiagsUsuario_Designado: TStringField;
    qryPainelSiagsNome_Setor: TStringField;
    qryPainelSiagsQtd_Historicos: TIntegerField;
    qryPainelSiagsQtd_Designacoes: TIntegerField;
    qryPainelSiagsQtd_Observacoes: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

