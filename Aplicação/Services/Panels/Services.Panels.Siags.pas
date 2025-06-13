unit Services.Panels.Siags;

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

  Providers.Panels.Siags,
  Providers.Panels.Conexao;

type
  TSrvSiags = class
  private
     FdmSiags      : TdtmPainelSiags;
     FPxySiags     : TSMSiagsClient;

     procedure TabelasDeDominio;

     const
        C_TITULO_MENSAGENS = 'Designação de Autorizações SIAGS';
  public
     constructor Create(ASqlConnection : TSQLConnection);

     function DataSetPesquisaDeUsuario : TDataSet;
     function DataSourceDesignacao : TDataSource;
     function DataSourceObservacao : TDataSource;
     function Filtrar(const AFiltros : TJSONObject) : Boolean;
     function NumeroDaAutorizacao  : String;
     procedure DesignacaoIncluirTodos;
     procedure DesignacaoExcluirTodos;

     function SetorDesignado : integer;
     function UsuarioDesignado : integer;
     function TemRegistros : Boolean;
     function TemDesignacoes : Boolean;
     function TemAtualizacoes: Boolean;
     function Designar(const AJustificativa : String; const AIdSetor, AIdUsuario : Integer) : Boolean;
     function Encerrar(const AJustificativa : String) : Boolean;


     function HistoricoDeDesignacoes : String;
     function HistoricoDeAtualizacoes : String;
     function ObservacoesDaAutorizacao : String;

     procedure IncluirObservacao;
     function GravarObservacao(const AObservacao : String): Boolean;
     procedure CancelarObservacao;


     destructor Destroy(); override;

  end;



implementation

{ TSrvImportacaoAutoAc }

function TSrvSiags.DataSourceDesignacao: TDataSource;
begin
   Result := FdmSiags.dtsHistoricoDesignacoes
end;

function TSrvSiags.DataSourceObservacao: TDataSource;
begin
   Result := FdmSiags.dtsObservacoesProcesso;
end;

function TSrvSiags.DataSetPesquisaDeUsuario : TDataSet;
begin
   Result := FdmSiags.mtbUsuarios;
end;

procedure TSrvSiags.CancelarObservacao;
begin
   FdmSiags.mtbObservacoesProcesso.Cancel;
end;

constructor TSrvSiags.Create(ASqlConnection : TSQLConnection);
begin
//   FPxySiags := TSMSiagsClient.Create(FdmSiags.SQLConnection.DBXConnection);

   Application.CreateForm(TdtmPainelSiags, FdmSiags);
   FPxySiags := TSMSiagsClient.Create(ASqlConnection.DBXConnection);

   TabelasDeDominio;
end;

procedure TSrvSiags.DesignacaoExcluirTodos;
begin
   if FdmSiags.mtbSetores.Locate('Nome_Setor',C_TODOS)  then
      FdmSiags.mtbSetores.Delete;

   if FdmSiags.mtbUsuarios.Locate('Nome_Usuario',C_TODOS)  then
      FdmSiags.mtbUsuarios.Delete;

end;

procedure TSrvSiags.DesignacaoIncluirTodos;
begin
   IncluirRegistro(FdmSiags.mtbSetores, 'Nome_Setor', C_TODOS);
   IncluirRegistro(FdmSiags.mtbUsuarios, 'Nome_Usuario', C_TODOS);
 end;

function TSrvSiags.Designar(const AJustificativa: String; const AIdSetor, AIdUsuario: Integer): Boolean;
begin
   Result := False;

   if not QuestionMessage('Confirma a designação da autorização ? ',C_TITULO_MENSAGENS) then
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

   if not FPxySiags.Designar(AJustificativa,
                             AIdSetor,
                             AIdUsuario,
                             Seguranca.id,
                             FdmSiags.cdsPainelid_Autorizacao.AsInteger ) then
      begin
      InformationMessage('Ocorreu um erro na tentativa de gravar os dados de designação.',C_TITULO_MENSAGENS);
      Exit;
   end;


   FdmSiags.cdsPainel.Edit;
   if AIdSetor <> C_CODIGO_NAO_DESIGNADO then
      begin
      FdmSiags.mtbSetores.Locate('id',AIdSetor);
      FdmSiags.cdsPainelid_Setor_Designado.AsInteger := AIdSetor;
      FdmSiags.cdsPainelSetor_Designado.AsString     := FdmSiags.mtbSetoresNome_Setor.AsString;
   end;

   if AIdUsuario <> C_CODIGO_NAO_DESIGNADO then
      begin
      FdmSiags.mtbUsuarios.Locate('id',AIdUsuario);
      FdmSiags.cdsPainelid_Usuario_Designado.AsInteger := AIdUsuario;
      FdmSiags.cdsPainelUsuario_Designado.AsString     := FdmSiags.mtbUsuariosNome_Usuario.AsString;
   end;
   FdmSiags.cdsPainelQtd_Designacoes.AsInteger := FdmSiags.cdsPainelQtd_Designacoes.AsInteger + 1;

   FdmSiags.cdsPainel.Post;
   Result := True;
end;

destructor TSrvSiags.Destroy;
begin

   FreeAndNil(FPxySiags);
   FreeAndNil(FdmSiags);

   inherited;
end;

function TSrvSiags.Encerrar(const AJustificativa: String): Boolean;
begin
   Result := False;
   if not QuestionMessage('Confirma o encerramento do autorização ' + FdmSiags.cdsPainelNumero_Autorizacao.AsString + ' ? ','Encerramento') then
      Exit;

   if FPxySiags.EncerrarAutorizacao(FdmSiags.cdsPainelid_Autorizacao.AsInteger, AJustificativa, Seguranca.id) then
      begin
      FdmSiags.cdsPainel.Delete;
      InformationMessage('Autorização encerrada com sucesso !','Encerramento');
      Result := True;
   end;
end;

function TSrvSiags.Filtrar(const AFiltros: TJSONObject): Boolean;
var
   LDados : TJSONArray;
begin
   Result := True;

   FdmSiags.cdsPainel.Close;
   LDados := FPxySiags.FiltrarAutorizacoes(AFiltros);
   if LDados.Count > 0 then
      TFuncoesJSON.PopularTabela(FdmSiags.cdsPainel, LDados);

end;

function TSrvSiags.GravarObservacao(const AObservacao : String): Boolean;
var
   LDataHora : TDateTime;
begin
   Result := False;

   if not QuestionMessage('Confirma o registro da observação para a autorização ?','Observações') then
      exit;

   Result := FPxySiags.RegistrarObservacao(FdmSiags.cdsPainelid_Autorizacao.AsInteger,
                                            AObservacao,
                                            Seguranca.id,
                                            LDataHora);
   if Result then
      begin
      InformationMessage('Observação registrada com sucesso !','Observações');
      FdmSiags.mtbObservacoesProcessoData_Hora.AsDateTime := LDataHora;
      FdmSiags.mtbObservacoesProcesso.Post;

      FdmSiags.cdsPainel.Edit;
      FdmSiags.cdsPainelQtd_Observacoes.AsInteger := FdmSiags.cdsPainelQtd_Observacoes.AsInteger + 1;
      FdmSiags.cdsPainel.Post;
   end else
      InformationMessage('Ocorreu um erro na tentativa de registrar a observação !','Observações');
end;

function TSrvSiags.HistoricoDeAtualizacoes : String;
begin
   TFuncoesJSON.PopularTabela(FdmSiags.mtbHistoricoAtualizacoes, FPxySiags.HistoricoDeAtualizacoes(FdmSiags.cdsPainelid_Autorizacao.AsInteger));
   Result := FdmSiags.cdsPainelNumero_Autorizacao.AsString;
end;

function TSrvSiags.HistoricoDeDesignacoes : String;
begin
   TFuncoesJSON.PopularTabela(FdmSiags.mtbHistoricoDesignacoes, FPxySiags.HistoricoDeDesignacoes(FdmSiags.cdsPainelid_Autorizacao.AsInteger));
   Result := FdmSiags.cdsPainelNumero_Autorizacao.AsString;
end;

procedure TSrvSiags.IncluirObservacao;
begin
   FdmSiags.mtbObservacoesProcesso.Append;
   FdmSiags.mtbObservacoesProcessoNome_Usuario.AsString := Seguranca.Nome;
   FdmSiags.mtbObservacoesProcessoData_Hora.AsDateTime  := Now;
end;

function TSrvSiags.NumeroDaAutorizacao: String;
begin
   Result := FdmSiags.cdsPainelNumero_Autorizacao.AsString;
end;

function TSrvSiags.ObservacoesDaAutorizacao: String;
begin
   FdmSiags.mtbObservacoesProcesso.Close;
   if FdmSiags.cdsPainelQtd_Observacoes.AsInteger > 0 then
      TFuncoesJSON.PopularTabela(FdmSiags.mtbObservacoesProcesso, FPxySiags.ObservacoesDaAutorizacao(FdmSiags.cdsPainelid_Autorizacao.AsInteger))
   else
      FdmSiags.mtbObservacoesProcesso.Open;
   Result := FdmSiags.cdsPainelNumero_Autorizacao.AsString;
end;

procedure TSrvSiags.TabelasDeDominio;
var
   LPrazos : TJSONArray;
begin
   LPrazos := FPxySiags.TiposDePrazo;
   TFuncoesJSON.PopularTabela(FdmSiags.mtbTiposAuditoria, FPxySiags.TiposDeAuditoria);
   TFuncoesJSON.PopularTabela(FdmSiags.mtbTiposPrazo, LPrazos);
   TFuncoesJSON.PopularTabela(FdmSiags.mtbTiposPrazoANS, LPrazos);
   TFuncoesJSON.PopularTabela(FdmSiags.mtbTiposAutorizacao, FPxySiags.TiposDeAutoriazacao);
   TFuncoesJSON.PopularTabela(FdmSiags.mtbTiposAtendimento, FPxySiags.TiposDeAtendimento);
   TFuncoesJSON.PopularTabela(FdmSiags.mtbTiposSituacaoAutorizacao, FPxySiags.TiposDeSituacaoAutorizacao);
   TFuncoesJSON.PopularTabela(FdmSiags.mtbTiposUltimaAnotacao, FPxySiags.TiposDeUltimaAnotacao);
   TFuncoesJSON.PopularTabela(FdmSiags.mtbSetores, FPxySiags.Setores);
   TFuncoesJSON.PopularTabela(FdmSiags.mtbUsuarios, FPxySiags.Usuarios);
   TFuncoesJSON.PopularTabela(FdmSiags.mtbUF, ListaDeUFs);

   IncluirRegistro(FdmSiags.mtbTiposAuditoria, 'Tipo_Auditoria', C_TODAS);
   IncluirRegistro(FdmSiags.mtbTiposPrazo, 'Tipo_Prazo_Caixa', C_TODOS);
   IncluirRegistro(FdmSiags.mtbTiposPrazoAns, 'Tipo_Prazo_Caixa', C_TODOS);
   IncluirRegistro(FdmSiags.mtbTiposAutorizacao, 'Tipo_Autorizacao', C_TODAS);
   IncluirRegistro(FdmSiags.mtbTiposAtendimento, 'Tipo_Atendimento', C_TODOS);
   IncluirRegistro(FdmSiags.mtbTiposSituacaoAutorizacao, 'Tipo_Situacao_Autorizacao', C_TODAS);
   IncluirRegistro(FdmSiags.mtbTiposUltimaAnotacao, 'Tipo_Ultima_Anotacao', C_TODAS);
   IncluirRegistro(FdmSiags.mtbSetores, 'Nome_Setor', C_PROCESSO_NAO_DESIGNADO, C_CODIGO_NAO_DESIGNADO);

   IncluirRegistro(FdmSiags.mtbUsuarios, 'Nome_Usuario', C_PROCESSO_NAO_DESIGNADO, C_CODIGO_NAO_DESIGNADO);
   IncluirRegistro(FdmSiags.mtbUF, 'Sigla', C_TODOS);

   DesignacaoIncluirTodos;


end;

function TSrvSiags.TemAtualizacoes: Boolean;
begin
   Result := FdmSiags.cdsPainelQtd_Historicos.AsInteger > 0;
end;

function TSrvSiags.TemDesignacoes: Boolean;
begin
   Result := FdmSiags.cdsPainelQtd_Designacoes.AsInteger > 0;
end;

function TSrvSiags.TemRegistros: Boolean;
begin
   Result := (FdmSiags.cdsPainel.State = dsBrowse) and (not FdmSiags.cdsPainel.IsEmpty);
end;

function TSrvSiags.SetorDesignado : integer;
begin
   Result := FdmSiags.cdsPainelid_Setor_Designado.asinteger;
end;

function TSrvSiags.UsuarioDesignado: integer;
begin
   Result := FdmSiags.cdsPainelid_Usuario_Designado.asinteger;
end;

end.
