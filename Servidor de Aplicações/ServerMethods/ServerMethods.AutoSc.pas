unit ServerMethods.AutoSc;

interface

uses
  System.SysUtils,
  System.Classes,
  System.JSON,

  Datasnap.DSServer,
  Datasnap.DSAuth,
  Datasnap.DSProviderDataModuleAdapter,


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

  Data.DB,

  Libs.Constantes,
  Libs.TTransacao,
  Libs.TFiltros,
  Libs.TFuncoesJSON,
  Utils.TFuncoesServer;

type
  TSMAutoSC = class(TDSServerModule)
    qryAux: TFDQuery;
    qryTiposPrazo: TFDQuery;
    qryTiposPrazoHoje: TFDQuery;
    qryTiposProcesso: TFDQuery;
    qryTiposProcessoE: TFDQuery;
    qryTiposStatus: TFDQuery;
    qryTiposPrazoid: TFDAutoIncField;
    qryTiposPrazoTipo_Prazo_Caixa: TStringField;
    qryTiposPrazoHojeid: TFDAutoIncField;
    qryTiposPrazoHojeTipo_Prazo_Caixa_Hoje: TStringField;
    qryTiposProcessoid: TFDAutoIncField;
    qryTiposProcessoTipo_Processo: TStringField;
    qryTiposProcessoEid: TFDAutoIncField;
    qryTiposProcessoETipo_Processo_E: TStringField;
    qryTiposStatusid: TFDAutoIncField;
    qryTiposStatusTipo_Status: TStringField;
    qryAutoSc: TFDQuery;
    qryAutoScid: TLargeintField;
    qryAutoScNumero_Processo: TLargeintField;
    qryAutoScid_Tipo_Auditoria: TIntegerField;
    qryAutoScid_Tipo_Prazo_Caixa: TIntegerField;
    qryAutoScid_Tipo_Prazo_Caixa_Hoje: TIntegerField;
    qryAutoScid_Tipo_Status: TIntegerField;
    qryAutoScid_Tipo_Processo: TIntegerField;
    qryAutoScData_Status: TDateTimeField;
    qryAutoScQtd_Arquivos: TIntegerField;
    qryAutoScUF: TStringField;
    qryAutoScid_Tipo_Processo_E: TIntegerField;
    qryAutoScid_Tipo_Prazo_ANS: TIntegerField;
    qryAutoScData_Hora_Importacao: TDateTimeField;
    qryAutoScid_Usuario_Importacao: TIntegerField;
    qryAutoScid_Setor_Designado: TIntegerField;
    qryAutoScid_Usuario_Designado: TIntegerField;
    qryAutoScHistorico: TFDQuery;
    qryAutoScHistoricoid: TLargeintField;
    qryAutoScHistoricoid_AutoSC: TLargeintField;
    qryAutoScHistoricoid_Tipo_Prazo_Caixa: TIntegerField;
    qryAutoScHistoricoid_Tipo_Prazo_Caixa_Hoje: TIntegerField;
    qryAutoScHistoricoid_Tipo_Status: TIntegerField;
    qryAutoScHistoricoData_Status: TDateTimeField;
    qryAutoScHistoricoid_Usuario_Responsavel: TIntegerField;
    qryPainelAutoSc: TFDQuery;
    qryPainelAutoScid_Processo: TLargeintField;
    qryPainelAutoScNumero_Processo: TLargeintField;
    qryPainelAutoScData_Status: TDateTimeField;
    qryPainelAutoScQtd_Arquivos: TIntegerField;
    qryPainelAutoScuf: TStringField;
    qryPainelAutoScTipo_Auditoria: TStringField;
    qryPainelAutoScTipo_Prazo_Caixa: TStringField;
    qryPainelAutoScTipo_Prazo_Caixa_Hoje: TStringField;
    qryPainelAutoScTipo_Status: TStringField;
    qryPainelAutoScTipo_Processo: TStringField;
    qryPainelAutoScTipo_Processo_E: TStringField;
    qryPainelAutoScTipo_Prazo_Ans: TStringField;
    qryPainelAutoScUsuario_Designado: TStringField;
    qrySetores: TFDQuery;
    qrySetoresid: TIntegerField;
    qrySetoresNome_Setor: TStringField;
    qryAutoScLog: TFDQuery;
    qryAutoScLogid: TLargeintField;
    qryAutoScLogid_AutoSC: TLargeintField;
    qryAutoScLogid_Setor_Designado: TIntegerField;
    qryAutoScLogid_Usuario_Designado: TIntegerField;
    qryAutoScLogid_Usuario_Responsavel: TIntegerField;
    qryAutoScLogJustificativa: TStringField;
    qryAutoScLogData_Hora_Log: TDateTimeField;
    qryAutoScHistoricoData_Hora_Historico: TDateTimeField;
    qryAutoScid_Responsavel_Designacao: TIntegerField;
    qryAutoScData_Hora_Designacao: TDateTimeField;
    qryAutoScData_Hora_Encerramento: TDateTimeField;
    qryAutoScid_Usuario_Encerramento: TIntegerField;
    qryAutoScJustificativa_Encerramento: TStringField;
    qryAutoScJustificativa_Designacao: TStringField;
    qryAutoScHistoricoid_Tipo_Prazo_ANS: TIntegerField;
    qryPainelAutoScQtd_Historicos: TIntegerField;
    qryPainelAutoScQtd_Designacoes: TIntegerField;
    qryPainelAutoScQtd_Observacoes: TIntegerField;
    qryTiposPrazoAUTOSC: TIntegerField;
    qryTiposPrazoSIAGS: TIntegerField;
    qryTiposPrazoCONTROLPC: TIntegerField;
    qryTiposPrazoHojeAUTOSC: TIntegerField;
    qryTiposPrazoHojeSIAGS: TIntegerField;
    qryTiposPrazoHojeCONTROLPC: TIntegerField;
    qryTiposAuditoria: TFDQuery;
    qryTiposAuditoriaid: TFDAutoIncField;
    qryTiposAuditoriaTipo_Auditoria: TStringField;
    qryTiposAuditoriaAUTOSC: TIntegerField;
    qryTiposAuditoriaSIAGS: TIntegerField;
    qryTiposAuditoriaCONTROLPC: TIntegerField;
    qryTiposStatusAUTOSC: TIntegerField;
    qryTiposStatusSIAGS: TIntegerField;
    qryTiposStatusCONTROLPC: TIntegerField;
  private
    { Private declarations }

    FIdTipoAuditoria     : integer;
    FIdTipoPrazoCaixa    : integer;
    FIdTipoPrazoCaixaHj  : integer;
    FIdTipoStatus        : integer;
    FIdTipoProcesso      : integer;
    FIdTipoProcessoE     : integer;
    FIdTipoPrazoANS      : integer;
    FQtdArquivos         : integer;
    FNumeroProcesso      : LongInt;

    FDataStatus          : TDateTime;
    FUF                  : String;

    FTotalRegistros      : Integer;
    FTotalNovos          : Integer;
    FTotalAtualizados    : Integer;
    FTotalNaoAtualizados : Integer;
    FIdUsuarioResponsavel: Integer;
    FDataHora            : TDateTime;


    procedure AbrirTabelasDeCadastro;
    procedure FecharTabelasDeCadastro;

    function ObterIdTipoAuditoria(const AValor : String) : integer;
    function ObterIdTipoPrazoHJ(const AValor : String) : integer;
    function ObterIdProcesso(const AValor : String) : LongInt;
    function ObterIdTipoStatus(const AValor : String) : integer;
    function ObterIdTipoProcesso(const AValor : String) : integer;
    function ObterIdTipoProcessoE(const AValor : String) : integer;
    function ObterIdTipoPrazo(const AValor : String) : integer;

    procedure GravarProcesso;
    procedure GravarHistorico(const AId : Largeint);

    procedure MontarQueryPainel;


  public
    function Importar(const ARegistros : TJSONArray; const AIdUsuario : integer) : TJSONObject;

    function FiltrarProcessos(const AFiltros : TJSONObject) : TJSONArray;
    function Designar(const AJustificativa: String;
                      const AIdSetor, AIdUsuario, AIdUsuarioResponsavel : integer;
                      const AIdProcesso : LongInt ): Boolean;

    function RegistrarObservacao(const AIdProcesso : LongInt;
                                 const AObservacao: String;
                                 const AIdUsuarioResponsavel : integer;
                                 out ADataHora : TDateTime): Boolean;

    function EncerrarProcesso(const AIdProcesso : LongInt;
                              const AJustificativa: String;
                              const AIdUsuarioResponsavel : integer): Boolean;

    function HistoricoDeDesignacoes(const AIdProcesso : LongInt) : TJSONArray;
    function HistoricoDeAtualizacoes(const AIdProcesso : LongInt) : TJSONArray;
    function ObservacoesDoProcesso(const AIdProcesso : LongInt) : TJSONArray;


    function TiposDeAuditoria : TJSONArray;
    function TiposDePrazo     : TJSONArray;
    function TiposDePrazoHoje : TJSONArray;
    function TiposDeProcesso  : TJSONArray;
    function TiposDeProcessoE : TJSONArray;
    function TiposDeStatus    : TJSONArray;
    function Setores          : TJSONArray;
    function Usuarios         : TJSONArray;

    function ListagemDeDesignacoes(const AUsaDatas : Boolean;
                                   const ADataInicial, ADataFinal : TDateTime;
                                   const ANumeroProceso : string;
                                   const AIdUsuarioResponsavel : integer) : TJSONArray;

  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses ServerMethods.Container;

{$R *.dfm}

{ TSMImportacoesAutoSC }


function TSMAutoSC.ObterIdTipoAuditoria(const AValor: String): integer;
begin
   if not qryTiposAuditoria.Locate('Tipo_Auditoria',AValor) then
      begin
      qryTiposAuditoria.Append;
      qryTiposAuditoriaTipo_Auditoria.AsString := AValor;
      qryTiposAuditoriaAUTOSC.AsInteger        := 1;
      qryTiposAuditoria.Post;
   end else if qryTiposAuditoriaAUTOSC.AsInteger = 0 then
      begin
      qryTiposAuditoria.Edit;
      qryTiposAuditoriaAUTOSC.AsInteger := 1;
      qryTiposAuditoria.Post;
   end;

   Result := qryTiposAuditoriaid.AsInteger
end;

function TSMAutoSC.ObterIdTipoPrazo(const AValor: String): integer;
begin
   if not qryTiposPrazo.Locate('Tipo_Prazo_Caixa',AValor) then
      begin
      qryTiposPrazo.Append;
      qryTiposPrazoTipo_Prazo_Caixa.AsString := AValor;
      qryTiposPrazoAUTOSC.AsInteger          := 1;
      qryTiposPrazo.Post;
   end else if qryTiposPrazoAUTOSC.AsInteger = 0 then
      begin
      qryTiposPrazo.Edit;
      qryTiposPrazoAUTOSC.AsInteger := 1;
      qryTiposPrazo.Post;
   end;

   Result := qryTiposPrazoid.AsInteger
end;


function TSMAutoSC.ObterIdTipoPrazoHJ(const AValor: String): integer;
begin
   if not qryTiposPrazoHoje.Locate('Tipo_Prazo_Caixa_Hoje',AValor) then
      begin
      qryTiposPrazoHoje.Append;
      qryTiposPrazoHojeTipo_Prazo_Caixa_Hoje.AsString := AValor;
      qryTiposPrazoHojeAUTOSC.AsInteger               := 1;
      qryTiposPrazoHoje.Post;
   end else if qryTiposPrazoHojeAUTOSC.AsInteger = 0 then
      begin
      qryTiposPrazoHoje.Edit;
      qryTiposPrazoHojeAUTOSC.AsInteger := 1;
      qryTiposPrazoHoje.Post;
   end;
   Result := qryTiposPrazoHojeid.AsInteger
end;

function TSMAutoSC.ObservacoesDoProcesso(const AIdProcesso: LongInt): TJSONArray;
begin
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add('Select ');
   qryAux.Sql.Add('   a.Data_Hora, a.Observacao, ');
   qryAux.Sql.Add('   b.Nome_Usuario ');
   qryAux.Sql.Add('From ');
   qryAux.Sql.Add('   AutoSC_Observacoes a ');
   qryAux.Sql.Add('   INNER JOIN Usuarios b on b.id = a.id_Usuario ');
   qryAux.Sql.Add('Where ');
   qryAux.Sql.Add('   a.id_AutoSC = :pIdAutoSC');
   qryAux.Sql.Add('Order by ');
   qryAux.Sql.Add('   a.Data_Hora desc ');

   qryAux.ParamByName('pIdAutoSC').AsInteger := AIdProcesso;

   Result := TFuncoesJSON.MontarJSON(qryAux);

end;

function TSMAutoSC.ObterIdProcesso(const AValor: String): LongInt;
begin
end;

function TSMAutoSC.ObterIdTipoStatus(const AValor: String): integer;
begin
   if not qryTiposStatus.Locate('Tipo_Status',AValor) then
      begin
      qryTiposStatus.Append;
      qryTiposStatusTipo_Status.AsString := AValor;
      qryTiposStatusAUTOSC.AsInteger  := 1;
      qryTiposStatus.Post;
   end else if qryTiposStatusAUTOSC.AsInteger = 0 then
      begin
      qryTiposStatus.Edit;
      qryTiposStatusAUTOSC.AsInteger := 1;
      qryTiposStatus.Post;
   end;
   Result := qryTiposStatusid.AsInteger
end;


function TSMAutoSC.RegistrarObservacao(
   const AIdProcesso: LongInt;
   const AObservacao: String;
   const AIdUsuarioResponsavel: integer;
   out ADataHora : TDateTime): Boolean;
begin
   Result := False;

   try
      TTransacao.IniciarTransacao(ServerContainer.FDConnection);

      ADataHora := Now;
      try
         qryAux.Close;
         qryAux.Sql.Clear;
         qryAux.Sql.Add('Insert into AutoSC_Observacoes');
         qryAux.Sql.Add('   (id_AutoSC, id_Usuario, Data_Hora, Observacao)');
         qryAux.Sql.Add('Values ');
         qryAux.Sql.Add('   (:pIdAutoSC, :pIdUsuario, :pDataHora, :pObservacao)');
         qryAux.ParamByName('pIdAutoSC').AsInteger  := AIdProcesso;
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
      qryAutoScLog.Close;
      qryAutoScHistorico.Close;
      qryAutoSc.Close;
   end;
end;

function TSMAutoSC.Setores: TJSONArray;
begin
  Result := TFuncoesJSON.MontarJSON(qrySetores);
end;

function TSMAutoSC.TiposDeAuditoria: TJSONArray;
begin
   qryTiposAuditoria.Close;
   qryTiposAuditoria.ParamByName('AUTOSC').AsInteger := 1;

   Result := TFuncoesJSON.MontarJSON(qryTiposAuditoria);
end;

function TSMAutoSC.TiposDePrazo: TJSONArray;
begin
   qryTiposPrazo.Close;
   qryTiposPrazo.ParamByName('AUTOSC').AsInteger := 1;

   Result := TFuncoesJSON.MontarJSON(qryTiposPrazo);
end;

function TSMAutoSC.TiposDePrazoHoje: TJSONArray;
begin
   qryTiposPrazoHoje.Close;
   qryTiposPrazoHoje.ParamByName('AUTOSC').AsInteger := 1;

   Result := TFuncoesJSON.MontarJSON(qryTiposPrazoHoje);
end;

function TSMAutoSC.TiposDeProcesso: TJSONArray;
begin
  Result := TFuncoesJSON.MontarJSON(qryTiposProcesso);
end;

function TSMAutoSC.TiposDeProcessoE: TJSONArray;
begin
   Result := TFuncoesJSON.MontarJSON(qryTiposProcessoE);
end;

function TSMAutoSC.TiposDeStatus: TJSONArray;
begin
   qryTiposStatus.Close;
   qryTiposStatus.ParamByName('AUTOSC').AsInteger := 1;
   Result := TFuncoesJSON.MontarJSON(qryTiposStatus);
end;

function TSMAutoSC.Usuarios: TJSONArray;
begin
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add('Select id, Nome_Usuario From');

   qryAux.Sql.Add('   (Select ');
   qryAux.Sql.Add('       id, Nome_Usuario, ');

   qryAux.Sql.Add('       isnull((Select 1 ');
   qryAux.Sql.Add('               From Usuarios_Setores us ');
   qryAux.Sql.Add('                    Inner Join Setores st on st.id = us.id_Setor ');
   qryAux.Sql.Add('               where st.AUTOSC = ' + QuotedStr('Sim') + '),0) as AutoSC ');
   qryAux.Sql.Add('    from ');
   qryAux.Sql.Add('       Usuarios u ');
   qryAux.Sql.Add('    where ');
   qryAux.Sql.Add('       u.ativo = ' + QuotedStr(C_SIM));
   qryAux.Sql.Add('   ) as usu');
   qryAux.Sql.Add('where ');
   qryAux.Sql.Add('   usu.AutoSC = 1');

   Result := TFuncoesJSON.MontarJSON(qryAux);

end;

function TSMAutoSC.ObterIdTipoProcesso(const AValor: String): integer;
begin
   if not qryTiposProcesso.Locate('Tipo_Processo',AValor) then
      begin
      qryTiposProcesso.Append;
      qryTiposProcessoTipo_Processo.AsString := AValor;
      qryTiposProcesso.Post;
   end;
   Result := qryTiposProcessoid.AsInteger
end;

function TSMAutoSC.ObterIdTipoProcessoE(const AValor: String): integer;
begin
   if not qryTiposProcessoE.Locate('Tipo_Processo_E',AValor) then
      begin
      qryTiposProcessoE.Append;
      qryTiposProcessoETipo_Processo_E.AsString := AValor;
      qryTiposProcessoE.Post;
   end;
   Result := qryTiposProcessoEid.AsInteger
end;

procedure TSMAutoSC.AbrirTabelasDeCadastro;
begin
   FecharTabelasDeCadastro;

   qryTiposAuditoria.ParamByName('AUTOSC').AsInteger := 9;
   qryTiposPrazo.ParamByName('AUTOSC').AsInteger     := 9;
   qryTiposPrazoHoje.ParamByName('AUTOSC').AsInteger := 9;
   qryTiposStatus.ParamByName('AUTOSC').AsInteger    := 9;

   qryTiposAuditoria.Open;
   qryTiposPrazo.Open;
   qryTiposPrazoHoje.Open;
   qryTiposProcesso.Open;
   qryTiposProcessoE.Open;
   qryTiposStatus.Open;
end;

function TSMAutoSC.Designar(
   const AJustificativa: String;
   const AIdSetor, AIdUsuario, AIdUsuarioResponsavel : integer;
   const AIdProcesso : LongInt ): Boolean;
begin
   Result := False;

   try
      FIdUsuarioResponsavel := AIdUsuarioResponsavel;
      FDataHora             := Now;
      TTransacao.IniciarTransacao(ServerContainer.FDConnection);
      try
         qryAutoSc.Close;
         qryAutoSc.Sql.Clear;
         qryAutoSc.Sql.Add('Select * from AutoSC');
         qryAutoSc.Sql.Add('where id = :pIProcesso');
         qryAutoSc.ParamByName('pIProcesso').AsInteger := AIdProcesso;
         qryAutoSc.Open;

         if qryAutoSc.isEmpty then
            Exit;

         GravarHistorico(AIdProcesso);

         qryAutoScLog.Close;
         qryAutoScLog.ParamByName('pIdAutoSC').AsInteger := AIdProcesso;
         qryAutoScLog.Open;

         qryAutoScLog.Append;
         qryAutoScLogid_AutoSC.AsInteger              := AIdProcesso;
         qryAutoScLogid_Usuario_Responsavel.AsInteger := AIdUsuarioResponsavel;
         qryAutoScLogJustificativa.AsString           := AJustificativa;
         qryAutoScLogData_Hora_Log.AsDateTime         := FDataHora;

         if AIdSetor <> C_CODIGO_NAO_DESIGNADO then
            qryAutoScLogid_Setor_Designado.AsInteger  := AIdSetor;
         if AIdUsuario <> C_CODIGO_NAO_DESIGNADO then
            qryAutoScLogid_Usuario_Designado.AsInteger := AIdUsuario;
         qryAutoScLog.Post;


         qryAutoSc.Edit;
         if AIdSetor <> C_CODIGO_NAO_DESIGNADO then
            qryAutoScid_Setor_Designado.AsInteger  := AIdSetor;
         if AIdUsuario <> C_CODIGO_NAO_DESIGNADO then
            qryAutoScid_Usuario_Designado.AsInteger := AIdUsuario;

         qryAutoScid_Responsavel_Designacao.AsInteger := AIdUsuarioResponsavel;
         qryAutoScData_Hora_Designacao.AsDateTime     := FDataHora;
         qryAutoScJustificativa_Designacao.AsString   := AJustificativa;
         qryAutoSc.Post;

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
      qryAutoScLog.Close;
      qryAutoScHistorico.Close;
      qryAutoSc.Close;
   end;
end;

function TSMAutoSC.EncerrarProcesso(const AIdProcesso: LongInt; const AJustificativa: String; const AIdUsuarioResponsavel: integer): Boolean;
begin
   Result := False;

   try
      TTransacao.IniciarTransacao(ServerContainer.FDConnection);
      try
         qryAutoSc.Close;
         qryAutoSc.Sql.Clear;
         qryAutoSc.Sql.Add('Select * from AutoSC');
         qryAutoSc.Sql.Add('where id = :pIProcesso');
         qryAutoSc.ParamByName('pIProcesso').AsInteger := AIdProcesso;
         qryAutoSc.Open;

         if qryAutoSc.isEmpty then
            Exit;

         qryAutoSc.Edit;
         qryAutoScid_Usuario_Encerramento.AsInteger   := AIdUsuarioResponsavel;
         qryAutoScData_Hora_Encerramento.AsDateTime   := Now;
         qryAutoScJustificativa_Encerramento.AsString := AJustificativa;
         qryAutoSc.Post;

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
      qryAutoScLog.Close;
      qryAutoScHistorico.Close;
      qryAutoSc.Close;
   end;
end;

procedure TSMAutoSC.FecharTabelasDeCadastro;
begin
   qryTiposAuditoria.Close;
   qryTiposPrazo.Close;
   qryTiposPrazoHoje.Close;
   qryTiposProcesso.Close;
   qryTiposProcessoE.Close;
   qryTiposStatus.Close;
   qryTiposAuditoria.Close;
end;

function TSMAutoSC.FiltrarProcessos(const AFiltros : TJSONObject) : TJSONArray;
var
   LFiltros : TFiltrosAutoSc;
begin

   LFiltros.numeroDoProcesso     := AFiltros.GetValue<String>('numeroDoProcesso');
   LFiltros.idTipoAuditoria      := AFiltros.GetValue<integer>('idTipoAuditoria');
   LFiltros.idTipoPrazoCaixa     := AFiltros.GetValue<integer>('idTipoPrazoCaixa');
   LFiltros.idTipoPrazoCaixaHoje := AFiltros.GetValue<integer>('idTipoPrazoCaixaHoje');
   LFiltros.idTipoStatus         := AFiltros.GetValue<integer>('idTipoStatus');
   LFiltros.idTipoProcesso       := AFiltros.GetValue<integer>('idTipoProcesso');
   LFiltros.idTipoProcessoE      := AFiltros.GetValue<integer>('idTipoProcessoE');
   LFiltros.idTipoPrazoANS       := AFiltros.GetValue<integer>('idTipoPrazoANS');
   LFiltros.idSetorDesignado     := AFiltros.GetValue<integer>('idSetorDesignado');
   LFiltros.idUsuarioDesignado   := AFiltros.GetValue<integer>('idUsuarioDesignado');
   LFiltros.UF                   := AFiltros.GetValue<String>('UF');
   LFiltros.nomeUsuario          := AFiltros.GetValue<String>('nomeUsuario');
   LFiltros.usaDataStatus        := AFiltros.GetValue<Boolean>('usaDataStatus');
   if LFiltros.usaDataStatus then
     begin
     LFiltros.dataInicio           := AFiltros.GetValue<TDateTime>('dataInicio');
     LFiltros.dataFim              := AFiltros.GetValue<TDateTime>('dataFim');
   end;

   MontarQueryPainel;

   qryPainelAutoSc.Sql.Add(' and a.Data_Hora_Encerramento is null');

   if LFiltros.numeroDoProcesso <> '' then
      begin
      qryPainelAutoSc.Sql.Add(' and a.Numero_Processo like :pNumeroDoProcesso');
//      qryPainelAutoSc.Sql.Add(' and cast(a.Numero_Processo as varchar(50)) like :pNumeroDoProcesso');
      qryPainelAutoSc.ParamByName('pNumeroDoProcesso').AsString := '%' + LFiltros.numeroDoProcesso + '%';
   end;

   if LFiltros.idTipoAuditoria > 0 then
      begin
      qryPainelAutoSc.Sql.Add(' and a.id_Tipo_Auditoria = :pIdTipoAuditoria');
      qryPainelAutoSc.ParamByName('pIdTipoAuditoria').AsInteger := LFiltros.idTipoAuditoria;
   end;

   if LFiltros.idTipoPrazoCaixa > 0 then
      begin
      qryPainelAutoSc.Sql.Add(' and a.id_Tipo_Prazo_Caixa = :pIdTipoPrazoCaixa');
      qryPainelAutoSc.ParamByName('pIdTipoPrazoCaixa').AsInteger := LFiltros.idTipoPrazoCaixa;
   end;

   if LFiltros.idTipoPrazoCaixaHoje > 0 then
      begin
      qryPainelAutoSc.Sql.Add(' and a.id_Tipo_Prazo_Caixa_Hoje = :pIdTipoPrazoCaixaHoje');
      qryPainelAutoSc.ParamByName('pIdTipoPrazoCaixaHoje').AsInteger := LFiltros.idTipoPrazoCaixaHoje;
   end;

   if LFiltros.idTipoStatus > 0 then
      begin
      qryPainelAutoSc.Sql.Add(' and a.id_Tipo_Status = :pIdTipoStatus');
      qryPainelAutoSc.ParamByName('pIdTipoStatus').AsInteger := LFiltros.idTipoStatus;
   end;

   if LFiltros.idTipoProcesso > 0 then
      begin
      qryPainelAutoSc.Sql.Add(' and a.id_Tipo_Processo = :pIdTipoProcesso');
      qryPainelAutoSc.ParamByName('pIdTipoProcesso').AsInteger := LFiltros.idTipoProcesso;
   end;

   if LFiltros.idTipoProcessoE > 0 then
      begin
      qryPainelAutoSc.Sql.Add(' and a.id_Tipo_Processo_E = :pIdTipoProcessoE');
      qryPainelAutoSc.ParamByName('pIdTipoProcessoE').AsInteger := LFiltros.idTipoProcessoE;
   end;

   if LFiltros.idTipoPrazoANS > 0 then
      begin
      qryPainelAutoSc.Sql.Add(' and a.id_Tipo_Prazo_ANS = :pIdTipoPrazoANS');
      qryPainelAutoSc.ParamByName('pIdTipoPrazoANS').AsInteger := LFiltros.idTipoPrazoANS;
   end;

   if LFiltros.idSetorDesignado > 0 then
      begin
      qryPainelAutoSc.Sql.Add(' and a.id_Setor_Designado = :pIdSetorDesignado');
      qryPainelAutoSc.ParamByName('pIdSetorDesignado').AsInteger := LFiltros.idSetorDesignado;
   end;

   if LFiltros.idUsuarioDesignado > 0 then
      begin
      if LFiltros.idUsuarioDesignado = C_CODIGO_NAO_DESIGNADO then
         qryPainelAutoSc.Sql.Add(' and a.id_Usuario_Designado is null')
      else
         begin
         qryPainelAutoSc.Sql.Add(' and a.id_Usuario_Designado = :pIdUsuarioDesignado');
         qryPainelAutoSc.ParamByName('pIdUsuarioDesignado').AsInteger := LFiltros.idUsuarioDesignado;
      end;
   end;

   if LFiltros.UF <> C_TODOS then
      begin
      qryPainelAutoSc.Sql.Add(' and a.UF = :pUF');
      qryPainelAutoSc.ParamByName('pUF').AsString := LFiltros.UF;
   end;

   if LFiltros.UsaDataStatus then
      begin
      qryPainelAutoSc.Sql.Add(' and a.Data_Status between :pDataInicio and :pDataFim');
      qryPainelAutoSc.ParamByName('pDataInicio').AsDate := LFiltros.dataInicio;
      qryPainelAutoSc.ParamByName('pDataFim').AsDate    := LFiltros.dataFim;
   end;

   qryPainelAutoSc.Open;
   Result := TFuncoesJSON.MontarJSON(qryPainelAutoSc);
   qryPainelAutoSc.Close;
end;

procedure TSMAutoSC.GravarHistorico(const AId: Largeint);
begin
   qryAutoScHistorico.Close;
   try
      qryAutoScHistorico.ParamByName('pIdAutoSC').AsInteger := AId;
      qryAutoScHistorico.Open;
      qryAutoScHistorico.Append;
      qryAutoScHistoricoid_AutoSC.AsInteger                := AId;
      qryAutoScHistoricoid_Tipo_Prazo_Caixa.AsInteger      := qryAutoScid_Tipo_Prazo_Caixa.AsInteger;
      qryAutoScHistoricoid_Tipo_Prazo_Caixa_Hoje.AsInteger := qryAutoScid_Tipo_Prazo_Caixa_Hoje.AsInteger;
      qryAutoScHistoricoid_Tipo_Prazo_ANS.AsInteger        := qryAutoScid_Tipo_Prazo_ANS.AsInteger;
      qryAutoScHistoricoid_Tipo_Status.AsInteger           := qryAutoScid_Tipo_Status.AsInteger;
      qryAutoScHistoricoid_Usuario_Responsavel.AsInteger   := qryAutoScid_Usuario_Importacao.AsInteger;
      qryAutoScHistoricoData_Status.AsDateTime             := qryAutoScData_Status.AsDateTime;
//      qryAutoScHistoricoid_Usuario_Responsavel.AsInteger   := FIdUsuarioResponsavel;
      qryAutoScHistoricoData_Hora_Historico.AsDateTime     := FDataHora;
      qryAutoScHistorico.Post;
   finally
      qryAutoScHistorico.Close;
   end;
end;

procedure TSMAutoSC.GravarProcesso;
var
   LNovo      : Boolean;
   LAtualizou : Boolean;
   LAtualizar : Boolean;
begin
   qryAutoSc.Close;
   qryAutoSc.Sql.Clear;
   qryAutoSc.Sql.Add('Select * from AutoSC');
   qryAutoSc.Sql.Add('where Numero_Processo = :pNumeroProcesso');
   qryAutoSc.ParamByName('pNumeroProcesso').AsInteger := FNumeroProcesso;
   qryAutoSc.Open;

   FTotalRegistros := FTotalRegistros + 1;

   try
      LAtualizar := False;
      LNovo := qryAutoSc.isEmpty;
      if LNovo then
         begin
         LAtualizou := False;
         qryAutoSc.Append;
         qryAutoScNumero_Processo.AsInteger := FNumeroProcesso;
      end else
         begin
         if (qryAutoScid_Tipo_Auditoria.AsInteger <> FIdTipoAuditoria) or
            (qryAutoScid_Tipo_Prazo_Caixa.AsInteger <> FIdTipoPrazoCaixa) or
            (qryAutoScid_Tipo_Prazo_Caixa_Hoje.AsInteger <> FIdTipoPrazoCaixaHj) or
            (qryAutoScid_Tipo_Status.AsInteger <> FIdTipoStatus) or
            (qryAutoScid_Tipo_Processo_E.AsInteger <> FIdTipoProcessoE) or
            (qryAutoScQtd_Arquivos.AsInteger <> FQtdArquivos) or
            (qryAutoScData_Status.AsDateTime <> FDataStatus) or
            (qryAutoScid_Tipo_Prazo_ANS.AsInteger <> FIdTipoPrazoANS) then
            begin
            LAtualizar := True;
            qryAutoSc.Edit;
         end;
      end;

      if LNovo or LAtualizar then
         begin
         if LAtualizar then
            begin
            GravarHistorico(qryAutoScid.AsInteger);
            FTotalAtualizados := FTotalAtualizados + 1;
         end else
            FTotalNovos := FTotalNovos + 1;

         qryAutoScid_Tipo_Auditoria.AsInteger        := FIdTipoAuditoria;
         qryAutoScid_Tipo_Prazo_Caixa.AsInteger      := FIdTipoPrazoCaixa;
         qryAutoScid_Tipo_Prazo_Caixa_Hoje.AsInteger := FIdTipoPrazoCaixaHj;
         qryAutoScid_Tipo_Status.AsInteger           := FIdTipoStatus;
         qryAutoScid_Tipo_Processo.AsInteger         := FIdTipoProcesso;
         qryAutoScid_Tipo_Processo_E.AsInteger       := FIdTipoProcessoE;
         qryAutoScid_Tipo_Prazo_ANS.AsInteger        := FIdTipoPrazoANS;

         qryAutoScQtd_Arquivos.AsInteger             := FQtdArquivos;
         qryAutoScData_Status.AsDateTime             := FDataStatus;
         qryAutoScUF.AsString                        := FUF;
         qryAutoScid_Usuario_Importacao.AsInteger    := FIdUsuarioResponsavel;
         qryAutoScData_Hora_Importacao.AsDateTime    := FDataHora;
         qryAutoSc.Post;
      end else
         FTotalNaoAtualizados := FTotalNaoAtualizados + 1;
   finally
      qryAutoSc.Close;
   end;
end;

function TSMAutoSC.HistoricoDeAtualizacoes(const AIdProcesso: LongInt): TJSONArray;
begin
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add('Select ');
   qryAux.Sql.Add('   ah.Data_Hora_Historico, ');
   qryAux.Sql.Add('   tpc.Tipo_Prazo_Caixa, ');
   qryAux.Sql.Add('   tph.Tipo_Prazo_Caixa_Hoje, ');
   qryAux.Sql.Add('   tpa.Tipo_Prazo_Caixa as Tipo_Prazo_ANS, ');
   qryAux.Sql.Add('   ts.Tipo_Status, ');
   qryAux.Sql.Add('   us.Nome_Usuario ');
   qryAux.Sql.Add('From ');
   qryAux.Sql.Add('   AutoSc_Historico ah ');
   qryAux.Sql.Add('   LEFT OUTER JOIN Tipos_Prazo tpc on tpc.id = ah.id_Tipo_Prazo_Caixa ');
   qryAux.Sql.Add('   LEFT OUTER JOIN Tipos_Prazo_Hoje tph on tph.id = ah.id_Tipo_Prazo_Caixa_Hoje ');
   qryAux.Sql.Add('   LEFT OUTER JOIN Tipos_Prazo tpa on tpa.id = ah.id_Tipo_Prazo_Caixa_Hoje ');
   qryAux.Sql.Add('   LEFT OUTER JOIN Tipos_Status ts on ts.id = ah.id_Tipo_Status ');
   qryAux.Sql.Add('   LEFT OUTER JOIN Usuarios us on us.id = ah.id_Usuario_Responsavel ');
   qryAux.Sql.Add('where ');
   qryAux.Sql.Add('   ah.id_AutoSC = :pIdProcesso');
   qryAux.Sql.Add('Order by ');
   qryAux.Sql.Add('   ah.Data_Hora_Historico desc ');
   qryAux.ParamByName('pIdProcesso').AsInteger := AIdProcesso;

   Result := TFuncoesJSON.MontarJSON(qryAux);
end;

function TSMAutoSC.HistoricoDeDesignacoes(const AIdProcesso: LongInt): TJSONArray;
begin
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add('Select ');
   qryAux.Sql.Add('   al.Justificativa, al.Data_Hora_Log, ');
   qryAux.Sql.Add('   isnull(sd.Nome_Setor, ' + QuotedStr(C_PROCESSO_NAO_DESIGNADO) + ') as Nome_Setor, ');
   qryAux.Sql.Add('   isnull(ud.Nome_Usuario, ' + QuotedStr(C_PROCESSO_NAO_DESIGNADO) + ') as Usuario_Designado, ');
   qryAux.Sql.Add('   ur.Nome_Usuario as Usuario_Responsavel ');
   qryAux.Sql.Add('from ');
   qryAux.Sql.Add('   AutoSc_Log al ');
   qryAux.Sql.Add('   Left Outer Join Setores sd on sd.id = al.id_Setor_Designado');
   qryAux.Sql.Add('   Left Outer Join Usuarios ud on ud.id = al.id_Usuario_Designado ');
   qryAux.Sql.Add('   Left Outer Join Usuarios ur on ur.id = al.id_Usuario_Responsavel ');
   qryAux.Sql.Add('where ');
   qryAux.Sql.Add('   al.id_AutoSC = :pIdProcesso');
   qryAux.Sql.Add('Order by ');
   qryAux.Sql.Add('   al.Data_Hora_Log desc ');
   qryAux.ParamByName('pIdProcesso').AsInteger := AIdProcesso;

   Result := TFuncoesJSON.MontarJSON(qryAux);
end;

function TSMAutoSC.Importar(const ARegistros: TJSONArray; const AIdUsuario : integer): TJSONObject;
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
      AbrirTabelasDeCadastro;
      TTransacao.IniciarTransacao(ServerContainer.FDConnection);
      try
         for I := 0 to ARegistros.Count - 1 do
            begin
            LObject := ARegistros[i] as TJSONObject;
            FIdTipoAuditoria    := ObterIdTipoAuditoria(LObject.Values['AUDITORIA'].Value);
            FIdTipoPrazoCaixa   := ObterIdTipoPrazo(LObject.Values['PRAZOCAX'].Value);
            FIdTipoPrazoCaixaHJ := ObterIdTipoPrazoHJ(LObject.Values['PRAZOCAXHJ'].Value);
            FIdTipoStatus       := ObterIdTipoStatus(LObject.Values['STATUS'].Value);
            FIdTipoProcesso     := ObterIdTipoProcesso(LObject.Values['TIPOPROCESSO'].Value);
            FIdTipoProcessoE    := ObterIdTipoProcessoE(LObject.Values['TIPOPROCESSOE'].Value);
            FIdTipoPrazoANS     := ObterIdTipoPrazo(LObject.Values['PRAZOANS'].Value);
            FUF                 := LObject.Values['UF'].Value;
            FQtdArquivos        := LObject.Values['QTD ARQUIVOS'].AsType<Integer>;
            LData               := LObject.Values['DATA ABERTURA'].Value;

            FDataStatus         := StrToDate(LData);

            FNumeroProcesso     := LObject.Values['PROCESSO'].AsType<LongInt>;

            GravarProcesso;

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

function TSMAutoSC.ListagemDeDesignacoes(
   const AUsaDatas : Boolean;
   const ADataInicial, ADataFinal : TDateTime;
   const ANumeroProceso : string;
   const AIdUsuarioResponsavel : integer) : TJSONArray;
begin
   qryAux.SQL.Clear;
   qryAux.SQL.Add('SELECT                                                                   ');
   qryAux.SQL.Add('   id_AutoSc as id,                                                      ');
   qryAux.SQL.Add('   Usuario_Designado,                                                    ');
   qryAux.SQL.Add('   Setor_Designado,                                                      ');
   qryAux.SQL.Add('   Usuario_Responsavel,                                                  ');
   qryAux.SQL.Add('   Justificativa,                                                        ');
   qryAux.SQL.Add('   Numero_Processo as Numero,                                            ');
   qryAux.SQL.Add('   Data_Hora_Log AS Data_Hora_Inicial,                                   ');
   qryAux.SQL.Add('   ISNULL(ProximaData, Null) AS Data_Hora_Final,                    ');
   qryAux.SQL.Add('   DATEDIFF(DAY, Data_hora_log, ISNULL(ProximaData, GETDATE())) AS Dias, ');
   qryAux.SQL.Add('   DATEDIFF(HOUR, Data_hora_log, ISNULL(ProximaData, GETDATE())) % 24 AS Horas,    ');
   qryAux.SQL.Add('   DATEDIFF(MINUTE, Data_hora_log, ISNULL(ProximaData, GETDATE())) % 60 AS Minutos ');
   qryAux.SQL.Add('FROM (                                                                             ');
   qryAux.SQL.Add('       SELECT                                                                      ');
   qryAux.SQL.Add('          a.id_AutoSc,                                                             ');
   qryAux.SQL.Add('          a.Data_hora_log,                                                         ');
   qryAux.SQL.Add('          a.Justificativa,                                                         ');
   qryAux.SQL.Add('          b.Nome_Usuario as Usuario_Designado,                                     ');
   qryAux.SQL.Add('          c.Nome_Setor as Setor_Designado,                                         ');
   qryAux.SQL.Add('          d.Nome_Usuario as Usuario_Responsavel,                                   ');
   qryAux.SQL.Add('          e.Numero_Processo,                                                       ');
   qryAux.SQL.Add('          LEAD(Data_hora_log) OVER (PARTITION BY id_AutoSc ORDER BY Data_hora_log) AS ProximaData ');
   qryAux.SQL.Add('       FROM                                                                                       ');
   qryAux.SQL.Add('          AutoSc_Log a                                                                            ');
   qryAux.SQL.Add('          left outer join Usuarios b on b.id = a.id_Usuario_Designado                             ');
   qryAux.SQL.Add('          left outer join Setores c on c.id = a.id_Setor_Designado                                ');
   qryAux.SQL.Add('          inner join Usuarios d on d.id = a.id_Usuario_Responsavel                                ');
   qryAux.SQL.Add('          inner join AutoSC e on e.id = a.id_AutoSC                                               ');
   qryAux.SQL.Add('       WHERE 1 = 1 ');

   if AUsaDatas then
      begin
      qryAux.SQL.Add('       and cast(a.Data_Hora_Log as Date) between :pDataInicial and :pDataFinal');
      qryAux.ParamByName('pDataInicial').AsDateTime := ADataInicial;
      qryAux.ParamByName('pDataFinal').AsDateTime   := ADataFinal;
   end;

   if AIdUsuarioResponsavel > 0 then
      begin
      qryAux.SQL.Add('       and a.id_Usuario_Responsavel = :pIdUsuarioResponsavel');
      qryAux.ParamByName('pIdUsuarioResponsavel').AsInteger := AIdUsuarioResponsavel;
   end;

   if ANumeroProceso <> '' then
      begin
      qryAux.SQL.Add('       and e.Numero_Processo = :pNumeroProcesso');
      qryAux.ParamByName('pNumeroProcesso').AsString := ANumeroProceso;
   end;
   qryAux.SQL.Add('     ) AS Logs ');

   qryAux.SQL.Add('Order by Numero, Data_Hora_Inicial desc');


   Result := TFuncoesJSON.MontarJSON(qryAux);
end;

procedure TSMAutoSC.MontarQueryPainel;
begin
   with qryPainelAutoSc do
      begin
      Close;
      Sql.Clear;
      Sql.Add('Select ');
      Sql.Add('   a.id as id_Processo, a.Numero_Processo, a.Data_Status, a.Qtd_Arquivos, a.uf, ');
      Sql.Add('   a.id_Usuario_Designado, a.id_Setor_Designado, ');
      Sql.Add('   b.Tipo_Auditoria, ');
      Sql.Add('   c.Tipo_Prazo_Caixa, ');
      Sql.Add('   d.Tipo_Prazo_Caixa_Hoje, ');
      Sql.Add('   e.Tipo_Status, ');
      Sql.Add('   f.Tipo_Processo, ');
      Sql.Add('   g.Tipo_Processo_E, ');
      Sql.Add('   h.Tipo_Prazo_Caixa as Tipo_Prazo_Ans, ');
      Sql.Add('   i.Nome_Usuario as Usuario_Designado, ');
      Sql.Add('   j.Nome_Setor as Setor_Designado, ');
      Sql.Add('   IsNull((Select count(*) ');
      Sql.Add('           From AutoSc_Historico ah ');
      Sql.Add('           where ah.id_AutoSC = a.id),0) as Qtd_Historicos,');
      Sql.Add('   IsNull((Select count(*) ');
      Sql.Add('           From AutoSc_Log al ');
      Sql.Add('           where al.id_AutoSC = a.id),0) as Qtd_Designacoes, ');
      Sql.Add('   IsNull((Select count(*) ');
      Sql.Add('           From AutoSC_Observacoes ao ');
      Sql.Add('           where ao.id_AutoSC = a.id),0) as Qtd_Observacoes');
      Sql.Add('From ');
      Sql.Add('   AutoSc a ');
      Sql.Add('   INNER JOIN Tipos_Auditoria b on b.id = a.id_Tipo_Auditoria ');
      Sql.Add('   INNER JOIN Tipos_Prazo c on c.id = a.id_Tipo_Prazo_Caixa ');
      Sql.Add('   INNER JOIN Tipos_Prazo_Hoje d on d.id = a.id_Tipo_Prazo_Caixa_Hoje ');
      Sql.Add('   INNER JOIN Tipos_Status e on e.id = a.id_Tipo_Status ');
      Sql.Add('   INNER JOIN Tipos_Processo f on f.id = a.id_Tipo_Processo ');
      Sql.Add('   INNER JOIN Tipos_Processo_E g on g.id = a.id_Tipo_Processo_E ');
      Sql.Add('   INNER JOIN Tipos_Prazo h on h.id = a.id_Tipo_Prazo_ANS ');
      Sql.Add('   LEFT OUTER JOIN Usuarios i on i.id = a.id_Usuario_Designado ');
      Sql.Add('   LEFT OUTER JOIN Setores j on j.id = a.id_Setor_Designado ');
      Sql.Add('where 1 = 1');
   end;
end;

end.

