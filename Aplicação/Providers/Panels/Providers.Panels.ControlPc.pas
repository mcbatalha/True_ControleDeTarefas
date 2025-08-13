unit Providers.Panels.ControlPc;

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
  TdtmPainelControlPc = class(TdtmPainel)
    mtbPainelData_Abertura: TDateTimeField;
    mtbPainelPrevisao_Solucao: TDateTimeField;
    mtbPainelTipo_Reclame: TStringField;
    mtbPainelTipo_Nip: TStringField;
    mtbPainelNome_Tecnico: TStringField;
    mtbPainelTipo_Cliente: TStringField;
    mtbPainelUsuario_Designado: TStringField;
    mtbPainelSetor_Designado: TStringField;
    mtbPainelid_Protocolo: TLargeintField;
    mtbPainelQtd_Historicos: TIntegerField;
    mtbPainelQtd_Designacoes: TIntegerField;
    mtbPainelQtd_Observacoes: TIntegerField;
    mtbHistoricoAtualizacoesData_Hora_Historico: TDateTimeField;
    mtbHistoricoAtualizacoesNome_Tecnico: TStringField;
    mtbHistoricoAtualizacoesTipo_Cliente: TStringField;
    mtbHistoricoAtualizacoesNome_Usuario: TStringField;
    mtbHistoricoAtualizacoesTipo_Reclame: TStringField;
    mtbHistoricoAtualizacoesTipo_Nip: TStringField;
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
    mtbTiposClienteTipo_Cliente: TStringField;
    mtbTiposClienteid: TIntegerField;
    cdsPainelid_Protocolo: TLargeintField;
    cdsPainelData_Abertura: TDateTimeField;
    cdsPainelPrevisao_Solucao: TDateTimeField;
    cdsPainelTipo_Reclame: TStringField;
    cdsPainelTipo_Nip: TStringField;
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
    dtsStatusTrue: TDataSource;
    mtbStatusTrue: TFDMemTable;
    mtbStatusTrueid: TIntegerField;
    mtbStatusTrueStatus: TStringField;
    mtbStatusTrueTipo_Prazo: TStringField;
    mtbStatusTruePrazo: TIntegerField;
    mtbStatusTrueEncerra: TStringField;
    mtbPainelStatus_True: TStringField;
    cdsPainelStatus_True: TStringField;
    mtbHistoricoAtualizacoesStatus_True: TStringField;
    mtbUsuarios: TFDMemTable;
    mtbUsuariosid: TIntegerField;
    mtbUsuariosNome_Usuario: TStringField;
    mtbUsuariosDoSetor: TFDMemTable;
    mtbUsuariosDoSetorid: TIntegerField;
    mtbUsuariosDoSetorNome_Usuario: TStringField;
    mtbPainelSelecionado: TIntegerField;
    cdsPainelSelecionado: TIntegerField;
    mtbPainelDesignacao_Pendente: TStringField;
    cdsPainelDesignacao_Pendente: TStringField;
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
  dtmPainelControlPc: TdtmPainelControlPc;
*)

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Libs.Constantes;

{$R *.dfm}

procedure TdtmPainelControlPc.cdsPainelUsuario_DesignadoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
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
