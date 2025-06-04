unit Services.Panels.AutoSC;

interface
uses
  Vcl.Forms,
  Vcl.Samples.Gauges,
  Vcl.StdCtrls,

  System.SysUtils,
  System.Classes,
  System.JSON,

  Data.SqlExpr,
  FireDAC.Comp.DataSet,

  Providers.Seguranca,
  Proxy.Classes,
  Funcoes,
  Libs.Constantes,
  Forms.Mensagem,
  Libs.TSeguranca,
  Libs.TFuncoesJSON,
  Providers.Panels.AutoSC,
  Providers.Panels.Conexao, Libs.TFiltros;

type

  TSrvAutoSC = class
  private
     FdmAutoSC      : TdtmPainelAutoSC;
     FPxyAutoSC     : TSMAutoSCClient;

     procedure TabelasDeDominio;

     const
        C_TITULO_MENSAGENS = 'Importação de Planilha AUTOSC';
  public
     constructor Create(ASqlConnection : TSQLConnection);

     function Filtrar(const AFiltros : TJSONObject) : Boolean;

     destructor Destroy(); override;

  end;



implementation

{ TSrvImportacaoAutoAc }

constructor TSrvAutoSC.Create(ASqlConnection : TSQLConnection);
begin
//   FPxyAutoSC := TSMAutoSCClient.Create(FdmAutoSC.SQLConnection.DBXConnection);

   Application.CreateForm(TdtmPainelAutoSC, FdmAutoSC);
   FPxyAutoSC := TSMAutoSCClient.Create(ASqlConnection.DBXConnection);
   TabelasDeDominio;
end;

destructor TSrvAutoSC.Destroy;
begin
   FreeAndNil(FPxyAutoSC);
   FreeAndNil(FdmAutoSC);

   inherited;
end;

function TSrvAutoSC.Filtrar(const AFiltros: TJSONObject): Boolean;
var
   LDados : TJSONArray;
begin
   Result := True;

   LDados := FPxyAutoSC.FiltrarProcessos(AFiltros);
   if LDados.Count > 0 then
      TFuncoesJSON.PopularTabela(FdmAutoSC.cdsPainel, LDados);

end;

procedure TSrvAutoSC.TabelasDeDominio;
var
   LPrazos : TJSONArray;
begin
   LPrazos := FPxyAutoSC.TiposDePrazo;
   TFuncoesJSON.PopularTabela(FdmAutoSC.mtbTiposAuditoria, FPxyAutoSC.TiposDeAuditoria);
   TFuncoesJSON.PopularTabela(FdmAutoSC.mtbTiposPrazo, LPrazos);
   TFuncoesJSON.PopularTabela(FdmAutoSC.mtbTiposPrazoANS, LPrazos);
   TFuncoesJSON.PopularTabela(FdmAutoSC.mtbTiposPrazoHoje, FPxyAutoSC.TiposDePrazoHoje);
   TFuncoesJSON.PopularTabela(FdmAutoSC.mtbTiposProcesso, FPxyAutoSC.TiposDeProcesso);
   TFuncoesJSON.PopularTabela(FdmAutoSC.mtbTiposProcessoE, FPxyAutoSC.TiposDeProcessoE);
   TFuncoesJSON.PopularTabela(FdmAutoSC.mtbTiposStatus, FPxyAutoSC.TiposDeStatus);
   TFuncoesJSON.PopularTabela(FdmAutoSC.mtbSetores, FPxyAutoSC.Setores);

   IncluirRegistro(FdmAutoSC.mtbTiposAuditoria, 'Tipo_Auditoria', C_TODAS);
   IncluirRegistro(FdmAutoSC.mtbTiposPrazo,  'Tipo_Prazo_Caixa', C_TODOS);
   IncluirRegistro(FdmAutoSC.mtbTiposPrazoAns,  'Tipo_Prazo_Caixa', C_TODOS);
   IncluirRegistro(FdmAutoSC.mtbTiposPrazoHoje,  'Tipo_Prazo_Caixa_Hoje', C_TODOS);
   IncluirRegistro(FdmAutoSC.mtbTiposProcesso, 'Tipo_Processo', C_TODOS);
   IncluirRegistro(FdmAutoSC.mtbTiposProcessoE, 'Tipo_Processo_E', C_TODOS);
   IncluirRegistro(FdmAutoSC.mtbTiposStatus, 'Tipo_Status', C_TODOS);
   IncluirRegistro(FdmAutoSC.mtbSetores, 'Nome_Setor', C_TODOS);
   IncluirRegistro(FdmAutoSC.mtbSetores, 'Nome_Setor', C_PROCESSO_NAO_DESIGNADO, 999999);

end;

end.
