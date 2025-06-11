unit ServerMethods.Siags;

interface

uses
  System.SysUtils,
  System.Classes,
  System.JSON,

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
    qryTiposPrazo: TFDQuery;
    qryTiposPrazoid: TFDAutoIncField;
    qryTiposPrazoTipo_Prazo_Caixa: TStringField;
    qryTiposPrazoAUTOSC: TIntegerField;
    qryTiposPrazoSIAGS: TIntegerField;
    qryTiposPrazoCONTROLPC: TIntegerField;
    qryTiposAutorizacao: TFDQuery;
    qryTiposAtendimento: TFDQuery;
    qryTiposSituacaoAutorizacao: TFDQuery;
    qrySiags: TFDQuery;
    qrySiagsHistorico: TFDQuery;
    qryPainelSiags: TFDQuery;
    qrySetores: TFDQuery;
    qrySetoresid: TIntegerField;
    qrySetoresNome_Setor: TStringField;
    qrySiagsLog: TFDQuery;
    qryTiposAuditoria: TFDQuery;
    qryTiposAuditoriaid: TFDAutoIncField;
    qryTiposAuditoriaTipo_Auditoria: TStringField;
    qryTiposAuditoriaAUTOSC: TIntegerField;
    qryTiposAuditoriaSIAGS: TIntegerField;
    qryTiposAuditoriaCONTROLPC: TIntegerField;
    qryTiposAutorizacaoid: TFDAutoIncField;
    qryTiposAutorizacaoTipo_Autorizacao: TStringField;
    qryTiposSituacaoAutorizacaoid: TFDAutoIncField;
    qryTiposSituacaoAutorizacaoTipo_Situacao_Autorizacao: TStringField;
    qryTiposAtendimentoid: TFDAutoIncField;
    qryTiposAtendimentoTipo_Atendimento: TStringField;
    qryTiposUltimaAnotacao: TFDQuery;
    qryTiposUltimaAnotacaoid: TFDAutoIncField;
    qryTiposUltimaAnotacaoTipo_Ultima_Anotacao: TStringField;
    qryBeneficiarios: TFDQuery;
    qryBeneficiariosid: TFDAutoIncField;
    qryBeneficiariosNumero_Beneficiario: TStringField;
    qryBeneficiariosNome_Beneficiario: TStringField;
    qrySiagsid: TLargeintField;
    qrySiagsUF: TStringField;
    qrySiagsid_Tipo_Autorizacao: TIntegerField;
    qrySiagsNumero_Autorizacao: TLargeintField;
    qrySiagsid_Tipo_Atendimento: TIntegerField;
    qrySiagsAnexo_Opme: TStringField;
    qrySiagsAnexo_Quimio: TStringField;
    qrySiagsAnexo_Radio: TStringField;
    qrySiagsid_Beneficiario: TIntegerField;
    qrySiagsid_Tipo_Situacao_Autorizacao: TIntegerField;
    qrySiagsid_Tipo_Ultima_Anotacao: TIntegerField;
    qrySiagsid_Tipo_Auditoria: TIntegerField;
    qrySiagsDia_Inclusao: TIntegerField;
    qrySiagsDias_Corridos_Base: TIntegerField;
    qrySiagsDias_Uteis_Base: TIntegerField;
    qrySiagsDias_Prazo_Caixa: TIntegerField;
    qrySiagsData_Prazo_Caixa: TDateTimeField;
    qrySiagsid_Tipo_Prazo_Caixa: TIntegerField;
    qrySiagsDias_Prazo_ANS: TIntegerField;
    qrySiagsData_Prazo_ANS: TDateTimeField;
    qrySiagsid_Tipo_Prazo_ANS: TIntegerField;
    qrySiagsData_Hora_Importacao: TDateTimeField;
    qrySiagsid_Usuario_Importacao: TIntegerField;
    qrySiagsid_Setor_Designado: TIntegerField;
    qrySiagsid_Responsavel_Designacao: TIntegerField;
    qrySiagsData_Hora_Designacao: TDateTimeField;
    qrySiagsJustificativa_Designacao: TStringField;
    qrySiagsData_Hora_Encerramento: TDateTimeField;
    qrySiagsid_Usuario_Encerramento: TIntegerField;
    qrySiagsJustificativa_Encerramento: TStringField;
    qrySiagsHistoricoid: TLargeintField;
    qrySiagsHistoricoid_Siags: TLargeintField;
    qrySiagsHistoricoid_Tipo_Autorizacao: TIntegerField;
    qrySiagsHistoricoid_Tipo_Atendimento: TIntegerField;
    qrySiagsHistoricoAnexo_Opme: TStringField;
    qrySiagsHistoricoAnexo_Quimio: TStringField;
    qrySiagsHistoricoAnexo_Radio: TStringField;
    qrySiagsHistoricoid_Tipo_Situacao_Autorizacao: TIntegerField;
    qrySiagsHistoricoid_Tipo_Ultima_Anotacao: TIntegerField;
    qrySiagsHistoricoid_Tipo_Auditoria: TIntegerField;
    qrySiagsHistoricoDias_Corridos_Base: TIntegerField;
    qrySiagsHistoricoDias_Uteis_Base: TIntegerField;
    qrySiagsHistoricoDias_Prazo_Caixa: TIntegerField;
    qrySiagsHistoricoid_Tipo_Prazo_Caixa: TIntegerField;
    qrySiagsHistoricoDias_Prazo_ANS: TIntegerField;
    qrySiagsHistoricoid_Tipo_Prazo_ANS: TIntegerField;
    qrySiagsHistoricoid_Usuario_Responsavel: TIntegerField;
    qrySiagsHistoricoData_Hora_Historico: TDateTimeField;
    qrySiagsLogid: TLargeintField;
    qrySiagsLogid_Siags: TLargeintField;
    qrySiagsLogid_Setor_Designado: TIntegerField;
    qrySiagsLogid_Usuario_Designado: TIntegerField;
    qrySiagsLogid_Usuario_Responsavel: TIntegerField;
    qrySiagsLogJustificativa: TStringField;
    qrySiagsLogData_Hora_Log: TDateTimeField;
    qryPainelSiagsuf: TStringField;
    qryPainelSiagsNumero_Autorizacao: TLargeintField;
    qryPainelSiagsAnexo_Opme: TStringField;
    qryPainelSiagsAnexo_Quimio: TStringField;
    qryPainelSiagsAnexo_Radio: TStringField;
    qryPainelSiagsDia_Inclusao: TIntegerField;
    qryPainelSiagsDias_Corridos_Base: TIntegerField;
    qryPainelSiagsDias_Uteis_Base: TIntegerField;
    qryPainelSiagsDias_Prazo_Caixa: TIntegerField;
    qryPainelSiagsData_Prazo_Caixa: TDateTimeField;
    qryPainelSiagsDias_Prazo_ANS: TIntegerField;
    qryPainelSiagsData_Prazo_ANS: TDateTimeField;
    qryPainelSiagsTipo_Autorizacao: TStringField;
    qryPainelSiagsTipo_Atendimento: TStringField;
    qryPainelSiagsNumero_Beneficiario: TStringField;
    qryPainelSiagsNome_Beneficiario: TStringField;
    qryPainelSiagsTipo_Situacao_Autorizacao: TStringField;
    qryPainelSiagsTipo_Ultima_Anotacao: TStringField;
    qryPainelSiagsTipo_Auditoria: TStringField;
    qryPainelSiagsTipo_Prazo_Caixa: TStringField;
    qryPainelSiagsTipo_Prazo_Ans: TStringField;
    qryPainelSiagsUsuario_Designado: TStringField;
    qryPainelSiagsSetor_Designado: TStringField;
    qryPainelSiagsQtd_Historicos: TIntegerField;
    qryPainelSiagsQtd_Designacoes: TIntegerField;
    qryPainelSiagsQtd_Observacoes: TIntegerField;
    qrySiagsid_Usuario_Designado: TIntegerField;
    qryPainelSiagsid_Autorizacao: TLargeintField;
  private
    { Private declarations }
    FIdTipoAuditoria           : integer;
    FIdTipoPrazoCaixa          : integer;
    FIdTipoPrazoANS            : integer;
    FIdTipoAutorizacao         : integer;
    FIdTipoAtendimento         : integer;
    FIdTipoSituacaoAutorizacao : integer;
    FIdTipoUltimaAnotacao      : integer;
    FIdBeneficiarios           : integer;

    FDiaInclusao               : integer;
    FDiasCorridosBase          : integer;
    FDiasUteisBase             : integer;
    FDiasPrazoCaixa            : integer;
    FDiasPrazoAns              : integer;

    FIdAutorizacao             : LongInt;
    FAnexoOpme                 : String;
    FAnexoQuimio               : String;
    FAnexoRadio                : String;


    FNumeroAutorizacao         : LongInt;

    FDataPrazoCaixa            : TDateTime;
    FDataPrazoANS              : TDateTime;
    FUF                        : String;

    FTotalRegistros            : Integer;
    FTotalNovos                : Integer;
    FTotalAtualizados          : Integer;
    FTotalNaoAtualizados       : Integer;
    FIdUsuarioResponsavel      : Integer;
    FDataHora                  : TDateTime;

    procedure AbrirTabelasDeCadastro;
    procedure FecharTabelasDeCadastro;

    function ObterIdTipoAuditoria(const AValor : String) : integer;
    function ObterIdTipoPrazo(const AValor : String) : integer;
    function ObterIdTipoAutorizacao(const AValor : String) : integer;
    function ObterIdTipoAtendimento(const AValor : String) : integer;
    function ObterIdTipoSituacaoAutorizacao(const AValor : String) : integer;
    function ObterIdTipoUltimaAnotacao(const AValor : String) : integer;
    function ObterIdBeneficiario(const AValor, ANome : String) : integer;
    function ObterIdAutorizacao(const AValor : String) : LongInt;

    procedure GravarAutorizacao;
    procedure GravarHistorico(const AId : Largeint);

    procedure MontarQueryPainel;


  public
    function Importar(const ARegistros : TJSONArray; const AIdUsuario : integer) : TJSONObject;

    function FiltrarAutorizacoes(const AFiltros : TJSONObject) : TJSONArray;
    function Designar(const AJustificativa: String;
                      const AIdSetor, AIdUsuario, AIdUsuarioResponsavel : integer;
                      const AIdAutorizacao : LongInt ): Boolean;

    function RegistrarObservacao(const AIdAutorizacao : LongInt;
                                 const AObservacao: String;
                                 const AIdUsuarioResponsavel : integer;
                                 out ADataHora : TDateTime): Boolean;

    function EncerrarAutorizacao(const AIdAutorizacao : LongInt;
                                 const AJustificativa: String;
                                 const AIdUsuarioResponsavel : integer): Boolean;

    function HistoricoDeDesignacoes(const AIdAutorizacao : LongInt) : TJSONArray;
    function HistoricoDeAtualizacoes(const AIdAutorizacao : LongInt) : TJSONArray;
    function ObservacoesDaAutorizacao(const AIdAutorizacao : LongInt) : TJSONArray;


    function TiposDeAuditoria           : TJSONArray;
    function TiposDePrazo               : TJSONArray;
    function TiposDeAutoriazacao        : TJSONArray;
    function TiposDeAtendimento         : TJSONArray;
    function TiposDeSituacaoAutorizacao : TJSONArray;
    function TiposDeUltimaAnotacao      : TJSONArray;


    function Setores          : TJSONArray;
    function Usuarios         : TJSONArray;
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

   qryTiposAuditoria.ParamByName('Siags').AsInteger := 9;
   qryTiposPrazo.ParamByName('Siags').AsInteger     := 9;

   qryTiposAuditoria.Open;
   qryTiposPrazo.Open;
   qryTiposAutorizacao.Open;
   qryTiposAtendimento.Open;
   qryTiposSituacaoAutorizacao.Open;
   qryTiposUltimaAnotacao.Open;
   qryBeneficiarios.Open;
end;

function TSMSiags.Designar(const AJustificativa: String; const AIdSetor, AIdUsuario, AIdUsuarioResponsavel: integer; const AIdAutorizacao: LongInt): Boolean;
begin
   Result := False;

   try
      FIdUsuarioResponsavel := AIdUsuarioResponsavel;
      FDataHora             := Now;
      TTransacao.IniciarTransacao(ServerContainer.FDConnection);
      try
         qrySiags.Close;
         qrySiags.Sql.Clear;
         qrySiags.Sql.Add('Select * from Siags');
         qrySiags.Sql.Add('where id = :pIdAutorizacao');
         qrySiags.ParamByName('pIdAutorizacao').AsInteger := AIdAutorizacao;
         qrySiags.Open;

         if qrySiags.isEmpty then
            Exit;

         GravarHistorico(AIdAutorizacao);

         qrySiagsLog.Close;
         qrySiagsLog.ParamByName('pIdSiags').AsInteger := AIdAutorizacao;
         qrySiagsLog.Open;

         qrySiagsLog.Append;
         qrySiagsLogid_Siags.AsInteger                := AIdAutorizacao;
         qrySiagsLogid_Usuario_Responsavel.AsInteger  := AIdUsuarioResponsavel;
         qrySiagsLogJustificativa.AsString            := AJustificativa;
         qrySiagsLogData_Hora_Log.AsDateTime          := FDataHora;

         if AIdSetor <> C_CODIGO_NAO_DESIGNADO then
            qrySiagsLogid_Setor_Designado.AsInteger   := AIdSetor;
         if AIdUsuario <> C_CODIGO_NAO_DESIGNADO then
            qrySiagsLogid_Usuario_Designado.AsInteger := AIdUsuario;
         qrySiagsLog.Post;


         qrySiags.Edit;
         if AIdSetor <> C_CODIGO_NAO_DESIGNADO then
            qrySiagsid_Setor_Designado.AsInteger     := AIdSetor;
         if AIdUsuario <> C_CODIGO_NAO_DESIGNADO then
            qrySiagsid_Usuario_Designado.AsInteger   := AIdUsuario;

         qrySiagsid_Responsavel_Designacao.AsInteger := AIdUsuarioResponsavel;
         qrySiagsData_Hora_Designacao.AsDateTime     := FDataHora;
         qrySiagsJustificativa_Designacao.AsString   := AJustificativa;
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

function TSMSiags.EncerrarAutorizacao(const AIdAutorizacao: LongInt; const AJustificativa: String; const AIdUsuarioResponsavel: integer): Boolean;
begin
   Result := False;

   try
      TTransacao.IniciarTransacao(ServerContainer.FDConnection);
      try
         qrySiags.Close;
         qrySiags.Sql.Clear;
         qrySiags.Sql.Add('Select * from Siags');
         qrySiags.Sql.Add('where id = :pIdAutorizacao');
         qrySiags.ParamByName('pIdAutorizacao').AsInteger := AIdAutorizacao;
         qrySiags.Open;

         if qrySiags.isEmpty then
            Exit;

         qrySiags.Edit;
         qrySiagsid_Usuario_Encerramento.AsInteger   := AIdUsuarioResponsavel;
         qrySiagsData_Hora_Encerramento.AsDateTime   := Now;
         qrySiagsJustificativa_Encerramento.AsString := AJustificativa;
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
   qryTiposAuditoria.Close;
   qryTiposPrazo.Close;
   qryTiposAutorizacao.Close;
   qryTiposAtendimento.Close;
   qryTiposSituacaoAutorizacao.Close;
   qryTiposUltimaAnotacao.Close;
   qryBeneficiarios.Close;
end;

function TSMSiags.FiltrarAutorizacoes(const AFiltros: TJSONObject): TJSONArray;
var
   LFiltros : TFiltrosSiags;
begin

   LFiltros.idTipoAuditoria           := AFiltros.GetValue<integer>('idTipoAuditoria');
   LFiltros.idTipoPrazoCaixa          := AFiltros.GetValue<integer>('idTipoPrazoCaixa');
   LFiltros.idTipoPrazoANS            := AFiltros.GetValue<integer>('idTipoPrazoANS');
   LFiltros.idTipoAutorizacao         := AFiltros.GetValue<integer>('idTipoAutorizacao');
   LFiltros.idTipoAtendimento         := AFiltros.GetValue<integer>('idTipoAtendimento');
   LFiltros.idTipoSituacaoAutorizacao := AFiltros.GetValue<integer>('idTipoSituacaoAutorizacao');
   LFiltros.idTipoUltimaAnotacao      := AFiltros.GetValue<integer>('idTipoUltimaAnotacao');
   LFiltros.idBeneficiarios           := AFiltros.GetValue<integer>('idBeneficiarios');
   LFiltros.idSetorDesignado          := AFiltros.GetValue<integer>('idSetorDesignado');
   LFiltros.idUsuarioDesignado        := AFiltros.GetValue<integer>('idUsuarioDesignado');
   LFiltros.UF                        := AFiltros.GetValue<String>('UF');
   LFiltros.nomeUsuario               := AFiltros.GetValue<String>('nomeUsuario');

   MontarQueryPainel;

   qryPainelSiags.Sql.Add(' and a.Data_Hora_Encerramento is null');
   if LFiltros.idTipoAuditoria > 0 then
      begin
      qryPainelSiags.Sql.Add(' and a.id_Tipo_Auditoria = :pIdTipoAuditoria');
      qryPainelSiags.ParamByName('pIdTipoAuditoria').AsInteger := LFiltros.idTipoAuditoria;
   end;

   if LFiltros.idTipoPrazoCaixa > 0 then
      begin
      qryPainelSiags.Sql.Add(' and a.id_Tipo_Prazo_Caixa = :pIdTipoPrazoCaixa');
      qryPainelSiags.ParamByName('pIdTipoPrazoCaixa').AsInteger := LFiltros.idTipoPrazoCaixa;
   end;

   if LFiltros.idTipoPrazoANS > 0 then
      begin
      qryPainelSiags.Sql.Add(' and a.id_Tipo_Prazo_ANS = :pIdTipoPrazoANS');
      qryPainelSiags.ParamByName('pIdTipoPrazoANS').AsInteger := LFiltros.idTipoPrazoANS;
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

   if LFiltros.idTipoSituacaoAutorizacao > 0 then
      begin
      qryPainelSiags.Sql.Add(' and a.id_Tipo_Situacao_Autorizacao = :pIdTipoSituacaoAutorizacao');
      qryPainelSiags.ParamByName('pIdTipoSituacaoAutorizacao').AsInteger := LFiltros.idTipoSituacaoAutorizacao;
   end;

   if LFiltros.idTipoUltimaAnotacao > 0 then
      begin
      qryPainelSiags.Sql.Add(' and a.id_Tipo_Ultima_Anotacao = :pIdTipoUltimaAnotacao');
      qryPainelSiags.ParamByName('pIdTipoUltimaAnotacao').AsInteger := LFiltros.idTipoUltimaAnotacao;
   end;

(*
   if LFiltros.idBeneficiarios > 0 then
      begin
      qryPainelSiags.Sql.Add(' and a.id_Beneficiario = :pIdBeneficiarios');
      qryPainelSiags.ParamByName('pIdBeneficiarios').AsInteger := LFiltros.idBeneficiarios;
   end;
*)
   if LFiltros.idSetorDesignado > 0 then
      begin
      qryPainelSiags.Sql.Add(' and a.id_Setor_Designado = :pIdSetorDesignado');
      qryPainelSiags.ParamByName('pIdSetorDesignado').AsInteger := LFiltros.idSetorDesignado;
   end;

   if LFiltros.idUsuarioDesignado > 0 then
      begin
      if LFiltros.idUsuarioDesignado = C_CODIGO_NAO_DESIGNADO then
         qryPainelSiags.Sql.Add(' and a.id_Usuario_Designado is null')
      else
         begin
         qryPainelSiags.Sql.Add(' and a.id_Usuario_Designado = :pIdUsuarioDesignado');
         qryPainelSiags.ParamByName('pIdUsuarioDesignado').AsInteger := LFiltros.idUsuarioDesignado;
      end;
   end;

   if LFiltros.UF <> C_TODOS then
      begin
      if LFiltros.UF = '' then
        qryPainelSiags.Sql.Add(' and a.UF = Null')
      else
        begin
        qryPainelSiags.Sql.Add(' and a.UF = :pUF');
        qryPainelSiags.ParamByName('pUF').AsString := LFiltros.UF;
      end;
   end;

   qryPainelSiags.Open;
   Result := TFuncoesJSON.MontarJSON(qryPainelSiags);
   qryPainelSiags.Close;
end;

procedure TSMSiags.GravarAutorizacao;
var
   LNovo      : Boolean;
   LAtualizou : Boolean;
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
         LAtualizou := False;
         qrySiags.Append;
         qrySiagsNumero_Autorizacao.AsInteger := FNumeroAutorizacao;
      end else
         begin
         if (qrySiagsid_Tipo_Autorizacao.AsInteger <> FIdTipoAutorizacao) or
            (qrySiagsid_Tipo_Atendimento.AsInteger <> FIdTipoAtendimento) or
            (qrySiagsid_Tipo_Situacao_Autorizacao.AsInteger <> FIdTipoSituacaoAutorizacao) or
            (qrySiagsid_Tipo_Ultima_Anotacao.AsInteger <> FIdTipoUltimaAnotacao) or
            (qrySiagsid_Tipo_Auditoria.AsInteger <> FIdTipoAuditoria) or
            (qrySiagsid_Tipo_Prazo_Caixa.AsInteger <> FIdTipoPrazoCaixa) or
            (qrySiagsid_Tipo_Prazo_ANS.AsInteger <> FIdTipoPrazoANS) or
            (qrySiagsDias_Corridos_Base.AsInteger <> FDiasCorridosBase) or
            (qrySiagsDias_Uteis_Base.AsInteger <> FDiasUteisBase) or
            (qrySiagsDias_Prazo_Caixa.AsInteger <> FDiasPrazoCaixa) or
            (qrySiagsDias_Prazo_ANS.AsInteger <> FDiasPrazoAns) or
            (qrySiagsAnexo_Opme.AsString <> FAnexoOpme) or
            (qrySiagsAnexo_Quimio.AsString <> FAnexoQuimio) or
            (qrySiagsAnexo_Radio.AsString <> FAnexoRadio) then
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

         if FUF <> '' then
            qrySiagsUF.AsString                         := FUF;
         qrySiagsid_Tipo_Autorizacao.AsInteger          := FIdTipoAutorizacao;
         qrySiagsid_Tipo_Atendimento.AsInteger          := FIdTipoAtendimento;
         qrySiagsAnexo_Opme.AsString                    := FAnexoOpme;
         qrySiagsAnexo_Quimio.AsString                  := FAnexoQuimio;
         qrySiagsAnexo_Radio.AsString                   := FAnexoRadio;
         qrySiagsid_Beneficiario.AsInteger              := FIdBeneficiarios;
         qrySiagsid_Tipo_Situacao_Autorizacao.AsInteger := FIdTipoSituacaoAutorizacao;
         qrySiagsid_Tipo_Ultima_Anotacao.AsInteger      := FIdTipoUltimaAnotacao;
         qrySiagsid_Tipo_Auditoria.AsInteger            := FIdTipoAuditoria;
         qrySiagsDia_Inclusao.AsInteger                 := FDiaInclusao;
         qrySiagsDias_Corridos_Base.AsInteger           := FDiasCorridosBase;
         qrySiagsDias_Uteis_Base.AsInteger              := FDiasUteisBase;
         qrySiagsDias_Prazo_Caixa.AsInteger             := FDiasPrazoCaixa;
         qrySiagsData_Prazo_Caixa.AsDateTime            := FDataPrazoCaixa;
         qrySiagsid_Tipo_Prazo_Caixa.AsInteger          := FIdTipoPrazoCaixa;
         qrySiagsDias_Prazo_ANS.AsInteger               := FDiasPrazoAns;
         qrySiagsData_Prazo_ANS.AsDateTime              := FDataPrazoANS;
         qrySiagsid_Tipo_Prazo_ANS.AsInteger            := FIdTipoPrazoANS;

         qrySiagsid_Usuario_Importacao.AsInteger    := FIdUsuarioResponsavel;
         qrySiagsData_Hora_Importacao.AsDateTime    := FDataHora;
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
      qrySiagsHistoricoid_Tipo_Situacao_Autorizacao.AsInteger := qrySiagsid_Tipo_Situacao_Autorizacao.AsInteger;
      qrySiagsHistoricoid_Tipo_Ultima_Anotacao.AsInteger      := qrySiagsid_Tipo_Ultima_Anotacao.AsInteger;
      qrySiagsHistoricoid_Tipo_Auditoria.AsInteger            := qrySiagsid_Tipo_Auditoria.AsInteger;
      qrySiagsHistoricoDias_Corridos_Base.AsInteger           := qrySiagsDias_Corridos_Base.AsInteger;
      qrySiagsHistoricoDias_Uteis_Base.AsInteger              := qrySiagsDias_Uteis_Base.AsInteger;
      qrySiagsHistoricoDias_Prazo_Caixa.AsInteger             := qrySiagsDias_Prazo_Caixa.AsInteger;
      qrySiagsHistoricoid_Tipo_Prazo_Caixa.AsInteger          := qrySiagsid_Tipo_Prazo_Caixa.AsInteger;
      qrySiagsHistoricoDias_Prazo_ANS.AsInteger               := qrySiagsDias_Prazo_ANS.AsInteger;
      qrySiagsHistoricoid_Tipo_Prazo_ANS.AsInteger            := qrySiagsid_Tipo_Prazo_ANS.AsInteger;
      qrySiagsHistoricoAnexo_Opme.AsString                    := qrySiagsAnexo_Opme.AsString;
      qrySiagsHistoricoAnexo_Quimio.AsString                  := qrySiagsAnexo_Quimio.AsString;
      qrySiagsHistoricoAnexo_Radio.AsString                   := qrySiagsAnexo_Radio.AsString;
      qrySiagsHistoricoid_Usuario_Responsavel.AsInteger   := qrySiagsid_Usuario_Importacao.AsInteger;
//      qrySiagsHistoricoid_Usuario_Responsavel.AsInteger   := FIdUsuarioResponsavel;
      qrySiagsHistoricoData_Hora_Historico.AsDateTime     := FDataHora;
      qrySiagsHistorico.Post;
   finally
      qrySiagsHistorico.Close;
   end;
end;

function TSMSiags.HistoricoDeAtualizacoes(const AIdAutorizacao: LongInt): TJSONArray;
begin
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add('Select ');
   qryAux.Sql.Add('   a.Anexo_Opme, a.Anexo_Quimio, a.Anexo_Radio, a.Dias_Corridos_Base, ');
   qryAux.Sql.Add('   a.Dias_Prazo_ANS, a.Dias_Prazo_Caixa, a.Dias_Uteis_Base, a.Data_Hora_Historico, ');
   qryAux.Sql.Add('   b.Tipo_Autorizacao, ');
   qryAux.Sql.Add('   c.Tipo_Atendimento, ');
   qryAux.Sql.Add('   d.Tipo_Situacao_Autorizacao, ');
   qryAux.Sql.Add('   e.Tipo_Ultima_Anotacao, ');
   qryAux.Sql.Add('   f.Tipo_Auditoria, ');
   qryAux.Sql.Add('   g.Tipo_Prazo_Caixa, ');
   qryAux.Sql.Add('   h.Tipo_Prazo_Caixa as Tipo_Prazo_ANS, ');
   qryAux.Sql.Add('   i.Nome_Usuario ');
   qryAux.Sql.Add('From ');
   qryAux.Sql.Add('   Siags_Historico a ');
   qryAux.Sql.Add('   Left Outer Join Tipos_Autorizacao b on b.id = a.id_Tipo_Autorizacao ');
   qryAux.Sql.Add('   Left Outer Join Tipos_Atendimento c on c.id = a.id_Tipo_Atendimento ');
   qryAux.Sql.Add('   Left Outer Join Tipos_Situacao_Autorizacao d on d.id = a.id_Tipo_Situacao_Autorizacao ');
   qryAux.Sql.Add('   Left Outer Join Tipos_Ultima_Anotacao e on e.id = a.id_Tipo_Ultima_Anotacao ');
   qryAux.Sql.Add('   Left Outer Join Tipos_Auditoria f on f.id = a.id_Tipo_Auditoria ');
   qryAux.Sql.Add('   Left Outer Join Tipos_Prazo g on g.id = a.id_Tipo_Prazo_Caixa ');
   qryAux.Sql.Add('   Left Outer Join Tipos_Prazo h on h.id = a.id_Tipo_Prazo_ANS ');
   qryAux.Sql.Add('   Left Outer Join Usuarios i on i.id = a.id_Usuario_Responsavel ');
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
   qryAux.Sql.Add('   isnull(sd.Nome_Setor, ' + QuotedStr(C_PROCESSO_NAO_DESIGNADO) + ') as Nome_Setor, ');
   qryAux.Sql.Add('   isnull(ud.Nome_Usuario, ' + QuotedStr(C_PROCESSO_NAO_DESIGNADO) + ') as Usuario_Designado, ');
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
   LData               : String;
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
            FUF                        := TFuncoesServer.EstadoParaSigla(LObject.Values['UF PRESTADOR'].Value);
            FIdTipoAutorizacao         := ObterIdTipoAutorizacao(LObject.Values['TIPO AUTORIZACAO'].Value);
            FNumeroAutorizacao         := LObject.Values['AUTORIZACAO'].AsType<LongInt>;
            FIdTipoAtendimento         := ObterIdTipoAtendimento(LObject.Values['TIPO ATENDIMENTO'].Value);
            FAnexoOpme                 := LObject.Values['ANEXO OPME'].AsType<String>;
            FAnexoQuimio               := LObject.Values['ANEXO QUIMIO'].AsType<String>;
            FAnexoRadio                := LObject.Values['ANEXO RADIO'].AsType<String>;
            LNumeroBeneficiario        := LObject.Values['BENEFICIARIO'].AsType<String>;
            LNomeBeneficiario          := LObject.Values['NOME'].AsType<String>;
            FIdBeneficiarios           := ObterIdBeneficiario(LNumeroBeneficiario, LNomeBeneficiario);
            FIdTipoSituacaoAutorizacao := ObterIdTipoSituacaoAutorizacao(LObject.Values['SITUACAOAUTORIZ'].Value);
            FIdTipoUltimaAnotacao      := ObterIdTipoUltimaAnotacao(LObject.Values['ULT ANOTACAO ADM'].Value);
            FIdTipoAuditoria           := ObterIdTipoAuditoria(LObject.Values['AUDITORIA'].Value);
            FDiaInclusao               := LObject.Values['DIAINCLUSAO'].AsType<Integer>;
            FDiasCorridosBase          := LObject.Values['DIASCORRIDOSABE'].AsType<Integer>;
            FDiasUteisBase             := LObject.Values['DIASUTEISABE'].AsType<Integer>;
            FDiasPrazoCaixa            := LObject.Values['DIASPRAZOCAX'].AsType<Integer>;
            FDataPrazoCaixa            := StrToDate(LObject.Values['DATAPRAZOCAX'].Value);
            FIdTipoPrazoCaixa          := ObterIdTipoPrazo(LObject.Values['STATUSPZCAX'].Value);
            FDiasPrazoAns              := LObject.Values['DIASPRAZOANS'].AsType<Integer>;
            FDataPrazoANS              := StrToDate(LObject.Values['DATAPRAZOANS'].Value);
            FIdTipoPrazoANS            := ObterIdTipoPrazo(LObject.Values['STATUSPZANS'].Value);

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

procedure TSMSiags.MontarQueryPainel;
begin
   with qryPainelSiags do
      begin
      Close;
      Sql.Clear;
      Sql.Add('Select ');
      Sql.Add('   a.id as id_Autorizacao, a.UF, a.Numero_Autorizacao, a.Anexo_Opme, a.Anexo_Quimio,  ');
      Sql.Add('   a.Anexo_Radio, a.Dia_Inclusao, a.Dias_Corridos_Base, a.Dias_Uteis_Base, ');
      Sql.Add('   a.Dias_Prazo_ANS, a.Data_Prazo_Caixa,  a.Dias_Prazo_Caixa, a.Dias_Prazo_ANS, ');
      Sql.Add('   a.Data_Prazo_ANS, a.id_Usuario_Designado,  a.id_Setor_Designado, ');
      Sql.Add('   b.Tipo_Autorizacao, ');
      Sql.Add('   c.Tipo_Atendimento, ');
      Sql.Add('   d.Tipo_Situacao_Autorizacao, ');
      Sql.Add('   e.Tipo_Ultima_Anotacao, ');
      Sql.Add('   f.Tipo_Auditoria, ');
      Sql.Add('   g.Tipo_Prazo_Caixa, ');
      Sql.Add('   h.Tipo_Prazo_Caixa as Tipo_Prazo_ANS, ');
      Sql.Add('   i.Numero_Beneficiario, i.Nome_Beneficiario, ');
      Sql.Add('   j.Nome_Usuario as Usuario_Designado, ');
      Sql.Add('   k.Nome_Setor as Setor_Designado, ');
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
      Sql.Add('   Inner Join Tipos_Situacao_Autorizacao d on d.id = a.id_Tipo_Situacao_Autorizacao ');
      Sql.Add('   Inner Join Tipos_Ultima_Anotacao e on e.id = a.id_Tipo_Ultima_Anotacao ');
      Sql.Add('   Inner Join Tipos_Auditoria f on f.id = a.id_Tipo_Auditoria ');
      Sql.Add('   Inner Join Tipos_Prazo g on g.id = a.id_Tipo_Prazo_Caixa ');
      Sql.Add('   Inner Join Tipos_Prazo h on h.id = a.id_Tipo_Prazo_ANS ');
      Sql.Add('   Inner Join Beneficiarios i on i.id = a.id_Beneficiario ');
      Sql.Add('   Left Outer Join Usuarios j on j.id = a.id_Usuario_Designado ');
      Sql.Add('   Left Outer Join Setores k on k.id = a.id_Setor_Designado ');
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

function TSMSiags.ObterIdAutorizacao(const AValor: String): LongInt;
begin
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

function TSMSiags.ObterIdTipoAuditoria(const AValor: String): integer;
begin
   if not qryTiposAuditoria.Locate('Tipo_Auditoria',AValor) then
      begin
      qryTiposAuditoria.Append;
      qryTiposAuditoriaTipo_Auditoria.AsString := AValor;
      qryTiposAuditoriaSIAGS.AsInteger        := 1;
      qryTiposAuditoria.Post;
   end else if qryTiposAuditoriaSIAGS.AsInteger = 0 then
      begin
      qryTiposAuditoria.Edit;
      qryTiposAuditoriaSIAGS.AsInteger := 1;
      qryTiposAuditoria.Post;
   end;

   Result := qryTiposAuditoriaid.AsInteger
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

function TSMSiags.ObterIdTipoPrazo(const AValor: String): integer;
begin
   if not qryTiposPrazo.Locate('Tipo_Prazo_Caixa',AValor) then
      begin
      qryTiposPrazo.Append;
      qryTiposPrazoTipo_Prazo_Caixa.AsString := AValor;
      qryTiposPrazoSIAGS.AsInteger           := 1;
      qryTiposPrazo.Post;
   end else if qryTiposPrazoSIAGS.AsInteger = 0 then
      begin
      qryTiposPrazo.Edit;
      qryTiposPrazoSIAGS.AsInteger := 1;
      qryTiposPrazo.Post;
   end;

   Result := qryTiposPrazoid.AsInteger
end;

function TSMSiags.ObterIdTipoSituacaoAutorizacao(const AValor: String): integer;
begin
   if not qryTiposSituacaoAutorizacao.Locate('Tipo_Situacao_Autorizacao',AValor) then
      begin
      qryTiposSituacaoAutorizacao.Append;
      qryTiposSituacaoAutorizacaoTipo_Situacao_Autorizacao.AsString := AValor;
      qryTiposSituacaoAutorizacao.Post;
   end;
   Result := qryTiposSituacaoAutorizacaoid.AsInteger
end;

function TSMSiags.ObterIdTipoUltimaAnotacao(const AValor: String): integer;
begin
   if not qryTiposUltimaAnotacao.Locate('Tipo_Ultima_Anotacao',AValor) then
      begin
      qryTiposUltimaAnotacao.Append;
      qryTiposUltimaAnotacaoTipo_Ultima_Anotacao.AsString := AValor;
      qryTiposUltimaAnotacao.Post;
   end;
   Result := qryTiposUltimaAnotacaoid.AsInteger
end;

function TSMSiags.RegistrarObservacao(const AIdAutorizacao: LongInt; const AObservacao: String; const AIdUsuarioResponsavel: integer; out ADataHora: TDateTime): Boolean;
begin
   Result := False;

   try
      TTransacao.IniciarTransacao(ServerContainer.FDConnection);

      ADataHora := Now;
      try
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

   finally
      qrySiagsLog.Close;
      qrySiagsHistorico.Close;
      qrySiags.Close;
   end;
end;

function TSMSiags.Setores: TJSONArray;
begin
  Result := TFuncoesJSON.MontarJSON(qrySetores);
end;

function TSMSiags.TiposDeAtendimento: TJSONArray;
begin
   Result := TFuncoesJSON.MontarJSON(qryTiposAtendimento);
end;

function TSMSiags.TiposDeAuditoria: TJSONArray;
begin
   qryTiposAuditoria.Close;
   qryTiposAuditoria.ParamByName('SIAGS').AsInteger := 1;

   Result := TFuncoesJSON.MontarJSON(qryTiposAuditoria);
end;

function TSMSiags.TiposDeAutoriazacao: TJSONArray;
begin
   Result := TFuncoesJSON.MontarJSON(qryTiposAutorizacao);
end;

function TSMSiags.TiposDePrazo: TJSONArray;
begin
   qryTiposPrazo.Close;
   qryTiposPrazo.ParamByName('SIAGS').AsInteger := 1;

   Result := TFuncoesJSON.MontarJSON(qryTiposPrazo);
end;

function TSMSiags.TiposDeSituacaoAutorizacao: TJSONArray;
begin
   Result := TFuncoesJSON.MontarJSON(qryTiposSituacaoAutorizacao);
end;


function TSMSiags.TiposDeUltimaAnotacao: TJSONArray;
begin
   Result := TFuncoesJSON.MontarJSON(qryTiposUltimaAnotacao);
end;

function TSMSiags.Usuarios: TJSONArray;
begin
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add('Select id, Nome_Usuario From');

   qryAux.Sql.Add('   (Select ');
   qryAux.Sql.Add('       id, Nome_Usuario, ');

   qryAux.Sql.Add('       isnull((Select 1 ');
   qryAux.Sql.Add('               From Usuarios_Setores us ');
   qryAux.Sql.Add('                    Inner Join Setores st on st.id = us.id_Setor ');
   qryAux.Sql.Add('               where st.Siags = ' + QuotedStr('Sim') + '),0) as Siags ');
   qryAux.Sql.Add('    from ');
   qryAux.Sql.Add('       Usuarios u ');
   qryAux.Sql.Add('    where ');
   qryAux.Sql.Add('       u.ativo = ' + QuotedStr(C_SIM));
   qryAux.Sql.Add('   ) as usu');
   qryAux.Sql.Add('where ');
   qryAux.Sql.Add('   usu.Siags = 1');

   Result := TFuncoesJSON.MontarJSON(qryAux);
end;

end.

