unit Providers.Designacoes.Pendentes.Siags;

interface

uses
  System.SysUtils, System.Classes, Providers.Conexao, Data.DBXDataSnap, Data.DBXCommon, IPPeerClient, Data.DB, Datasnap.DBClient, Datasnap.DSConnect, Data.SqlExpr, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, Datasnap.Provider, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdtmDesignacoesPendentesSiags = class(TdtmConexao)
    mtbPainel: TFDMemTable;
    mtbPainelData_Solicitacao: TDateTimeField;
    mtbPainelJustificativa: TStringField;
    mtbPainelid_Autorizacao: TLargeintField;
    mtbPainelUsuario_Solicitante: TStringField;
    mtbPainelUsuario_Atual: TStringField;
    mtbPainelUsuario_Solicitado: TStringField;
    mtbPainelSetor_Atual: TStringField;
    mtbPainelSetor_Solicitado: TStringField;
    mtbPainelStatus_True: TStringField;
    mtbPainelid_Solicitacao: TLargeintField;
    cdsPainel: TClientDataSet;
    cdsPainelData_Solicitacao: TDateTimeField;
    cdsPainelJustificativa: TStringField;
    cdsPainelUsuario_Solicitante: TStringField;
    cdsPainelUsuario_Atual: TStringField;
    cdsPainelUsuario_Solicitado: TStringField;
    cdsPainelSetor_Atual: TStringField;
    cdsPainelSetor_Solicitado: TStringField;
    cdsPainelStatus_True: TStringField;
    cdsPainelid_Solicitacao: TLargeintField;
    dspPainel: TDataSetProvider;
    dtsPainel: TDataSource;
    mtbPainelNumero_Autorizacao: TLargeintField;
    cdsPainelid_Autorizacao: TLargeintField;
    cdsPainelNumero_Autorizacao: TLargeintField;
    procedure cdsPainelUsuario_AtualGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

(*
var
  dtmDesignacoesPendentesSiags: TdtmDesignacoesPendentesSiags;
*)

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
uses
   Libs.Constantes;

{$R *.dfm}

procedure TdtmDesignacoesPendentesSiags.cdsPainelUsuario_AtualGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
   inherited;
   if (not cdsPainel.IsEmpty) and (Sender.AsString = '')  then
      Text := C_DESCRICAO_NAO_DESIGNADO
   else
      Text := Sender.AsString;

end;

end.
