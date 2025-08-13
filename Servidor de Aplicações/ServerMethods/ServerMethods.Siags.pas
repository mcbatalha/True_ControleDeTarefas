unit ServerMethods.Siags;

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
  TSMSiags = class(TDSServerModule)
    qryAux: TFDQuery;
    qryTiposAutorizacao: TFDQuery;
    qryTiposAtendimento: TFDQuery;
    qrySiags: TFDQuery;
    qrySiagsHistorico: TFDQuery;
    qryPainelSiags: TFDQuery;
    qrySetores: TFDQuery;
    qrySetoresid: TIntegerField;
    qrySetoresNome_Setor: TStringField;
    qrySiagsLog: TFDQuery;
    qryTiposAutorizacaoid: TFDAutoIncField;
    qryTiposAutorizacaoTipo_Autorizacao: TStringField;
    qryTiposAtendimentoid: TFDAutoIncField;
    qryTiposAtendimentoTipo_Atendimento: TStringField;
    qryBeneficiarios: TFDQuery;
    qryBeneficiariosid: TFDAutoIncField;
    qryBeneficiariosNumero_Beneficiario: TStringField;
    qryBeneficiariosNome_Beneficiario: TStringField;
    qrySiagsid: TLargeintField;
    qrySiagsid_Tipo_Autorizacao: TIntegerField;
    qrySiagsNumero_Autorizacao: TLargeintField;
    qrySiagsid_Tipo_Atendimento: TIntegerField;
    qrySiagsid_Beneficiario: TIntegerField;
    qrySiagsData_Prazo_Caixa: TDateTimeField;
    qrySiagsData_Prazo_ANS: TDateTimeField;
    qrySiagsData_Hora_Importacao: TDateTimeField;
    qrySiagsid_Usuario_Importacao: TIntegerField;
    qrySiagsid_Setor_Designado: TIntegerField;
    qrySiagsid_Responsavel_Designacao: TIntegerField;
    qrySiagsData_Hora_Designacao: TDateTimeField;
    qrySiagsJustificativa_Designacao: TStringField;
    qrySiagsData_Hora_Encerramento: TDateTimeField;
    qrySiagsid_Usuario_Encerramento: TIntegerField;
    qrySiagsJustificativa_Encerramento: TStringField;
    qrySiagsLogid: TLargeintField;
    qrySiagsLogid_Siags: TLargeintField;
    qrySiagsLogid_Setor_Designado: TIntegerField;
    qrySiagsLogid_Usuario_Designado: TIntegerField;
    qrySiagsLogid_Usuario_Responsavel: TIntegerField;
    qrySiagsLogJustificativa: TStringField;
    qrySiagsLogData_Hora_Log: TDateTimeField;
    qrySiagsid_Usuario_Designado: TIntegerField;
    qrySiagsUltima_Atualizacao: TDateTimeField;
    qrySiagsid_Usuario_Ultima_Atualizacao: TIntegerField;
    qrySiagsid_Status_True: TIntegerField;
    qryPainelSiagsid_Autorizacao: TLargeintField;
    qryPainelSiagsNumero_Autorizacao: TLargeintField;
    qryPainelSiagsData_Prazo_Caixa: TDateTimeField;
    qryPainelSiagsData_Prazo_ANS: TDateTimeField;
    qryPainelSiagsTipo_Autorizacao: TStringField;
    qryPainelSiagsTipo_Atendimento: TStringField;
    qryPainelSiagsNumero_Beneficiario: TStringField;
    qryPainelSiagsNome_Beneficiario: TStringField;
    qryPainelSiagsStatus_True: TStringField;
    qryPainelSiagsTipo_Prazo: TStringField;
    qryPainelSiagsPrazo: TIntegerField;
    qryPainelSiagsEncerra: TStringField;
    qryPainelSiagsUsuario_Designado: TStringField;
    qryPainelSiagsSetor_Designado: TStringField;
    qryPainelSiagsQtd_Historicos: TIntegerField;
    qryPainelSiagsQtd_Designacoes: TIntegerField;
    qryPainelSiagsQtd_Observacoes: TIntegerField;
    qrySiagsHistoricoid: TLargeintField;
    qrySiagsHistoricoid_Siags: TLargeintField;
    qrySiagsHistoricoid_Tipo_Autorizacao: TIntegerField;
    qrySiagsHistoricoid_Tipo_Atendimento: TIntegerField;
    qrySiagsHistoricoid_Status_True: TIntegerField;
    qrySiagsHistoricoData_Prazo_Caixa: TDateTimeField;
    qrySiagsHistoricoData_Prazo_Ans: TDateTimeField;
    qrySiagsHistoricoid_Usuario_Responsavel: TIntegerField;
    qrySiagsHistoricoData_Hora_Historico: TDateTimeField;
    qrySiagsDesignacao_Pendente: TStringField;
    qryPainelSiagsDesignacao_Pendente: TStringField;
    qryDesignacoesPendentes: TFDQuery;
    qryDesignacoesPendentesData_Solicitacao: TDateTimeField;
    qryDesignacoesPendentesJustificativa: TStringField;
    qryDesignacoesPendentesid_Autorizacao: TLargeintField;
    qryDesignacoesPendentesNumero_Autorizacao: TLargeintField;
    qryDesignacoesPendentesUsuario_Solicitante: TStringField;
    qryDesignacoesPendentesUsuario_Atual: TStringField;
    qryDesignacoesPendentesUsuario_Solicitado: TStringField;
    qryDesignacoesPendentesSetor_Atual: TStringField;
    qryDesignacoesPendentesSetor_Solicitado: TStringField;
    qryDesignacoesPendentesStatus_True: TStringField;
    qryDesignacoesPendentesid_Solicitacao: TLargeintField;
    qryIncluirDesignacao: TFDQuery;
    qryIncluirDesignacaoid: TLargeintField;
    qryIncluirDesignacaoid_Autorizacao: TLargeintField;
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
    qryPainelSiagsid_Status_True: TIntegerField;
  private
    { Private declarations }

    FIdTipoAutorizacao         : integer;
    FIdTipoAtendimento         : integer;
    FIdBeneficiarios           : integer;
    FIdSetor                   : integer;

    FNumeroAutorizacao         : LongInt;

    FDataPrazoCaixa            : TDateTime;
    FDataPrazoANS              : TDateTime;

    FTotalRegistros            : Integer;
    FTotalNovos                : Integer;
    FTotalAtualizados          : Integer;
    FTotalNaoAtualizados       : Integer;
    FIdUsuarioResponsavel      : Integer;
    FDataHora                  : TDateTime;

    procedure AbrirTabelasDeCadastro;
    procedure FecharTabelasDeCadastro;

    function ObterIdTipoAutorizacao(const AValor : String) : integer;
    function ObterIdTipoAtendimento(const AValor : String) : integer;
    function ObterIdBeneficiario(const AValor, ANome : String) : integer;

    procedure GravarAutorizacao;
    procedure GravarHistorico(const AId : Largeint);
    procedure GravarLogDesigancao(const AIdAutorizacao,
                                        AIdUsuarioResponsavel,
                                        AIdUsuario,
                                        AIdSetor : Integer;
                                  const AJustificativa : String);

    procedure MontarQueryPainel;


  public
    function Importar(const ARegistros : TJSONArray; const AIdUsuario : integer) : TJSONObject;

    function FiltrarAutorizacoes(const AFiltros : TJSONObject; const AIncluirEncerrados : Boolean) : TJSONArray;
    function Designar(const AAutorizacoes : TJSONArray;
                      const AJustificativa: String;
                      const AIdSetor, AIdUsuario, AIdUsuarioResponsavel : integer;
                      const AIdAutorizacao : LongInt ): Boolean;

    function RegistrarObservacao(const AIdAutorizacao : LongInt;
                                 const AObservacao: String;
                                 const AIdUsuarioResponsavel : integer;
                                 out ADataHora : TDateTime): Boolean;

    function AlterarStatus(const AIdAutorizacao : LongInt;
                           const AIdStatus      : Integer;
                           const AJustificativa : String;
                           const AIdUsuarioResponsavel : integer): Boolean;

    function HistoricoDeDesignacoes(const AIdAutorizacao : LongInt) : TJSONArray;
    function HistoricoDeAtualizacoes(const AIdAutorizacao : LongInt) : TJSONArray;
    function ObservacoesDaAutorizacao(const AIdAutorizacao : LongInt) : TJSONArray;


    function TiposDeAutoriazacao : TJSONArray;
    function TiposDeAtendimento  : TJSONArray;
    function StatusTrue          : TJSONArray;
    function AutorizacoesAtivas  : TJSONArray;

    function Setores(const AIdUsuario : integer) : TJSONArray;
    function Usuarios(const AIdUsuario : integer) : TJSONArray;
    function UsuariosDoSetor(const AIdSetor: Integer) : TJSONArray;

    function RelatorioDeDesignacoes(const AUsaDatas : Boolean;
                                    const ADataInicial, ADataFinal : TDateTime;
                                    const ANumeroAutorizacao : string;
                                    const AIdUsuarioResponsavel : integer) : TJSONArray;

    function RelatorioDeEncerramentos(const ADataInicial, ADataFinal : TDateTime;
                                      const AIdUsuarioResponsavel : integer) : TJSONArray;
    function DesignacoesPendentes : TJSONArray;
    function AutorizarDesiganacao(const AIdAutorizacao, AIdSolicitacao : LongInt;
                                  const AAutorizado : Boolean;
                                  const AIdUsuario : Integer)  : Boolean;

  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses ServerMethods.Container,
     Funcoes,
     Libs.TFuncoesServer;

{$R *.dfm}

{ TSMSiags }

procedure TSMSiags.AbrirTabelasDeCadastro;
begin
   FecharTabelasDeCadastro;
   qryTiposAutorizacao.Open;
   qryTiposAtendimento.Open;
   qryBeneficiarios.Open;
end;

function TSMSiags.AutorizacoesAtivas: TJSONArray;
begin
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add('Select ');
   qryAux.Sql.Add('   a.Numero_Autorizacao as Autorizacao, a.id_Setor_Designado, ');
   qryAux.Sql.Add('   b.Nome_Setor');
   qryAux.Sql.Add('From ');
   qryAux.Sql.Add('   Siags a ');
   qryAux.Sql.Add('   LEFT OUTER JOIN Setores b on b.id = a.id_Setor_Designado');
   qryAux.Sql.Add('Where ');
   qryAux.Sql.Add('   a.Data_Hora_Encerramento is null');
   qryAux.Sql.Add('Order by ');
   qryAux.Sql.Add('   a.Numero_Autorizacao ');


   Result := TFuncoesJSON.MontarJSON(qryAux);
end;

function TSMSiags.AutorizarDesiganacao(const AIdAutorizacao, AIdSolicitacao: LongInt; const AAutorizado: Boolean; const AIdUsuario: Integer): Boolean;
begin
   Result    := False;
   FDataHora := Now;

   try
      try
         TTransacao.IniciarTransacao(ServerContainer.FDConnection);

         qryAux.Close;
         qryAux.Sql.Clear;
         qryAux.Sql.Add('Select * from Siags_Designacao_Solicitacao');
         qryAux.Sql.Add('where id = :pId');
         qryAux.ParamByName('pId').AsInteger := AIdSolicitacao;
         qryAux.Open;

         qrySiags.Close;
         qrySiags.ParamByName('pIdAutorizacao').AsInteger := AIdAutorizacao;
         qrySiags.Open;

         qryAux.Edit;
         qrySiags.Edit;

         if not AAutorizado then
            begin
            qryAux.FieldByName('Autorizado').AsString := C_NAO;
         end else
            begin
            qryAux.FieldByName('Autorizado').AsString := C_SIM;
            if qryAux.FieldByName('id_Setor_Solicitado').AsInteger > 0 then
               qrySiagsid_Setor_Designado.AsInteger := qryAux.FieldByName('id_Setor_Solicitado').AsInteger;
            if qryAux.FieldByName('id_Usuario_Solicitado').AsInteger > 0 then
               qrySiagsid_Usuario_Designado.AsInteger := qryAux.FieldByName('id_Usuario_Solicitado').AsInteger;

            qrySiagsData_Hora_Designacao.AsDateTime     := FDataHora;
            qrySiagsid_Responsavel_Designacao.AsInteger := qryAux.FieldByName('id_Usuario_Solicitante').AsInteger;
            qrySiagsJustificativa_Designacao.AsString   := qryAux.FieldByName('Justificativa').AsString;
         end;

         qrySiagsDesignacao_Pendente.AsString := C_NAO;
         qrySiags.Post;

         qryAux.FieldByName('Data_Hora_Autorizacao').AsDateTime := FDataHora;
         qryAux.FieldByName('id_Usuario_Autorizador').AsInteger := AIdUsuario;
         qryAux.Post;

         if AAutorizado then
            begin
            GravarLogDesigancao(qrySiagsid.AsInteger,
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
      qrySiags.Open;
   end;
end;

function TSMSiags.DesignacoesPendentes: TJSONArray;
begin
   qryDesignacoesPendentes.Close;

   Result := TFuncoesJSON.MontarJSON(qryDesignacoesPendentes);
end;

function TSMSiags.Designar(
   const AAutorizacoes : TJSONArray;
   const AJustificativa: String;
   const AIdSetor, AIdUsuario, AIdUsuarioResponsavel: integer; const AIdAutorizacao: LongInt): Boolean;
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
         LQtd := AAutorizacoes.Count -1;

         qrySiags.Close;
         qrySiags.Sql.Clear;
         qrySiags.Sql.Add('Select * from Siags');
         qrySiags.Sql.Add('where Numero_Autorizacao in (');
         for I := 0 to LQtd do
            begin
            if i < LQtd then
               qrySiags.Sql.Add(QuotedStr(AAutorizacoes.Items[i].GetValue<String>) + ',')
            else
               qrySiags.Sql.Add(QuotedStr(AAutorizacoes.Items[i].GetValue<String>));
         end;
         qrySiags.Sql.Add(')');
         qrySiags.Open;

         if qrySiags.isEmpty then
            Exit;

         qryIncluirDesignacao.Open;
         while not qrySiags.Eof do
            begin
            qrySiags.Edit;
            if LPerfil = C_PERFIL_USUARIO then
               begin
               qrySiagsDesignacao_Pendente.AsString := C_SIM;

               qryIncluirDesignacao.Append;
               qryIncluirDesignacaoid_Autorizacao.AsInteger         := qrySiagsid.AsInteger;
               qryIncluirDesignacaoid_Usuario_Solicitante.AsInteger := AIdUsuarioResponsavel;
               qryIncluirDesignacaoData_Solicitacao.AsDateTime      := FDataHora;
               qryIncluirDesignacaoAutorizado.AsString              := 'Pendente';
               qryIncluirDesignacaoJustificativa.AsString           := AJustificativa;

               if (qrySiagsid_Usuario_Designado.AsInteger <> 0) then
                  qryIncluirDesignacaoid_Usuario_Designado.AsInteger  := qrySiagsid_Usuario_Designado.AsInteger;

               if (AIdUsuario <> 0) and (AIdUsuario <> C_CODIGO_NAO_DESIGNADO) then
                  qryIncluirDesignacaoid_Usuario_Solicitado.AsInteger := AIdUsuario;

               if qrySiagsid_Setor_Designado.AsInteger > 0 then
                  qryIncluirDesignacaoid_Setor_Designado.AsInteger    := qrySiagsid_Setor_Designado.AsInteger;

               if (AIdSetor <> 0) and (AIdSetor <> C_CODIGO_NAO_DESIGNADO) then
                  qryIncluirDesignacaoid_Setor_Solicitado.AsInteger   := AIdSetor;
               qryIncluirDesignacao.Post;
            end else
               begin
               if (AIdSetor = 0) or (AIdSetor = C_CODIGO_NAO_DESIGNADO) then
                  qrySiagsid_Setor_Designado.Clear
               else
                  qrySiagsid_Setor_Designado.AsInteger  := AIdSetor;

               if (AIdUsuario = 0) or (AIdUsuario = C_CODIGO_NAO_DESIGNADO) then
                  qrySiagsid_Usuario_Designado.Clear
               else
                  qrySiagsid_Usuario_Designado.AsInteger := AIdUsuario;

               qrySiagsid_Responsavel_Designacao.AsInteger := AIdUsuarioResponsavel;
               qrySiagsData_Hora_Designacao.AsDateTime     := FDataHora;
               qrySiagsJustificativa_Designacao.AsString   := AJustificativa;

               GravarLogDesigancao(qrySiagsid.AsInteger,
                                   AIdUsuarioResponsavel,
                                   AIdUsuario,
                                   AIdSetor,
                                   AJustificativa);
            end;
            qrySiags.Post;

            qrySiags.Next;
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
      qrySiagsLog.Close;
      qrySiagsHistorico.Close;
      qrySiags.Close;
   end;
end;

function TSMSiags.AlterarStatus(
   const AIdAutorizacao : LongInt;
   const AIdStatus      : Integer;
   const AJustificativa : String;
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

         qrySiags.Close;
         qrySiags.Sql.Clear;
         qrySiags.Sql.Add('Select * from Siags');
         qrySiags.Sql.Add('where id = :pIdAutorizacao');
         qrySiags.ParamByName('pIdAutorizacao').AsInteger := AIdAutorizacao;
         qrySiags.Open;

         if qrySiags.isEmpty then
            Exit;

         qryAux.Close;
         qryAux.Sql.Clear;
         qryAux.Sql.Add('Insert Into Siags_Historico');
         qryAux.Sql.Add('   (id_Siags, id_Tecnico, id_Tipo_Cliente,  ');
         qryAux.Sql.Add('    id_Usuario_Responsavel, Data_Hora_Historico, id_Status_True)');
         qryAux.Sql.Add('Select ');
         qryAux.Sql.Add('   id, id_Tecnico, id_Tipo_Cliente, ');
         qryAux.Sql.Add('   :pIdUsuario, :pDataHora, :pIdStatus ');
         qryAux.Sql.Add('From ');
         qryAux.Sql.Add('   Siags ');
         qryAux.Sql.Add('where');
         qryAux.Sql.Add('   id = :pId');
         qryAux.ParamByName('pId').AsInteger        := AIdAutorizacao;
         qryAux.ParamByName('pIdUsuario').AsInteger := AIdUsuarioResponsavel;
         qryAux.ParamByName('pDataHora').AsDateTime := LDataHora;
         qryAux.ParamByName('pIdStatus').AsInteger  := AIdStatus;
         qryAux.ExecSQL;

         qrySiags.Edit;
         qrySiagsid_Status_True.AsInteger := AIdStatus;

         if LEncerrarProcesso then
            begin
            qrySiagsid_Usuario_Encerramento.AsInteger   := AIdUsuarioResponsavel;
            qrySiagsData_Hora_Encerramento.AsDateTime   := LDataHora;
            qrySiagsJustificativa_Encerramento.AsString := AJustificativa;
         end;
         qrySiags.Post;

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
      qrySiagsLog.Close;
      qrySiagsHistorico.Close;
      qrySiags.Close;
   end;
end;

procedure TSMSiags.FecharTabelasDeCadastro;
begin
   qryTiposAutorizacao.Close;
   qryTiposAtendimento.Close;
   qryBeneficiarios.Close;
end;

function TSMSiags.FiltrarAutorizacoes(const AFiltros: TJSONObject; const AIncluirEncerrados : Boolean): TJSONArray;
var
   LFiltros : TFiltrosSiags;
begin

   LFiltros.numeroDaAutorizacao       := AFiltros.GetValue<String>('numeroDaAutorizacao');
   LFiltros.idTipoAutorizacao         := AFiltros.GetValue<integer>('idTipoAutorizacao');
   LFiltros.idTipoAtendimento         := AFiltros.GetValue<integer>('idTipoAtendimento');
   LFiltros.idBeneficiarios           := AFiltros.GetValue<integer>('idBeneficiarios');
   LFiltros.idStatusTrue              := AFiltros.GetValue<integer>('idStatusTrue');
   LFiltros.idSetorDesignado          := AFiltros.GetValue<integer>('idSetorDesignado');
   LFiltros.idUsuarioDesignado        := AFiltros.GetValue<integer>('idUsuarioDesignado');
   LFiltros.nomeUsuario               := AFiltros.GetValue<String>('nomeUsuario');

   if AFiltros.FindValue('dataPrazoCaixa') <> nil then
      LFiltros.dataPrazoCaixa         := AFiltros.GetValue<String>('dataPrazoCaixa');

   if AFiltros.FindValue('dataPrazoAns') <> nil then
      LFiltros.dataPrazoAns           := AFiltros.GetValue<String>('dataPrazoAns');

   MontarQueryPainel;

   if not AIncluirEncerrados then
      qryPainelSiags.Sql.Add(' and a.Data_Hora_Encerramento is null');

   if LFiltros.numeroDaAutorizacao <> '' then
      begin
//      qryPainelSiags.Sql.Add(' and cast(a.Numero_Autorizacao as varchar(50)) like :pNumeroDaAutorizacao');
      qryPainelSiags.Sql.Add(' and a.Numero_Autorizacao like :pNumeroDaAutorizacao');
      qryPainelSiags.ParamByName('pNumeroDaAutorizacao').AsString := '%' + LFiltros.numeroDaAutorizacao + '%';
   end;


   if LFiltros.idTipoAutorizacao > 0 then
      begin
      qryPainelSiags.Sql.Add(' and a.id_Tipo_Autorizacao = :pIdTipoAutorizacao');
      qryPainelSiags.ParamByName('pIdTipoAutorizacao').AsInteger := LFiltros.idTipoAutorizacao;
   end;

   if LFiltros.idTipoAtendimento > 0 then
      begin
      qryPainelSiags.Sql.Add(' and a.id_Tipo_Atendimento = :pIdTipoAtendimento');
      qryPainelSiags.ParamByName('pIdTipoAtendimento').AsInteger := LFiltros.idTipoAtendimento;
   end;

   if LFiltros.idStatusTrue > 0 then
      begin
      qryPainelSiags.Sql.Add(' and a.id_Status_True = :pIdStatusTrue');
      qryPainelSiags.ParamByName('pIdStatusTrue').AsInteger := LFiltros.idStatusTrue;
   end;

   if (LFiltros.idSetorDesignado <> 0) and (LFiltros.idSetorDesignado <> C_CODIGO_NAO_DESIGNADO)then
      begin
      qryPainelSiags.Sql.Add(' and a.id_Setor_Designado = :pIdSetorDesignado');
      qryPainelSiags.ParamByName('pIdSetorDesignado').AsInteger := LFiltros.idSetorDesignado;
   end;

   if (LFiltros.dataPrazoCaixa <> '') and (LFiltros.dataPrazoCaixa <> C_DATA_EM_BRANCO) then
      begin
      qryPainelSiags.Sql.Add(' and a.Data_Prazo_Caixa = :pDataPrazoCaixa');
      qryPainelSiags.ParamByName('pDataPrazoCaixa').AsDateTime := StrToDate(LFiltros.dataPrazoCaixa);
   end;

   if (LFiltros.dataPrazoAns <> '') and (LFiltros.dataPrazoAns <> C_DATA_EM_BRANCO) then
      begin
      qryPainelSiags.Sql.Add(' and a.Data_Prazo_Ans = :pDataPrazoAns');
      qryPainelSiags.ParamByName('pDataPrazoAns').AsDateTime := StrToDate(LFiltros.dataPrazoAns);
   end;


   if (LFiltros.idUsuarioDesignado <> 0) and  (LFiltros.idUsuarioDesignado <> C_CODIGO_NAO_DESIGNADO) then
      begin
      if LFiltros.idUsuarioDesignado = C_CODIGO_NAO_DESIGNADO then
         qryPainelSiags.Sql.Add(' and a.id_Usuario_Designado is null')
      else
         begin
         qryPainelSiags.Sql.Add(' and a.id_Usuario_Designado = :pIdUsuarioDesignado');
         qryPainelSiags.ParamByName('pIdUsuarioDesignado').AsInteger := LFiltros.idUsuarioDesignado;
      end;
   end;

   qryPainelSiags.Open;
   Result := TFuncoesJSON.MontarJSON(qryPainelSiags);
   qryPainelSiags.Close;
end;

procedure TSMSiags.GravarAutorizacao;
var
   LNovo      : Boolean;
   LAtualizar : Boolean;
begin
   qrySiags.Close;
   qrySiags.Sql.Clear;
   qrySiags.Sql.Add('Select * from Siags');
   qrySiags.Sql.Add('where Numero_Autorizacao = :pNumeroAutorizacao');
   qrySiags.ParamByName('pNumeroAutorizacao').AsInteger := FNumeroAutorizacao;
   qrySiags.Open;

   FTotalRegistros := FTotalRegistros + 1;

   try
      LAtualizar := False;
      LNovo := qrySiags.isEmpty;
      if LNovo then
         begin
         qrySiags.Append;
         qrySiagsNumero_Autorizacao.AsInteger := FNumeroAutorizacao;
         qrySiagsid_Setor_Designado.AsInteger := FIdSetor;
      end else
         begin
         if (qrySiagsid_Tipo_Autorizacao.AsInteger <> FIdTipoAutorizacao) or
            (qrySiagsid_Tipo_Atendimento.AsInteger <> FIdTipoAtendimento) then
            begin
            LAtualizar := True;
            qrySiags.Edit;
         end;
      end;

      if LNovo or LAtualizar then
         begin
         if LAtualizar then
            begin
            GravarHistorico(qrySiagsid.AsInteger);
            FTotalAtualizados := FTotalAtualizados + 1;
         end else
            FTotalNovos := FTotalNovos + 1;

         qrySiagsid_Tipo_Autorizacao.AsInteger          := FIdTipoAutorizacao;

         qrySiagsid_Tipo_Atendimento.AsInteger          := FIdTipoAtendimento;
         qrySiagsid_Beneficiario.AsInteger              := FIdBeneficiarios;
         qrySiagsData_Prazo_Caixa.AsDateTime            := FDataPrazoCaixa;
         qrySiagsData_Prazo_ANS.AsDateTime              := FDataPrazoANS;

         qrySiagsid_Usuario_Ultima_Atualizacao.AsInteger := FIdUsuarioResponsavel;
         qrySiagsUltima_Atualizacao.AsDateTime           := FDataHora;

         if LNovo then
            begin
            qrySiagsid_Usuario_Importacao.AsInteger    := FIdUsuarioResponsavel;
            qrySiagsData_Hora_Importacao.AsDateTime    := FDataHora;
         end;
         qrySiags.Post;
      end else
         FTotalNaoAtualizados := FTotalNaoAtualizados + 1;
   finally
      qrySiags.Close;
   end;
end;

procedure TSMSiags.GravarHistorico(const AId: Largeint);
begin
   qrySiagsHistorico.Close;
   try
      qrySiagsHistorico.ParamByName('pIdSiags').AsInteger := AId;
      qrySiagsHistorico.Open;
      qrySiagsHistorico.Append;

      qrySiagsHistoricoid_Siags.AsInteger                     := AId;
      qrySiagsHistoricoid_Tipo_Autorizacao.AsInteger          := qrySiagsid_Tipo_Autorizacao.AsInteger;
      qrySiagsHistoricoid_Tipo_Atendimento.AsInteger          := qrySiagsid_Tipo_Atendimento.AsInteger;
      qrySiagsHistoricoData_Prazo_Caixa.AsDateTime            := qrySiagsData_Prazo_Caixa.AsDateTime;
      qrySiagsHistoricoData_Prazo_Ans.AsDateTime              := qrySiagsData_Prazo_Ans.AsDateTime;

      qrySiagsHistoricoid_Usuario_Responsavel.AsInteger       := qrySiagsid_Usuario_Importacao.AsInteger;
//      qrySiagsHistoricoid_Usuario_Responsavel.AsInteger   := FIdUsuarioResponsavel;
      qrySiagsHistoricoData_Hora_Historico.AsDateTime     := FDataHora;
      qrySiagsHistorico.Post;
   finally
      qrySiagsHistorico.Close;
   end;
end;

procedure TSMSiags.GravarLogDesigancao(const AIdAutorizacao, AIdUsuarioResponsavel, AIdUsuario, AIdSetor: Integer; const AJustificativa: String);
begin
   qrySiagsLog.Close;
   qrySiagsLog.ParamByName('pIdSiags').AsInteger := AIdAutorizacao;
   qrySiagsLog.Open;

   qrySiagsLog.Append;
   qrySiagsLogid_Siags.AsInteger                := AIdAutorizacao;
   qrySiagsLogid_Usuario_Responsavel.AsInteger  := AIdUsuarioResponsavel;
   qrySiagsLogJustificativa.AsString            := AJustificativa;
   qrySiagsLogData_Hora_Log.AsDateTime          := FDataHora;

   if (AIdSetor > 0) and (AIdSetor <> C_CODIGO_NAO_DESIGNADO) then
      qrySiagsLogid_Setor_Designado.AsInteger   := AIdSetor;
   if (AIdUsuario > 0) and (AIdUsuario <> C_CODIGO_NAO_DESIGNADO) then
      qrySiagsLogid_Usuario_Designado.AsInteger := AIdUsuario;
   qrySiagsLog.Post;
   qrySiagsLog.Close;
end;

function TSMSiags.HistoricoDeAtualizacoes(const AIdAutorizacao: LongInt): TJSONArray;
begin
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add('Select ');
   qryAux.Sql.Add('   a.Data_Prazo_Caixa, a.Data_Prazo_Ans, a.Data_Hora_Historico, ');
   qryAux.Sql.Add('   b.Tipo_Autorizacao, ');
   qryAux.Sql.Add('   c.Tipo_Atendimento, ');
   qryAux.Sql.Add('   d.Nome_Usuario, ');
   qryAux.Sql.Add('   e.Status as Status_True,                            ');
   qryAux.Sql.Add('From ');
   qryAux.Sql.Add('   Siags_Historico a ');
   qryAux.Sql.Add('   Left Outer Join Tipos_Autorizacao b on b.id = a.id_Tipo_Autorizacao ');
   qryAux.Sql.Add('   Left Outer Join Tipos_Atendimento c on c.id = a.id_Tipo_Atendimento ');
   qryAux.Sql.Add('   Left Outer Join Usuarios d on d.id = a.id_Usuario_Responsavel ');
   qryAux.Sql.Add('   Left Outer Join Status_True e on e.id = a.id_Status_True');
   qryAux.Sql.Add('where ');
   qryAux.Sql.Add('   a.id_Siags = :pIdAutorizacao');
   qryAux.Sql.Add('Order by ');
   qryAux.Sql.Add('   a.Data_Hora_Historico desc ');

   qryAux.ParamByName('pIdAutorizacao').AsInteger := AIdAutorizacao;

   Result := TFuncoesJSON.MontarJSON(qryAux);
end;

function TSMSiags.HistoricoDeDesignacoes(const AIdAutorizacao: LongInt): TJSONArray;
begin
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add('Select ');
   qryAux.Sql.Add('   al.Justificativa, al.Data_Hora_Log, ');
   qryAux.Sql.Add('   isnull(sd.Nome_Setor, ' + QuotedStr(C_DESCRICAO_NAO_DESIGNADO) + ') as Nome_Setor, ');
   qryAux.Sql.Add('   isnull(ud.Nome_Usuario, ' + QuotedStr(C_DESCRICAO_NAO_DESIGNADO) + ') as Usuario_Designado, ');
   qryAux.Sql.Add('   ur.Nome_Usuario as Usuario_Responsavel ');
   qryAux.Sql.Add('from ');
   qryAux.Sql.Add('   Siags_Log al ');
   qryAux.Sql.Add('   Left Outer Join Setores sd on sd.id = al.id_Setor_Designado');
   qryAux.Sql.Add('   Left Outer Join Usuarios ud on ud.id = al.id_Usuario_Designado ');
   qryAux.Sql.Add('   Left Outer Join Usuarios ur on ur.id = al.id_Usuario_Responsavel ');
   qryAux.Sql.Add('where ');
   qryAux.Sql.Add('   al.id_Siags = :pIdAutorizacao');
   qryAux.Sql.Add('Order by ');
   qryAux.Sql.Add('   al.Data_Hora_Log desc ');
   qryAux.ParamByName('pIdAutorizacao').AsInteger := AIdAutorizacao;

   Result := TFuncoesJSON.MontarJSON(qryAux);
end;

function TSMSiags.Importar(const ARegistros: TJSONArray; const AIdUsuario: integer): TJSONObject;
var
   I                   : Integer;
   LNomeBeneficiario   : String;
   LNumeroBeneficiario : String;

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
            LObject                    := ARegistros[i] as TJSONObject;
            FIdTipoAutorizacao         := ObterIdTipoAutorizacao(LObject.Values['TIPO AUTORIZACAO'].Value);
            FNumeroAutorizacao         := LObject.Values['AUTORIZACAO'].AsType<LongInt>;
            FIdTipoAtendimento         := ObterIdTipoAtendimento(LObject.Values['TIPO ATENDIMENTO'].Value);
            LNumeroBeneficiario        := LObject.Values['BENEFICIARIO'].AsType<String>;
            LNomeBeneficiario          := LObject.Values['NOME'].AsType<String>;
            FIdBeneficiarios           := ObterIdBeneficiario(LNumeroBeneficiario, LNomeBeneficiario);
            FDataPrazoCaixa            := StrToDate(LObject.Values['DATAPRAZOCAX'].Value);
            FDataPrazoANS              := StrToDate(LObject.Values['DATAPRAZOANS'].Value);
            FIDSETOR                   := LObject.Values['IDSETOR'].AsType<Integer>;

            GravarAutorizacao;
         end;
         TFuncoesServer.RegistrarImportacao(C_TIPO_SIAGS, FDataHora, AIdUsuario, FTotalRegistros, FTotalNovos, FTotalAtualizados);

         if TTransacao.ComitarTransacao(ServerContainer.FDConnection) then
            begin
            Result.AddPair('importou',TJSONBool.Create(True));
            Result.AddPair('totalRegistros',TJSONNumber.Create(FTotalRegistros));
            Result.AddPair('totalNovos',TJSONNumber.Create(FTotalNovos));
            Result.AddPair('totalAtualizados',TJSONNumber.Create(FTotalAtualizados));
            Result.AddPair('totalNaoAtualizados',TJSONNumber.Create(FTotalNaoAtualizados));
         end else
            Result.AddPair('importou',TJSONBool.Create(False));
      except
         begin
         Result.AddPair('importou',TJSONBool.Create(False));
         TTransacao.CancelarTransacao(ServerContainer.FDConnection);
         end;
      end;

   finally
      FecharTabelasDeCadastro;
   end;
end;

function TSMSiags.RelatorioDeDesignacoes(
   const AUsaDatas: Boolean;
   const ADataInicial, ADataFinal: TDateTime;
   const ANumeroAutorizacao: string;
   const AIdUsuarioResponsavel : integer) : TJSONArray;

begin
   qryAux.SQL.Clear;
   qryAux.SQL.Add('SELECT                                                                   ');
   qryAux.SQL.Add('   id_Siags as id,                                                       ');
   qryAux.SQL.Add('   Usuario_Designado,                                                    ');
   qryAux.SQL.Add('   Setor_Designado,                                                      ');
   qryAux.SQL.Add('   Usuario_Responsavel,                                                  ');
   qryAux.SQL.Add('   Justificativa,                                                        ');
   qryAux.SQL.Add('   Numero_Autorizacao as Numero,                                         ');
   qryAux.SQL.Add('   Data_Hora_log AS Data_Hora_Inicial,                                   ');
   qryAux.SQL.Add('   ISNULL(ProximaData, Null) AS Data_Hora_Final,                    ');
   qryAux.SQL.Add('   DATEDIFF(DAY, Data_Hora_log, ISNULL(ProximaData, GETDATE())) AS Dias, ');
   qryAux.SQL.Add('   DATEDIFF(HOUR, Data_Hora_log, ISNULL(ProximaData, GETDATE())) % 24 AS Horas,    ');
   qryAux.SQL.Add('   DATEDIFF(MINUTE, Data_Hora_log, ISNULL(ProximaData, GETDATE())) % 60 AS Minutos ');
   qryAux.SQL.Add('FROM (                                                                             ');
   qryAux.SQL.Add('       SELECT                                                                      ');
   qryAux.SQL.Add('          a.id_Siags,                                                             ');
   qryAux.SQL.Add('          a.Data_Hora_log,                                                         ');
   qryAux.SQL.Add('          a.Justificativa,                                                         ');
   qryAux.SQL.Add('          b.Nome_Usuario as Usuario_Designado,                                     ');
   qryAux.SQL.Add('          c.Nome_Setor as Setor_Designado,                                         ');
   qryAux.SQL.Add('          d.Nome_Usuario as Usuario_Responsavel,                                   ');
   qryAux.SQL.Add('          e.Numero_Autorizacao,                                                       ');
   qryAux.SQL.Add('          LEAD(Data_Hora_log) OVER (PARTITION BY id_Siags ORDER BY Data_Hora_log) AS ProximaData ');
   qryAux.SQL.Add('       FROM                                                                                       ');
   qryAux.SQL.Add('          Siags_Log a                                                                            ');
   qryAux.SQL.Add('          left outer join Usuarios b on b.id = a.id_Usuario_Designado                             ');
   qryAux.SQL.Add('          left outer join Setores c on c.id = a.id_Setor_Designado                                ');
   qryAux.SQL.Add('          inner join Usuarios d on d.id = a.id_Usuario_Responsavel                                ');
   qryAux.SQL.Add('          inner join Siags e on e.id = a.id_Siags                                               ');
   qryAux.SQL.Add('       WHERE 1 = 1 ');

   if AUsaDatas then
      begin
      qryAux.SQL.Add('       and cast(a.Data_Hora_Log as Date) between :pDataInicial and :pDataFinal');
      qryAux.ParamByName('pDataInicial').AsDateTime := ADataInicial;
      qryAux.ParamByName('pDataFinal').AsDateTime   := ADataFinal;
   end;

   if ANumeroAutorizacao <> '' then
      begin
      qryAux.SQL.Add('       and e.Numero_Autorizacao = :pNumeroAutorizacao');
      qryAux.ParamByName('pNumeroAutorizacao').AsString := ANumeroAutorizacao;
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

function TSMSiags.RelatorioDeEncerramentos(
   const ADataInicial, ADataFinal: TDateTime;
   const AIdUsuarioResponsavel: integer): TJSONArray;
begin
   qryAux.SQL.Clear;
   qryAux.SQL.Add('SELECT                                                                   ');
   qryAux.SQL.Add('   a.Numero_Autorizacao as Numero,                                       ');
   qryAux.SQL.Add('   a.Data_Hora_Importacao,                                               ');
   qryAux.SQL.Add('   a.Data_Hora_Encerramento,                                             ');
   qryAux.SQL.Add('   a.Justificativa_Encerramento,                                         ');
   qryAux.SQL.Add('   b.Nome_Usuario,                                                       ');
   qryAux.SQL.Add('   DATEDIFF(DAY, a.Data_Hora_Importacao, ISNULL(a.Data_Hora_Encerramento, GETDATE())) AS Dias,           ');
   qryAux.SQL.Add('   DATEDIFF(HOUR, a.Data_Hora_Importacao, ISNULL(a.Data_Hora_Encerramento, GETDATE())) % 24 AS Horas,    ');
   qryAux.SQL.Add('   DATEDIFF(MINUTE, a.Data_Hora_Importacao, ISNULL(a.Data_Hora_Encerramento, GETDATE())) % 60 AS Minutos ');
   qryAux.SQL.Add('FROM                                                                          ');
   qryAux.SQL.Add('   Siags a                                                                    ');
   qryAux.SQL.Add('   Inner Join Usuarios b on b.id = a.id_Usuario_Encerramento                  ');
   qryAux.SQL.Add('where not Data_Hora_Encerramento is null                                      ');
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

procedure TSMSiags.MontarQueryPainel;
begin
   with qryPainelSiags do
      begin
      Close;
      Sql.Clear;
      Sql.Add('Select ');
      Sql.Add('   a.id as id_Autorizacao, a.Numero_Autorizacao, a.Data_Prazo_Caixa, a.Data_Prazo_ANS, ');
      Sql.Add('   a.id_Usuario_Designado,  a.id_Setor_Designado, a.id_Status_True, ');
      Sql.Add('   a.Data_Hora_Importacao, a.Ultima_Atualizacao, a.Data_Hora_Encerramento, ');
      Sql.Add('   a.Justificativa_Encerramento, a.Designacao_Pendente,');
      Sql.Add('   b.Tipo_Autorizacao, ');
      Sql.Add('   c.Tipo_Atendimento, ');
      Sql.Add('   d.Numero_Beneficiario, d.Nome_Beneficiario, ');
      Sql.Add('   e.Status as Status_True, e.Tipo_Prazo, e.Prazo, e.Encerra, ');
      Sql.Add('   j.Nome_Usuario as Usuario_Designado, ');
      Sql.Add('   k.Nome_Setor as Setor_Designado, ');
      Sql.Add('   l.Nome_Usuario as Usuario_Importacao, ');
      Sql.Add('   m.Nome_Usuario as Usuario_Atualizacao, ');
      Sql.Add('   n.Nome_Usuario as Usuario_Encerrameto, ');
      Sql.Add('   IsNull((Select count(*) ');
      Sql.Add('           From Siags_Historico ah ');
      Sql.Add('           where ah.id_Siags = a.id),0) as Qtd_Historicos,');
      Sql.Add('   IsNull((Select count(*) ');
      Sql.Add('           From Siags_Log al ');
      Sql.Add('           where al.id_Siags = a.id),0) as Qtd_Designacoes, ');
      Sql.Add('   IsNull((Select count(*) ');
      Sql.Add('           From Siags_Observacoes ao ');
      Sql.Add('           where ao.id_Siags = a.id),0) as Qtd_Observacoes');
      Sql.Add('From ');
      Sql.Add('   Siags a ');
      Sql.Add('   Inner Join Tipos_Autorizacao b on b.id = a.id_Tipo_Autorizacao ');
      Sql.Add('   Inner Join Tipos_Atendimento c on c.id = a.id_Tipo_Atendimento ');
      Sql.Add('   Inner Join Beneficiarios d on d.id = a.id_Beneficiario ');
      Sql.Add('   Left Outer Join Status_True e on e.id = a.id_Status_True');
      Sql.Add('   Left Outer Join Usuarios j on j.id = a.id_Usuario_Designado ');
      Sql.Add('   Left Outer Join Setores k on k.id = a.id_Setor_Designado ');
      Sql.Add('   LEFT OUTER JOIN Usuarios l on l.id = a.id_Usuario_Importacao ');
      Sql.Add('   LEFT OUTER JOIN Usuarios m on m.id = a.id_Usuario_Ultima_Atualizacao ');
      Sql.Add('   LEFT OUTER JOIN Usuarios n on n.id = a.id_Usuario_Encerramento');
      Sql.Add('where 1 = 1');
   end;
end;

function TSMSiags.ObservacoesDaAutorizacao(const AIdAutorizacao: LongInt): TJSONArray;
begin
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add('Select ');
   qryAux.Sql.Add('   a.Data_Hora, a.Observacao, ');
   qryAux.Sql.Add('   b.Nome_Usuario ');
   qryAux.Sql.Add('From ');
   qryAux.Sql.Add('   Siags_Observacoes a ');
   qryAux.Sql.Add('   INNER JOIN Usuarios b on b.id = a.id_Usuario ');
   qryAux.Sql.Add('Where ');
   qryAux.Sql.Add('   a.id_Siags = :pIdSiags');
   qryAux.Sql.Add('Order by ');
   qryAux.Sql.Add('   a.Data_Hora desc ');

   qryAux.ParamByName('pIdSiags').AsInteger := AIdAutorizacao;

   Result := TFuncoesJSON.MontarJSON(qryAux);
end;


function TSMSiags.ObterIdBeneficiario(const AValor, ANome: String): integer;
begin
   if not qryBeneficiarios.Locate('Numero_Beneficiario',AValor) then
      begin
      qryBeneficiarios.Append;
      qryBeneficiariosNumero_Beneficiario.AsString := AValor;
      qryBeneficiariosNome_Beneficiario.AsString   := ANome;
      qryBeneficiarios.Post;
   end;
   Result := qryBeneficiariosid.AsInteger
end;

function TSMSiags.ObterIdTipoAtendimento(const AValor: String): integer;
begin
   if not qryTiposAtendimento.Locate('Tipo_Atendimento',AValor) then
      begin
      qryTiposAtendimento.Append;
      qryTiposAtendimentoTipo_Atendimento.AsString := AValor;
      qryTiposAtendimento.Post;
   end;
   Result := qryTiposAtendimentoid.AsInteger
end;


function TSMSiags.ObterIdTipoAutorizacao(const AValor: String): integer;
begin
   if not qryTiposAutorizacao.Locate('Tipo_Autorizacao',AValor) then
      begin
      qryTiposAutorizacao.Append;
      qryTiposAutorizacaoTipo_Autorizacao.AsString := AValor;
      qryTiposAutorizacao.Post;
   end;
   Result := qryTiposAutorizacaoid.AsInteger
end;


function TSMSiags.RegistrarObservacao(const AIdAutorizacao: LongInt; const AObservacao: String; const AIdUsuarioResponsavel: integer; out ADataHora: TDateTime): Boolean;
begin
   Result := False;

   try
      TTransacao.IniciarTransacao(ServerContainer.FDConnection);
      ADataHora := Now;

      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add('Insert into Siags_Observacoes');
      qryAux.Sql.Add('   (id_Siags, id_Usuario, Data_Hora, Observacao)');
      qryAux.Sql.Add('Values ');
      qryAux.Sql.Add('   (:pIdSiags, :pIdUsuario, :pDataHora, :pObservacao)');
      qryAux.ParamByName('pIdSiags').AsInteger   := AIdAutorizacao;
      qryAux.ParamByName('pIdUsuario').AsInteger := AIdUsuarioResponsavel;
      qryAux.ParamByName('pDataHora').AsDateTime := ADataHora;
      qryAux.ParamByName('pObservacao').AsString := AObservacao;
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

function TSMSiags.Setores(const AIdUsuario : integer) : TJSONArray;
begin
  qrySetores.Close;
  qrySetores.ParamByName('pIdUsuario').AsInteger := AIdUsuario;
  Result := TFuncoesJSON.MontarJSON(qrySetores);
end;

function TSMSiags.StatusTrue: TJSONArray;
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

function TSMSiags.TiposDeAtendimento: TJSONArray;
begin
   Result := TFuncoesJSON.MontarJSON(qryTiposAtendimento);
end;


function TSMSiags.TiposDeAutoriazacao: TJSONArray;
begin
   Result := TFuncoesJSON.MontarJSON(qryTiposAutorizacao);
end;


function TSMSiags.Usuarios(const AIdUsuario : integer) : TJSONArray;
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
   qryAux.Sql.Add('                                     and isnull(b.SIAGS,' + QuotedStr(C_NAO) + ') = ' + QuotedStr(C_SIM));
   qryAux.Sql.Add('                              )');
   qryAux.Sql.Add('         ) ');
   qryAux.Sql.Add('   and us.Ativo = ' + QuotedStr(C_SIM));
   qryAux.ParamByName('pIdUsuario').AsInteger := AIdUsuario;

   Result := TFuncoesJSON.MontarJSON(qryAux);

(* qryAux.Sql.Add('Select id, Nome_Usuario From');

   qryAux.Sql.Add('   (Select ');
   qryAux.Sql.Add('       id, Nome_Usuario, ');

   qryAux.Sql.Add('       isnull((Select count(* ) ');
   qryAux.Sql.Add('               From Usuarios_Setores us ');
   qryAux.Sql.Add('                    Inner Join Setores st on st.id = us.id_Setor ');
   qryAux.Sql.Add('               where st.Siags = ' + QuotedStr('Sim') + '),0) as Siags ');
   qryAux.Sql.Add('    from ');
   qryAux.Sql.Add('       Usuarios u ');
   qryAux.Sql.Add('    where ');
   qryAux.Sql.Add('       u.ativo = ' + QuotedStr(C_SIM));
   qryAux.Sql.Add('   ) as usu');
   qryAux.Sql.Add('where ');
   qryAux.Sql.Add('   usu.Siags >= 1');
   Result := TFuncoesJSON.MontarJSON(qryAux);
*)
end;

function TSMSiags.UsuariosDoSetor(const AIdSetor: Integer): TJSONArray;
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
   qryAux.Sql.Add('   isnull(b.SIAGS, @pNao) = @pSim');
   qryAux.Sql.Add('   and c.Ativo = @pSim');
   qryAux.Sql.Add('   and (@pIdSetor = 0 or a.id_Setor = @pIdSetor)');

   qryAux.ParamByName('pIdSetor').AsInteger := AIdSetor;

   Result := TFuncoesJSON.MontarJSON(qryAux);
end;

end.

