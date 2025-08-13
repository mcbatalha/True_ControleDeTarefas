unit Services.Relatorios.Encerramento;

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

  Providers.Relatorios.Encerramentos,

  Providers.Panels.Conexao;
type
  TSrvRelatorioEncerramentos = class
  private
     Fdm           : TdtmRelatoriosEncerramento;
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

     procedure RelatorioAutoSc(const ADataInicial, ADataFinal : TDateTime;
                               const AIdUsuarioResponsavel : integer;
                               const ANomeResponsavel : String);

     procedure RelatorioSiags(const ADataInicial, ADataFinal : TDateTime;
                              const AIdUsuarioResponsavel : integer;
                              const ANomeResponsavel : String);

     procedure RelatorioControlPc(const ADataInicial, ADataFinal : TDateTime;
                                  const AIdUsuarioResponsavel : integer;
                                  const ANomeResponsavel : String);


     destructor destroy(); override;
  end;


implementation

{ TSrvRelatorioEncerramentos }

constructor TSrvRelatorioEncerramentos.create;
begin
   Application.CreateForm(TdtmRelatoriosEncerramento, Fdm);

   FPxySiags     := TSMSiagsClient.Create(FDm.SQLConnection.DBXConnection);
   FPxyAutoSc    := TSMAutoScClient.Create(FDm.SQLConnection.DBXConnection);
   FPxyControlPc := TSMControlPcClient.Create(FDm.SQLConnection.DBXConnection);

   PopularTabelasDeUsuarios;
end;

function TSrvRelatorioEncerramentos.DataSetUsuarioAutoSc: TDataSet;
begin
   Result := Fdm.mtbUsuariosAutoSc;
end;

function TSrvRelatorioEncerramentos.DataSetUsuarioControlPc: TDataSet;
begin
   Result := Fdm.mtbUsuariosControlPc;
end;

function TSrvRelatorioEncerramentos.DataSetUsuarioSiags: TDataSet;
begin
   Result := Fdm.mtbUsuariosSiags;
end;

destructor TSrvRelatorioEncerramentos.destroy;
begin
   FreeAndNil(FPxySiags);
   FreeAndNil(FPxyAutoSc);
   FreeAndNil(FPxyControlPc);
   FreeAndNil(Fdm);
   inherited;
end;

procedure TSrvRelatorioEncerramentos.PopularTabelasDeUsuarios;
begin
   TFuncoesJSON.PopularTabela(Fdm.mtbUsuariosAutoSc,    FPxyAutoSC.Usuarios);
   TFuncoesJSON.PopularTabela(Fdm.mtbUsuariosSiags,     FPxySiags.Usuarios(Seguranca.id));
   TFuncoesJSON.PopularTabela(Fdm.mtbUsuariosControlPc, FPxyControlPc.Usuarios(Seguranca.id));

   IncluirRegistro(Fdm.mtbUsuariosAutoSc, 'Nome_Usuario', C_TODOS);
   IncluirRegistro(Fdm.mtbUsuariosSiags, 'Nome_Usuario', C_TODOS);
   IncluirRegistro(Fdm.mtbUsuariosControlPc, 'Nome_Usuario', C_TODOS);
end;

procedure TSrvRelatorioEncerramentos.RelatorioAutoSc(
   const ADataInicial, ADataFinal: TDateTime;
   const AIdUsuarioResponsavel: integer;
   const ANomeResponsavel: String);
var
   LProcesso : String;
   LPeriodo  : String;
   LDados    : TJSONArray;
begin

   LDados := FPxyAutoSc.RelatorioDeEncerramentos(ADataInicial,
                                                 ADataFinal,
                                                 AIdUsuarioResponsavel);
   if LDados.Count = 0 then
      begin
      InformationMessage('Não foram encotrados registros que atendam aos filtros especificados !',C_TITULO_MENSAGENS);
      Fdm.mtbEncerramentos.Close;
      Exit;
   end;

   Fdm.mtbEncerramentos.Close;
   TFuncoesJSON.PopularTabela(Fdm.mtbEncerramentos,LDados);

   LPeriodo := 'entre ' + FormatDateTime('dd/mm/yyyy',ADataInicial) + ' e ' + FormatDateTime('dd/mm/yyyy',ADataFinal);

   Fdm.setParameters(C_TIPO_AUTOSC,
                     'Nº do Processo',
                     LProcesso,
                     LPeriodo,
                     ANomeResponsavel,
                     'Processo');

   Fdm.frpEncerramentos.ShowReport();
end;

procedure TSrvRelatorioEncerramentos.RelatorioControlPc(
   const ADataInicial, ADataFinal: TDateTime;
   const AIdUsuarioResponsavel: integer;
   const ANomeResponsavel: String);
var
   LProtocolo : String;
   LPeriodo  : String;
   LDados    : TJSONArray;
begin

   LDados := FPxyControlPc.RelatorioDeEncerramentos(ADataInicial,
                                                    ADataFinal,
                                                    AIdUsuarioResponsavel);
   if LDados.Count = 0 then
      begin
      InformationMessage('Não foram encotrados registros que atendam aos filtros especificados !',C_TITULO_MENSAGENS);
      Fdm.mtbEncerramentos.Close;
      Exit;
   end;

   Fdm.mtbEncerramentos.Close;
   TFuncoesJSON.PopularTabela(Fdm.mtbEncerramentos,LDados);

   LPeriodo := 'entre ' + FormatDateTime('dd/mm/yyyy',ADataInicial) + ' e ' + FormatDateTime('dd/mm/yyyy',ADataFinal);

   Fdm.setParameters(C_TIPO_CONTROLPC,
                     'Nº do Protocolo',
                     LProtocolo,
                     LPeriodo,
                     ANomeResponsavel,
                     'Protocolo');

   Fdm.frpEncerramentos.ShowReport();
end;

procedure TSrvRelatorioEncerramentos.RelatorioSiags(
   const ADataInicial, ADataFinal: TDateTime;
   const AIdUsuarioResponsavel: integer;
   const ANomeResponsavel: String);
var
   LAutorizacao : String;
   LPeriodo  : String;
   LDados    : TJSONArray;
begin

   LDados := FPxySiags.RelatorioDeEncerramentos(ADataInicial,
                                                    ADataFinal,
                                                    AIdUsuarioResponsavel);
   if LDados.Count = 0 then
      begin
      InformationMessage('Não foram encotrados registros que atendam aos filtros especificados !',C_TITULO_MENSAGENS);
      Fdm.mtbEncerramentos.Close;
      Exit;
   end;

   Fdm.mtbEncerramentos.Close;
   TFuncoesJSON.PopularTabela(Fdm.mtbEncerramentos,LDados);

   LPeriodo := 'entre ' + FormatDateTime('dd/mm/yyyy',ADataInicial) + ' e ' + FormatDateTime('dd/mm/yyyy',ADataFinal);

   Fdm.setParameters(C_TIPO_Siags,
                     'Nº da Autorização',
                     LAutorizacao,
                     LPeriodo,
                     ANomeResponsavel,
                     'Autorização');

   Fdm.frpEncerramentos.ShowReport();
end;

end.
