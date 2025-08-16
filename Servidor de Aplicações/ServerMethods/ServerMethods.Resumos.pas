unit ServerMethods.Resumos;

interface

uses
  System.SysUtils,
  System.Classes,
  System.JSON,
  System.Generics.Collections,

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
  TSMResumos = class(TDSServerModule)
    qryAux: TFDQuery;
    qryQuadroResumo: TFDQuery;
    qrySiagsVencidos: TFDQuery;
    qryAutoScVencidos: TFDQuery;
    qryControlPcVencidos: TFDQuery;
    qryAutoScVencidosNome_Setor: TStringField;
    qryAutoScVencidosQtd_Vencido: TIntegerField;
    qryAutoScVencidosQtd_VenceHoje: TIntegerField;
    qryQuadroResumoQtd_Siags: TIntegerField;
    qryQuadroResumoQtd_Siags_Vencidos: TIntegerField;
    qryQuadroResumoQtd_Siags_Vence_Hoje: TIntegerField;
    qryQuadroResumoQtd_Siags_Vence_Amanha: TIntegerField;
    qryQuadroResumoQtd_Siags_Com_Prazo: TIntegerField;
    qryQuadroResumoQtd_ControlPc: TIntegerField;
    qryQuadroResumoQtd_ControlPc_Vencidos: TIntegerField;
    qryQuadroResumoQtd_ControlPc_Vence_Hoje: TIntegerField;
    qryQuadroResumoQtd_ControlPc_Vence_Amanha: TIntegerField;
    qryQuadroResumoQtd_ControlPc_Com_Prazo: TIntegerField;
    qrySiagsVencidosNome_Setor: TStringField;
    qrySiagsVencidosQtd_Vencido: TIntegerField;
    qrySiagsVencidosQtd_VenceHoje: TIntegerField;
    qrySiagsVencidosQtd_VenceAmanha: TIntegerField;
    qryControlPcVencidosNome_Setor: TStringField;
    qryControlPcVencidosQtd_Vencido: TIntegerField;
    qryControlPcVencidosQtd_VenceHoje: TIntegerField;
    qryControlPcVencidosQtd_VenceAmanha: TIntegerField;
  private
  public
     function QuadroResumo : TJSONArray;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TSMResumos }

function TSMResumos.QuadroResumo: TJSONArray;
var
   LQuadroResumo            : TJSONArray;
   LSiagsVencidos     : TJSONArray;
   LAutoScVencidos    : TJSONArray;
   LControlPcVencidos : TJSONArray;

   LDados             : TJSONObject;

begin
   qryQuadroResumo.Close;
   qrySiagsVencidos.Close;
   qryAutoScVencidos.Close;
   qryControlPcVencidos.Close;
   try
      qryQuadroResumo.Open;
      LQuadroResumo := TFuncoesJSON.MontarJSON(qryQuadroResumo);

      qrySiagsVencidos.Open;
      LSiagsVencidos := TFuncoesJSON.MontarJSON(qrySiagsVencidos);

      qryAutoScVencidos.Open;
      LAutoScVencidos := TFuncoesJSON.MontarJSON(qryAutoScVencidos);

      qryControlPcVencidos.Open;
      LControlPcVencidos := TFuncoesJSON.MontarJSON(qryControlPcVencidos);

      LDados := TJSONObject.Create;
      LDados.AddPair('quadroResumo',LQuadroResumo);
      LDados.AddPair('siagsVencidos',LSiagsVencidos);
      LDados.AddPair('autoScVencidos',LAutoScVencidos);
      LDados.AddPair('controlPcVencidos',LControlPcVencidos);

      Result := TJSONArray.Create;
      Result.Add(LDados);
   finally
      qryQuadroResumo.Close;
      qrySiagsVencidos.Close;
      qryAutoScVencidos.Close;
      qryControlPcVencidos.Close;
   end;

end;

end.

