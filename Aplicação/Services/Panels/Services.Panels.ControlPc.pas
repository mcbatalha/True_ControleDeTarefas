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
  Util.Funcoes,

  Providers.Panels.ControlPc,
  Providers.Panels.Conexao;

type
  TSrvControlPc = class
  private
     FdmControlPc      : TdtmPainelControlPc;
     FPxyControlPc     : TSMControlPcClient;

     procedure TabelasDeDominio;
     procedure UtilizarUsuarioAtual;

     const
        C_TITULO_MENSAGENS = 'Designação de Protocolo CONTROLPC';
  public
     constructor Create(ASqlConnection : TSQLConnection);

     function DataSetPesquisaDeUsuario : TDataSet;
     function DataSetUsuariosDoSetor   : TDataSet;

     function DataSourceDesignacao     : TDataSource;
     function DataSourceObservacao     : TDataSource;
     function DataSourceStatusTrue     : TDataSource;
     function DataSourceSetores        : TDataSource;
     function NumeroDoProtocolo        : String;
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
     function Designar(Const AProtocolos : TStringList;
                       const AJustificativa : String;
                       const AIdSetor, AIdUsuario : Integer) : Boolean;
     function AlterarStatusTrue(const AIdNovoStatus : integer; const AJustificativa : String) : Boolean;

     function HistoricoDeDesignacoes   : String;
     function HistoricoDeAtualizacoes  : String;
     function ObservacoesDoProtocolo : String;

     procedure IncluirObservacao;
     function GravarObservacao(const AObservacao : String): Boolean;
     procedure CancelarObservacao;

     function Conteudo(const ACampo : String) : String;
     procedure ImprimirExtrato(const AProcesso : String; const AFecharTabelas : Boolean);
     procedure PosicionarRegistro(const ANumero : String);

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

function TSrvControlPc.DataSourceDesignacao: TDataSource;
begin
   Result := FdmControlPc.dtsHistoricoDesignacoes
end;


function TSrvControlPc.DataSourceObservacao: TDataSource;
begin
   Result := FdmControlPc.dtsObservacoes;
end;


function TSrvControlPc.DataSourceSetores: TDataSource;
begin
   Result := FdmControlPc.dtsSetores;
end;

function TSrvControlPc.DataSourceStatusTrue: TDataSource;
begin
   Result := FdmControlPc.dtsStatusTrue;
end;

function TSrvControlPc.DataSetPesquisaDeUsuario : TDataSet;
begin
   Result := FdmControlPc.mtbUsuarios;
end;

function TSrvControlPc.DataSetUsuariosDoSetor: TDataSet;
begin
   Result := FdmControlPc.mtbUsuariosDoSetor;
end;

procedure TSrvControlPc.AtualizarRegistrosPosDesignacao(
   const AListBox : TListBox;
   const AIdUsuario, AIdSetor : Integer;
   const AUsuario, ASetor : String);
var
   LIdProtocolo : Integer;
   I            : Integer;
begin
   try
      LIdProtocolo := FdmControlPc.cdsPainelid_Protocolo.AsInteger;
      FdmControlPc.cdsPainel.DisableControls;

      for I := 0 to AListBox.Items.Count - 1 do
         begin
         if FdmControlPc.cdsPainel.Locate('Protocolo',AListBox.Items[I],[]) then
            begin
            FdmControlPc.cdsPainel.Edit;
            FdmControlPc.cdsPainelSelecionado.AsInteger := 0;

            if Seguranca.Perfil = C_PERFIL_USUARIO then
               FdmControlPc.cdsPainelDesignacao_Pendente.AsString := C_SIM
            else
               begin
               FdmControlPc.cdsPainelQtd_Designacoes.AsInteger := FdmControlPc.cdsPainelQtd_Designacoes.AsInteger + 1;
               if (AIdUsuario <> 0) and (AIdUsuario <> C_CODIGO_NAO_DESIGNADO) then
                  begin
                  FdmControlPc.cdsPainelid_Usuario_Designado.AsInteger := AIdUsuario;
                  FdmControlPc.cdsPainelUsuario_Designado.AsString     := AUsuario;
               end;
               if (AIdSetor <> 0) and (AIdSetor <> C_CODIGO_NAO_DESIGNADO) then
                  begin
                  FdmControlPc.cdsPainelid_Setor_Designado.AsInteger := AIdSetor;
                  FdmControlPc.cdsPainelSetor_Designado.AsString     := ASetor;
               end;
            end;
            FdmControlPc.cdsPainel.Post;
         end;
      end;
   finally
      FdmControlPc.cdsPainel.Locate('id_Protocolo',LIdProtocolo,[]);
      FdmControlPc.cdsPainel.EnableControls;
   end;
end;

procedure TSrvControlPc.CancelarObservacao;
begin
   FdmControlPc.mtbObservacoes.Cancel;
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

procedure TSrvControlPc.DesabilitarControles;
begin
   FdmControlPc.cdsPainel.DisableControls;
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

function TSrvControlPc.Designar(
   Const AProtocolos : TStringList;
   const AJustificativa: String;
   const AIdSetor, AIdUsuario: Integer): Boolean;
var
   LProtocolos : TJSONArray;
   I           : Integer;
begin
   Result := False;

   if not QuestionMessage('Confirma a designação do protocolo ? ',C_TITULO_MENSAGENS) then
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

(*
   if (AIdSetor = C_CODIGO_NAO_DESIGNADO) and (AIdUsuario <> C_CODIGO_NAO_DESIGNADO) then
      begin
      InformationMessage('É preciso selecionar o setor do usuário para designação.', C_TITULO_MENSAGENS);
      Exit;
   end;
*)
   try
      LProtocolos := TJSONArray.Create;
      for I := 0 to AProtocolos.Count - 1 do
         LProtocolos.AddElement(TJSONString.Create(AProtocolos[i]));

      if not FPxyControlPc.Designar(LProtocolos,
                                    AJustificativa,
                                    AIdSetor,
                                    AIdUsuario,
                                    Seguranca.id,
                                    FdmControlPc.cdsPainelid_Protocolo.AsInteger ) then
         begin
         InformationMessage('Ocorreu um erro na tentativa de gravar os dados de designação.',C_TITULO_MENSAGENS);
         Exit;
      end;
   finally
//      FreeAndNil(LProtocolos);
   end;


   FdmControlPc.cdsPainel.Edit;
   if AIdSetor <> C_CODIGO_NAO_DESIGNADO then
      begin
      FdmControlPc.mtbSetores.Locate('id',AIdSetor);
      FdmControlPc.cdsPainelid_Setor_Designado.AsInteger := AIdSetor;
      FdmControlPc.cdsPainelSetor_Designado.AsString     := FdmControlPc.mtbSetoresNome_Setor.AsString;
   end else
      begin
      FdmControlPc.cdsPainelid_Setor_Designado.Clear;
      FdmControlPc.cdsPainelSetor_Designado.AsString := C_DESCRICAO_NAO_DESIGNADO;
   end;

   if AIdUsuario <> C_CODIGO_NAO_DESIGNADO then
      begin
      FdmControlPc.mtbUsuarios.Locate('id',AIdUsuario);
      FdmControlPc.cdsPainelid_Usuario_Designado.AsInteger := AIdUsuario;
      FdmControlPc.cdsPainelUsuario_Designado.AsString     := FdmControlPc.mtbUsuariosNome_Usuario.AsString;
   end else
      begin
      FdmControlPc.cdsPainelid_Usuario_Designado.Clear;
      FdmControlPc.cdsPainelUsuario_Designado.AsString := C_DESCRICAO_NAO_DESIGNADO;
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

function TSrvControlPc.AlterarStatusTrue(const AIdNovoStatus : integer; const AJustificativa: String): Boolean;
var
   LEncerra : Boolean;
begin

   Result := False;

   if not FdmControlPc.mtbStatusTrue.Locate('id',AIdNovoStatus, []) then
      begin
      InformationMessage('Status não localizado !','Alteração de Status CONTROLPC');
      Exit;
   end;

   LEncerra := FdmControlPc.mtbStatusTrueEncerra.AsString = C_SIM;
   if LEncerra then
      begin
      if not QuestionMessage('Este Status encerra o Protocolo. Confirma a alteração?','Alteração de Status CONTROLPC') then
         Exit;
   end;

   if FPxyControlPc.AlterarStatus(FdmControlPc.cdsPainelid_Protocolo.AsInteger, AIdNovoStatus, AJustificativa, Seguranca.id) then
      begin
      if LEncerra then
         begin
         FdmControlPc.cdsPainel.Delete;
         InformationMessage('Protocolo encerrado com sucesso !','Alteração de Status CONTROLPC');
      end else
         begin
         FdmControlPc.cdsPainel.Edit;
         FdmControlPc.cdsPainelid_Status_True.AsInteger := FdmControlPc.mtbStatusTrueid.AsInteger;
         FdmControlPc.cdsPainelStatus_True.AsString     := FdmControlPc.mtbStatusTrueStatus.AsString;
         FdmControlPc.cdsPainelQtd_Historicos.AsInteger := FdmControlPc.cdsPainelQtd_Historicos.AsInteger + 1;

         FdmControlPc.cdsPainel.Post;
         InformationMessage('Status alterado com sucesso !','Alteração de Status CONTROLPC');
      end;

      StatusTrueIncluirTodos;

      Result := True;
   end;
end;

function TSrvControlPc.Filtrar(
   const AFiltros: TJSONObject;
   const AIncluirEncerrados : Boolean): Boolean;
var
   LDados : TJSONArray;
begin
   Result := True;

   FdmControlPc.cdsPainel.Close;
   LDados := FPxyControlPc.FiltrarProtocolos(AFiltros, AIncluirEncerrados);
   if LDados.Count > 0 then
      TFuncoesJSON.PopularTabela(FdmControlPc.cdsPainel, LDados);

end;

function TSrvControlPc.GravarObservacao(const AObservacao : String): Boolean;
var
   LDataHora : TDateTime;
begin
   Result := False;

   if not QuestionMessage('Confirma o registro da observação para o protocolo ?','Observações') then
      exit;

   Result := FPxyControlPc.RegistrarObservacao(FdmControlPc.cdsPainelid_Protocolo.AsInteger,
                                            AObservacao,
                                            Seguranca.id,
                                            LDataHora);
   if Result then
      begin
      InformationMessage('Observação registrada com sucesso !','Observações');
      FdmControlPc.mtbObservacoesData_Hora.AsDateTime := LDataHora;
      FdmControlPc.mtbObservacoes.Post;

      FdmControlPc.cdsPainel.Edit;
      FdmControlPc.cdsPainelQtd_Observacoes.AsInteger := FdmControlPc.cdsPainelQtd_Observacoes.AsInteger + 1;
      FdmControlPc.cdsPainel.Post;
   end else
      InformationMessage('Ocorreu um erro na tentativa de registrar a observação !','Observações');
end;

procedure TSrvControlPc.GravarSelecao;
begin
   if FdmControlPc.cdsPainelDesignacao_Pendente.AsString = C_SIM then
      begin
      InformationMessage('Já existe uma solicitação para designação deste protocolo.','Designação');
      FdmControlPc.cdsPainel.Cancel;
      Exit;
   end;

   if FdmControlPc.cdsPainel.State = dsEdit then
      FdmControlPc.cdsPainel.Post;
end;

procedure TSrvControlPc.HabilitarControles;
begin
   FdmControlPc.cdsPainel.EnableControls;
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

procedure TSrvControlPc.ImprimirExtrato(const AProcesso : String; const AFecharTabelas : Boolean);
var
   LFiltroControlPc : TFiltros;
   LControlPc       : TFiltrosControlPc;
   LDados           : TJSONArray;
begin
   if AProcesso = '' then
      begin
      InformationMessage('Informe o nº do processo.','Impressão de Extrato');
      Exit;
   end;

   LFiltroControlPc := TFiltros.create(C_CODIGO_ControlPc);
   try
      LControlPc := LFiltroControlPc.getFiltrosControlPcAsRecord;
      LControlPc.numeroDoProtocolo  := AProcesso;
      LControlPc.idUsuarioDesignado := 0;

      LFiltroControlPc.setFiltrosControlPc(LControlPc);

      if not Filtrar(LFiltroControlPc.getFiltrosControlPcAsJSON, True) or (not TemRegistros) then
         begin
         InformationMessage('Processo não localizado.','Impressão de Extrato');
         Exit;
      end;


      if TemAtualizacoes then
         HistoricoDeAtualizacoes;

      if TemObservacoes then
         ObservacoesDoProtocolo;

      if TemDesignacoes then
         begin
         LDados := FPxyControlPc.RelatorioDeDesignacoes(True,
                                                     StrToDate('01/01/2025'),
                                                     Date,
                                                     FdmControlPc.cdsPainelProtocolo.AsString,
                                                     0);

         FdmControlPc.mtbDesignacoes.Close;
         if LDados.Count > 0 then
            TFuncoesJSON.PopularTabela(FdmControlPc.mtbDesignacoes, LDados)
         else
            FdmControlPc.mtbDesignacoes.Open;
      end;

      FdmControlPc.frpExtrato.Showreport();

   finally
      FreeAndNil(LFiltroControlPc);
      if AFecharTabelas then
         begin
         FdmControlPc.cdsPainel.Close;
         FdmControlPc.mtbDesignacoes.Close;
         FdmControlPc.mtbHistoricoAtualizacoes.Close;
         FdmControlPc.mtbObservacoes.Close;
      end;
   end;
end;

procedure TSrvControlPc.IncluirObservacao;
begin
   FdmControlPc.mtbObservacoes.Append;
   FdmControlPc.mtbObservacoesNome_Usuario.AsString := Seguranca.Nome;
   FdmControlPc.mtbObservacoesData_Hora.AsDateTime  := Now;
end;

function TSrvControlPc.NumeroDoProtocolo: String;
begin
   Result := FdmControlPc.cdsPainelProtocolo.AsString;
end;

function TSrvControlPc.ObservacoesDoProtocolo: String;
begin
   FdmControlPc.mtbObservacoes.Close;
   if FdmControlPc.cdsPainelQtd_Observacoes.AsInteger > 0 then
      TFuncoesJSON.PopularTabela(FdmControlPc.mtbObservacoes, FPxyControlPc.ObservacoesDoProtocolo(FdmControlPc.cdsPainelid_Protocolo.AsInteger))
   else
      FdmControlPc.mtbObservacoes.Open;
   Result := FdmControlPc.cdsPainelProtocolo.AsString;
end;

procedure TSrvControlPc.PosicionarRegistro(const ANumero: String);
begin
   FdmControlPc.cdsPainel.Locate('Protocolo',ANumero,[]);
end;

function TSrvControlPc.Prazo: String;
begin
   Result := TFuncoes.PrazoStatus(FdmControlPc.cdsPainelPrevisao_Solucao.AsDateTime);
end;

function TSrvControlPc.PrazoCores: TCoresPrazo;
begin
   Result := TFuncoes.PrazoCores(FdmControlPc.cdsPainelPrevisao_Solucao.AsDateTime);
end;

function TSrvControlPc.Selecionados(AListBox : TListBox): Boolean;
var
   LId    : Integer;
begin
   Result := False;
   AListBox.Items.Clear;
   LId := FdmControlPc.cdsPainelid_Protocolo.AsInteger;
   try
      FdmControlPc.cdsPainel.DisableControls;
      FdmControlPc.cdsPainel.First;
      while not FdmControlPc.cdsPainel.Eof do
         begin
         if FdmControlPc.cdsPainelSelecionado.AsInteger = 1 then
            AListBox.Items.Add(FdmControlPc.cdsPainelProtocolo.AsString);

         FdmControlPc.cdsPainel.Next;
      end;
      Result := AListBox.Count > 0;
   finally
(*
      if not Result then
         InformationMessage('Não há nenhum protocolo selecionado!','CONTROLPC');
*)
      FdmControlPc.cdsPainel.locate('id_Protocolo',Lid,[]);
      if not Result then
         begin
         AListBox.Items.Add(FdmControlPc.cdsPainelProtocolo.AsString);
         Result := True;
      end;

      FdmControlPc.cdsPainel.EnableControls;
   end;
end;

function TSrvControlPc.StatusAtual: String;
begin
   Result := FdmControlPc.cdsPainelStatus_True.AsString;
end;

procedure TSrvControlPc.StatusTrueExcluirTodos;
begin
   if FdmControlPc.mtbStatusTrue.Locate('Status',C_TODOS)  then
      FdmControlPc.mtbStatusTrue.Delete;
end;

procedure TSrvControlPc.StatusTrueIncluirTodos;
begin
   IncluirRegistro(FdmControlPc.mtbStatusTrue, 'Status', C_TODOS);
end;

procedure TSrvControlPc.TabelasDeDominio;
begin
   TFuncoesJSON.PopularTabela(FdmControlPc.mtbTecnicos, FPxyControlPc.Tecnicos);
   TFuncoesJSON.PopularTabela(FdmControlPc.mtbTiposCliente, FPxyControlPc.TiposDeCliente);
   TFuncoesJSON.PopularTabela(FdmControlPc.mtbStatusTrue, FPxyControlPc.StatusTrue);

   IncluirRegistro(FdmControlPc.mtbTecnicos, 'Nome_Tecnico', C_TODOS);
   IncluirRegistro(FdmControlPc.mtbTiposCliente, 'Tipo_Cliente', C_TODOS);
   IncluirRegistro(FdmControlPc.mtbStatusTrue, 'Status', C_TODOS);

   TFuncoesJSON.PopularTabela(FdmControlPc.mtbSetores, FPxyControlPc.Setores(Seguranca.id));
   TFuncoesJSON.PopularTabela(FdmControlPc.mtbUsuarios, FPxyControlPc.Usuarios(Seguranca.id));

   IncluirRegistro(FdmControlPc.mtbSetores, 'Nome_Setor', C_DESCRICAO_NAO_DESIGNADO, C_CODIGO_NAO_DESIGNADO);
   IncluirRegistro(FdmControlPc.mtbUsuarios, 'Nome_Usuario', C_DESCRICAO_NAO_DESIGNADO, C_CODIGO_NAO_DESIGNADO);
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

function TSrvControlPc.TemObservacoes: Boolean;
begin
   Result := FdmControlPc.cdsPainelQtd_Observacoes.AsInteger > 0;
end;

function TSrvControlPc.TemRegistros: Boolean;
begin
   Result := (FdmControlPc.cdsPainel.State = dsBrowse) and (not FdmControlPc.cdsPainel.IsEmpty);
end;

function TSrvControlPc.idSetorDesignado : integer;
begin
   Result := FdmControlPc.cdsPainelid_Setor_Designado.asinteger;
end;

function TSrvControlPc.idUsuarioDesignado: integer;
begin
   Result := FdmControlPc.cdsPainelid_Usuario_Designado.asinteger;
end;

procedure TSrvControlPc.UsuariosDoSetor(const AIdSetor: Integer);
begin
   FdmControlPc.mtbUsuariosDoSetor.Close;
   TFuncoesJSON.PopularTabela(FdmControlPc.mtbUsuariosDoSetor, FPxyControlPc.UsuariosDoSetor(AIdSetor));

   IncluirRegistro(FdmControlPc.mtbUsuariosDoSetor, 'Nome_Usuario', C_DESCRICAO_NAO_DESIGNADO, C_CODIGO_NAO_DESIGNADO);
end;

procedure TSrvControlPc.UtilizarUsuarioAtual;
begin
   FdmControlPc.mtbUsuarios.Close;
   FdmControlPc.mtbUsuarios.Open;
   FdmControlPc.mtbUsuarios.Append;
   FdmControlPc.mtbUsuariosid.AsInteger          := Seguranca.id;
   FdmControlPc.mtbUsuariosNome_Usuario.AsString := Seguranca.Nome;
   FdmControlPc.mtbUsuarios.Post;
end;

end.
