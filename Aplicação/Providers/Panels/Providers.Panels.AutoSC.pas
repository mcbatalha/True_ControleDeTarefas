unit Providers.Panels.AutoSC;

interface

uses
  System.SysUtils,
  System.Classes,

  Providers.Panels,

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
  Proxy.Classes, Providers.Connection;

type
  TdtmPainelAutoSC = class(TdtmPainel)
    mtbPainelid_Processo: TLargeintField;
    mtbPainelData_Status: TDateTimeField;
    mtbPainelQtd_Arquivos: TIntegerField;
    mtbPaineluf: TStringField;
    mtbPainelTipo_Auditoria: TStringField;
    mtbPainelTipo_Prazo_Caixa: TStringField;
    mtbPainelTipo_Prazo_Caixa_Hoje: TStringField;
    mtbPainelTipo_Status: TStringField;
    mtbPainelTipo_Processo: TStringField;
    mtbPainelTipo_Processo_E: TStringField;
    mtbPainelTipo_Prazo_Ans: TStringField;
    mtbPainelUsuario_Designado: TStringField;
    cdsPainelid_Processo: TLargeintField;
    cdsPainelNumero_Processo: TLargeintField;
    cdsPainelData_Status: TDateTimeField;
    cdsPainelQtd_Arquivos: TIntegerField;
    cdsPaineluf: TStringField;
    cdsPainelTipo_Auditoria: TStringField;
    cdsPainelTipo_Prazo_Caixa: TStringField;
    cdsPainelTipo_Prazo_Caixa_Hoje: TStringField;
    cdsPainelTipo_Status: TStringField;
    cdsPainelTipo_Processo: TStringField;
    cdsPainelTipo_Processo_E: TStringField;
    cdsPainelTipo_Prazo_Ans: TStringField;
    cdsPainelUsuario_Designado: TStringField;
    mtbTiposAuditoria: TFDMemTable;
    mtbTiposPrazoHoje: TFDMemTable;
    mtbTiposProcesso: TFDMemTable;
    mtbTiposProcessoE: TFDMemTable;
    mtbTiposStatus: TFDMemTable;
    mtbTiposProcessoid: TFDAutoIncField;
    mtbTiposProcessoEid: TFDAutoIncField;
    mtbTiposStatusid: TFDAutoIncField;
    mtbTiposPrazo: TFDMemTable;
    mtbTiposProcessoTipo_Processo: TStringField;
    mtbTiposProcessoETipo_Processo_E: TStringField;
    mtbTiposStatusTipo_Status: TStringField;
    mtbTiposAuditoriaid: TIntegerField;
    mtbTiposAuditoriaTipo_Auditoria: TStringField;
    mtbTiposPrazoid: TIntegerField;
    mtbTiposPrazoTipo_Prazo_Caixa: TStringField;
    mtbTiposPrazoHojeid: TIntegerField;
    mtbTiposPrazoHojeTipo_Prazo_Caixa_Hoje: TStringField;
    mtbSetores: TFDMemTable;
    mtbSetoresid: TIntegerField;
    mtbSetoresNome_Setor: TStringField;
    dtsTiposAuditoria: TDataSource;
    dtsTiposPrazo: TDataSource;
    dtsTiposPrazoHoje: TDataSource;
    dtsTiposProcesso: TDataSource;
    dtsTiposProcessoE: TDataSource;
    dtsTiposStatus: TDataSource;
    dtsSetores: TDataSource;
    mtbTiposPrazoANS: TFDMemTable;
    dtsTiposPrazoANS: TDataSource;
    mtbTiposPrazoANSid: TIntegerField;
    mtbTiposPrazoANSTipo_Prazo_Caixa: TStringField;
    dtsPainel: TDataSource;
    mtbPainelSetor_Designado: TStringField;
    cdsPainelSetor_Designado: TStringField;
    mtbPainelNumero_Processo: TLargeintField;
    mtbUsuarios: TFDMemTable;
    mtbUsuariosid: TIntegerField;
    mtbUsuariosNome_Usuario: TStringField;
    mtbUF: TFDMemTable;
    dtsUF: TDataSource;
    mtbUFSigla: TStringField;
    mtbPainelid_Usuario_Designado: TIntegerField;
    mtbPainelid_Setor_Designado: TIntegerField;
    cdsPainelid_Usuario_Designado: TIntegerField;
    cdsPainelid_Setor_Designado: TIntegerField;
    mtbPainelQtd_Historicos: TIntegerField;
    mtbPainelQtd_Designacoes: TIntegerField;
    cdsPainelQtd_Historicos: TIntegerField;
    cdsPainelQtd_Designacoes: TIntegerField;
    mtbHistoricoDesignacoes: TFDMemTable;
    mtbHistoricoDesignacoesJustificativa: TStringField;
    mtbHistoricoDesignacoesData_Hora_Log: TDateTimeField;
    mtbHistoricoDesignacoesNome_Setor: TStringField;
    mtbHistoricoDesignacoesUsuario_Designado: TStringField;
    mtbHistoricoDesignacoesUsuario_Responsavel: TStringField;
    dtsHistoricoDesignacoes: TDataSource;
    mtbHistoricoAtualizacoes: TFDMemTable;
    dtsHistoricoAtualizacoes: TDataSource;
    mtbHistoricoAtualizacoesData_Hora_Historico: TDateTimeField;
    mtbHistoricoAtualizacoesTipo_Prazo_Caixa: TStringField;
    mtbHistoricoAtualizacoesTipo_Prazo_Caixa_Hoje: TStringField;
    mtbHistoricoAtualizacoesTipo_Prazo_ANS: TStringField;
    mtbHistoricoAtualizacoesTipo_Status: TStringField;
    mtbHistoricoAtualizacoesNome_Usuario: TStringField;
    mtbObservacoesProcesso: TFDMemTable;
    dtsObservacoesProcesso: TDataSource;
    mtbObservacoesProcessoData_Hora: TDateTimeField;
    mtbObservacoesProcessoObservacao: TStringField;
    mtbObservacoesProcessoNome_Usuario: TStringField;
    mtbPainelQtd_Observacoes: TIntegerField;
    cdsPainelQtd_Observacoes: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure cdsPainelTipo_ProcessoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsPainelUsuario_DesignadoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  private

  public
    { Public declarations }
  end;

var
  dtmPainelAutoSC: TdtmPainelAutoSC;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdtmPainelAutoSC.cdsPainelTipo_ProcessoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
   inherited;
   Text := Sender.AsString;
   if cdsPainelTipo_Processo_E.AsString <> '' then
      Text := Text + ' - ' + cdsPainelTipo_Processo_E.AsString;
end;

procedure TdtmPainelAutoSC.cdsPainelUsuario_DesignadoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
   inherited;

   if Sender.AsString = '' then
      Text := 'Não designado'
   else
      Text := Sender.AsString;
end;

procedure TdtmPainelAutoSC.DataModuleCreate(Sender: TObject);
begin
  inherited;
//  ConnectionProvider.ConfigurarConexao(SQLConnection);
end;

procedure TdtmPainelAutoSC.DataModuleDestroy(Sender: TObject);
begin
//   SQLConnection.Connected := False;
   inherited;
end;

end.
