unit Providers.Designacoes.Pendentes.ControlPC;

interface

uses
  System.SysUtils, System.Classes, Providers.Conexao, Data.DBXDataSnap, Data.DBXCommon, IPPeerClient, Data.DB, Datasnap.DBClient, Datasnap.DSConnect, Data.SqlExpr, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.Provider;

type
  TdtmDesignacoesPendentesControlPC = class(TdtmConexao)
    mtbPainel: TFDMemTable;
    cdsPainel: TClientDataSet;
    dspPainel: TDataSetProvider;
    mtbPainelData_Solicitacao: TDateTimeField;
    mtbPainelJustificativa: TStringField;
    mtbPainelid_Protocolo: TLargeintField;
    mtbPainelProtocolo: TStringField;
    mtbPainelUsuario_Solicitante: TStringField;
    mtbPainelUsuario_Atual: TStringField;
    mtbPainelUsuario_Solicitado: TStringField;
    mtbPainelSetor_Atual: TStringField;
    mtbPainelSetor_Solicitado: TStringField;
    cdsPainelData_Solicitacao: TDateTimeField;
    cdsPainelJustificativa: TStringField;
    cdsPainelid_Protocolo: TLargeintField;
    cdsPainelProtocolo: TStringField;
    cdsPainelUsuario_Solicitante: TStringField;
    cdsPainelUsuario_Atual: TStringField;
    cdsPainelUsuario_Solicitado: TStringField;
    cdsPainelSetor_Atual: TStringField;
    cdsPainelSetor_Solicitado: TStringField;
    dtsPainel: TDataSource;
    mtbPainelStatus_True: TStringField;
    cdsPainelStatus_True: TStringField;
    mtbPainelid_Solicitacao: TLargeintField;
    cdsPainelid_Solicitacao: TLargeintField;
    procedure cdsPainelUsuario_AtualGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

(*
var
  dtmDesignacoesPendentesControlPC: TdtmDesignacoesPendentesControlPC;
*)

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Libs.Constantes;

{$R *.dfm}

procedure TdtmDesignacoesPendentesControlPC.cdsPainelUsuario_AtualGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
   inherited;
   if (not cdsPainel.IsEmpty) and (Sender.AsString = '')  then
      Text := C_DESCRICAO_NAO_DESIGNADO
   else
      Text := Sender.AsString;
end;


end.
