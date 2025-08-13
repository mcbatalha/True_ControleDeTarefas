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
  Providers.Connection, frxClass, frxDBSet, Libs.Constantes;

type
  TdtmPainelSiags = class(TdtmPainel)
    mtbUsuarios: TFDMemTable;
    mtbUsuariosid: TIntegerField;
    mtbUsuariosNome_Usuario: TStringField;
    mtbSetores: TFDMemTable;
    mtbSetoresid: TIntegerField;
    mtbSetoresNome_Setor: TStringField;
    dtsSetores: TDataSource;
    mtbTiposAutorizacao: TFDMemTable;
    dtsTiposAutorizacao: TDataSource;
    mtbTiposAutorizacaoid: TIntegerField;
    mtbTiposAutorizacaoTipo_Autorizacao: TStringField;
    mtbTiposAtendimento: TFDMemTable;
    dtsTiposAtendimento: TDataSource;
    mtbTiposAtendimentoid: TIntegerField;
    mtbTiposAtendimentoTipo_Atendimento: TStringField;
    mtbPainelid_Autorizacao: TLargeintField;
    mtbPainelNumero_Autorizacao: TLargeintField;
    mtbPainelData_Prazo_ANS: TDateTimeField;
    mtbPainelTipo_Autorizacao: TStringField;
    mtbPainelTipo_Atendimento: TStringField;
    mtbPainelNumero_Beneficiario: TStringField;
    mtbPainelNome_Beneficiario: TStringField;
    mtbPainelUsuario_Designado: TStringField;
    cdsPainelNumero_Autorizacao: TLargeintField;
    cdsPainelData_Prazo_ANS: TDateTimeField;
    cdsPainelTipo_Autorizacao: TStringField;
    cdsPainelTipo_Atendimento: TStringField;
    cdsPainelNumero_Beneficiario: TStringField;
    cdsPainelNome_Beneficiario: TStringField;
    cdsPainelUsuario_Designado: TStringField;
    mtbPainelid_Setor_Designado: TIntegerField;
    mtbPainelSetor_Designado: TStringField;
    mtbPainelid_Usuario_Designado: TIntegerField;
    cdsPainelid_Setor_Designado: TIntegerField;
    cdsPainelid_Usuario_Designado: TIntegerField;
    cdsPainelSetor_Designado: TStringField;
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
    mtbHistoricoAtualizacoesData_Prazo_Caixa: TDateTimeField;
    mtbHistoricoAtualizacoesData_Prazo_ANS: TDateTimeField;
    mtbHistoricoAtualizacoesTipo_Autorizacao: TStringField;
    mtbHistoricoAtualizacoesTipo_Atendimento: TStringField;
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
    mtbPainelData_Prazo_Caixa: TDateTimeField;
    mtbPainelStatus_True: TStringField;
    mtbPainelTipo_Prazo: TStringField;
    mtbPainelPrazo: TIntegerField;
    mtbPainelEncerra: TStringField;
    mtbStatusTrue: TFDMemTable;
    mtbStatusTrueid: TIntegerField;
    mtbStatusTrueStatus: TStringField;
    mtbStatusTrueTipo_Prazo: TStringField;
    mtbStatusTruePrazo: TIntegerField;
    mtbStatusTrueEncerra: TStringField;
    cdsPainelData_Prazo_Caixa: TDateTimeField;
    cdsPainelStatus_True: TStringField;
    cdsPainelTipo_Prazo: TStringField;
    cdsPainelPrazo: TIntegerField;
    cdsPainelEncerra: TStringField;
    dtsStatusTrue: TDataSource;
    mtbPainelSelecionado: TIntegerField;
    cdsPainelSelecionado: TIntegerField;
    mtbPainelDesignacao_Pendente: TStringField;
    cdsPainelDesignacao_Pendente: TStringField;
    mtbUsuariosDoSetor: TFDMemTable;
    mtbUsuariosDoSetorid: TIntegerField;
    mtbUsuariosDoSetorNome_Usuario: TStringField;
    mtbHistoricoAtualizacoesStatus_True: TStringField;
    mtbPainelid_Status_True: TIntegerField;
    cdsPainelid_Status_True: TIntegerField;
    procedure cdsPainelUsuario_DesignadoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

(*
var
  dtmPainelSiags: TdtmPainelSiags;
*)

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdtmPainelSiags.cdsPainelUsuario_DesignadoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
   inherited;
   if cdsPainelDesignacao_Pendente.AsString = C_SIM then
      Text := 'Designação aguardando autorização'
   else if Sender.AsString = '' then
      Text := 'Não designado'
   else
      Text := Sender.AsString;

end;

end.
