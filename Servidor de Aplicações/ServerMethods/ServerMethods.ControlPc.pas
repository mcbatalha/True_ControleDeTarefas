unit ServerMethods.ControlPc;

interface

uses
  System.SysUtils,
  System.Classes,
  System.JSON,

  Datasnap.DSServer,
  Datasnap.DSAuth,
  Datasnap.DSProviderDataModuleAdapter,

  Data.DB,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,

  Libs.Constantes,
  Libs.TTransacao,
  Libs.TFiltros,
  Libs.TFuncoesJSON,
  Utils.TFuncoesServer;

type
  TSMControlPc = class(TDSServerModule)
    qrySetores: TFDQuery;
    qrySetoresid: TIntegerField;
    qrySetoresNome_Setor: TStringField;
    qryTiposStatus: TFDQuery;
    qryTiposStatusid: TFDAutoIncField;
    qryTiposStatusTipo_Status: TStringField;
    qryTiposStatusAUTOSC: TIntegerField;
    qryTiposStatusSIAGS: TIntegerField;
    qryTiposStatusCONTROLPC: TIntegerField;
    qryTiposPrazo: TFDQuery;
    qryTiposPrazoid: TFDAutoIncField;
    qryTiposPrazoTipo_Prazo_Caixa: TStringField;
    qryTiposPrazoAUTOSC: TIntegerField;
    qryTiposPrazoSIAGS: TIntegerField;
    qryTiposPrazoCONTROLPC: TIntegerField;
    qryTecnicos: TFDQuery;
    qryTecnicosid: TFDAutoIncField;
    qryTecnicosNome_Tecnico: TStringField;
    qryTiposCliente: TFDQuery;
    qryTiposClienteid: TFDAutoIncField;
    qryTiposClienteTipo_Cliente: TStringField;
    qryTiposClassificacao: TFDQuery;
    qryTiposClassificacaoid: TFDAutoIncField;
    qryTiposClassificacaoTipo_Classificacao: TStringField;
    qryControlPc: TFDQuery;
    qryControlPcHistorico: TFDQuery;
    qryControlPcLog: TFDQuery;
    qryControlPcid: TLargeintField;
    qryControlPcProtocolo: TStringField;
    qryControlPcid_Tipo_Status: TIntegerField;
    qryControlPcData_Abertura: TDateTimeField;
    qryControlPcData_Transferencia: TDateTimeField;
    qryControlPcData_Fechamento: TDateTimeField;
    qryControlPcPrevisao_Solucao: TDateTimeField;
    qryControlPcid_Tipo_Prazo: TIntegerField;
    qryControlPcid_Tipo_Cliente: TIntegerField;
    qryControlPcid_Tipo_Classificacao: TIntegerField;
    qryControlPcSolicitacao_Cliente: TStringField;
    qryControlPcTipo_Reclame: TStringField;
    qryControlPcTipo_Nip: TStringField;
    qryControlPcData_Hora_Importacao: TDateTimeField;
    qryControlPcid_Usuario_Importacao: TIntegerField;
    qryControlPcid_Setor_Designado: TIntegerField;
    qryControlPcid_Usuario_Designado: TIntegerField;
    qryControlPcid_Responsavel_Designacao: TIntegerField;
    qryControlPcData_Hora_Designacao: TDateTimeField;
    qryControlPcJustificativa_Designacao: TStringField;
    qryControlPcData_Hora_Encerramento: TDateTimeField;
    qryControlPcid_Usuario_Encerramento: TIntegerField;
    qryControlPcJustificativa_Encerramento: TStringField;
    qryControlPcHistoricoid: TLargeintField;
    qryControlPcHistoricoid_ControlPc: TLargeintField;
    qryControlPcHistoricoid_Tipo_Status: TIntegerField;
    qryControlPcHistoricoid_Tipo_Prazo: TIntegerField;
    qryControlPcHistoricoid_Tecnico: TIntegerField;
    qryControlPcHistoricoid_Tipo_Cliente: TIntegerField;
    qryControlPcHistoricoid_Tipo_Classifiacao: TIntegerField;
    qryControlPcHistoricoid_Usuario_Responsavel: TIntegerField;
    qryControlPcHistoricoData_Hora_Historico: TDateTimeField;
    qryPainelControlPc: TFDQuery;
    qryPainelControlPcid_Protocolo: TLargeintField;
    qryPainelControlPcData_Abertura: TDateTimeField;
    qryPainelControlPcData_Transferencia: TDateTimeField;
    qryPainelControlPcData_Fechamento: TDateTimeField;
    qryPainelControlPcPrevisao_Solucao: TDateTimeField;
    qryPainelControlPcSolicitacao_Cliente: TStringField;
    qryPainelControlPcTipo_Reclame: TStringField;
    qryPainelControlPcTipo_Nip: TStringField;
    qryPainelControlPcTipo_Status: TStringField;
    qryPainelControlPcTipo_Prazo_Caixa: TStringField;
    qryPainelControlPcNome_Tecnico: TStringField;
    qryPainelControlPcTipo_Cliente: TStringField;
    qryPainelControlPcUsuario_Designado: TStringField;
    qryPainelControlPcSetor_Designado: TStringField;
    qryPainelControlPcQtd_Historicos: TIntegerField;
    qryPainelControlPcQtd_Designacoes: TIntegerField;
    qryPainelControlPcQtd_Observacoes: TIntegerField;
    qryAux: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation
uses ServerMethods.Container,
     Funcoes,
     Libs.TFuncoesServer;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

