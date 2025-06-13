unit Providers.Panels.ControlPc;

interface

uses
  System.SysUtils, System.Classes, Providers.Panels, Data.DBXDataSnap, Data.DBXCommon, IPPeerClient, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Datasnap.Provider, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.DB, Datasnap.DBClient, Datasnap.DSConnect, Data.SqlExpr;

type
  TdtmPainelControlPc = class(TdtmPainel)
    mtbPainelData_Abertura: TDateTimeField;
    mtbPainelData_Transferencia: TDateTimeField;
    mtbPainelData_Fechamento: TDateTimeField;
    mtbPainelPrevisao_Solucao: TDateTimeField;
    mtbPainelSolicitacao_Cliente: TStringField;
    mtbPainelTipo_Reclame: TStringField;
    mtbPainelTipo_Nip: TStringField;
    mtbPainelTipo_Status: TStringField;
    mtbPainelTipo_Prazo_Caixa: TStringField;
    mtbPainelNome_Tecnico: TStringField;
    mtbPainelTipo_Cliente: TStringField;
    mtbPainelUsuario_Designado: TStringField;
    mtbPainelSetor_Designado: TStringField;
    mtbPainelid_Protocolo: TLargeintField;
    mtbPainelQtd_Historicos: TIntegerField;
    mtbPainelQtd_Designacoes: TIntegerField;
    mtbPainelQtd_Observacoes: TIntegerField;
    mtbHistoricoAtualizacoesData_Hora_Historico: TDateTimeField;
    mtbHistoricoAtualizacoesTipo_Status: TStringField;
    mtbHistoricoAtualizacoesTipo_Prazo_Caixa: TStringField;
    mtbHistoricoAtualizacoesNome_Tecnico: TStringField;
    mtbHistoricoAtualizacoesTipo_Cliente: TStringField;
    mtbHistoricoAtualizacoesTipo_Classificacao: TStringField;
    mtbHistoricoAtualizacoesNome_Usuario: TStringField;
    mtbHistoricoAtualizacoesTipo_Reclame: TStringField;
    mtbHistoricoAtualizacoesTipo_Nip: TStringField;
    mtbTiposPrazo: TFDMemTable;
    mtbTiposPrazoid: TIntegerField;
    mtbTiposPrazoTipo_Prazo_Caixa: TStringField;
    dtsTiposPrazo: TDataSource;
    mtbUsuarios: TFDMemTable;
    mtbUsuariosid: TIntegerField;
    mtbUsuariosNome_Usuario: TStringField;
    dtsTiposStatus: TDataSource;
    mtbTiposStatus: TFDMemTable;
    mtbTiposStatusid: TFDAutoIncField;
    mtbTiposStatusTipo_Status: TStringField;
    dtsSetores: TDataSource;
    mtbSetores: TFDMemTable;
    mtbSetoresid: TIntegerField;
    mtbSetoresNome_Setor: TStringField;
    mtbTecnicos: TFDMemTable;
    dtsTecnicos: TDataSource;
    mtbTecnicosid: TIntegerField;
    mtbTecnicosNome_Tecnico: TStringField;
    mtbTiposCliente: TFDMemTable;
    dtsTiposCliente: TDataSource;
    mtbTiposClassificacao: TFDMemTable;
    dtsTiposClassificacao: TDataSource;
    mtbTiposClienteTipo_Cliente: TStringField;
    mtbTiposClienteid: TIntegerField;
    mtbTiposClassificacaoTipo_Classificacao: TStringField;
    mtbTiposClassificacaoid: TIntegerField;
    cdsPainelid_Protocolo: TLargeintField;
    cdsPainelData_Abertura: TDateTimeField;
    cdsPainelData_Transferencia: TDateTimeField;
    cdsPainelData_Fechamento: TDateTimeField;
    cdsPainelPrevisao_Solucao: TDateTimeField;
    cdsPainelSolicitacao_Cliente: TStringField;
    cdsPainelTipo_Reclame: TStringField;
    cdsPainelTipo_Nip: TStringField;
    cdsPainelTipo_Status: TStringField;
    cdsPainelTipo_Prazo_Caixa: TStringField;
    cdsPainelNome_Tecnico: TStringField;
    cdsPainelTipo_Cliente: TStringField;
    cdsPainelUsuario_Designado: TStringField;
    cdsPainelSetor_Designado: TStringField;
    cdsPainelQtd_Historicos: TIntegerField;
    cdsPainelQtd_Designacoes: TIntegerField;
    cdsPainelQtd_Observacoes: TIntegerField;
    mtbPainelid_Usuario_Designado: TIntegerField;
    mtbPainelid_Setor_Designado: TIntegerField;
    cdsPainelid_Usuario_Designado: TIntegerField;
    cdsPainelid_Setor_Designado: TIntegerField;
    cdsPainelProtocolo: TStringField;
    mtbPainelProtocolo: TStringField;
    dtsPainel: TDataSource;
    mtbPainelTipo_Classificacao: TStringField;
    cdsPainelTipo_Classificacao: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmPainelControlPc: TdtmPainelControlPc;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
