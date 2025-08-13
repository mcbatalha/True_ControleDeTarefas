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

  Providers.Panels.AutoSC,
  Providers.Panels.Conexao;

type

  TSrvAutoSC = class
  private
     FdmAutoSC      : TdtmPainelAutoSC;
     FPxyAutoSC     : TSMAutoSCClient;

     procedure TabelasDeDominio;

     const
        C_TITULO_MENSAGENS = 'Designação de Processo AUTOSC';
  public
     constructor Create(ASqlConnection : TSQLConnection);

     function DataSetPesquisaDeUsuario : TDataSet;
     function DataSourceDesignacao : TDataSource;
     function DataSourceObservacao : TDataSource;
     function DataSourceStatusTrue : TDataSource;
     function DataSourceSetores    : TDataSource;
     function Filtrar(const AFiltros : TJSONObject; const AIncluirEncerrados : Boolean = False) : Boolean;
     function NumeroDoProcesso  : String;
     procedure DesignacaoIncluirTodos;
     procedure DesignacaoExcluirTodos;

     function idSetorDesignado   : integer;
     function idUsuarioDesignado : integer;
     function TemRegistros     : Boolean;
     function TemDesignacoes   : Boolean;
     function TemAtualizacoes  : Boolean;
     function TemObservacoes   : Boolean;

     function Designar(const AJustificativa : String; const AIdSetor, AIdUsuario : Integer) : Boolean;
     function AlterarStatusTrue(const AIdNovoStatus : integer; const AJustificativa : String) : Boolean;


     function HistoricoDeDesignacoes : String;
     function HistoricoDeAtualizacoes : String;
     function ObservacoesDoProcesso : String;

     procedure IncluirObservacao;
     function GravarObservacao(const AObservacao : String): Boolean;
     procedure CancelarObservacao;

     procedure ImprimirExtrato(const AProcesso : String; const AFecharTabelas : Boolean);

     procedure PosicionarRegistro(const ANumero: String);
     procedure HabilitarControles;
     procedure DesabilitarControles;

     destructor Destroy(); override;

  end;



implementation

{ TSrvImportacaoAutoAc }

function TSrvAutoSC.DataSourceDesignacao: TDataSource;
begin
   Result := FdmAutoSC.dtsHistoricoDesignacoes
end;

function TSrvAutoSC.DataSourceObservacao: TDataSource;
begin
   Result := FdmAutoSC.dtsObservacoes;
end;

function TSrvAutoSC.DataSourceSetores: TDataSource;
begin
   Result := FdmAutoSC.dtsSetores;
end;

function TSrvAutoSC.DataSourceStatusTrue: TDataSource;
begin
   Result := FdmAutoSC.dtsSetores;
end;

function TSrvAutoSC.DataSetPesquisaDeUsuario : TDataSet;
begin
   Result := FdmAutoSC.mtbUsuarios;
end;

procedure TSrvAutoSC.CancelarObservacao;
begin
   FdmAutoSC.mtbObservacoes.Cancel;
end;

constructor TSrvAutoSC.Create(ASqlConnection : TSQLConnection);
begin
//   FPxyAutoSC := TSMAutoSCClient.Create(FdmAutoSC.SQLConnection.DBXConnection);

   Application.CreateForm(TdtmPainelAutoSC, FdmAutoSC);
   FPxyAutoSC := TSMAutoSCClient.Create(ASqlConnection.DBXConnection);

   TabelasDeDominio;
end;

procedure TSrvAutoSC.DesabilitarControles;
begin
   FdmAutoSC.cdsPainel.DisableControls;
end;

procedure TSrvAutoSC.DesignacaoExcluirTodos;
begin
   if FdmAutoSC.mtbSetores.Locate('Nome_Setor',C_TODOS)  then
      FdmAutoSC.mtbSetores.Delete;

   if FdmAutoSC.mtbUsuarios.Locate('Nome_Usuario',C_TODOS)  then
      FdmAutoSC.mtbUsuarios.Delete;

end;

procedure TSrvAutoSC.DesignacaoIncluirTodos;
begin
   IncluirRegistro(FdmAutoSC.mtbSetores, 'Nome_Setor', C_TODOS);
   IncluirRegistro(FdmAutoSC.mtbUsuarios, 'Nome_Usuario', C_TODOS);
 end;

function TSrvAutoSC.Designar(const AJustificativa: String; const AIdSetor, AIdUsuario: Integer): Boolean;
begin
   Result := False;

   if not QuestionMessage('Confirma a designação do processo ? ',C_TITULO_MENSAGENS) then
      Exit;

   if Length(Trim(AJustificativa)) < 5 then
      begin
      InformationMessage('Justificativa inválida.', C_TITULO_MENSAGENS);
      Exit;
   end;


   if (AIdSetor = C_CODIGO_NAO_DESIGNADO) and (AIdUsuario = C_CODIGO_NAO_DESIGNADO) then
      begin
      InformationMessage('É preciso selecionar um setor ou um usuário para designação.', C_TITULO_MENSAGENS);
      Exit;
   end;


   if (AIdSetor = C_CODIGO_NAO_DESIGNADO) and (AIdUsuario <> C_CODIGO_NAO_DESIGNADO) then
      begin
      InformationMessage('É preciso selecionar o setor do usuário para designação.', C_TITULO_MENSAGENS);
      Exit;
   end;

   if not FPxyAutoSC.Designar(AJustificativa,
                              AIdSetor,
                              AIdUsuario,
                              Seguranca.id,
                              FdmAutoSC.cdsPainelid_Processo.AsInteger ) then
      begin
      InformationMessage('Ocorreu um erro na tentativa de gravar os dados de designação.',C_TITULO_MENSAGENS);
      Exit;
   end;


   FdmAutoSC.cdsPainel.Edit;
   if AIdSetor <> C_CODIGO_NAO_DESIGNADO then
      begin
      FdmAutoSC.mtbSetores.Locate('id',AIdSetor);
      FdmAutoSC.cdsPainelid_Setor_Designado.AsInteger := AIdSetor;
      FdmAutoSC.cdsPainelSetor_Designado.AsString     := FdmAutoSC.mtbSetoresNome_Setor.AsString;
   end else
      begin
      FdmAutoSC.cdsPainelid_Setor_Designado.Clear;
      FdmAutoSC.cdsPainelSetor_Designado.AsString := C_DESCRICAO_NAO_DESIGNADO;
   end;

   if AIdUsuario <> C_CODIGO_NAO_DESIGNADO then
      begin
      FdmAutoSC.mtbUsuarios.Locate('id',AIdUsuario);
      FdmAutoSC.cdsPainelid_Usuario_Designado.AsInteger := AIdUsuario;
      FdmAutoSC.cdsPainelUsuario_Designado.AsString     := FdmAutoSC.mtbUsuariosNome_Usuario.AsString;
   end else
      begin
      FdmAutoSC.cdsPainelid_Usuario_Designado.Clear;
      FdmAutoSC.cdsPainelUsuario_Designado.AsString := C_DESCRICAO_NAO_DESIGNADO;
   end;

   FdmAutoSC.cdsPainelQtd_Designacoes.AsInteger := FdmAutoSC.cdsPainelQtd_Designacoes.AsInteger + 1;

   FdmAutoSC.cdsPainel.Post;
   Result := True;
end;

destructor TSrvAutoSC.Destroy;
begin

   FreeAndNil(FPxyAutoSC);
   FreeAndNil(FdmAutoSC);

   inherited;
end;

function TSrvAutoSC.AlterarStatusTrue(const AIdNovoStatus : integer; const AJustificativa: String): Boolean;
begin
   Result := False;
   if not QuestionMessage('Confirma o encerramento do processo ' + FdmAutoSC.cdsPainelNumero_Processo.AsString + ' ? ','Encerramento de Processo') then
      Exit;

   if FPxyAutoSC.AlterarStatus(FdmAutoSC.cdsPainelid_Processo.AsInteger, AIdNovoStatus, AJustificativa, Seguranca.id) then
      begin
      FdmAutoSC.cdsPainel.Delete;
      InformationMessage('Processo encerrado com sucesso !','Encerramento de Processo');
      Result := True;
   end;
end;

function TSrvAutoSC.Filtrar(const AFiltros: TJSONObject; const AIncluirEncerrados : Boolean = False) : Boolean;
var
   LDados : TJSONArray;
begin
   Result := True;

   FdmAutoSC.cdsPainel.Close;
   LDados := FPxyAutoSC.FiltrarProcessos(AFiltros, AIncluirEncerrados);
   if LDados.Count > 0 then
      TFuncoesJSON.PopularTabela(FdmAutoSC.cdsPainel, LDados);

end;

function TSrvAutoSC.GravarObservacao(const AObservacao : String): Boolean;
var
   LDataHora : TDateTime;
begin
   Result := False;

   if not QuestionMessage('Confirma o registro da observação para o processo ?','Observações') then
      exit;

   Result := FPxyAutoSC.RegistrarObservacao(FdmAutoSC.cdsPainelid_Processo.AsInteger,
                                            AObservacao,
                                            Seguranca.id,
                                            LDataHora);
   if Result then
      begin
      InformationMessage('Observação registrada com sucesso !','Observações');
      FdmAutoSC.mtbObservacoesData_Hora.AsDateTime := LDataHora;
      FdmAutoSC.mtbObservacoes.Post;

      FdmAutoSC.cdsPainel.Edit;
      FdmAutoSC.cdsPainelQtd_Observacoes.AsInteger := FdmAutoSC.cdsPainelQtd_Observacoes.AsInteger + 1;
      FdmAutoSC.cdsPainel.Post;
   end else
      InformationMessage('Ocorreu um erro na tentativa de registrar a observação !','Observações');
end;

procedure TSrvAutoSC.HabilitarControles;
begin
   FdmAutoSC.cdsPainel.EnableControls;
end;

function TSrvAutoSC.HistoricoDeAtualizacoes : String;
begin
   TFuncoesJSON.PopularTabela(FdmAutoSC.mtbHistoricoAtualizacoes, FPxyAutoSC.HistoricoDeAtualizacoes(FdmAutoSC.cdsPainelid_Processo.AsInteger));
   Result := FdmAutoSC.cdsPainelNumero_Processo.AsString;
end;

function TSrvAutoSC.HistoricoDeDesignacoes : String;
begin
   TFuncoesJSON.PopularTabela(FdmAutoSC.mtbHistoricoDesignacoes, FPxyAutoSC.HistoricoDeDesignacoes(FdmAutoSC.cdsPainelid_Processo.AsInteger));
   Result := FdmAutoSC.cdsPainelNumero_Processo.AsString;
end;

procedure TSrvAutoSC.ImprimirExtrato(const AProcesso : String; const AFecharTabelas : Boolean);
var
   LFiltroAutoSC  : TFiltros;
   LAutoSc        : TFiltrosAutoSc;
   LDados         : TJSONArray;
begin
   if AProcesso = '' then
      begin
      InformationMessage('Informe o nº do processo.','Impressão de Extrato');
      Exit;
   end;

   LFiltroAutoSC := TFiltros.create(C_CODIGO_AUTOSC);
   try
      LAutoSc := LFiltroAutoSC.getFiltrosAutoSCAsRecord;
      LAutoSc.numeroDoProcesso   := AProcesso;
      LAutoSc.idUsuarioDesignado := 0;

      LFiltroAutoSC.setFiltrosAutoSC(LAutoSc);

      if not Filtrar(LFiltroAutoSC.getFiltrosAutoSCAsJSON, True) or (not TemRegistros) then
         begin
         InformationMessage('Processo não localizado.','Impressão de Extrato');
         Exit;
      end;


      if TemAtualizacoes then
         HistoricoDeAtualizacoes;

      if TemObservacoes then
         ObservacoesDoProcesso;

      if TemDesignacoes then
         begin
         LDados := FPxyAutoSc.RelatorioDeDesignacoes(True,
                                                     StrToDate('01/01/2025'),
                                                     Date,
                                                     FdmAutoSC.cdsPainelNumero_Processo.AsString,
                                                     0);

         FdmAutoSC.mtbDesignacoes.Close;
         if LDados.Count > 0 then
            TFuncoesJSON.PopularTabela(FdmAutoSC.mtbDesignacoes, LDados)
         else
            FdmAutoSC.mtbDesignacoes.Open;
      end;

      FdmAutoSC.frpExtrato.Showreport();

   finally
      FreeAndNil(LFiltroAutoSC);
      if AFecharTabelas then
         begin
         FdmAutoSC.cdsPainel.Close;
         FdmAutoSC.mtbDesignacoes.Close;
         FdmAutoSC.mtbHistoricoAtualizacoes.Close;
         FdmAutoSC.mtbObservacoes.Close;
      end;
   end;
end;

procedure TSrvAutoSC.IncluirObservacao;
begin
   FdmAutoSC.mtbObservacoes.Append;
   FdmAutoSC.mtbObservacoesNome_Usuario.AsString := Seguranca.Nome;
   FdmAutoSC.mtbObservacoesData_Hora.AsDateTime  := Now;
end;

function TSrvAutoSC.NumeroDoProcesso: String;
begin
   Result := FdmAutoSC.cdsPainelNumero_Processo.AsString;
end;

function TSrvAutoSC.ObservacoesDoProcesso: String;
begin
   FdmAutoSC.mtbObservacoes.Close;
   if FdmAutoSC.cdsPainelQtd_Observacoes.AsInteger > 0 then
      TFuncoesJSON.PopularTabela(FdmAutoSC.mtbObservacoes, FPxyAutoSC.ObservacoesDoProcesso(FdmAutoSC.cdsPainelid_Processo.AsInteger))
   else
      FdmAutoSC.mtbObservacoes.Open;
   Result := FdmAutoSC.cdsPainelNumero_Processo.AsString;
end;

procedure TSrvAutoSC.PosicionarRegistro(const ANumero: String);
begin
   FdmAutoSC.cdsPainel.Locate('Numero_Processo',ANumero,[]);
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
   TFuncoesJSON.PopularTabela(FdmAutoSC.mtbUsuarios, FPxyAutoSC.Usuarios);
   TFuncoesJSON.PopularTabela(FdmAutoSC.mtbUF, ListaDeUFs);

   IncluirRegistro(FdmAutoSC.mtbTiposAuditoria, 'Tipo_Auditoria', C_TODAS);
   IncluirRegistro(FdmAutoSC.mtbTiposPrazo,  'Tipo_Prazo_Caixa', C_TODOS);
   IncluirRegistro(FdmAutoSC.mtbTiposPrazoAns,  'Tipo_Prazo_Caixa', C_TODOS);
   IncluirRegistro(FdmAutoSC.mtbTiposPrazoHoje,  'Tipo_Prazo_Caixa_Hoje', C_TODOS);
   IncluirRegistro(FdmAutoSC.mtbTiposProcesso, 'Tipo_Processo', C_TODOS);
   IncluirRegistro(FdmAutoSC.mtbTiposProcessoE, 'Tipo_Processo_E', C_TODOS);
   IncluirRegistro(FdmAutoSC.mtbTiposStatus, 'Tipo_Status', C_TODOS);
   IncluirRegistro(FdmAutoSC.mtbSetores, 'Nome_Setor', C_DESCRICAO_NAO_DESIGNADO, C_CODIGO_NAO_DESIGNADO);

   IncluirRegistro(FdmAutoSC.mtbUsuarios, 'Nome_Usuario', C_DESCRICAO_NAO_DESIGNADO, C_CODIGO_NAO_DESIGNADO);
   IncluirRegistro(FdmAutoSC.mtbUF, 'Sigla', C_TODOS);

   DesignacaoIncluirTodos;
end;

function TSrvAutoSC.TemAtualizacoes: Boolean;
begin
   Result := FdmAutoSC.cdsPainelQtd_Historicos.AsInteger > 0;
end;

function TSrvAutoSC.TemDesignacoes: Boolean;
begin
   Result := FdmAutoSC.cdsPainelQtd_Designacoes.AsInteger > 0;
end;

function TSrvAutoSC.TemObservacoes: Boolean;
begin
   Result := FdmAutoSC.cdsPainelQtd_Observacoes.AsInteger > 0;
end;

function TSrvAutoSC.TemRegistros: Boolean;
begin
   Result := (FdmAutoSC.cdsPainel.State = dsBrowse) and (not FdmAutoSC.cdsPainel.IsEmpty);
end;

function TSrvAutoSC.idSetorDesignado : integer;
begin
   Result := FdmAutoSC.cdsPainelid_Setor_Designado.asinteger;
end;

function TSrvAutoSC.idUsuarioDesignado: integer;
begin
   Result := FdmAutoSC.cdsPainelid_Usuario_Designado.asinteger;
end;

end.
