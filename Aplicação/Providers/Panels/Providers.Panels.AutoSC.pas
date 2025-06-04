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
    mtbPainelNumero_Processo: TLargeintField;
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
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  dtmPainelAutoSC: TdtmPainelAutoSC;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdtmPainelAutoSC.DataModuleCreate(Sender: TObject);
begin
  inherited;
  ConnectionProvider.ConfigurarConexao(SQLConnection);
end;

procedure TdtmPainelAutoSC.DataModuleDestroy(Sender: TObject);
begin
   SQLConnection.Connected := False;
   inherited;
end;

end.
