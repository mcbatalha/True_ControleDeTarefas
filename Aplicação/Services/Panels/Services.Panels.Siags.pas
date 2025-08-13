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
  Util.Funcoes,

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
     function DataSetUsuariosDoSetor   : TDataSet;

     function DataSourceDesignacao     : TDataSource;
     function DataSourceObservacao     : TDataSource;
     function DataSourceStatusTrue     : TDataSource;
     function DataSourceSetores        : TDataSource;
     function NumeroDaAutorizacao      : String;
     function StatusAtual              : String;

     function Filtrar(const AFiltros : TJSONObject; const AIncluirEncerrados : Boolean = False) : Boolean;
     procedure DesignacaoIncluirTodos;
     procedure DesignacaoExcluirTodos;

     procedure StatusTrueIncluirTodos;
     procedure StatusTrueExcluirTodos;


     function idSetorDesignado   : integer;
     function idUsuarioDesignado : integer;
     function TemRegistros       : Boolean;
     function TemDesignacoes     : Boolean;
     function TemAtualizacoes    : Boolean;
     function TemObservacoes     : Boolean;
     function Designar(Const Autorizacoes : TStringList;
                       const AJustificativa : String;
                       const AIdSetor, AIdUsuario : Integer) : Boolean;
     function AlterarStatusTrue(const AIdNovoStatus : Integer; const AJustificativa : String) : Boolean;

     function HistoricoDeDesignacoes   : String;
     function HistoricoDeAtualizacoes  : String;
     function ObservacoesDaAutorizacao : String;

     procedure IncluirObservacao;
     function GravarObservacao(const AObservacao : String): Boolean;
     procedure CancelarObservacao;

     procedure ImprimirExtrato(const AAutorizacao : String; const AFecharTabelas : Boolean);
     procedure PosicionarRegistro(const ANumero: String);

     procedure HabilitarControles;
     procedure DesabilitarControles;

     procedure UsuariosDoSetor(const AIdSetor : Integer);


     procedure GravarSelecao;
     function Selecionados(AListBox : TListBox) : Boolean;
     procedure AtualizarRegistrosPosDesignacao(const AListBox : TListBox;
                                               const AIdUsuario, AIdSetor : Integer;
                                               const AUsuario, ASetor : String);

     function Prazo : String;
     function PrazoCores : TCoresPrazo;

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
   Result := FdmSiags.dtsObservacoes;
end;

function TSrvSiags.DataSourceSetores: TDataSource;
begin
   Result := FdmSiags.dtsSetores;
end;

function TSrvSiags.DataSourceStatusTrue: TDataSource;
begin
   Result := FdmSiags.dtsStatusTrue;
end;

function TSrvSiags.DataSetPesquisaDeUsuario : TDataSet;
begin
   Result := FdmSiags.mtbUsuarios;
end;

function TSrvSiags.DataSetUsuariosDoSetor: TDataSet;
begin
   Result := FdmSiags.mtbUsuariosDoSetor;
end;

procedure TSrvSiags.AtualizarRegistrosPosDesignacao(const AListBox: TListBox; const AIdUsuario, AIdSetor: Integer; const AUsuario, ASetor: String);
var
   LIdAutorizacao : Integer;
   I              : Integer;
begin
   try
      LIdAutorizacao := FdmSiags.cdsPainelid_Autorizacao.AsInteger;
      FdmSiags.cdsPainel.DisableControls;

      for I := 0 to AListBox.Items.Count - 1 do
         begin
         if FdmSiags.cdsPainel.Locate('Numero_Autorizacao',AListBox.Items[I],[]) then
            begin
            FdmSiags.cdsPainel.Edit;
            FdmSiags.cdsPainelSelecionado.AsInteger := 0;

            if Seguranca.Perfil = C_PERFIL_USUARIO then
               FdmSiags.cdsPainelDesignacao_Pendente.AsString := C_SIM
            else
               begin
               FdmSiags.cdsPainelQtd_Designacoes.AsInteger := FdmSiags.cdsPainelQtd_Designacoes.AsInteger + 1;
               if (AIdUsuario <> 0) and (AIdUsuario <> C_CODIGO_NAO_DESIGNADO) then
                  begin
                  FdmSiags.cdsPainelid_Usuario_Designado.AsInteger := AIdUsuario;
                  FdmSiags.cdsPainelUsuario_Designado.AsString     := AUsuario;
               end;
               if (AIdSetor <> 0) and (AIdSetor <> C_CODIGO_NAO_DESIGNADO) then
                  begin
                  FdmSiags.cdsPainelid_Setor_Designado.AsInteger := AIdSetor;
                  FdmSiags.cdsPainelSetor_Designado.AsString     := ASetor;
               end;
            end;
            FdmSiags.cdsPainel.Post;
         end;
      end;
   finally
      FdmSiags.cdsPainel.Locate('id_Autorizacao',LIdAutorizacao,[]);
      FdmSiags.cdsPainel.EnableControls;
   end;
end;

procedure TSrvSiags.CancelarObservacao;
begin
   FdmSiags.mtbObservacoes.Cancel;
end;

constructor TSrvSiags.Create(ASqlConnection : TSQLConnection);
begin
//   FPxySiags := TSMSiagsClient.Create(FdmSiags.SQLConnection.DBXConnection);

   Application.CreateForm(TdtmPainelSiags, FdmSiags);
   FPxySiags := TSMSiagsClient.Create(ASqlConnection.DBXConnection);

   TabelasDeDominio;
end;

procedure TSrvSiags.DesabilitarControles;
begin
   FdmSiags.cdsPainel.DisableControls;
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

function TSrvSiags.Designar(
   Const Autorizacoes : TStringList;
   const AJustificativa : String;
   const AIdSetor, AIdUsuario : Integer) : Boolean;
var
   LAutorizacoes : TJSONArray;
   I             : Integer;
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

   try
      LAutorizacoes := TJSONArray.Create;
      for I := 0 to Autorizacoes.Count - 1 do
         LAutorizacoes.AddElement(TJSONString.Create(Autorizacoes[i]));

      if not FPxySiags.Designar(LAutorizacoes,
                                AJustificativa,
                                AIdSetor,
                                AIdUsuario,
                                Seguranca.id,
                                FdmSiags.cdsPainelid_Autorizacao.AsInteger) then
         begin
         InformationMessage('Ocorreu um erro na tentativa de gravar os dados de designação.',C_TITULO_MENSAGENS);
         Exit;
      end;
   finally
   end;


   FdmSiags.cdsPainel.Edit;
   if AIdSetor <> C_CODIGO_NAO_DESIGNADO then
      begin
      FdmSiags.mtbSetores.Locate('id',AIdSetor);
      FdmSiags.cdsPainelid_Setor_Designado.AsInteger := AIdSetor;
      FdmSiags.cdsPainelSetor_Designado.AsString     := FdmSiags.mtbSetoresNome_Setor.AsString;
   end else
      begin
      FdmSiags.cdsPainelid_Setor_Designado.Clear;
      FdmSiags.cdsPainelSetor_Designado.AsString := C_DESCRICAO_NAO_DESIGNADO;
   end;

   if AIdUsuario <> C_CODIGO_NAO_DESIGNADO then
      begin
      FdmSiags.mtbUsuarios.Locate('id',AIdUsuario);
      FdmSiags.cdsPainelid_Usuario_Designado.AsInteger := AIdUsuario;
      FdmSiags.cdsPainelUsuario_Designado.AsString     := FdmSiags.mtbUsuariosNome_Usuario.AsString;
   end else
      begin
      FdmSiags.cdsPainelid_Usuario_Designado.Clear;
      FdmSiags.cdsPainelUsuario_Designado.AsString := C_DESCRICAO_NAO_DESIGNADO;
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

function TSrvSiags.AlterarStatusTrue(const AIdNovoStatus : Integer; const AJustificativa: String): Boolean;
var
   LEncerra : Boolean;
begin

   Result := False;

   if not FdmSiags.mtbStatusTrue.Locate('id',AIdNovoStatus, []) then
      begin
      InformationMessage('Status não localizado !','Alteração de Status SIAGS');
      Exit;
   end;

   LEncerra := FdmSiags.mtbStatusTrueEncerra.AsString = C_SIM;
   if LEncerra then
      begin
      if not QuestionMessage('Este Status encerra a Autorização. Confirma a alteração?','Alteração de Status SIAGS') then
         Exit;
   end;

   if FPxySiags.AlterarStatus(FdmSiags.cdsPainelid_Autorizacao.AsInteger, AIdNovoStatus, AJustificativa, Seguranca.id) then
      begin
      if LEncerra then
         begin
         FdmSiags.cdsPainel.Delete;
         InformationMessage('Autorização encerrada com sucesso !','Alteração de Status SIAGS');
      end else
         begin
         FdmSiags.cdsPainel.Edit;
         FdmSiags.cdsPainelid_Status_True.AsInteger := FdmSiags.mtbStatusTrueid.AsInteger;
         FdmSiags.cdsPainelStatus_True.AsString     := FdmSiags.mtbStatusTrueStatus.AsString;
         FdmSiags.cdsPainelQtd_Historicos.AsInteger := FdmSiags.cdsPainelQtd_Historicos.AsInteger + 1;

         FdmSiags.cdsPainel.Post;
         InformationMessage('Status alterado com sucesso !','Alteração de Status Siags');
      end;

      StatusTrueIncluirTodos;

      Result := True;
   end;
end;

function TSrvSiags.Filtrar(
   const AFiltros: TJSONObject;
   const AIncluirEncerrados : Boolean) : Boolean;
var
   LDados : TJSONArray;
begin
   Result := True;

   FdmSiags.cdsPainel.Close;
   LDados := FPxySiags.FiltrarAutorizacoes(AFiltros, AIncluirEncerrados);
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
      FdmSiags.mtbObservacoesData_Hora.AsDateTime := LDataHora;
      FdmSiags.mtbObservacoes.Post;

      FdmSiags.cdsPainel.Edit;
      FdmSiags.cdsPainelQtd_Observacoes.AsInteger := FdmSiags.cdsPainelQtd_Observacoes.AsInteger + 1;
      FdmSiags.cdsPainel.Post;
   end else
      InformationMessage('Ocorreu um erro na tentativa de registrar a observação !','Observações');
end;

procedure TSrvSiags.GravarSelecao;
begin
   if FdmSiags.cdsPainelDesignacao_Pendente.AsString = C_SIM then
      begin
      InformationMessage('Já existe uma solicitação para designação desta autorização.','Designação');
      FdmSiags.cdsPainel.Cancel;
      Exit;
   end;

   if FdmSiags.cdsPainel.State = dsEdit then
      FdmSiags.cdsPainel.Post;
end;

procedure TSrvSiags.HabilitarControles;
begin
   FdmSiags.cdsPainel.EnableControls;
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

procedure TSrvSiags.ImprimirExtrato(const AAutorizacao : String; const AFecharTabelas : Boolean);
var
   LFiltroSiags  : TFiltros;
   LSiags        : TFiltrosSiags;
   LDados         : TJSONArray;
begin
   if AAutorizacao = '' then
      begin
      InformationMessage('Informe o nº do processo.','Impressão de Extrato');
      Exit;
   end;

   LFiltroSiags := TFiltros.create(C_CODIGO_Siags);
   try
      LSiags := LFiltroSiags.getFiltrosSiagsAsRecord;
      LSiags.numeroDaAutorizacao := AAutorizacao;
      LSiags.idUsuarioDesignado  := 0;

      LFiltroSiags.setFiltrosSiags(LSiags);

      if not Filtrar(LFiltroSiags.getFiltrosSiagsAsJSON, True) or (not TemRegistros) then
         begin
         InformationMessage('Processo não localizado.','Impressão de Extrato');
         Exit;
      end;


      if TemAtualizacoes then
         HistoricoDeAtualizacoes;

      if TemObservacoes then
         ObservacoesDaAutorizacao;

      if TemDesignacoes then
         begin
         LDados := FPxySiags.RelatorioDeDesignacoes(True,
                                                    StrToDate('01/01/2025'),
                                                    Date,
                                                    FdmSiags.cdsPainelNumero_Autorizacao.AsString,
                                                    0);

         FdmSiags.mtbDesignacoes.Close;
         if LDados.Count > 0 then
            TFuncoesJSON.PopularTabela(FdmSiags.mtbDesignacoes, LDados)
         else
            FdmSiags.mtbDesignacoes.Open;
      end;

      FdmSiags.frpExtrato.Showreport();

   finally
      FreeAndNil(LFiltroSiags);

      if AFecharTabelas then
         begin
         FdmSiags.cdsPainel.Close;
         FdmSiags.mtbDesignacoes.Close;
         FdmSiags.mtbHistoricoAtualizacoes.Close;
         FdmSiags.mtbObservacoes.Close;
      end;
   end;
end;

procedure TSrvSiags.IncluirObservacao;
begin
   FdmSiags.mtbObservacoes.Append;
   FdmSiags.mtbObservacoesNome_Usuario.AsString := Seguranca.Nome;
   FdmSiags.mtbObservacoesData_Hora.AsDateTime  := Now;
end;

function TSrvSiags.NumeroDaAutorizacao: String;
begin
   Result := FdmSiags.cdsPainelNumero_Autorizacao.AsString;
end;

function TSrvSiags.ObservacoesDaAutorizacao: String;
begin
   FdmSiags.mtbObservacoes.Close;
   if FdmSiags.cdsPainelQtd_Observacoes.AsInteger > 0 then
      TFuncoesJSON.PopularTabela(FdmSiags.mtbObservacoes, FPxySiags.ObservacoesDaAutorizacao(FdmSiags.cdsPainelid_Autorizacao.AsInteger))
   else
      FdmSiags.mtbObservacoes.Open;
   Result := FdmSiags.cdsPainelNumero_Autorizacao.AsString;
end;

procedure TSrvSiags.PosicionarRegistro(const ANumero: String);
begin
   FdmSiags.cdsPainel.Locate('Numero_Autorizacao',ANumero,[]);
end;

function TSrvSiags.Prazo: String;
begin
   Result := TFuncoes.PrazoStatus(FdmSiags.cdsPainelData_Prazo_Caixa.AsDateTime);
end;

function TSrvSiags.PrazoCores: TCoresPrazo;
begin
   Result := TFuncoes.PrazoCores(FdmSiags.cdsPainelData_Prazo_Caixa.AsDateTime);
end;

function TSrvSiags.Selecionados(AListBox: TListBox): Boolean;
var
   LId    : Integer;
begin
   Result := False;
   AListBox.Items.Clear;
   LId := FdmSiags.cdsPainelid_Autorizacao.AsInteger;
   try
      FdmSiags.cdsPainel.DisableControls;
      FdmSiags.cdsPainel.First;
      while not FdmSiags.cdsPainel.Eof do
         begin
         if FdmSiags.cdsPainelSelecionado.AsInteger = 1 then
            AListBox.Items.Add(FdmSiags.cdsPainelNumero_Autorizacao.AsString);

         FdmSiags.cdsPainel.Next;
      end;
      Result := AListBox.Count > 0;
   finally

      FdmSiags.cdsPainel.locate('id_Autorizacao',Lid,[]);
      if not Result then
         begin
         AListBox.Items.Add(FdmSiags.cdsPainelNumero_Autorizacao.AsString);
         Result := True;
      end;

      FdmSiags.cdsPainel.EnableControls;
   end;
end;

function TSrvSiags.StatusAtual: String;
begin
   Result := FdmSiags.cdsPainelStatus_True.AsString;
end;

procedure TSrvSiags.StatusTrueExcluirTodos;
begin
   if FdmSiags.mtbStatusTrue.Locate('Status',C_TODOS)  then
      FdmSiags.mtbStatusTrue.Delete;
end;

procedure TSrvSiags.StatusTrueIncluirTodos;
begin
   if FdmSiags.mtbStatusTrue.Locate('Status',C_TODOS)  then
      FdmSiags.mtbStatusTrue.Delete;
end;

procedure TSrvSiags.TabelasDeDominio;
begin
   TFuncoesJSON.PopularTabela(FdmSiags.mtbTiposAutorizacao, FPxySiags.TiposDeAutoriazacao);
   TFuncoesJSON.PopularTabela(FdmSiags.mtbTiposAtendimento, FPxySiags.TiposDeAtendimento);
   TFuncoesJSON.PopularTabela(FdmSiags.mtbSetores, FPxySiags.Setores(Seguranca.id));
   TFuncoesJSON.PopularTabela(FdmSiags.mtbUsuarios, FPxySiags.Usuarios(Seguranca.id));
   TFuncoesJSON.PopularTabela(FdmSiags.mtbStatusTrue, FPxySiags.StatusTrue);

   IncluirRegistro(FdmSiags.mtbTiposAutorizacao, 'Tipo_Autorizacao', C_TODAS);
   IncluirRegistro(FdmSiags.mtbTiposAtendimento, 'Tipo_Atendimento', C_TODOS);
   IncluirRegistro(FdmSiags.mtbStatusTrue, 'Status', C_TODOS);
   IncluirRegistro(FdmSiags.mtbSetores, 'Nome_Setor', C_DESCRICAO_NAO_DESIGNADO, C_CODIGO_NAO_DESIGNADO);

   IncluirRegistro(FdmSiags.mtbUsuarios, 'Nome_Usuario', C_DESCRICAO_NAO_DESIGNADO, C_CODIGO_NAO_DESIGNADO);

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

function TSrvSiags.TemObservacoes: Boolean;
begin
   Result := FdmSiags.cdsPainelQtd_Observacoes.AsInteger > 0;
end;

function TSrvSiags.TemRegistros: Boolean;
begin
   Result := (FdmSiags.cdsPainel.State = dsBrowse) and (not FdmSiags.cdsPainel.IsEmpty);
end;

procedure TSrvSiags.UsuariosDoSetor(const AIdSetor: Integer);
begin
   FdmSiags.mtbUsuariosDoSetor.Close;
   TFuncoesJSON.PopularTabela(FdmSiags.mtbUsuariosDoSetor, FPxySiags.UsuariosDoSetor(AIdSetor));

   IncluirRegistro(FdmSiags.mtbUsuariosDoSetor, 'Nome_Usuario', C_DESCRICAO_NAO_DESIGNADO, C_CODIGO_NAO_DESIGNADO);
end;

function TSrvSiags.idSetorDesignado : integer;
begin
   Result := FdmSiags.cdsPainelid_Setor_Designado.asinteger;
end;

function TSrvSiags.idUsuarioDesignado: integer;
begin
   Result := FdmSiags.cdsPainelid_Usuario_Designado.asinteger;
end;

end.
