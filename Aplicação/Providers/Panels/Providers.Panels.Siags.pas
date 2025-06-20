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
  Providers.Connection, frxClass, frxDBSet;

type
  TdtmPainelSiags = class(TdtmPainel)
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
    mtbPainelid_Autorizacao: TLargeintField;
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
    mtbPainelQtd_Historicos: TIntegerField;
    mtbPainelQtd_Designacoes: TIntegerField;
    mtbPainelQtd_Observacoes: TIntegerField;
    cdsPainelQtd_Historicos: TIntegerField;
    cdsPainelQtd_Designacoes: TIntegerField;
    cdsPainelQtd_Observacoes: TIntegerField;
    cdsPainelid_Autorizacao: TLargeintField;
    mtbHistoricoAtualizacoesNome_Usuario: TStringField;
    mtbHistoricoAtualizacoesData_Hora_Historico: TDateTimeField;
    mtbHistoricoAtualizacoesAnexo_Opme: TStringField;
    mtbHistoricoAtualizacoesAnexo_Quimio: TStringField;
    mtbHistoricoAtualizacoesAnexo_Radio: TStringField;
    mtbHistoricoAtualizacoesDias_Corridos_Base: TIntegerField;
    mtbHistoricoAtualizacoesDias_Uteis_Base: TIntegerField;
    mtbHistoricoAtualizacoesDias_Prazo_Caixa: TIntegerField;
    mtbHistoricoAtualizacoesData_Prazo_Caixa: TDateTimeField;
    mtbHistoricoAtualizacoesDias_Prazo_ANS: TIntegerField;
    mtbHistoricoAtualizacoesData_Prazo_ANS: TDateTimeField;
    mtbHistoricoAtualizacoesTipo_Autorizacao: TStringField;
    mtbHistoricoAtualizacoesTipo_Atendimento: TStringField;
    mtbHistoricoAtualizacoesTipo_Situacao_Autorizacao: TStringField;
    mtbHistoricoAtualizacoesTipo_Ultima_Anotacao: TStringField;
    mtbHistoricoAtualizacoesTipo_Auditoria: TStringField;
    mtbHistoricoAtualizacoesTipo_Prazo_Caixa: TStringField;
    mtbHistoricoAtualizacoesTipo_Prazo_Ans: TStringField;
    mtbPainelData_Hora_Importacao: TDateTimeField;
    mtbPainelUltima_Atualizacao: TDateTimeField;
    mtbPainelData_Hora_Encerramento: TDateTimeField;
    mtbPainelJustificativa_Encerramento: TStringField;
    mtbPainelUsuario_Importacao: TStringField;
    mtbPainelUsuario_Atualizacao: TStringField;
    mtbPainelUsuario_Encerrameto: TStringField;
    cdsPainelData_Hora_Importacao: TDateTimeField;
    cdsPainelUltima_Atualizacao: TDateTimeField;
    cdsPainelData_Hora_Encerramento: TDateTimeField;
    cdsPainelJustificativa_Encerramento: TStringField;
    cdsPainelUsuario_Importacao: TStringField;
    cdsPainelUsuario_Atualizacao: TStringField;
    cdsPainelUsuario_Encerrameto: TStringField;
    procedure cdsPainelUsuario_DesignadoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
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

procedure TdtmPainelSiags.cdsPainelUsuario_DesignadoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
   inherited;
   if Sender.AsString = '' then
      Text := 'Não designado'
   else
      Text := Sender.AsString;

end;

end.
