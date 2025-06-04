unit Services.Panels.AutoSC;

interface
uses
  Vcl.Forms,
  Vcl.Samples.Gauges,
  Vcl.StdCtrls,

  System.SysUtils,
  System.Classes,
  System.JSON,

  Providers.Seguranca,
  Proxy.Classes,
  Funcoes,
  Libs.Constantes,
  Providers.Panels.AutoSC,
  Forms.Mensagem,
  Libs.TSeguranca,
  Libs.TFuncoesJSON;

type

  TSrvAutoSC = class
  private
     FdmAutoSC      : TdtmPainelAutoSC;
     FPxyAutoSC     : TSMAutoSCClient;

     procedure TabelasDeDominio;

     const
        C_TITULO_MENSAGENS = 'Importação de Planilha AUTOSC';
  public
     constructor Create();
     destructor Destroy(); override;

  end;



implementation

{ TSrvImportacaoAutoAc }

constructor TSrvAutoSC.Create;
begin
   Application.CreateForm(TdtmPainelAutoSC, FdmAutoSC);
   FPxyAutoSC := TSMAutoSCClient.Create(FdmAutoSC.SQLConnection.DBXConnection);

   TabelasDeDominio;
end;

destructor TSrvAutoSC.Destroy;
begin
   FreeAndNil(FPxyAutoSC);
   FreeAndNil(FdmAutoSC);

   inherited;
end;

procedure TSrvAutoSC.TabelasDeDominio;
begin
   TFuncoesJSON.PopularTabela(FdmAutoSC.mtbTiposAuditoria, FPxyAutoSC.TiposDeAuditoria);
   TFuncoesJSON.PopularTabela(FdmAutoSC.mtbTiposPrazo, FPxyAutoSC.TiposDePrazo);
   TFuncoesJSON.PopularTabela(FdmAutoSC.mtbTiposPrazoHoje, FPxyAutoSC.TiposDePrazoHoje);
   TFuncoesJSON.PopularTabela(FdmAutoSC.mtbTiposProcesso, FPxyAutoSC.TiposDeProcesso);
   TFuncoesJSON.PopularTabela(FdmAutoSC.mtbTiposProcessoE, FPxyAutoSC.TiposDeProcessoE);
   TFuncoesJSON.PopularTabela(FdmAutoSC.mtbTiposStatus, FPxyAutoSC.TiposDeStatus);
   TFuncoesJSON.PopularTabela(FdmAutoSC.mtbSetores, FPxyAutoSC.Setores);

   IncluirRegistro(FdmAutoSC.mtbTiposAuditoria, 'Tipo_Auditoria', C_TODAS);
   IncluirRegistro(FdmAutoSC.mtbTiposPrazo,  'Tipo_Prazo_Caixa', C_TODOS);
   IncluirRegistro(FdmAutoSC.mtbTiposPrazoHoje,  'Tipo_Prazo_Caixa_Hoje', C_TODOS);
   IncluirRegistro(FdmAutoSC.mtbTiposProcesso, 'Tipo_Processo', C_TODOS);
   IncluirRegistro(FdmAutoSC.mtbTiposProcessoE, 'Tipo_Processo_E', C_TODOS);
   IncluirRegistro(FdmAutoSC.mtbTiposStatus, 'Tipo_Status', C_TODOS);
   IncluirRegistro(FdmAutoSC.mtbSetores, 'Nome_Setor', C_TODOS);
   IncluirRegistro(FdmAutoSC.mtbSetores, 'Nome_Setor', C_PROCESSO_NAO_DESIGNADO, 999999);
end;

end.
