unit Services.Relatorios.Designacoes;

interface
uses
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

  Providers.Relatorios.Designacoes,

  Providers.Panels.Conexao;

type
  TSrvRelatorioDesignacoes = class
  private
     Fdm           : TdtmRelatoriosDesinacoes;
     FPxySiags     : TSMSiagsClient;
     FPxyAutoSc    : TSMAutoScClient;
     FPxyControlPc : TSMControlPcClient;

     procedure PopularTabelasDeUsuarios;

     const
        C_TITULO_MENSAGENS = 'Listagem de Designações';

  public
     constructor create;

     function DataSetUsuarioAutoSc : TDataSet;
     function DataSetUsuarioSiags : TDataSet;
     function DataSetUsuarioControlPc : TDataSet;

     procedure RelatorioAutoSc(const ANumeroProcesso : String;
                               const AUsaData : Boolean;
                               const ADataInicial, ADataFinal : TDateTime;
                               const AIdUsuarioResponsavel : integer;
                               const ANomeResponsavel : String);

     procedure RelatorioSiags(const ANumeroAutorizacao : String;
                              const AUsaData : Boolean;
                              const ADataInicial, ADataFinal : TDateTime;
                              const AIdUsuarioResponsavel : integer;
                              const ANomeResponsavel : String);

     procedure RelatorioControlPc(const ANumeroProtocolo : String;
                                  const AUsaData : Boolean;
                                  const ADataInicial, ADataFinal : TDateTime;
                                  const AIdUsuarioResponsavel : integer;
                                  const ANomeResponsavel : String);


     destructor destroy(); override;


  end;


implementation

{ TSrvSiags }

constructor TSrvRelatorioDesignacoes.create;
begin
   Application.CreateForm(TdtmRelatoriosDesinacoes, Fdm);

   FPxySiags     := TSMSiagsClient.Create(FDm.SQLConnection.DBXConnection);
   FPxyAutoSc    := TSMAutoScClient.Create(FDm.SQLConnection.DBXConnection);
   FPxyControlPc := TSMControlPcClient.Create(FDm.SQLConnection.DBXConnection);

   PopularTabelasDeUsuarios;
end;

function TSrvRelatorioDesignacoes.DataSetUsuarioAutoSc: TDataSet;
begin
   Result := Fdm.mtbUsuariosAutoSc;
end;

function TSrvRelatorioDesignacoes.DataSetUsuarioControlPc: TDataSet;
begin
   Result := Fdm.mtbUsuariosControlPc;
end;

function TSrvRelatorioDesignacoes.DataSetUsuarioSiags: TDataSet;
begin
   Result := Fdm.mtbUsuariosSiags;
end;

destructor TSrvRelatorioDesignacoes.destroy;
begin
   FreeAndNil(FPxySiags);
   FreeAndNil(FPxyAutoSc);
   FreeAndNil(FPxyControlPc);
   FreeAndNil(Fdm);

   inherited;
end;



procedure TSrvRelatorioDesignacoes.RelatorioAutoSc(
   const ANumeroProcesso: String;
   const AUsaData: Boolean;
   const ADataInicial, ADataFinal: TDateTime;
   const AIdUsuarioResponsavel: integer;
   const ANomeResponsavel : String);
var
   LProcesso : String;
   LPeriodo  : String;
   LDados    : TJSONArray;
begin

   LDados := FPxyAutoSc.RelatorioDeDesignacoes(AUsaData,
                                               ADataInicial,
                                               ADataFinal,
                                               ANumeroProcesso,
                                               AIdUsuarioResponsavel);


   if LDados.Count = 0 then
      begin
      InformationMessage('Não foram encotrados registros que atendam aos filtros especificados !',C_TITULO_MENSAGENS);
      Fdm.mtbDesignacoes.Close;
      Exit;
   end;

   Fdm.mtbDesignacoes.Close;
   TFuncoesJSON.PopularTabela(Fdm.mtbDesignacoes, LDados);

   if ANumeroProcesso = '' then
      LProcesso := 'Filtro não especificado'
   else
      LProcesso := ANumeroProcesso;

   if not AUsaData then
      LPeriodo := 'Período não especificado'
   else
      LPeriodo := 'entre ' + FormatDateTime('dd/mm/yyyy',ADataInicial) + ' e ' + FormatDateTime('dd/mm/yyyy',ADataFinal);

   Fdm.setParameters(C_TIPO_AUTOSC,
                     'Nº do Processo',
                     LProcesso,
                     LPeriodo,
                     ANomeResponsavel,
                     'Processo:');

   Fdm.frpDesignacoes.ShowReport();
end;

procedure TSrvRelatorioDesignacoes.RelatorioControlPc(
   const ANumeroProtocolo: String;
   const AUsaData: Boolean;
   const ADataInicial, ADataFinal: TDateTime;
   const AIdUsuarioResponsavel: integer;
   const ANomeResponsavel : String);

var
   LProcesso: String;
   LPeriodo:  String;
   LDados    : TJSONArray;
begin

   LDados := FPxyControlPc.RelatorioDeDesignacoes(AUsaData,
                                                  ADataInicial,
                                                  ADataFinal,
                                                  ANumeroProtocolo,
                                                  AIdUsuarioResponsavel);


   if LDados.Count = 0 then
      begin
      InformationMessage('Não foram encotrados registros que atendam aos filtros especificados !',C_TITULO_MENSAGENS);
      Fdm.mtbDesignacoes.Close;
      Exit;
   end;

   Fdm.mtbDesignacoes.Close;
   TFuncoesJSON.PopularTabela(Fdm.mtbDesignacoes, LDados);

   if ANumeroProtocolo = '' then
      LProcesso := 'Filtro não especificado'
   else
      LProcesso := ANumeroProtocolo;

   if not AUsaData then
      LPeriodo := 'Período não especificado'
   else
      LPeriodo := 'entre ' + FormatDateTime('dd/mm/yyyy',ADataInicial) + ' e ' + FormatDateTime('dd/mm/yyyy',ADataFinal);

   Fdm.setParameters(C_TIPO_CONTROLPC,
                     'Nº do Protocolo',
                     LProcesso,
                     LPeriodo,
                     ANomeResponsavel,
                     'Protocolo: ');

   Fdm.frpDesignacoes.ShowReport();
end;

procedure TSrvRelatorioDesignacoes.RelatorioSiags(
   const ANumeroAutorizacao: String;
   const AUsaData: Boolean;
   const ADataInicial, ADataFinal: TDateTime;
   const AIdUsuarioResponsavel: integer;
   const ANomeResponsavel : String);

var
   LProcesso: String;
   LPeriodo:  String;
   LDados    : TJSONArray;
begin

   LDados := FPxySiags.RelatorioDeDesignacoes(AUsaData,
                                              ADataInicial,
                                              ADataFinal,
                                              ANumeroAutorizacao,
                                              AIdUsuarioResponsavel);

   if LDados.Count = 0 then
      begin
      InformationMessage('Não foram encotrados registros que atendam aos filtros especificados !',C_TITULO_MENSAGENS);
      Fdm.mtbDesignacoes.Close;
      Exit;
   end;

   Fdm.mtbDesignacoes.Close;
   TFuncoesJSON.PopularTabela(Fdm.mtbDesignacoes, LDados);

   if ANumeroAutorizacao = '' then
      LProcesso := 'Filtro não especificado'
   else
      LProcesso := ANumeroAutorizacao;

   if not AUsaData then
      LPeriodo := 'Período não especificado'
   else
      LPeriodo := 'entre ' + FormatDateTime('dd/mm/yyyy',ADataInicial) + ' e ' + FormatDateTime('dd/mm/yyyy',ADataFinal);

   Fdm.setParameters(C_TIPO_SIAGS,
                    'Nº da Autorização',
                    LProcesso,
                    LPeriodo,
                    ANomeResponsavel,
                    'Autorização:  ');

   Fdm.frpDesignacoes.ShowReport();
end;

procedure TSrvRelatorioDesignacoes.PopularTabelasDeUsuarios;
begin
   TFuncoesJSON.PopularTabela(Fdm.mtbUsuariosAutoSc,    FPxyAutoSC.Usuarios);
   TFuncoesJSON.PopularTabela(Fdm.mtbUsuariosSiags,     FPxySiags.Usuarios(Seguranca.id));
   TFuncoesJSON.PopularTabela(Fdm.mtbUsuariosControlPc, FPxyControlPc.Usuarios(Seguranca.id));

   IncluirRegistro(Fdm.mtbUsuariosAutoSc, 'Nome_Usuario', C_TODOS);
   IncluirRegistro(Fdm.mtbUsuariosSiags, 'Nome_Usuario', C_TODOS);
   IncluirRegistro(Fdm.mtbUsuariosControlPc, 'Nome_Usuario', C_TODOS);
end;

end.
