unit Services.Panels.ControlPc;

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

  Providers.Panels.ControlPc,
  Providers.Panels.Conexao;

type
  TSrvControlPc = class
  private
     FdmControlPc      : TdtmPainelControlPc;
     FPxyControlPc     : TSMControlPcClient;

     procedure TabelasDeDominio;

     const
        C_TITULO_MENSAGENS = 'Designação de Autorizações CONTROLPC';
  public
     constructor Create(ASqlConnection : TSQLConnection);

     function DataSourcePainel       : TDataSource;
     function DataSourceTiposPrazo   : TDataSource;
     function DataSourceTecnicos     : TDataSource;
     function DataSourceTiposCliente : TDataSource;
     function DataSourceTipoStatus   : TDataSource;
     function DataSourceTiposClassificacao : TDataSource;


     function DataSetPesquisaDeUsuario : TDataSet;
     function DataSourceDesignacao : TDataSource;
     function DataSourceObservacao : TDataSource;
     function Filtrar(const AFiltros : TJSONObject) : Boolean;
     function NumeroDoProtocolo  : String;
     procedure DesignacaoIncluirTodos;
     procedure DesignacaoExcluirTodos;

     function SetorDesignado : integer;
     function UsuarioDesignado : integer;
     function TemRegistros : Boolean;
     function TemDesignacoes : Boolean;
     function TemAtualizacoes: Boolean;
     function Designar(const AJustificativa : String; const AIdSetor, AIdUsuario : Integer) : Boolean;
     function Encerrar(const AJustificativa : String) : Boolean;

     function HistoricoDeDesignacoes   : String;
     function HistoricoDeAtualizacoes  : String;
     function ObservacoesDaAutorizacao : String;

     procedure IncluirObservacao;
     function GravarObservacao(const AObservacao : String): Boolean;
     procedure CancelarObservacao;

     function Conteudo(const ACampo : String) : String;

     destructor Destroy(); override;

  end;



implementation

{ TSrvImportacaoAutoAc }

function TSrvControlPc.DataSourceDesignacao: TDataSource;
begin
   Result := FdmControlPc.dtsHistoricoDesignacoes
end;

function TSrvControlPc.DataSourceObservacao: TDataSource;
begin
   Result := FdmControlPc.dtsObservacoesProcesso;
end;

function TSrvControlPc.DataSourcePainel: TDataSource;
begin
   Result := FdmControlPc.dtsPainel;
end;

function TSrvControlPc.DataSourceTecnicos: TDataSource;
begin
   Result := FdmControlPc.dtsTecnicos;
end;

function TSrvControlPc.DataSourceTiposClassificacao: TDataSource;
begin
   Result := FdmControlPc.dtsTiposClassificacao;
end;

function TSrvControlPc.DataSourceTiposCliente: TDataSource;
begin
   Result := FdmControlPc.dtsTiposCliente;
end;

function TSrvControlPc.DataSourceTiposPrazo: TDataSource;
begin
   Result := FdmControlPc.dtsTiposPrazo;
end;

function TSrvControlPc.DataSourceTipoStatus: TDataSource;
begin
   Result := FdmControlPc.dtsTiposStatus;
end;

function TSrvControlPc.DataSetPesquisaDeUsuario : TDataSet;
begin
   Result := FdmControlPc.mtbUsuarios;
end;

procedure TSrvControlPc.CancelarObservacao;
begin
   FdmControlPc.mtbObservacoesProcesso.Cancel;
end;

function TSrvControlPc.Conteudo(const ACampo: String): String;
begin
   Result := FdmControlPc.cdsPainel.FieldByName(ACampo).AsString;
end;

constructor TSrvControlPc.Create(ASqlConnection : TSQLConnection);
begin
   Application.CreateForm(TdtmPainelControlPc, FdmControlPc);
   FPxyControlPc := TSMControlPcClient.Create(ASqlConnection.DBXConnection);

   TabelasDeDominio;
end;

procedure TSrvControlPc.DesignacaoExcluirTodos;
begin
   if FdmControlPc.mtbSetores.Locate('Nome_Setor',C_TODOS)  then
      FdmControlPc.mtbSetores.Delete;

   if FdmControlPc.mtbUsuarios.Locate('Nome_Usuario',C_TODOS)  then
      FdmControlPc.mtbUsuarios.Delete;

end;

procedure TSrvControlPc.DesignacaoIncluirTodos;
begin
   IncluirRegistro(FdmControlPc.mtbSetores, 'Nome_Setor', C_TODOS);
   IncluirRegistro(FdmControlPc.mtbUsuarios, 'Nome_Usuario', C_TODOS);
 end;

function TSrvControlPc.Designar(const AJustificativa: String; const AIdSetor, AIdUsuario: Integer): Boolean;
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

   if not FPxyControlPc.Designar(AJustificativa,
                             AIdSetor,
                             AIdUsuario,
                             Seguranca.id,
                             FdmControlPc.cdsPainelid_Protocolo.AsInteger ) then
      begin
      InformationMessage('Ocorreu um erro na tentativa de gravar os dados de designação.',C_TITULO_MENSAGENS);
      Exit;
   end;


   FdmControlPc.cdsPainel.Edit;
   if AIdSetor <> C_CODIGO_NAO_DESIGNADO then
      begin
      FdmControlPc.mtbSetores.Locate('id',AIdSetor);
      FdmControlPc.cdsPainelid_Setor_Designado.AsInteger := AIdSetor;
      FdmControlPc.cdsPainelSetor_Designado.AsString     := FdmControlPc.mtbSetoresNome_Setor.AsString;
   end;

   if AIdUsuario <> C_CODIGO_NAO_DESIGNADO then
      begin
      FdmControlPc.mtbUsuarios.Locate('id',AIdUsuario);
      FdmControlPc.cdsPainelid_Usuario_Designado.AsInteger := AIdUsuario;
      FdmControlPc.cdsPainelUsuario_Designado.AsString     := FdmControlPc.mtbUsuariosNome_Usuario.AsString;
   end;
   FdmControlPc.cdsPainelQtd_Designacoes.AsInteger := FdmControlPc.cdsPainelQtd_Designacoes.AsInteger + 1;

   FdmControlPc.cdsPainel.Post;
   Result := True;
end;

destructor TSrvControlPc.Destroy;
begin

   FreeAndNil(FPxyControlPc);
   FreeAndNil(FdmControlPc);

   inherited;
end;

function TSrvControlPc.Encerrar(const AJustificativa: String): Boolean;
begin
   Result := False;
   if not QuestionMessage('Confirma o encerramento do autorização ' + FdmControlPc.cdsPainelProtocolo.AsString + ' ? ','Encerramento') then
      Exit;

   if FPxyControlPc.EncerrarProtocolo(FdmControlPc.cdsPainelid_Protocolo.AsInteger, AJustificativa, Seguranca.id) then
      begin
      FdmControlPc.cdsPainel.Delete;
      InformationMessage('Autorização encerrada com sucesso !','Encerramento');
      Result := True;
   end;
end;

function TSrvControlPc.Filtrar(const AFiltros: TJSONObject): Boolean;
var
   LDados : TJSONArray;
begin
   Result := True;

   FdmControlPc.cdsPainel.Close;
   LDados := FPxyControlPc.FiltrarProtocolos(AFiltros);
   if LDados.Count > 0 then
      TFuncoesJSON.PopularTabela(FdmControlPc.cdsPainel, LDados);

end;

function TSrvControlPc.GravarObservacao(const AObservacao : String): Boolean;
var
   LDataHora : TDateTime;
begin
   Result := False;

   if not QuestionMessage('Confirma o registro da observação para a autorização ?','Observações') then
      exit;

   Result := FPxyControlPc.RegistrarObservacao(FdmControlPc.cdsPainelid_Protocolo.AsInteger,
                                            AObservacao,
                                            Seguranca.id,
                                            LDataHora);
   if Result then
      begin
      InformationMessage('Observação registrada com sucesso !','Observações');
      FdmControlPc.mtbObservacoesProcessoData_Hora.AsDateTime := LDataHora;
      FdmControlPc.mtbObservacoesProcesso.Post;

      FdmControlPc.cdsPainel.Edit;
      FdmControlPc.cdsPainelQtd_Observacoes.AsInteger := FdmControlPc.cdsPainelQtd_Observacoes.AsInteger + 1;
      FdmControlPc.cdsPainel.Post;
   end else
      InformationMessage('Ocorreu um erro na tentativa de registrar a observação !','Observações');
end;

function TSrvControlPc.HistoricoDeAtualizacoes : String;
begin
   TFuncoesJSON.PopularTabela(FdmControlPc.mtbHistoricoAtualizacoes, FPxyControlPc.HistoricoDeAtualizacoes(FdmControlPc.cdsPainelid_Protocolo.AsInteger));
   Result := FdmControlPc.cdsPainelProtocolo.AsString;
end;

function TSrvControlPc.HistoricoDeDesignacoes : String;
begin
   TFuncoesJSON.PopularTabela(FdmControlPc.mtbHistoricoDesignacoes, FPxyControlPc.HistoricoDeDesignacoes(FdmControlPc.cdsPainelid_Protocolo.AsInteger));
   Result := FdmControlPc.cdsPainelProtocolo.AsString;
end;

procedure TSrvControlPc.IncluirObservacao;
begin
   FdmControlPc.mtbObservacoesProcesso.Append;
   FdmControlPc.mtbObservacoesProcessoNome_Usuario.AsString := Seguranca.Nome;
   FdmControlPc.mtbObservacoesProcessoData_Hora.AsDateTime  := Now;
end;

function TSrvControlPc.NumeroDoProtocolo: String;
begin
   Result := FdmControlPc.cdsPainelProtocolo.AsString;
end;

function TSrvControlPc.ObservacoesDaAutorizacao: String;
begin
   FdmControlPc.mtbObservacoesProcesso.Close;
   if FdmControlPc.cdsPainelQtd_Observacoes.AsInteger > 0 then
      TFuncoesJSON.PopularTabela(FdmControlPc.mtbObservacoesProcesso, FPxyControlPc.ObservacoesDoProtocolo(FdmControlPc.cdsPainelid_Protocolo.AsInteger))
   else
      FdmControlPc.mtbObservacoesProcesso.Open;
   Result := FdmControlPc.cdsPainelProtocolo.AsString;
end;

procedure TSrvControlPc.TabelasDeDominio;
begin
   TFuncoesJSON.PopularTabela(FdmControlPc.mtbTiposPrazo, FPxyControlPc.TiposDePrazo);
   TFuncoesJSON.PopularTabela(FdmControlPc.mtbTecnicos, FPxyControlPc.Tecnicos);
   TFuncoesJSON.PopularTabela(FdmControlPc.mtbTiposCliente, FPxyControlPc.TiposDeCliente);
   TFuncoesJSON.PopularTabela(FdmControlPc.mtbTiposClassificacao, FPxyControlPc.TiposDeClassificacao);
   TFuncoesJSON.PopularTabela(FdmControlPc.mtbTiposStatus, FPxyControlPc.TiposDeStatus);


   TFuncoesJSON.PopularTabela(FdmControlPc.mtbSetores, FPxyControlPc.Setores);
   TFuncoesJSON.PopularTabela(FdmControlPc.mtbUsuarios, FPxyControlPc.Usuarios);

   IncluirRegistro(FdmControlPc.mtbTiposPrazo, 'Tipo_Prazo_Caixa', C_TODOS);
   IncluirRegistro(FdmControlPc.mtbTecnicos, 'Nome_Tecnico', C_TODOS);
   IncluirRegistro(FdmControlPc.mtbTiposCliente, 'Tipo_Cliente', C_TODOS);
   IncluirRegistro(FdmControlPc.mtbTiposClassificacao, 'Tipo_Classificacao', C_TODOS);
   IncluirRegistro(FdmControlPc.mtbTiposStatus, 'Tipo_Status', C_TODOS);

   IncluirRegistro(FdmControlPc.mtbSetores, 'Nome_Setor', C_PROCESSO_NAO_DESIGNADO, C_CODIGO_NAO_DESIGNADO);
   IncluirRegistro(FdmControlPc.mtbUsuarios, 'Nome_Usuario', C_PROCESSO_NAO_DESIGNADO, C_CODIGO_NAO_DESIGNADO);

   DesignacaoIncluirTodos;


end;

function TSrvControlPc.TemAtualizacoes: Boolean;
begin
   Result := FdmControlPc.cdsPainelQtd_Historicos.AsInteger > 0;
end;

function TSrvControlPc.TemDesignacoes: Boolean;
begin
   Result := FdmControlPc.cdsPainelQtd_Designacoes.AsInteger > 0;
end;

function TSrvControlPc.TemRegistros: Boolean;
begin
   Result := (FdmControlPc.cdsPainel.State = dsBrowse) and (not FdmControlPc.cdsPainel.IsEmpty);
end;

function TSrvControlPc.SetorDesignado : integer;
begin
   Result := FdmControlPc.cdsPainelid_Setor_Designado.asinteger;
end;

function TSrvControlPc.UsuarioDesignado: integer;
begin
   Result := FdmControlPc.cdsPainelid_Usuario_Designado.asinteger;
end;

end.
