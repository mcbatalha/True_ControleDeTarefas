unit Services.Listagens.Designacoes;

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

  Providers.Listagens.Designacoes,

  Providers.Panels.Conexao;

type
  TSrvListagensDesignacoes = class
  private
     Fdm           : TdtmListagensDesinacoes;
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

     procedure ListagemAutoSc(const ANumeroProcesso : String;
                              const AUsaData : Boolean;
                              const ADataInicial, ADataFinal : TDateTime;
                              const AIdUsuarioResponsavel : integer;
                              const ANomeResponsavel : String);

     procedure ListagemSiags(const ANumeroAutorizacao : String;
                             const AUsaData : Boolean;
                             const ADataInicial, ADataFinal : TDateTime;
                             const AIdUsuarioResponsavel : integer;
                             const ANomeResponsavel : String);

     procedure ListagemControlPc(const ANumeroProtocolo : String;
                                 const AUsaData : Boolean;
                                 const ADataInicial, ADataFinal : TDateTime;
                                 const AIdUsuarioResponsavel : integer;
                                 const ANomeResponsavel : String);


     destructor destroy(); override;


  end;


implementation

{ TSrvSiags }

constructor TSrvListagensDesignacoes.create;
begin
   Application.CreateForm(TdtmListagensDesinacoes, Fdm);

   FPxySiags     := TSMSiagsClient.Create(FDm.SQLConnection.DBXConnection);
   FPxyAutoSc    := TSMAutoScClient.Create(FDm.SQLConnection.DBXConnection);
   FPxyControlPc := TSMControlPcClient.Create(FDm.SQLConnection.DBXConnection);

   PopularTabelasDeUsuarios;
end;

function TSrvListagensDesignacoes.DataSetUsuarioAutoSc: TDataSet;
begin
   Result := Fdm.mtbUsuariosAutoSc;
end;

function TSrvListagensDesignacoes.DataSetUsuarioControlPc: TDataSet;
begin
   Result := Fdm.mtbUsuariosControlPc;
end;

function TSrvListagensDesignacoes.DataSetUsuarioSiags: TDataSet;
begin
   Result := Fdm.mtbUsuariosSiags;
end;

destructor TSrvListagensDesignacoes.destroy;
begin
   FreeAndNil(FPxySiags);
   FreeAndNil(FPxyAutoSc);
   FreeAndNil(FPxyControlPc);
   FreeAndNil(Fdm);

  inherited;
end;



procedure TSrvListagensDesignacoes.ListagemAutoSc(
   const ANumeroProcesso: String;
   const AUsaData: Boolean;
   const ADataInicial, ADataFinal: TDateTime;
   const AIdUsuarioResponsavel: integer;
   const ANomeResponsavel : String);
var
   LProcesso : String;
   LPeriodo  : String;

begin
   TFuncoesJSON.PopularTabela(Fdm.mtbDesignacoes, FPxyAutoSc.ListagemDeDesignacoes(AUsaData,
                                                                                   ADataInicial,
                                                                                   ADataFinal,
                                                                                   ANumeroProcesso,
                                                                                   AIdUsuarioResponsavel));
   if Fdm.mtbDesignacoes.isEmpty then
      begin
      InformationMessage('Não foram encotrados registros que atendam aos filtros especificados !',C_TITULO_MENSAGENS);
      Fdm.mtbDesignacoes.Close;
      Exit;
   end;

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

procedure TSrvListagensDesignacoes.ListagemControlPc(
   const ANumeroProtocolo: String;
   const AUsaData: Boolean;
   const ADataInicial, ADataFinal: TDateTime;
   const AIdUsuarioResponsavel: integer;
   const ANomeResponsavel : String);

var
   LProcesso: String;
   LPeriodo:  String;
begin
   TFuncoesJSON.PopularTabela(Fdm.mtbDesignacoes, FPxyControlPc.ListagemDeDesignacoes(AUsaData,
                                                                                      ADataInicial,
                                                                                      ADataFinal,
                                                                                      ANumeroProtocolo,
                                                                                      AIdUsuarioResponsavel));
   if Fdm.mtbDesignacoes.isEmpty then
      begin
      InformationMessage('Não foram encotrados registros que atendam aos filtros especificados !',C_TITULO_MENSAGENS);
      Fdm.mtbDesignacoes.Close;
      Exit;
   end;

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

procedure TSrvListagensDesignacoes.ListagemSiags(
   const ANumeroAutorizacao: String;
   const AUsaData: Boolean;
   const ADataInicial, ADataFinal: TDateTime;
   const AIdUsuarioResponsavel: integer;
   const ANomeResponsavel : String);

var
   LProcesso: String;
   LPeriodo:  String;

begin
   TFuncoesJSON.PopularTabela(Fdm.mtbDesignacoes, FPxySiags.ListagemDeDesignacoes(AUsaData,
                                                                                  ADataInicial,
                                                                                  ADataFinal,
                                                                                  ANumeroAutorizacao,
                                                                                  AIdUsuarioResponsavel));

   if Fdm.mtbDesignacoes.isEmpty then
      begin
      InformationMessage('Não foram encotrados registros que atendam aos filtros especificados !',C_TITULO_MENSAGENS);
      Fdm.mtbDesignacoes.Close;
      Exit;
   end;

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

procedure TSrvListagensDesignacoes.PopularTabelasDeUsuarios;
begin
   TFuncoesJSON.PopularTabela(Fdm.mtbUsuariosAutoSc,    FPxyAutoSC.Usuarios);
   TFuncoesJSON.PopularTabela(Fdm.mtbUsuariosSiags,     FPxySiags.Usuarios);
   TFuncoesJSON.PopularTabela(Fdm.mtbUsuariosControlPc, FPxyControlPc.Usuarios);

   IncluirRegistro(Fdm.mtbUsuariosAutoSc, 'Nome_Usuario', C_TODOS);
   IncluirRegistro(Fdm.mtbUsuariosSiags, 'Nome_Usuario', C_TODOS);
   IncluirRegistro(Fdm.mtbUsuariosControlPc, 'Nome_Usuario', C_TODOS);
end;

end.
