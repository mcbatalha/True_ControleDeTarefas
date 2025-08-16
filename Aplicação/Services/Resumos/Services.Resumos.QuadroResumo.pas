unit Services.Resumos.QuadroResumo;

interface
Uses
  Vcl.Forms,
  Vcl.Samples.Gauges,
  Vcl.StdCtrls,

  System.SysUtils,
  System.Classes,
  System.JSON,

  Data.SqlExpr,
  Data.DB,

  FireDAC.Comp.DataSet,

  Providers.Seguranca,
  Proxy.Classes,
  Funcoes,

  Forms.Mensagem,

  Libs.Constantes,
  Libs.TSeguranca,
  Libs.TFuncoesJSON,
  Libs.TFiltros,

  Providers.Resumos.QuadroResumo,
  Providers.Panels.Conexao;

type

  TSrvResumos = class
  private
     Fdm        : TdtmQuadroResumo;
     FPxyResumo : TSMResumosClient;

  public
     constructor Create;

     function QuadroResumo : Boolean;

     function TotalSiags            : String;
     function SiagsVencidos         : String;
     function SiagsVenceHoje        : String;
     function SiagsVenceAmanha      : String;
     function SiagsComPrazo         : String;
     function SiagsNaoDesignado      : Boolean;

     function TotalAutoSc           : String;
     function AutoScVencidosTrue    : String;
     function AutoScVencidosAns     : String;

     function TotalControlPc        : String;
     function ControlPcVencidos     : String;
     function ControlPcVenceHoje    : String;
     function ControlPcVenceAmanha  : String;
     function ControlPcComPrazo     : String;
     function ControlPcNaoDesignado  : Boolean;

     destructor Destroy(); override;
  end;


implementation

{ TSrvAutoSC }

function TSrvResumos.AutoScVencidosAns: String;
begin
//   Result := Fdm.mtbQuadroResumoQtd_Siags_Vencidos_Ans.AsInteger.ToString;
end;

function TSrvResumos.AutoScVencidosTrue: String;
begin
//   Result := Fdm.mtbQuadroResumoQtd_AutoSc_Vencidos_Ans.AsInteger.ToString;
end;

function TSrvResumos.ControlPcComPrazo: String;
var
   LTotal : Integer;
begin

   LTotal := Fdm.mtbQuadroResumoQtd_ControlPc.AsInteger -
             Fdm.mtbQuadroResumoQtd_ControlPc_Vencidos.AsInteger -
             Fdm.mtbQuadroResumoQtd_ControlPc_Vence_Hoje.AsInteger -
             Fdm.mtbQuadroResumoQtd_ControlPc_Vence_Amanha.AsInteger;

   Result := IntToStr(LTotal);
end;

function TSrvResumos.ControlPcNaoDesignado: Boolean;
begin
   Result := Fdm.mtbControlPcVencidosNome_Setor.AsString = '';
end;

function TSrvResumos.ControlPcVenceAmanha: String;
begin
   Result := Fdm.mtbQuadroResumoQtd_ControlPc_Vence_Amanha.AsInteger.ToString;
end;

function TSrvResumos.ControlPcVenceHoje: String;
begin
   Result := Fdm.mtbQuadroResumoQtd_ControlPc_Vence_Hoje.AsInteger.ToString;
end;

function TSrvResumos.ControlPcVencidos: String;
begin
   Result := Fdm.mtbQuadroResumoQtd_ControlPc_Vencidos.AsInteger.ToString;
end;

constructor TSrvResumos.Create;
begin
   Application.CreateForm(TdtmQuadroResumo, Fdm);
   FPxyResumo := TSMResumosClient.Create(Fdm.SqlConnection.DBXConnection);
end;

destructor TSrvResumos.Destroy;
begin
   Fdm.mtbQuadroResumo.Close;

   FreeAndNil(FPxyResumo);
   FreeAndNil(Fdm);

   inherited;
end;

function TSrvResumos.QuadroResumo : Boolean;
var
   LRetorno : TJSONArray;
   LObjeto  : TJSONObject;
   LDados   : TJSONArray;
begin
   Fdm.mtbQuadroResumo.Close;
   LRetorno := FPxyResumo.QuadroResumo;

   LObjeto := LRetorno.Items[0] as TJSONObject; // Quadro Resumo

   LDados  := LObjeto.GetValue<TJSONArray>('quadroResumo');
   if LDados.Count > 0 then
      TFuncoesJSON.PopularTabela(Fdm.mtbQuadroResumo, LDados);

   LDados  := LObjeto.GetValue<TJSONArray>('siagsVencidos');
   if LDados.Count > 0 then
      TFuncoesJSON.PopularTabela(Fdm.mtbSiagsVencidos, LDados);

   LDados  := LObjeto.GetValue<TJSONArray>('autoScVencidos');
   if LDados.Count > 0 then
      TFuncoesJSON.PopularTabela(Fdm.mtbAutoScVencidos, LDados);

   LDados  := LObjeto.GetValue<TJSONArray>('controlPcVencidos');
   if LDados.Count > 0 then
      TFuncoesJSON.PopularTabela(Fdm.mtbControlPcVencidos, LDados);
end;

function TSrvResumos.SiagsComPrazo: String;
var
   LTotal : Integer;
begin

   LTotal := Fdm.mtbQuadroResumoQtd_Siags.AsInteger -
             Fdm.mtbQuadroResumoQtd_Siags_Vencidos.AsInteger -
             Fdm.mtbQuadroResumoQtd_Siags_Vence_Hoje.AsInteger -
             Fdm.mtbQuadroResumoQtd_Siags_Vence_Amanha.AsInteger;

   Result := IntToStr(LTotal);
end;

function TSrvResumos.SiagsNaoDesignado: Boolean;
begin
   Result := Fdm.mtbSiagsVencidosNome_Setor.AsString = '';
end;

function TSrvResumos.SiagsVenceAmanha: String;
begin
   Result := Fdm.mtbQuadroResumoQtd_Siags_Vence_Amanha.AsInteger.ToString;
end;

function TSrvResumos.SiagsVenceHoje: String;
begin
   Result := Fdm.mtbQuadroResumoQtd_Siags_Vence_Hoje.AsInteger.ToString;
end;

function TSrvResumos.SiagsVencidos: String;
begin
   Result := Fdm.mtbQuadroResumoQtd_Siags_Vencidos.AsInteger.ToString;
end;

function TSrvResumos.TotalAutoSc: String;
begin
//   Result := Fdm.mtbQuadroResumoQtd_AutoSc.AsInteger.ToString;
end;

function TSrvResumos.TotalControlPc: String;
begin
   Result := Fdm.mtbQuadroResumoQtd_ControlPc.AsInteger.ToString;
end;

function TSrvResumos.TotalSiags: String;
begin
   Result := Fdm.mtbQuadroResumoQtd_Siags.AsInteger.ToString;
end;

end.
