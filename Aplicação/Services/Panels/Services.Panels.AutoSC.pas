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
        C_TITULO_MENSAGENS = 'Designa��o de Processo AUTOSC';
  public
     constructor Create(ASqlConnection : TSQLConnection);

     function ConfigurarPesquisaDeUsuario : TDataSet;
     function Filtrar(const AFiltros : TJSONObject) : Boolean;
     function NumeroDoProcesso  : String;
     procedure DesignacaoIncluirTodos;
     procedure DesignacaoExcluirTodos;

     function SetorDesignado : integer;
     function UsuarioDesignado : integer;
     function TemRegistros : Boolean;
     function TemDesignacoes : Boolean;
     function Designar(const AJustificativa : String; const AIdSetor, AIdUsuario : Integer) : Boolean;

     procedure HistoricoDeDesignacoes;

     destructor Destroy(); override;

  end;



implementation

{ TSrvImportacaoAutoAc }

function TSrvAutoSC.ConfigurarPesquisaDeUsuario : TDataSet;
begin
   Result := FdmAutoSC.mtbUsuarios;
end;

constructor TSrvAutoSC.Create(ASqlConnection : TSQLConnection);
begin
//   FPxyAutoSC := TSMAutoSCClient.Create(FdmAutoSC.SQLConnection.DBXConnection);

   Application.CreateForm(TdtmPainelAutoSC, FdmAutoSC);
   FPxyAutoSC := TSMAutoSCClient.Create(ASqlConnection.DBXConnection);

   TabelasDeDominio;
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

   if not QuestionMessage('Confirma a designa��o do processo ? ',C_TITULO_MENSAGENS) then
      Exit;

   if Length(Trim(AJustificativa)) < 5 then
      begin
      InformationMessage('Justificativa inv�lida.', C_TITULO_MENSAGENS);
      Exit;
   end;


   if (AIdSetor = C_CODIGO_NAO_DESIGNADO) and (AIdUsuario = C_CODIGO_NAO_DESIGNADO) then
      begin
      InformationMessage('� preciso selecionar um setor ou um usu�rio para designa��o.', C_TITULO_MENSAGENS);
      Exit;
   end;


   if (AIdSetor = C_CODIGO_NAO_DESIGNADO) and (AIdUsuario <> C_CODIGO_NAO_DESIGNADO) then
      begin
      InformationMessage('� preciso selecionar o setor do usu�rio para designa��o.', C_TITULO_MENSAGENS);
      Exit;
   end;

   if not FPxyAutoSC.Designar(AJustificativa,
                          AIdSetor,
                          AIdUsuario,
                          Seguranca.id,
                          FdmAutoSC.cdsPainelid_Processo.AsInteger ) then
      begin
      InformationMessage('Ocorreu um erro na tentativa de gravar os dados de designa��o.',C_TITULO_MENSAGENS);
      Exit;
   end;


   FdmAutoSC.cdsPainel.Edit;
   if AIdSetor <> C_CODIGO_NAO_DESIGNADO then
      begin
      FdmAutoSC.mtbSetores.Locate('id',AIdSetor);
      FdmAutoSC.cdsPainelid_Setor_Designado.AsInteger := AIdSetor;
      FdmAutoSC.cdsPainelSetor_Designado.AsString     := FdmAutoSC.mtbSetoresNome_Setor.AsString;
   end;

   if AIdUsuario <> C_CODIGO_NAO_DESIGNADO then
      begin
      FdmAutoSC.mtbUsuarios.Locate('id',AIdUsuario);
      FdmAutoSC.cdsPainelid_Usuario_Designado.AsInteger := AIdUsuario;
      FdmAutoSC.cdsPainelUsuario_Designado.AsString     := FdmAutoSC.mtbUsuariosNome_Usuario.AsString;
   end;
   FdmAutoSC.cdsPainel.Post;
   Result := True;
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

procedure TSrvAutoSC.HistoricoDeDesignacoes;
begin
   TFuncoesJSON.PopularTabela(FdmAutoSC.mtbHistoricoDesignacoes, FPxyAutoSC.HistoricoDeDesignacoes(FdmAutoSC.cdsPainelid_Processo.AsInteger));
end;

function TSrvAutoSC.NumeroDoProcesso: String;
begin
   Result := FdmAutoSC.cdsPainelNumero_Processo.AsString;
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
   IncluirRegistro(FdmAutoSC.mtbSetores, 'Nome_Setor', C_PROCESSO_NAO_DESIGNADO, C_CODIGO_NAO_DESIGNADO);

   IncluirRegistro(FdmAutoSC.mtbUsuarios, 'Nome_Usuario', C_PROCESSO_NAO_DESIGNADO, C_CODIGO_NAO_DESIGNADO);
   IncluirRegistro(FdmAutoSC.mtbUF, 'Sigla', C_TODOS);

   DesignacaoIncluirTodos;


end;

function TSrvAutoSC.TemDesignacoes: Boolean;
begin
   Result := FdmAutoSC.cdsPainelQtd_Designacoes.AsInteger > 0;
end;

function TSrvAutoSC.TemRegistros: Boolean;
begin
   Result := (FdmAutoSC.cdsPainel.State = dsBrowse) and (not FdmAutoSC.cdsPainel.IsEmpty);
end;

function TSrvAutoSC.SetorDesignado : integer;
begin
   Result := FdmAutoSC.cdsPainelid_Setor_Designado.asinteger;
end;

function TSrvAutoSC.UsuarioDesignado: integer;
begin
   Result := FdmAutoSC.cdsPainelid_Usuario_Designado.asinteger;
end;

end.
