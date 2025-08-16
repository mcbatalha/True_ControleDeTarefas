unit ServerMethods.ControlPc;

interface

uses
  System.SysUtils,
  System.Classes,
  System.JSON,
  System.Generics.Collections,

  Datasnap.DSServer,
  Datasnap.DSAuth,
  Datasnap.DSProviderDataModuleAdapter,

  Data.DB,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,

  Libs.Constantes,
  Libs.TTransacao,
  Libs.TFiltros,
  Libs.TFuncoesJSON,
  Utils.TFuncoesServer;

type
  TSMControlPc = class(TDSServerModule)
    qrySetores: TFDQuery;
    qrySetoresid: TIntegerField;
    qrySetoresNome_Setor: TStringField;
    qryControlPc: TFDQuery;
    qryControlPcHistorico: TFDQuery;
    qryControlPcLog: TFDQuery;
    qryControlPcid: TLargeintField;
    qryControlPcProtocolo: TStringField;
    qryControlPcData_Abertura: TDateTimeField;
    qryControlPcPrevisao_Solucao: TDateTimeField;
    qryControlPcid_Tipo_Cliente: TIntegerField;
    qryControlPcTipo_Reclame: TStringField;
    qryControlPcTipo_Nip: TStringField;
    qryControlPcData_Hora_Importacao: TDateTimeField;
    qryControlPcid_Usuario_Importacao: TIntegerField;
    qryControlPcid_Setor_Designado: TIntegerField;
    qryControlPcid_Usuario_Designado: TIntegerField;
    qryControlPcid_Responsavel_Designacao: TIntegerField;
    qryControlPcData_Hora_Designacao: TDateTimeField;
    qryControlPcJustificativa_Designacao: TStringField;
    qryControlPcData_Hora_Encerramento: TDateTimeField;
    qryControlPcid_Usuario_Encerramento: TIntegerField;
    qryControlPcJustificativa_Encerramento: TStringField;
    qryControlPcHistoricoid: TLargeintField;
    qryControlPcHistoricoid_ControlPc: TLargeintField;
    qryControlPcHistoricoid_Tecnico: TIntegerField;
    qryControlPcHistoricoid_Tipo_Cliente: TIntegerField;
    qryControlPcHistoricoid_Usuario_Responsavel: TIntegerField;
    qryControlPcHistoricoData_Hora_Historico: TDateTimeField;
    qryPainelControlPc: TFDQuery;
    qryAux: TFDQuery;
    qryControlPcid_Tecnico: TIntegerField;
    qryControlPcLogid: TLargeintField;
    qryControlPcLogid_ControlPc: TLargeintField;
    qryControlPcLogid_Setor_Designado: TIntegerField;
    qryControlPcLogid_Usuario_Designado: TIntegerField;
    qryControlPcLogid_Usuario_Responsavel: TIntegerField;
    qryControlPcLogJustificativa: TStringField;
    qryControlPcLogData_Hora_Log: TDateTimeField;
    qryTecnicos: TFDQuery;
    qryTecnicosid: TFDAutoIncField;
    qryTecnicosNome_Tecnico: TStringField;
    qryTiposCliente: TFDQuery;
    qryTiposClienteid: TFDAutoIncField;
    qryTiposClienteTipo_Cliente: TStringField;
    qryControlPcUltima_Atualizacao: TDateTimeField;
    qryControlPcid_Usuario_Ultima_Atualizacao: TIntegerField;
    qryControlPcid_Status_True: TIntegerField;
    qryControlPcHistoricoid_Status_True: TIntegerField;
    qryPainelControlPcid_Protocolo: TLargeintField;
    qryPainelControlPcProtocolo: TStringField;
    qryPainelControlPcData_Abertura: TDateTimeField;
    qryPainelControlPcPrevisao_Solucao: TDateTimeField;
    qryPainelControlPcTipo_Reclame: TStringField;
    qryPainelControlPcTipo_Nip: TStringField;
    qryPainelControlPcNome_Tecnico: TStringField;
    qryPainelControlPcTipo_Cliente: TStringField;
    qryPainelControlPcStatus_True: TStringField;
    qryPainelControlPcUsuario_Designado: TStringField;
    qryPainelControlPcSetor_Designado: TStringField;
    qryPainelControlPcQtd_Historicos: TIntegerField;
    qryPainelControlPcQtd_Designacoes: TIntegerField;
    qryPainelControlPcQtd_Observacoes: TIntegerField;
    qryPainelControlPcid_Usuario_Designado: TIntegerField;
    qryPainelControlPcid_Setor_Designado: TIntegerField;
    qryControlPcDesignacao_Pendente: TStringField;
    qryPainelControlPcDesignacao_Pendente: TStringField;
    qryIncluirDesignacao: TFDQuery;
    qryIncluirDesignacaoid: TLargeintField;
    qryIncluirDesignacaoid_Protocolo: TLargeintField;
    qryIncluirDesignacaoid_Usuario_Solicitante: TIntegerField;
    qryIncluirDesignacaoData_Solicitacao: TDateTimeField;
    qryIncluirDesignacaoid_Usuario_Designado: TIntegerField;
    qryIncluirDesignacaoid_Usuario_Solicitado: TIntegerField;
    qryIncluirDesignacaoid_Setor_Designado: TIntegerField;
    qryIncluirDesignacaoid_Setor_Solicitado: TIntegerField;
    qryIncluirDesignacaoAutorizado: TStringField;
    qryIncluirDesignacaoData_Hora_Autorizacao: TDateTimeField;
    qryIncluirDesignacaoJustificativa: TStringField;
    qryIncluirDesignacaoid_Usuario_Autorizador: TIntegerField;
    qryPainelControlPcid_Status_True: TIntegerField;
    qryDesignacoesPendentes: TFDQuery;
    qryDesignacoesPendentesData_Solicitacao: TDateTimeField;
    qryDesignacoesPendentesJustificativa: TStringField;
    qryDesignacoesPendentesid_Protocolo: TLargeintField;
    qryDesignacoesPendentesProtocolo: TStringField;
    qryDesignacoesPendentesUsuario_Solicitante: TStringField;
    qryDesignacoesPendentesUsuario_Atual: TStringField;
    qryDesignacoesPendentesUsuario_Solicitado: TStringField;
    qryDesignacoesPendentesSetor_Atual: TStringField;
    qryDesignacoesPendentesSetor_Solicitado: TStringField;
    qryDesignacoesPendentesStatus_True: TStringField;
    qryDesignacoesPendentesid_Solicitacao: TLargeintField;
  private

    FIdTecnico            : integer;
    FIdTipoCliente        : integer;
    FIdUsuarioDesignado   : integer;

    FNumeroProtocolo      : String;
    FDataAbertura         : TDateTime;
    FPrevisaoSolucao      : TDateTime;
    FTipoReclame          : String;
    FTipoNip              : String;

    FTotalRegistros       : Integer;
    FTotalNovos           : Integer;
    FTotalAtualizados     : Integer;
    FTotalNaoAtualizados  : Integer;

    FIdUsuarioResponsavel : Integer;
    FDataHora             : TDateTime;

    FTemDataAbertura      : Boolean;
    FTemPrevisaoSolucao   : Boolean;

    procedure AbrirTabelasDeCadastro;
    procedure FecharTabelasDeCadastro;

    function ObterIdTecnico(const AValor : String) : integer;
    function ObterIdTipoCliente(const AValor : String) : integer;

    procedure GravarProtocolo;
    procedure GravarHistorico(const AId : Largeint);
    procedure GravarLogDesigancao(const AIdProtocolo,
                                        AIdUsuarioResponsavel,
                                        AIdUsuario,
                                        AIdSetor : Integer;
                                  const AJustificativa : String);

    procedure MontarQueryPainel;
  public
    function Importar(const ARegistros : TJSONArray; const AIdUsuario : integer) : TJSONObject;

    function FiltrarProtocolos(const AFiltros : TJSONObject; const AIncluirEncerrados : Boolean) : TJSONArray;
    function Designar(const AProtocolos : TJSONArray;
                      const AJustificativa: String;
                      const AIdSetor, AIdUsuario, AIdUsuarioResponsavel : integer;
                      const AIdProtocolo : LongInt ): Boolean;

    function RegistrarObservacao(const AIdProtocolo : LongInt;
                                 const AObservacao: String;
                                 const AIdUsuarioResponsavel : integer;
                                 out ADataHora : TDateTime): Boolean;

    function AlterarStatus(const AIdProtocolo : LongInt;
                           const AIdStatus   : Integer;
                           const AJustificativa: String;
                           const AIdUsuarioResponsavel : integer): Boolean;

    function HistoricoDeDesignacoes(const AIdProtocolo : LongInt) : TJSONArray;
    function HistoricoDeAtualizacoes(const AIdProtocolo : LongInt) : TJSONArray;
    function ObservacoesDoProtocolo(const AIdProtocolo : LongInt) : TJSONArray;


    function Tecnicos         : TJSONArray;
    function TiposDeCliente   : TJSONArray;
    function StatusTrue       : TJSONArray;
    function ProtocolosAtivos : TJSONArray;

    function Setores(const AIdUsuario : Integer)      : TJSONArray;
    function Usuarios(const AIdUsuario : Integer)     : TJSONArray;
    function UsuariosDoSetor(const AIdSetor: Integer) : TJSONArray;

    function RelatorioDeDesignacoes(const AUsaDatas : Boolean;
                                    const ADataInicial, ADataFinal : TDateTime;
                                    const ANumeroProtocolo : string;
                                    const AIdUsuarioResponsavel : integer) : TJSONArray;

    function RelatorioDeEncerramentos(const ADataInicial, ADataFinal : TDateTime;
                                      const AIdUsuarioResponsavel : integer) : TJSONArray;

    function DesignacoesPendentes : TJSONArray;

    function AutorizarDesiganacao(const AIdProtocolo, AIdSolicitacao : LongInt;
                                  const AAutorizado : Boolean;
                                  const AIdUsuario : Integer)  : Boolean;

end;

implementation
uses ServerMethods.Container,
     Funcoes,
     Libs.TFuncoesServer;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TSMControlPc }

procedure TSMControlPc.AbrirTabelasDeCadastro;
begin
   FecharTabelasDeCadastro;

   qryTecnicos.Open;
   qryTiposCliente.Open;
end;

function TSMControlPc.DesignacoesPendentes: TJSONArray;
begin
   qryDesignacoesPendentes.Close;

   Result := TFuncoesJSON.MontarJSON(qryDesignacoesPendentes);
end;

function TSMControlPc.Designar(
   const AProtocolos : TJSONArray;
   const AJustificativa: String;
   const AIdSetor, AIdUsuario, AIdUsuarioResponsavel: integer; const AIdProtocolo: LongInt): Boolean;
var
   i : integer;
   LQtd       : integer;
   LPerfil    : String;
begin
   Result := False;

   try
      FIdUsuarioResponsavel := AIdUsuarioResponsavel;
      FDataHora             := Now;
      TTransacao.IniciarTransacao(ServerContainer.FDConnection);

      LPerfil := TFuncoesServer.PerfilUsuario(AIdUsuarioResponsavel);

      try
         LQtd := AProtocolos.Count -1;

         qryControlPc.Close;
         qryControlPc.Sql.Clear;
         qryControlPc.Sql.Add('Select * from ControlPc');
         qryControlPc.Sql.Add('where Protocolo in (');
         for I := 0 to LQtd do
            begin
            if i < LQtd then
               qryControlPc.Sql.Add(QuotedStr(AProtocolos.Items[i].GetValue<String>) + ',')
            else
               qryControlPc.Sql.Add(QuotedStr(AProtocolos.Items[i].GetValue<String>));
         end;
         qryControlPc.Sql.Add(')');
         qryControlPc.Open;

         if qryControlPc.isEmpty then
            Exit;

         qryIncluirDesignacao.Open;
         while not qryControlPc.Eof do
            begin
            qryControlPc.Edit;
            if LPerfil = C_PERFIL_USUARIO then
               begin
               qryControlPcDesignacao_Pendente.AsString := C_SIM;

               qryIncluirDesignacao.Append;
               qryIncluirDesignacaoid_Protocolo.AsInteger           := qryControlPcid.AsInteger;
               qryIncluirDesignacaoid_Usuario_Solicitante.AsInteger := AIdUsuarioResponsavel;
               qryIncluirDesignacaoData_Solicitacao.AsDateTime      := FDataHora;
               qryIncluirDesignacaoAutorizado.AsString              := 'Pendente';
               qryIncluirDesignacaoJustificativa.AsString           := AJustificativa;

               if (qryControlPcid_Usuario_Designado.AsInteger <> 0) then
                  qryIncluirDesignacaoid_Usuario_Designado.AsInteger  := qryControlPcid_Usuario_Designado.AsInteger;

               if (AIdUsuario <> 0) and (AIdUsuario <> C_CODIGO_NAO_DESIGNADO) then
                  qryIncluirDesignacaoid_Usuario_Solicitado.AsInteger := AIdUsuario;

               if qryControlPcid_Setor_Designado.AsInteger > 0 then
                  qryIncluirDesignacaoid_Setor_Designado.AsInteger    := qryControlPcid_Setor_Designado.AsInteger;

               if (AIdSetor <> 0) and (AIdSetor <> C_CODIGO_NAO_DESIGNADO) then
                  qryIncluirDesignacaoid_Setor_Solicitado.AsInteger   := AIdSetor;
               qryIncluirDesignacao.Post;
            end else
               begin
               if (AIdSetor = 0) or (AIdSetor = C_CODIGO_NAO_DESIGNADO) then
                  qryControlPcid_Setor_Designado.Clear
               else
                  qryControlPcid_Setor_Designado.AsInteger  := AIdSetor;

               if (AIdUsuario = 0) or (AIdUsuario = C_CODIGO_NAO_DESIGNADO) then
                  qryControlPcid_Usuario_Designado.Clear
               else
                  qryControlPcid_Usuario_Designado.AsInteger := AIdUsuario;

               qryControlPcid_Responsavel_Designacao.AsInteger := AIdUsuarioResponsavel;
               qryControlPcData_Hora_Designacao.AsDateTime     := FDataHora;
               qryControlPcJustificativa_Designacao.AsString   := AJustificativa;

               GravarLogDesigancao(qryControlPcid.AsInteger,
                                   AIdUsuarioResponsavel,
                                   AIdUsuario,
                                   AIdSetor,
                                   AJustificativa);
            end;
            qryControlPc.Post;

            qryControlPc.Next;
         end;
         qryIncluirDesignacao.Close;


         if TTransacao.ComitarTransacao(ServerContainer.FDConnection) then
            Result := True;
      except
         begin
         Result := False;
         TTransacao.CancelarTransacao(ServerContainer.FDConnection);
         Exit;
         end;
      end;

   finally
      qryControlPcLog.Close;
      qryControlPcHistorico.Close;
      qryControlPc.Close;
   end;
end;


function TSMControlPc.AlterarStatus(
   const AIdProtocolo  : LongInt;
   const AIdStatus     : Integer;
   const AJustificativa: String;
   const AIdUsuarioResponsavel : integer): Boolean;
var
   LEncerrarProcesso : Boolean;
   LDataHora         : TDateTime;
begin
   Result    := False;
   LDataHora := Now;

   try
      TTransacao.IniciarTransacao(ServerContainer.FDConnection);
      try
         qryAux.Close;
         qryAux.Sql.Clear;
         qryAux.Sql.Add('Select * from Status_True');
         qryAux.Sql.Add('where id = :pIdStatus');
         qryAux.ParamByName('pIdStatus').AsInteger := AIdStatus;
         qryAux.Open;
         LEncerrarProcesso := qryAux.FieldByName('Encerra').AsString = C_SIM;
         qryAux.Close;

         qryControlPc.Close;
         qryControlPc.Sql.Clear;
         qryControlPc.Sql.Add('Select * from ControlPc');
         qryControlPc.Sql.Add('where id = :pIdProtocolo');
         qryControlPc.ParamByName('pIdProtocolo').AsInteger := AIdProtocolo;
         qryControlPc.Open;

         if qryControlPc.isEmpty then
            Exit;

         qryAux.Close;
         qryAux.Sql.Clear;
         qryAux.Sql.Add('Insert Into ControlPc_Historico');
         qryAux.Sql.Add('   (id_ControlPc, id_Tecnico, id_Tipo_Cliente,  ');
         qryAux.Sql.Add('    id_Usuario_Responsavel, Data_Hora_Historico, id_Status_True)');
         qryAux.Sql.Add('Select ');
         qryAux.Sql.Add('   id, id_Tecnico, id_Tipo_Cliente, ');
         qryAux.Sql.Add('   :pIdUsuario, :pDataHora, :pIdStatus ');
         qryAux.Sql.Add('From ');
         qryAux.Sql.Add('   ControlPc ');
         qryAux.Sql.Add('where');
         qryAux.Sql.Add('   id = :pId');
         qryAux.ParamByName('pId').AsInteger        := AIdProtocolo;
         qryAux.ParamByName('pIdUsuario').AsInteger := AIdUsuarioResponsavel;
         qryAux.ParamByName('pDataHora').AsDateTime := LDataHora;
         qryAux.ParamByName('pIdStatus').AsInteger  := AIdStatus;
         qryAux.ExecSQL;

         qryControlPc.Edit;
         qryControlPcid_Status_True.AsInteger := AIdStatus;

         if LEncerrarProcesso then
            begin
            qryControlPcid_Usuario_Encerramento.AsInteger   := AIdUsuarioResponsavel;
            qryControlPcData_Hora_Encerramento.AsDateTime   := LDataHora;
            qryControlPcJustificativa_Encerramento.AsString := AJustificativa;
         end;
         qryControlPc.Post;

         if TTransacao.ComitarTransacao(ServerContainer.FDConnection) then
            Result := True;
      except
         begin
         Result := False;
         TTransacao.CancelarTransacao(ServerContainer.FDConnection);
         Exit;
         end;
      end;

   finally
      qryControlPcLog.Close;
      qryControlPcHistorico.Close;
      qryControlPc.Close;
   end;
end;

function TSMControlPc.AutorizarDesiganacao(const AIdProtocolo, AIdSolicitacao: LongInt; const AAutorizado: Boolean; const AIdUsuario: Integer): Boolean;
begin
   Result    := False;
   FDataHora := Now;

   try
      try
         TTransacao.IniciarTransacao(ServerContainer.FDConnection);

         qryAux.Close;
         qryAux.Sql.Clear;
         qryAux.Sql.Add('Select * from ControlPc_Designacao_Solicitacao');
         qryAux.Sql.Add('where id = :pId');
         qryAux.ParamByName('pId').AsInteger := AIdSolicitacao;
         qryAux.Open;

         qryControlPc.Close;
         qryControlPc.ParamByName('pIdProtocolo').AsInteger := AIdProtocolo;
         qryControlPc.Open;

         qryAux.Edit;
         qryControlPc.Edit;

         if not AAutorizado then
            begin
            qryAux.FieldByName('Autorizado').AsString := C_NAO;
         end else
            begin
            qryAux.FieldByName('Autorizado').AsString := C_SIM;
            if qryAux.FieldByName('id_Setor_Solicitado').AsInteger > 0 then
               qryControlPcid_Setor_Designado.AsInteger := qryAux.FieldByName('id_Setor_Solicitado').AsInteger;
            if qryAux.FieldByName('id_Usuario_Solicitado').AsInteger > 0 then
               qryControlPcid_Usuario_Designado.AsInteger := qryAux.FieldByName('id_Usuario_Solicitado').AsInteger;

            qryControlPcData_Hora_Designacao.AsDateTime     := FDataHora;
            qryControlPcid_Responsavel_Designacao.AsInteger := qryAux.FieldByName('id_Usuario_Solicitante').AsInteger;
            qryControlPcJustificativa_Designacao.AsString   := qryAux.FieldByName('Justificativa').AsString;
         end;

         qryControlPcDesignacao_Pendente.AsString := C_NAO;
         qryControlPc.Post;

         qryAux.FieldByName('Data_Hora_Autorizacao').AsDateTime := FDataHora;
         qryAux.FieldByName('id_Usuario_Autorizador').AsInteger := AIdUsuario;
         qryAux.Post;

         if AAutorizado then
            begin
            GravarLogDesigancao(qryControlPcid.AsInteger,
                                qryAux.FieldByName('id_Usuario_Solicitante').AsInteger,
                                qryAux.FieldByName('id_Usuario_Solicitado').AsInteger,
                                qryAux.FieldByName('id_Setor_Solicitado').AsInteger,
                                qryAux.FieldByName('Justificativa').AsString);
         end;
         TTransacao.ComitarTransacao(ServerContainer.FDConnection);
         Result := True;

      except
         TTransacao.CancelarTransacao(ServerContainer.FDConnection);
         Result := False;
      end;

   finally
      qryAux.Open;
      qryControlPc.Open;
   end;
end;

procedure TSMControlPc.FecharTabelasDeCadastro;
begin
   qryTecnicos.Close;
   qryTiposCliente.Close;
end;

function TSMControlPc.FiltrarProtocolos(const AFiltros: TJSONObject; const AIncluirEncerrados : Boolean): TJSONArray;
var
   LFiltros : TFiltrosControlPc;
begin

   LFiltros.numeroDoProtocolo    := AFiltros.GetValue<String>('numeroDoProtocolo');
   LFiltros.idTecnico            := AFiltros.GetValue<integer>('idTecnico');
   LFiltros.idTipoCliente        := AFiltros.GetValue<integer>('idTipoCliente');
   LFiltros.idStatusTrue         := AFiltros.GetValue<integer>('idStatusTrue');

   LFiltros.usaDataAbertura      := AFiltros.GetValue<Boolean>('usaDataAbertura');
   LFiltros.usaPrevisaoSolucao   := AFiltros.GetValue<Boolean>('usaPrevisaoSolucao');
   LFiltros.tipoReclame          := AFiltros.GetValue<String>('tipoReclame');
   LFiltros.tipoNip              := AFiltros.GetValue<String>('tipoNip');

   LFiltros.idSetorDesignado     := AFiltros.GetValue<integer>('idSetorDesignado');
   LFiltros.idUsuarioDesignado   := AFiltros.GetValue<integer>('idUsuarioDesignado');

   LFiltros.nomeUsuario          := AFiltros.GetValue<String>('nomeUsuario');

   if LFiltros.usaDataAbertura then
     LFiltros.dataAbertura       := AFiltros.GetValue<TDateTime>('dataAbertura');

   if LFiltros.usaPrevisaoSolucao then
     LFiltros.previsaoSolucao    := AFiltros.GetValue<TDateTime>('previsaoSolucao');

   MontarQueryPainel;

   if not AIncluirEncerrados then
      qryPainelControlPc.Sql.Add(' and a.Data_Hora_Encerramento is null');

   if LFiltros.numeroDoProtocolo <> '' then
      begin
      qryPainelControlPc.Sql.Add(' and a.Protocolo like :pNumeroDoProtocolo');
      qryPainelControlPc.ParamByName('pNumeroDoProtocolo').AsString := '%' + LFiltros.numeroDoProtocolo + '%';
   end;

   if LFiltros.idStatusTrue > 0 then
      begin
      qryPainelControlPc.Sql.Add(' and a.id_Status_True = :pIdStatusTrue');
      qryPainelControlPc.ParamByName('pIdStatusTrue').AsInteger := LFiltros.idStatusTrue;
   end;

   if LFiltros.idTecnico > 0 then
      begin
      qryPainelControlPc.Sql.Add(' and a.id_Tecnico = :pIdTecnico');
      qryPainelControlPc.ParamByName('pIdTecnico').AsInteger := LFiltros.idTecnico;
   end;

   if LFiltros.idTipoCliente > 0 then
      begin
      qryPainelControlPc.Sql.Add(' and a.id_Tipo_Cliente = :pIdTipoCliente');
      qryPainelControlPc.ParamByName('pIdTipoCliente').AsInteger := LFiltros.idTipoCliente;
   end;

   if LFiltros.usaDataAbertura then
      begin
      qryPainelControlPc.Sql.Add(' and cast(a.Data_Abertura as Date) = :pDataAbertura');
      qryPainelControlPc.ParamByName('pDataAbertura').AsDate := LFiltros.dataAbertura;
   end;

   if LFiltros.usaPrevisaoSolucao then
      begin
      qryPainelControlPc.Sql.Add(' and cast(a.Previsao_Solucao  as Date)= :pPrevisaoSolucao');
      qryPainelControlPc.ParamByName('pPrevisaoSolucao').AsDate := LFiltros.previsaoSolucao;
   end;

   if LFiltros.tipoReclame <> C_TODOS then
      begin
      qryPainelControlPc.Sql.Add(' and a.Tipo_Reclame = :pTipoReclame');
      qryPainelControlPc.ParamByName('pTipoReclame').AsString := LFiltros.tipoReclame;
   end;

   if LFiltros.tipoNip <> C_TODOS then
      begin
      qryPainelControlPc.Sql.Add(' and a.Tipo_Nip = :pTipoNip');
      qryPainelControlPc.ParamByName('pTipoNip').AsString := LFiltros.tipoNip;
   end;

   if (LFiltros.idSetorDesignado <> 0) and  (LFiltros.idSetorDesignado <> C_CODIGO_NAO_DESIGNADO)then
      begin
      qryPainelControlPc.Sql.Add(' and a.id_Setor_Designado = :pIdSetorDesignado');
      qryPainelControlPc.ParamByName('pIdSetorDesignado').AsInteger := LFiltros.idSetorDesignado;
   end;

   if (LFiltros.idUsuarioDesignado <> 0) and  (LFiltros.idUsuarioDesignado <> C_CODIGO_NAO_DESIGNADO) then
      begin
      if LFiltros.idUsuarioDesignado = C_CODIGO_NAO_DESIGNADO then
         qryPainelControlPc.Sql.Add(' and a.id_Usuario_Designado is null')
      else
         begin
         qryPainelControlPc.Sql.Add(' and a.id_Usuario_Designado = :pIdUsuarioDesignado');
         qryPainelControlPc.ParamByName('pIdUsuarioDesignado').AsInteger := LFiltros.idUsuarioDesignado;
      end;
   end;

   qryPainelControlPc.Open;
   Result := TFuncoesJSON.MontarJSON(qryPainelControlPc);
   qryPainelControlPc.Close;
end;

procedure TSMControlPc.GravarHistorico(const AId: Largeint);
begin
   qryControlPcHistorico.Close;
   try
      qryControlPcHistorico.ParamByName('pIdControlPc').AsInteger := AId;
      qryControlPcHistorico.Open;
      qryControlPcHistorico.Append;
      qryControlPcHistoricoid_ControlPc.AsInteger           := AId;
      if qryControlPcid_Tecnico.AsInteger > 0 then
         qryControlPcHistoricoid_Tecnico.AsInteger          := qryControlPcid_Tecnico.AsInteger;
      if qryControlPcid_Tipo_Cliente.AsInteger > 0 then
         qryControlPcHistoricoid_Tipo_Cliente.AsInteger     := qryControlPcid_Tipo_Cliente.AsInteger;
      if qryControlPcid_Status_True.AsInteger > 0 then
         qryControlPcHistoricoid_Status_True.AsInteger         := qryControlPcid_Status_True.AsInteger;
      qryControlPcHistoricoid_Usuario_Responsavel.AsInteger := qryControlPcid_Usuario_Importacao.AsInteger;
      qryControlPcHistoricoData_Hora_Historico.AsDateTime   := FDataHora;
      qryControlPcHistorico.Post;
   finally
      qryControlPcHistorico.Close;
   end;
end;

procedure TSMControlPc.GravarLogDesigancao(const AIdProtocolo,
                                                 AIdUsuarioResponsavel,
                                                 AIdUsuario,
                                                 AIdSetor : Integer;
                                           const AJustificativa : String);
begin
   qryControlPcLog.Close;
   qryControlPcLog.ParamByName('pIdControlPc').AsInteger := AIdProtocolo;
   qryControlPcLog.Open;

   qryControlPcLog.Append;
   qryControlPcLogid_ControlPc.AsInteger            := AIdProtocolo;
   qryControlPcLogid_Usuario_Responsavel.AsInteger  := AIdUsuarioResponsavel;
   qryControlPcLogJustificativa.AsString            := AJustificativa;
   qryControlPcLogData_Hora_Log.AsDateTime          := FDataHora;

   if (AIdSetor > 0) and (AIdSetor <> C_CODIGO_NAO_DESIGNADO) then
      qryControlPcLogid_Setor_Designado.AsInteger   := AIdSetor;
   if (AIdUsuario > 0) and (AIdUsuario <> C_CODIGO_NAO_DESIGNADO) then
      qryControlPcLogid_Usuario_Designado.AsInteger := AIdUsuario;
   qryControlPcLog.Post;
   qryControlPcLog.Close;
end;

procedure TSMControlPc.GravarProtocolo;
var
   LNovo      : Boolean;
   LAtualizar : Boolean;

   LSetor     : Integer;
begin
   qryControlPc.Close;
   qryControlPc.Sql.Clear;
   qryControlPc.Sql.Add('Select * from ControlPc');
   qryControlPc.Sql.Add('where Protocolo = :pNumeroProtocolo');
   qryControlPc.ParamByName('pNumeroProtocolo').AsString := FNumeroProtocolo;
   qryControlPc.Open;

   FTotalRegistros := FTotalRegistros + 1;

   try
      LAtualizar := False;
      LNovo := qryControlPc.isEmpty;
      if LNovo then
         begin
         qryControlPc.Append;
         qryControlPcProtocolo.AsString := FNumeroProtocolo;
      end else
         begin
         if (qryControlPcid_Tecnico.AsInteger            <> FIdTecnico) or
            (qryControlPcid_Tipo_Cliente.AsInteger       <> FIdTipoCliente) or
            (qryControlPcTipo_Reclame.AsString           <> FTipoReclame) or
            (qryControlPcTipo_Nip.AsString               <> FTipoNip) then
            begin
            LAtualizar := True;
            qryControlPc.Edit;
         end;
      end;

      if LNovo or LAtualizar then
         begin
         if LAtualizar then
            begin
            GravarHistorico(qryControlPcid.AsInteger);
            FTotalAtualizados := FTotalAtualizados + 1;
         end else
            FTotalNovos := FTotalNovos + 1;

         qryControlPcid_Tecnico.AsInteger             := FIdTecnico;
         qryControlPcid_Tipo_Cliente.AsInteger        := FIdTipoCliente;

         if FTemDataAbertura then
            qryControlPcData_Abertura.AsDateTime      := FDataAbertura;
         if FTemPrevisaoSolucao then
            qryControlPcPrevisao_Solucao.AsDateTime   := FPrevisaoSolucao;
         qryControlPcTipo_Reclame.AsString            := FTipoReclame;
         qryControlPcTipo_Nip.AsString                := FTipoNip;
         if FIdUsuarioDesignado > 0 then
            begin
            qryControlPcid_Usuario_Designado.AsInteger := FIdUsuarioDesignado;
            LSetor := TFuncoesServer.SetorDoUsuario(FIdUsuarioDesignado);
            if LSetor > 0 then
               qryControlPcid_Setor_Designado.AsInteger := FIdUsuarioDesignado;
         end;

         qryControlPcid_Usuario_Ultima_Atualizacao.AsInteger := FIdUsuarioResponsavel;
         qryControlPcUltima_Atualizacao.AsDateTime           := FDataHora;
         if LNovo then
            begin
            qryControlPcid_Usuario_Importacao.AsInteger    := FIdUsuarioResponsavel;
            qryControlPcData_Hora_Importacao.AsDateTime    := FDataHora;
         end;
         qryControlPc.Post;
      end else
         FTotalNaoAtualizados := FTotalNaoAtualizados + 1;
   finally
      qryControlPc.Close;
   end;
end;

function TSMControlPc.HistoricoDeAtualizacoes(const AIdProtocolo: LongInt): TJSONArray;
begin
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add('Select ');
   qryAux.Sql.Add('   a.Data_Hora_Historico, ');
   qryAux.Sql.Add('   d.Nome_Tecnico,                                     ');
   qryAux.Sql.Add('   e.Status as Status_True,                            ');
   qryAux.Sql.Add('   f.Tipo_Cliente,                                     ');
   qryAux.Sql.Add('   g.Nome_Usuario                                      ');
   qryAux.Sql.Add('From ');
   qryAux.Sql.Add('   ControlPc_Historico a ');
   qryAux.Sql.Add('   INNER JOIN Tecnicos d on d.id = a.id_Tecnico                           ');
   qryAux.Sql.Add('   LEFT OUTER JOIN Status_True e on e.id = a.id_Status_True');
   qryAux.Sql.Add('   LEFT OUTER JOIN Tipos_Cliente f on f.id = a.id_Tipo_Cliente            ');
   qryAux.Sql.Add('   INNER JOIN Usuarios g on g.id = a.id_Usuario_Responsavel               ');
   qryAux.Sql.Add('where ');
   qryAux.Sql.Add('   a.id_ControlPc = :pIdProtocolo');
   qryAux.Sql.Add('Order by ');
   qryAux.Sql.Add('   a.Data_Hora_Historico desc ');
   qryAux.ParamByName('pIdProtocolo').AsInteger := AIdProtocolo;

   Result := TFuncoesJSON.MontarJSON(qryAux);
end;

function TSMControlPc.HistoricoDeDesignacoes(const AIdProtocolo: LongInt): TJSONArray;
begin
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add('Select ');
   qryAux.Sql.Add('   al.Justificativa, al.Data_Hora_Log, ');
   qryAux.Sql.Add('   isnull(sd.Nome_Setor, ' + QuotedStr(C_DESCRICAO_NAO_DESIGNADO) + ') as Nome_Setor, ');
   qryAux.Sql.Add('   isnull(ud.Nome_Usuario, ' + QuotedStr(C_DESCRICAO_NAO_DESIGNADO) + ') as Usuario_Designado, ');
   qryAux.Sql.Add('   ur.Nome_Usuario as Usuario_Responsavel ');
   qryAux.Sql.Add('from ');
   qryAux.Sql.Add('   ControlPc_Log al ');
   qryAux.Sql.Add('   Left Outer Join Setores sd on sd.id = al.id_Setor_Designado');
   qryAux.Sql.Add('   Left Outer Join Usuarios ud on ud.id = al.id_Usuario_Designado ');
   qryAux.Sql.Add('   Left Outer Join Usuarios ur on ur.id = al.id_Usuario_Responsavel ');
   qryAux.Sql.Add('where ');
   qryAux.Sql.Add('   al.id_ControlPc = :pIdProcesso');
   qryAux.Sql.Add('Order by ');
   qryAux.Sql.Add('   al.Data_Hora_Log desc ');
   qryAux.ParamByName('pIdProcesso').AsInteger := AIdProtocolo;

   Result := TFuncoesJSON.MontarJSON(qryAux);
end;

function TSMControlPc.Importar(const ARegistros: TJSONArray; const AIdUsuario: integer): TJSONObject;
var
  I       : Integer;
  LData   : String;
  LObject : TJSONObject;
begin
   Result := TJSONObject.Create;

   FTotalRegistros      := 0;
   FTotalNovos          := 0;
   FTotalAtualizados    := 0;
   FTotalNaoAtualizados := 0;
   FIdUsuarioResponsavel:= AIdUsuario;
   FDataHora  := Now;

   try
      TTransacao.IniciarTransacao(ServerContainer.FDConnection);
      AbrirTabelasDeCadastro;
      try
         for I := 0 to ARegistros.Count - 1 do
            begin
            LObject := ARegistros[i] as TJSONObject;

            FTemDataAbertura      := False;
            FTemPrevisaoSolucao   := False;

            FIdTecnico            := ObterIdTecnico(LObject.Values['TÉCNICO'].Value);
            FIdTipoCliente        := ObterIdTipoCliente(LObject.Values['TIPO CLIENTE'].Value);
            LData                 := LObject.Values['DT. ABERTURA'].Value;
            if LData <> '' then
               begin
               FTemDataAbertura   := True;
               FDataAbertura      := StrToDateTime(LData);
            end;
            LData := LObject.Values['PREVISÃO SOLUÇÃO'].Value;
            if LData <> '' then
               begin
               FTemPrevisaoSolucao := True;
               FPrevisaoSolucao    := StrToDateTime(LData);
            end;

            FTipoReclame        := LObject.Values['TIPO RECLAME'].AsType<String>;
            FTipoNip            := LObject.Values['TIPO NIP/JUDICIAL'].AsType<String>;
            FIdUsuarioDesignado := LObject.Values['ID_USUARIO_DESIGNADO'].AsType<Integer>;

            FNumeroProtocolo     := LObject.Values['PROTOCOLO'].AsType<String>;

            GravarProtocolo;
         end;
         TFuncoesServer.RegistrarImportacao(C_TIPO_AUTOSC, FDataHora, AIdUsuario, FTotalRegistros, FTotalNovos, FTotalAtualizados);

         if TTransacao.ComitarTransacao(ServerContainer.FDConnection) then
            begin
            Result.AddPair('importou',TJSONBool.Create(True));
            Result.AddPair('totalRegistros',TJSONNumber.Create(FTotalRegistros));
            Result.AddPair('totalNovos',TJSONNumber.Create(FTotalNovos));
            Result.AddPair('totalAtualizados',TJSONNumber.Create(FTotalAtualizados));
            Result.AddPair('totalNaoAtualizados',TJSONNumber.Create(FTotalNaoAtualizados));
         end else
            begin
            Result.AddPair('importou',TJSONBool.Create(False));
            Result.AddPair('protocolo',FNumeroProtocolo);
         end;

      except
         begin
         Result.AddPair('importou',TJSONBool.Create(False));
         Result.AddPair('protocolo',FNumeroProtocolo);
         TTransacao.CancelarTransacao(ServerContainer.FDConnection);
         end;
      end;

   finally
      FecharTabelasDeCadastro;
   end;
end;

function TSMControlPc.RelatorioDeDesignacoes(
   const AUsaDatas: Boolean;
   const ADataInicial, ADataFinal: TDateTime;
   const ANumeroProtocolo: string;
   const AIdUsuarioResponsavel : integer) : TJSONArray;
begin
   qryAux.SQL.Clear;
   qryAux.SQL.Add('SELECT                                                                   ');
   qryAux.SQL.Add('   id_ControlPc as id,                                                   ');
   qryAux.SQL.Add('   Usuario_Designado,                                                    ');
   qryAux.SQL.Add('   Setor_Designado,                                                      ');
   qryAux.SQL.Add('   Usuario_Responsavel,                                                  ');
   qryAux.SQL.Add('   Justificativa,                                                        ');
   qryAux.SQL.Add('   Protocolo as Numero,                                                  ');
   qryAux.SQL.Add('   Data_Hora_log AS Data_Hora_Inicial,                                   ');
   qryAux.SQL.Add('   ISNULL(ProximaData, Null) AS Data_Hora_Final,                    ');
   qryAux.SQL.Add('   DATEDIFF(DAY, Data_Hora_log, ISNULL(ProximaData, GETDATE())) AS Dias, ');
   qryAux.SQL.Add('   DATEDIFF(HOUR, Data_Hora_log, ISNULL(ProximaData, GETDATE())) % 24 AS Horas,    ');
   qryAux.SQL.Add('   DATEDIFF(MINUTE, Data_Hora_log, ISNULL(ProximaData, GETDATE())) % 60 AS Minutos ');
   qryAux.SQL.Add('FROM (                                                                             ');
   qryAux.SQL.Add('       SELECT                                                                      ');
   qryAux.SQL.Add('          a.id_ControlPc,                                                             ');
   qryAux.SQL.Add('          a.Data_Hora_log,                                                         ');
   qryAux.SQL.Add('          a.Justificativa,                                                         ');
   qryAux.SQL.Add('          b.Nome_Usuario as Usuario_Designado,                                     ');
   qryAux.SQL.Add('          c.Nome_Setor as Setor_Designado,                                         ');
   qryAux.SQL.Add('          d.Nome_Usuario as Usuario_Responsavel,                                   ');
   qryAux.SQL.Add('          e.Protocolo,                                                       ');
   qryAux.SQL.Add('          LEAD(Data_Hora_log) OVER (PARTITION BY id_ControlPc ORDER BY Data_Hora_log) AS ProximaData ');
   qryAux.SQL.Add('       FROM                                                                                       ');
   qryAux.SQL.Add('          ControlPc_Log a                                                                            ');
   qryAux.SQL.Add('          left outer join Usuarios b on b.id = a.id_Usuario_Designado                             ');
   qryAux.SQL.Add('          left outer join Setores c on c.id = a.id_Setor_Designado                                ');
   qryAux.SQL.Add('          inner join Usuarios d on d.id = a.id_Usuario_Responsavel                                ');
   qryAux.SQL.Add('          inner join ControlPc e on e.id = a.id_ControlPc                                               ');
   qryAux.SQL.Add('       WHERE 1 = 1 ');

   if AUsaDatas then
      begin
      qryAux.SQL.Add('       and cast(a.Data_Hora_Log as Date) between :pDataInicial and :pDataFinal');
      qryAux.ParamByName('pDataInicial').AsDateTime := ADataInicial;
      qryAux.ParamByName('pDataFinal').AsDateTime   := ADataFinal;
   end;

   if ANumeroProtocolo <> '' then
      begin
      qryAux.SQL.Add('       and e.Protocolo = :pNumeroProtocolo');
      qryAux.ParamByName('pNumeroProtocolo').AsString := ANumeroProtocolo;
   end;

   if AIdUsuarioResponsavel > 0 then
      begin
      qryAux.SQL.Add('       and a.id_Usuario_Responsavel = :pIdUsuarioResponsavel');
      qryAux.ParamByName('pIdUsuarioResponsavel').AsInteger := AIdUsuarioResponsavel;
   end;

   qryAux.SQL.Add('     ) AS Logs ');
   qryAux.SQL.Add('Order by Numero, Data_Hora_Inicial desc');

   Result := TFuncoesJSON.MontarJSON(qryAux);
end;

function TSMControlPc.RelatorioDeEncerramentos(
   const ADataInicial, ADataFinal: TDateTime;
   const AIdUsuarioResponsavel: integer): TJSONArray;
begin
   qryAux.SQL.Clear;
   qryAux.SQL.Add('SELECT                                                                   ');
   qryAux.SQL.Add('   a.Protocolo as Numero,                                                ');
   qryAux.SQL.Add('   a.Data_Hora_Importacao,                                               ');
   qryAux.SQL.Add('   a.Data_Hora_Encerramento,                                             ');
   qryAux.SQL.Add('   a.Justificativa_Encerramento,                                         ');
   qryAux.SQL.Add('   b.Nome_Usuario,                                                       ');
   qryAux.SQL.Add('   DATEDIFF(DAY, a.Data_Hora_Importacao, ISNULL(a.Data_Hora_Encerramento, GETDATE())) AS Dias,           ');
   qryAux.SQL.Add('   DATEDIFF(HOUR, a.Data_Hora_Importacao, ISNULL(a.Data_Hora_Encerramento, GETDATE())) % 24 AS Horas,    ');
   qryAux.SQL.Add('   DATEDIFF(MINUTE, a.Data_Hora_Importacao, ISNULL(a.Data_Hora_Encerramento, GETDATE())) % 60 AS Minutos ');
   qryAux.SQL.Add('FROM                                                                          ');
   qryAux.SQL.Add('   ControlPc a                                                                ');
   qryAux.SQL.Add('   Inner Join Usuarios b on b.id = a.id_Usuario_Encerramento                  ');
   qryAux.SQL.Add('WHERE not Data_Hora_Encerramento is null                                      ');
   qryAux.SQL.Add('      and cast(a.Data_Hora_Encerramento as Date) between :pDataInicial and :pDataFinal ');

   if AIdUsuarioResponsavel > 0 then
      begin
      qryAux.SQL.Add('       and a.id_Usuario_Encerramento = :pIdUsuarioResponsavel');
      qryAux.ParamByName('pIdUsuarioResponsavel').AsInteger := AIdUsuarioResponsavel;
   end;
   qryAux.SQL.Add('Order by Data_Hora_Encerramento desc');

   qryAux.ParamByName('pDataInicial').AsDateTime := ADataInicial;
   qryAux.ParamByName('pDataFinal').AsDateTime   := ADataFinal;

   Result := TFuncoesJSON.MontarJSON(qryAux);
end;

procedure TSMControlPc.MontarQueryPainel;
begin
   with qryPainelControlPc do
      begin
      Close;
      Sql.Clear;
      Sql.Add('Select ');
      Sql.Add('   a.id as id_Protocolo, a.Protocolo, a.Data_Abertura, a.Previsao_Solucao, a.Tipo_Reclame, ');
      Sql.Add('   a.Tipo_Nip, a.id_Status_True, a.Data_Hora_Importacao, a.Ultima_Atualizacao, ');
      Sql.Add('   a.Data_Hora_Encerramento, a.Justificativa_Encerramento,  ');
      Sql.Add('   a.id_Usuario_Designado, a.id_Setor_Designado, a.Designacao_Pendente, ');
      Sql.Add('   d.Nome_Tecnico,');
      Sql.Add('   e.Tipo_Cliente,');
      Sql.Add('   f.Status as Status_True,');
      Sql.Add('   g.Nome_Usuario as Usuario_Designado,');
      Sql.Add('   h.Nome_Setor as Setor_Designado,');
      Sql.Add('   i.Nome_Usuario as Usuario_Importacao, ');
      Sql.Add('   j.Nome_Usuario as Usuario_Atualizacao, ');
      Sql.Add('   k.Nome_Usuario as Usuario_Encerrameto, ');

      Sql.Add('   IsNull((Select count(*) ');
      Sql.Add('           From ControlPc_Historico ah ');
      Sql.Add('           where ah.id_ControlPc = a.id),0) as Qtd_Historicos,');
      Sql.Add('   IsNull((Select count(*) ');
      Sql.Add('           From ControlPc_Log al ');
      Sql.Add('           where al.id_ControlPc = a.id),0) as Qtd_Designacoes, ');
      Sql.Add('   IsNull((Select count(*) ');
      Sql.Add('           From ControlPc_Observacoes ao ');
      Sql.Add('           where ao.id_ControlPc = a.id),0) as Qtd_Observacoes');
      Sql.Add('From ');
      Sql.Add('   ControlPc a ');
      Sql.Add('   INNER JOIN Tecnicos d on d.id = a.id_Tecnico');
      Sql.Add('   INNER JOIN Tipos_Cliente e on e.id = a.id_Tipo_Cliente');
      Sql.Add('   LEFT OUTER JOIN Status_True f on f.id = a.id_Status_True');
      Sql.Add('   LEFT OUTER JOIN Usuarios g on g.id = a.id_Usuario_Designado');
      Sql.Add('   LEFT OUTER JOIN Setores h on h.id = a.id_Setor_Designado');
      Sql.Add('   LEFT OUTER JOIN Usuarios i on i.id = a.id_Usuario_Importacao ');
      Sql.Add('   LEFT OUTER JOIN Usuarios j on j.id = a.id_Usuario_Ultima_Atualizacao ');
      Sql.Add('   LEFT OUTER JOIN Usuarios k on k.id = a.id_Usuario_Encerramento');
      Sql.Add('where 1 = 1');
   end;
end;

function TSMControlPc.ObservacoesDoProtocolo(const AIdProtocolo: LongInt): TJSONArray;
begin
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add('Select ');
   qryAux.Sql.Add('   a.Data_Hora, a.Observacao, ');
   qryAux.Sql.Add('   b.Nome_Usuario ');
   qryAux.Sql.Add('From ');
   qryAux.Sql.Add('   ControlPc_Observacoes a ');
   qryAux.Sql.Add('   INNER JOIN Usuarios b on b.id = a.id_Usuario ');
   qryAux.Sql.Add('Where ');
   qryAux.Sql.Add('   a.id_ControlPc = :pIdProtocolo');
   qryAux.Sql.Add('Order by ');
   qryAux.Sql.Add('   a.Data_Hora desc ');

   qryAux.ParamByName('pIdControlPc').AsInteger := AIdProtocolo;

   Result := TFuncoesJSON.MontarJSON(qryAux);
end;

function TSMControlPc.ObterIdTecnico(const AValor: String): integer;
begin
   if not qryTecnicos.Locate('Nome_Tecnico',AValor) then
      begin
      qryTecnicos.Append;
      qryTecnicosNome_Tecnico.AsString := AValor;
      qryTecnicos.Post;
   end;
   Result := qryTecnicosid.AsInteger
end;

function TSMControlPc.ObterIdTipoCliente(const AValor: String): integer;
begin
   if not qryTiposCliente.Locate('Tipo_Cliente',AValor) then
      begin
      qryTiposCliente.Append;
      qryTiposClienteTipo_Cliente.AsString := AValor;
      qryTiposCliente.Post;
   end;
   Result := qryTiposClienteid.AsInteger
end;


function TSMControlPc.ProtocolosAtivos: TJSONArray;
begin
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add('Select ');
   qryAux.Sql.Add('   a.Protocolo, a.id_Usuario_Designado, ');
   qryAux.Sql.Add('   b.Nome_Usuario');
   qryAux.Sql.Add('From ');
   qryAux.Sql.Add('   ControlPc a ');
   qryAux.Sql.Add('   LEFT OUTER JOIN Usuarios b on b.id = a.id_Usuario ');
   qryAux.Sql.Add('Where ');
   qryAux.Sql.Add('   a.Data_Hora_Encerramento is null');
   qryAux.Sql.Add('Order by ');
   qryAux.Sql.Add('   a.Protocolo');

   Result := TFuncoesJSON.MontarJSON(qryAux);
end;

function TSMControlPc.RegistrarObservacao(const AIdProtocolo: LongInt; const AObservacao: String; const AIdUsuarioResponsavel: integer; out ADataHora: TDateTime): Boolean;
begin
   Result := False;

   try
      TTransacao.IniciarTransacao(ServerContainer.FDConnection);
      ADataHora := Now;

      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add('Insert into ControlPc_Observacoes');
      qryAux.Sql.Add('   (id_ControlPc, id_Usuario, Data_Hora, Observacao)');
      qryAux.Sql.Add('Values ');
      qryAux.Sql.Add('   (:pIdControlPc, :pIdUsuario, :pDataHora, :pObservacao)');
      qryAux.ParamByName('pIdControlPc').AsInteger := AIdProtocolo;
      qryAux.ParamByName('pIdUsuario').AsInteger   := AIdUsuarioResponsavel;
      qryAux.ParamByName('pDataHora').AsDateTime   := ADataHora;
      qryAux.ParamByName('pObservacao').AsString   := AObservacao;
      qryAux.ExecSQL;

      if TTransacao.ComitarTransacao(ServerContainer.FDConnection) then
         Result := True;
   except
      begin
      Result := False;
      TTransacao.CancelarTransacao(ServerContainer.FDConnection);
      Exit;
      end;
   end;

end;


function TSMControlPc.Setores(const AIdUsuario : Integer) : TJSONArray;
begin
  qrySetores.Close;
  qrySetores.ParamByName('pIdUsuario').AsInteger := AIdUsuario;
  Result := TFuncoesJSON.MontarJSON(qrySetores);
end;

function TSMControlPc.StatusTrue: TJSONArray;
begin
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add('Select ');
   qryAux.Sql.Add('   id, Status, Tipo_Prazo, Prazo, Encerra');
   qryAux.Sql.Add('From');
   qryAux.Sql.Add('   Status_True ');
   qryAux.Sql.Add('where ');
   qryAux.Sql.Add('   Ativo = ' + QuotedStr(C_SIM));
   qryAux.Sql.Add('   and isnull(ControlPC,:pNao) = :pSim');

   qryAux.ParamByName('pSim').AsString := C_SIM;
   qryAux.ParamByName('pNao').AsString := C_NAO;

   Result := TFuncoesJSON.MontarJSON(qryAux);
end;

function TSMControlPc.Tecnicos: TJSONArray;
begin
  Result := TFuncoesJSON.MontarJSON(qryTecnicos);
end;


function TSMControlPc.TiposDeCliente: TJSONArray;
begin
  Result := TFuncoesJSON.MontarJSON(qryTiposCliente);
end;


function TSMControlPc.Usuarios(const AIdUsuario : Integer): TJSONArray;
begin
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add('Select ');
   qryAux.Sql.Add('   us.id, us.Nome_Usuario ');
   qryAux.Sql.Add('From ');
   qryAux.Sql.Add('   Usuarios us ');
   qryAux.Sql.Add('where ');
   qryAux.Sql.Add('   id in (Select ');
   qryAux.Sql.Add('             distinct u.id_Usuario ');
   qryAux.Sql.Add('          From ');
   qryAux.Sql.Add('             Usuarios_Setores u ');
   qryAux.Sql.Add('          where u.id_Setor in (Select ');
   qryAux.Sql.Add('                                  id_Setor ');
   qryAux.Sql.Add('                               From Usuarios_Setores a ');
   qryAux.Sql.Add('                                    inner join Setores b on a.id_Setor = b.id ');
   qryAux.Sql.Add('                               where id_Usuario =  :pIdUsuario');
   qryAux.Sql.Add('                                     and isnull(b.CONTROLPC,' + QuotedStr(C_NAO) + ') = ' + QuotedStr(C_SIM));
   qryAux.Sql.Add('                              )');
   qryAux.Sql.Add('         ) ');
   qryAux.Sql.Add('   and us.Ativo = ' + QuotedStr(C_SIM));
   qryAux.ParamByName('pIdUsuario').AsInteger := AIdUsuario;

   Result := TFuncoesJSON.MontarJSON(qryAux);
end;

function TSMControlPc.UsuariosDoSetor(const AIdSetor: Integer): TJSONArray;
begin
   qryAux.Close;
   qryAux.Sql.Clear;

   qryAux.Sql.Add('Declare @pIdSetor int ');
   qryAux.Sql.Add('Declare @pSim varchar(3) ');
   qryAux.Sql.Add('Declare @pNao varchar(3) ');

   qryAux.Sql.Add('Set @pIdSetor = :pIdSetor');
   qryAux.Sql.Add('Set @pSim = ' + QuotedStr(C_SIM));
   qryAux.Sql.Add('Set @pNao = ' + QuotedStr(C_NAO));

   qryAux.Sql.Add('Select ');
   qryAux.Sql.Add('   c.id, c.Nome_Usuario ');
   qryAux.Sql.Add('From ');
   qryAux.Sql.Add('   Usuarios_Setores a ');
   qryAux.Sql.Add('   INNER JOIN Setores b on b.id = a.id_Setor ');
   qryAux.Sql.Add('   INNER JOIN Usuarios c on c.id = a.id_Usuario ');
   qryAux.Sql.Add('where ');
   qryAux.Sql.Add('   isnull(b.ControlPc, @pNao) = @pSim');
   qryAux.Sql.Add('   and c.Ativo = @pSim');
   qryAux.Sql.Add('   and (@pIdSetor = 0 or a.id_Setor = @pIdSetor)');

   qryAux.ParamByName('pIdSetor').AsInteger := AIdSetor;

   Result := TFuncoesJSON.MontarJSON(qryAux);

end;

end.

