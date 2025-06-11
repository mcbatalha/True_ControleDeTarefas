unit ServerMethods.ControlPc;

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
  TSMControlPc = class(TDSServerModule)
    qrySetores: TFDQuery;
    qrySetoresid: TIntegerField;
    qrySetoresNome_Setor: TStringField;
    qryTiposStatus: TFDQuery;
    qryTiposStatusid: TFDAutoIncField;
    qryTiposStatusTipo_Status: TStringField;
    qryTiposStatusAUTOSC: TIntegerField;
    qryTiposStatusSIAGS: TIntegerField;
    qryTiposStatusCONTROLPC: TIntegerField;
    qryTiposPrazo: TFDQuery;
    qryTiposPrazoid: TFDAutoIncField;
    qryTiposPrazoTipo_Prazo_Caixa: TStringField;
    qryTiposPrazoAUTOSC: TIntegerField;
    qryTiposPrazoSIAGS: TIntegerField;
    qryTiposPrazoCONTROLPC: TIntegerField;
    qryTecnicos: TFDQuery;
    qryTecnicosid: TFDAutoIncField;
    qryTecnicosNome_Tecnico: TStringField;
    qryTiposCliente: TFDQuery;
    qryTiposClienteid: TFDAutoIncField;
    qryTiposClienteTipo_Cliente: TStringField;
    qryTiposClassificacao: TFDQuery;
    qryTiposClassificacaoid: TFDAutoIncField;
    qryTiposClassificacaoTipo_Classificacao: TStringField;
    qryControlPc: TFDQuery;
    qryControlPcHistorico: TFDQuery;
    qryControlPcLog: TFDQuery;
    qryControlPcid: TLargeintField;
    qryControlPcProtocolo: TStringField;
    qryControlPcid_Tipo_Status: TIntegerField;
    qryControlPcData_Abertura: TDateTimeField;
    qryControlPcData_Transferencia: TDateTimeField;
    qryControlPcData_Fechamento: TDateTimeField;
    qryControlPcPrevisao_Solucao: TDateTimeField;
    qryControlPcid_Tipo_Prazo: TIntegerField;
    qryControlPcid_Tipo_Cliente: TIntegerField;
    qryControlPcid_Tipo_Classificacao: TIntegerField;
    qryControlPcSolicitacao_Cliente: TStringField;
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
    qryControlPcHistoricoid_Tipo_Status: TIntegerField;
    qryControlPcHistoricoid_Tipo_Prazo: TIntegerField;
    qryControlPcHistoricoid_Tecnico: TIntegerField;
    qryControlPcHistoricoid_Tipo_Cliente: TIntegerField;
    qryControlPcHistoricoid_Tipo_Classifiacao: TIntegerField;
    qryControlPcHistoricoid_Usuario_Responsavel: TIntegerField;
    qryControlPcHistoricoData_Hora_Historico: TDateTimeField;
    qryPainelControlPc: TFDQuery;
    qryPainelControlPcid_Protocolo: TLargeintField;
    qryPainelControlPcData_Abertura: TDateTimeField;
    qryPainelControlPcData_Transferencia: TDateTimeField;
    qryPainelControlPcData_Fechamento: TDateTimeField;
    qryPainelControlPcPrevisao_Solucao: TDateTimeField;
    qryPainelControlPcSolicitacao_Cliente: TStringField;
    qryPainelControlPcTipo_Reclame: TStringField;
    qryPainelControlPcTipo_Nip: TStringField;
    qryPainelControlPcTipo_Status: TStringField;
    qryPainelControlPcTipo_Prazo_Caixa: TStringField;
    qryPainelControlPcNome_Tecnico: TStringField;
    qryPainelControlPcTipo_Cliente: TStringField;
    qryPainelControlPcUsuario_Designado: TStringField;
    qryPainelControlPcSetor_Designado: TStringField;
    qryPainelControlPcQtd_Historicos: TIntegerField;
    qryPainelControlPcQtd_Designacoes: TIntegerField;
    qryPainelControlPcQtd_Observacoes: TIntegerField;
    qryAux: TFDQuery;
    qryControlPcid_Tecnico: TIntegerField;
    qryControlPcLogid: TLargeintField;
    qryControlPcLogid_ControlPc: TLargeintField;
    qryControlPcLogid_Setor_Designado: TIntegerField;
    qryControlPcLogid_Usuario_Designado: TIntegerField;
    qryControlPcLogid_Usuario_Responsavel: TIntegerField;
    qryControlPcLogJustificativa: TStringField;
    qryControlPcLogData_Hora_Log: TDateTimeField;
  private

    FIdTecnico            : integer;
    FIdTipoPrazo          : integer;
    FIdTipoCliente        : integer;
    FIdTipoClassificacao  : integer;
    FIdTipoStatus         : integer;

    FNumeroProtocolo      : String;
    FDataAbertura         : TDateTime;
    FDataTransferencia    : TDateTime;
    FDataFechamento       : TDateTime;
    FPrevisaoSolucao      : TDateTime;
    FSolicitacaoCliente   : String;
    FTipoReclame          : String;
    FTipoNip              : String;

    FTotalRegistros       : Integer;
    FTotalNovos           : Integer;
    FTotalAtualizados     : Integer;
    FTotalNaoAtualizados  : Integer;

    FIdUsuarioResponsavel : Integer;
    FDataHora             : TDateTime;

    FTemDataAbertura      : Boolean;
    FTemDataTransferencia : Boolean;
    FTemDataFechamento    : Boolean;
    FTemPrevisaoSolucao   : Boolean;

    procedure AbrirTabelasDeCadastro;
    procedure FecharTabelasDeCadastro;

    function ObterIdTecnico(const AValor : String) : integer;
    function ObterIdTipoPrazo(const AValor : String) : integer;
    function ObterIdTipoCliente(const AValor : String) : integer;
    function ObterIdTipoClassificacao(const AValor : String) : integer;
    function ObterIdTipoStatus(const AValor : String) : integer;

    procedure GravarProtocolo;
    procedure GravarHistorico(const AId : Largeint);

    procedure MontarQueryPainel;


  public
    function Importar(const ARegistros : TJSONArray; const AIdUsuario : integer) : TJSONObject;

    function FiltrarProtocolos(const AFiltros : TJSONObject) : TJSONArray;
    function Designar(const AJustificativa: String;
                      const AIdSetor, AIdUsuario, AIdUsuarioResponsavel : integer;
                      const AIdProtocolo : LongInt ): Boolean;

    function RegistrarObservacao(const AIdProtocolo : LongInt;
                                 const AObservacao: String;
                                 const AIdUsuarioResponsavel : integer;
                                 out ADataHora : TDateTime): Boolean;

    function EncerrarProtocolo(const AIdProtocolo : LongInt;
                              const AJustificativa: String;
                              const AIdUsuarioResponsavel : integer): Boolean;

    function HistoricoDeDesignacoes(const AIdProtocolo : LongInt) : TJSONArray;
    function HistoricoDeAtualizacoes(const AIdProtocolo : LongInt) : TJSONArray;
    function ObservacoesDoProtocolo(const AIdProtocolo : LongInt) : TJSONArray;


    function Tecnicos    : TJSONArray;
    function TiposDePrazo : TJSONArray;
    function TiposDeCliente  : TJSONArray;
    function TiposDeClassificacao : TJSONArray;
    function TiposDeStatus    : TJSONArray;
    function Setores          : TJSONArray;
    function Usuarios         : TJSONArray;  end;

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

   qryTiposPrazo.ParamByName('CONTROLPC').AsInteger     := 9;
   qryTiposStatus.ParamByName('CONTROLPC').AsInteger    := 9;

   qryTecnicos.Open;
   qryTiposPrazo.Open;
   qryTiposCliente.Open;
   qryTiposClassificacao.Open;
end;

function TSMControlPc.Designar(const AJustificativa: String; const AIdSetor, AIdUsuario, AIdUsuarioResponsavel: integer; const AIdProtocolo: LongInt): Boolean;
begin
   Result := False;

   try
      FIdUsuarioResponsavel := AIdUsuarioResponsavel;
      FDataHora             := Now;
      TTransacao.IniciarTransacao(ServerContainer.FDConnection);
      try
         qryControlPc.Close;
         qryControlPc.Sql.Clear;
         qryControlPc.Sql.Add('Select * from ControlPc');
         qryControlPc.Sql.Add('where id = :pIdProtocolo');
         qryControlPc.ParamByName('pIdProtocolo').AsInteger := AIdProtocolo;
         qryControlPc.Open;

         if qryControlPc.isEmpty then
            Exit;

         GravarHistorico(AIdProtocolo);

         qryControlPcLog.Close;
         qryControlPcLog.ParamByName('pIdControlPc').AsInteger := AIdProtocolo;
         qryControlPcLog.Open;

         qryControlPcLog.Append;
         qryControlPcLogid_ControlPc.AsInteger           := AIdProtocolo;
         qryControlPcLogid_Usuario_Responsavel.AsInteger := AIdUsuarioResponsavel;
         qryControlPcLogJustificativa.AsString           := AJustificativa;
         qryControlPcLogData_Hora_Log.AsDateTime         := FDataHora;

         if AIdSetor <> C_CODIGO_NAO_DESIGNADO then
            qryControlPcLogid_Setor_Designado.AsInteger  := AIdSetor;
         if AIdUsuario <> C_CODIGO_NAO_DESIGNADO then
            qryControlPcLogid_Usuario_Designado.AsInteger := AIdUsuario;
         qryControlPcLog.Post;


         qryControlPc.Edit;
         if AIdSetor <> C_CODIGO_NAO_DESIGNADO then
            qryControlPcid_Setor_Designado.AsInteger  := AIdSetor;
         if AIdUsuario <> C_CODIGO_NAO_DESIGNADO then
            qryControlPcid_Usuario_Designado.AsInteger := AIdUsuario;

         qryControlPcid_Responsavel_Designacao.AsInteger := AIdUsuarioResponsavel;
         qryControlPcData_Hora_Designacao.AsDateTime     := FDataHora;
         qryControlPcJustificativa_Designacao.AsString   := AJustificativa;
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


function TSMControlPc.EncerrarProtocolo(const AIdProtocolo: LongInt; const AJustificativa: String; const AIdUsuarioResponsavel: integer): Boolean;
begin
   Result := False;

   try
      TTransacao.IniciarTransacao(ServerContainer.FDConnection);
      try
         qryControlPc.Close;
         qryControlPc.Sql.Clear;
         qryControlPc.Sql.Add('Select * from ControlPc');
         qryControlPc.Sql.Add('where id = :pIdProtocolo');
         qryControlPc.ParamByName('pIdProtocolo').AsInteger := AIdProtocolo;
         qryControlPc.Open;

         if qryControlPc.isEmpty then
            Exit;

         qryControlPc.Edit;
         qryControlPcid_Usuario_Encerramento.AsInteger   := AIdUsuarioResponsavel;
         qryControlPcData_Hora_Encerramento.AsDateTime   := Now;
         qryControlPcJustificativa_Encerramento.AsString := AJustificativa;
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

procedure TSMControlPc.FecharTabelasDeCadastro;
begin
   qryTecnicos.Close;
   qryTiposPrazo.Close;
   qryTiposCliente.Close;
   qryTiposClassificacao.Close;
end;

function TSMControlPc.FiltrarProtocolos(const AFiltros: TJSONObject): TJSONArray;
var
   LFiltros : TFiltrosControlPc;
begin

   LFiltros.idTipoStatus         := AFiltros.GetValue<integer>('idTipoStatus');
   LFiltros.idTipoPrazo          := AFiltros.GetValue<integer>('idTipoPrazo');
   LFiltros.idTecnico            := AFiltros.GetValue<integer>('idTecnico');
   LFiltros.idTipoCliente        := AFiltros.GetValue<integer>('idTipoCliente');

   LFiltros.usaDataAbertura      := AFiltros.GetValue<Boolean>('usaDataAbertura');
   LFiltros.usaDataFechamento    := AFiltros.GetValue<Boolean>('usaDataFechamento');
   LFiltros.usaDataTransferencia := AFiltros.GetValue<Boolean>('usaDataTransferencia');
   LFiltros.usaPrevisaoSolucao   := AFiltros.GetValue<Boolean>('usaPrevisaoSolucao');

   LFiltros.idSetorDesignado     := AFiltros.GetValue<integer>('idSetorDesignado');
   LFiltros.idUsuarioDesignado   := AFiltros.GetValue<integer>('idUsuarioDesignado');
   LFiltros.nomeUsuario          := AFiltros.GetValue<String>('nomeUsuario');

   if LFiltros.usaDataAbertura then
     LFiltros.dataAbertura       := AFiltros.GetValue<TDateTime>('dataAbertura');

   if LFiltros.usaDataFechamento then
     LFiltros.dataFechamento     := AFiltros.GetValue<TDateTime>('dataFechamento');

   if LFiltros.usaDataTransferencia then
     LFiltros.dataTransferencia  := AFiltros.GetValue<TDateTime>('dataTransferencia');

   if LFiltros.usaPrevisaoSolucao then
     LFiltros.previsaoSolucao    := AFiltros.GetValue<TDateTime>('previsaoSolucao');

   MontarQueryPainel;

   qryPainelControlPc.Sql.Add(' and a.Data_Hora_Encerramento is null');
   if LFiltros.idTipoStatus > 0 then
      begin
      qryPainelControlPc.Sql.Add(' and a.id_Tipo_Status = :pIdTipoStatus');
      qryPainelControlPc.ParamByName('pIdTipoStatus').AsInteger := LFiltros.idTipoStatus;
   end;

   if LFiltros.idTipoPrazo > 0 then
      begin
      qryPainelControlPc.Sql.Add(' and a.id_Tipo_Prazo = :pIdTipoPrazo');
      qryPainelControlPc.ParamByName('pIdTipoPrazo').AsInteger := LFiltros.idTipoPrazo;
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
      qryPainelControlPc.Sql.Add(' and a.Data_Abertura = :pDataAbertura');
      qryPainelControlPc.ParamByName('pDataAbertura').AsDate := LFiltros.dataAbertura;
   end;

   if LFiltros.usaDataFechamento then
      begin
      qryPainelControlPc.Sql.Add(' and a.Data_Fechamento = :pDataFechamento');
      qryPainelControlPc.ParamByName('pDataFechamento').AsDate := LFiltros.dataFechamento;
   end;

   if LFiltros.usaDataTransferencia then
      begin
      qryPainelControlPc.Sql.Add(' and a.Data_Transferencia = :pDataTransferencia');
      qryPainelControlPc.ParamByName('pDataTransferencia').AsDate := LFiltros.dataTransferencia;
   end;

   if LFiltros.usaPrevisaoSolucao then
      begin
      qryPainelControlPc.Sql.Add(' and a.Previsao_Solucao = :pPrevisaoSolucao');
      qryPainelControlPc.ParamByName('pPrevisaoSolucao').AsDate := LFiltros.previsaoSolucao;
   end;

   if LFiltros.idSetorDesignado > 0 then
      begin
      qryPainelControlPc.Sql.Add(' and a.id_Setor_Designado = :pIdSetorDesignado');
      qryPainelControlPc.ParamByName('pIdSetorDesignado').AsInteger := LFiltros.idSetorDesignado;
   end;

   if LFiltros.idUsuarioDesignado > 0 then
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
      qryControlPcHistoricoid_Tipo_Status.AsInteger         := qryControlPcid_Tipo_Status.AsInteger;
      qryControlPcHistoricoid_Tipo_Prazo.AsInteger          := qryControlPcid_Tipo_Prazo.AsInteger;
      qryControlPcHistoricoid_Tecnico.AsInteger             := qryControlPcid_Tecnico.AsInteger;
      qryControlPcHistoricoid_Tipo_Cliente.AsInteger        := qryControlPcid_Tipo_Cliente.AsInteger;
      qryControlPcHistoricoid_Tipo_Classifiacao.AsInteger   := qryControlPcid_Tipo_Classificacao.AsInteger;
      qryControlPcHistoricoid_Usuario_Responsavel.AsInteger := qryControlPcid_Usuario_Importacao.AsInteger;
      qryControlPcHistoricoData_Hora_Historico.AsDateTime   := FDataHora;
      qryControlPcHistorico.Post;
   finally
      qryControlPcHistorico.Close;
   end;
end;

procedure TSMControlPc.GravarProtocolo;
var
   LNovo      : Boolean;
   LAtualizou : Boolean;
   LAtualizar : Boolean;
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
         LAtualizou := False;
         qryControlPc.Append;
         qryControlPcProtocolo.AsString := FNumeroProtocolo;
      end else
         begin
         if (qryControlPcid_Tipo_Status.AsInteger        <> FIdTipoStatus) or
            (qryControlPcid_Tipo_Prazo.AsInteger         <> FIdTipoPrazo) or
            (qryControlPcid_Tecnico.AsInteger            <> FIdTecnico) or
            (qryControlPcid_Tipo_Cliente.AsInteger       <> FIdTipoCliente) or
            (qryControlPcid_Tipo_Classificacao.AsInteger <> FIdTipoClassificacao)then
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

         qryControlPcid_Tipo_Status.AsInteger         := FIdTipoStatus;
         qryControlPcid_Tipo_Prazo.AsInteger          := FIdTipoPrazo;
         qryControlPcid_Tecnico.AsInteger             := FIdTecnico;
         qryControlPcid_Tipo_Cliente.AsInteger        := FIdTipoCliente;
         qryControlPcid_Tipo_Classificacao.AsInteger  := FIdTipoClassificacao;

         if FTemDataAbertura then
            qryControlPcData_Abertura.AsDateTime      := FDataAbertura;
         if FTemDataFechamento then
            qryControlPcData_Fechamento.AsDateTime    := FDataFechamento;
         if FTemDataTransferencia then
            qryControlPcData_Transferencia.AsDateTime := FDataTransferencia;
         if FTemPrevisaoSolucao then
            qryControlPcPrevisao_Solucao.AsDateTime   := FPrevisaoSolucao;

         qryControlPcSolicitacao_Cliente.AsString     := FSolicitacaoCliente;
         qryControlPcTipo_Reclame.AsString            := FTipoReclame;
         qryControlPcTipo_Nip.AsString                := FTipoNip;

         qryControlPcid_Usuario_Importacao.AsInteger    := FIdUsuarioResponsavel;
         qryControlPcData_Hora_Importacao.AsDateTime    := FDataHora;
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
   qryAux.Sql.Add('   b.Tipo_Status, ');
   qryAux.Sql.Add('   c.Tipo_Prazo_Caixa, ');
   qryAux.Sql.Add('   d.Nome_Tecnico, ');
   qryAux.Sql.Add('   e.Tipo_Cliente, ');
   qryAux.Sql.Add('   f.Tipo_Classificacao, ');
   qryAux.Sql.Add('   g.Nome_Usuario ');
   qryAux.Sql.Add('From ');
   qryAux.Sql.Add('   ControlPc_Historico a ');
   qryAux.Sql.Add('   INNER JOIN Tipos_Status b on b.id = a.id_Tipo_Status ');
   qryAux.Sql.Add('   INNER JOIN Tipos_Prazo c on c.id = a.id_Tipo_Prazo ');
   qryAux.Sql.Add('   INNER JOIN Tecnicos d on d.id = a.id_Tecnico ');
   qryAux.Sql.Add('   INNER JOIN Tipos_Cliente e  on e.id = a.id_Tipo_Cliente ');
   qryAux.Sql.Add('   INNER JOIN Tipos_Classificacao f  on f.id = a.id_Tipo_Classifiacao ');
   qryAux.Sql.Add('   INNER JOIN Usuarios g on g.id = a.id_Usuario_Responsavel ');
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
   qryAux.Sql.Add('   isnull(sd.Nome_Setor, ' + QuotedStr(C_PROCESSO_NAO_DESIGNADO) + ') as Nome_Setor, ');
   qryAux.Sql.Add('   isnull(ud.Nome_Usuario, ' + QuotedStr(C_PROCESSO_NAO_DESIGNADO) + ') as Usuario_Designado, ');
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
      AbrirTabelasDeCadastro;
      TTransacao.IniciarTransacao(ServerContainer.FDConnection);
      try
         for I := 0 to ARegistros.Count - 1 do
            begin
            LObject := ARegistros[i] as TJSONObject;

            FTemDataAbertura      := False;
            FTemDataTransferencia := False;
            FTemDataFechamento    := False;
            FTemPrevisaoSolucao   := False;

            FIdTecnico            := ObterIdTecnico(LObject.Values['TÉCNICO'].Value);
            FIdTipoPrazo          := ObterIdTipoPrazo(LObject.Values['PRAZO'].Value);
            FIdTipoCliente        := ObterIdTipoCliente(LObject.Values['TIPO CLIENTE'].Value);
            FIdTipoClassificacao  := ObterIdTipoClassificacao(LObject.Values['CLASSIFICAÇÃO'].Value);
            FIdTipoStatus         := ObterIdTipoStatus(LObject.Values['STATUS'].Value);

            LData                 := LObject.Values['DT. ABERTURA'].Value;
            if LData <> '' then
               begin
               FTemDataAbertura   := True;
               FDataAbertura      := StrToDate(LData);
            end;
            LData := LObject.Values['DT. TRANSFERÊNCIA'].Value;
            if LData <> '' then
               begin
               FTemDataFechamento := True;
               FDataFechamento    := StrToDate(LData);
            end;
            LData := LObject.Values['DT. FECHAMENTO'].Value;
            if LData <> '' then
               begin
               FTemDataTransferencia := True;
               FDataTransferencia    := StrToDate(LData);
            end;
            LData := LObject.Values['PREVISÃO SOLUÇÃO'].Value;
            if LData <> '' then
               begin
               FTemPrevisaoSolucao := True;
               FPrevisaoSolucao    := StrToDate(LData);
            end;

            FTipoReclame     := LObject.Values['TIPO RECLAME'].AsType<String>;
            FTipoNip         := LObject.Values['TIPO NIP/JUDICIAL'].AsType<String>;

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

procedure TSMControlPc.MontarQueryPainel;
begin
   with qryPainelControlPc do
      begin
      Close;
      Sql.Clear;
      Sql.Add('Select ');
      Sql.Add('   a.id as id_Protocolo, a.Data_Abertura, a.Data_Transferencia, a.Data_Fechamento, ');
      Sql.Add('   a.Previsao_Solucao, a.Solicitacao_Cliente, a.Tipo_Reclame, a.Tipo_Nip,');
      Sql.Add('   b.Tipo_Status,');
      Sql.Add('   c.Tipo_Prazo_Caixa,');
      Sql.Add('   d.Nome_Tecnico,');
      Sql.Add('   e.Tipo_Cliente,');
      Sql.Add('   f.Nome_Usuario as Usuario_Designado,');
      Sql.Add('   g.Nome_Setor as Setor_Designado,');
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
      Sql.Add('   INNER JOIN Tipos_Status b on b.id = a.id_Tipo_Status');
      Sql.Add('   INNER JOIN Tipos_Prazo c on c.id = a.id_Tipo_Prazo');
      Sql.Add('   INNER JOIN Tecnicos d on d.id = a.id_Tecnico');
      Sql.Add('   INNER JOIN Tipos_Cliente e on e.id = a.id_Tipo_Cliente');
      Sql.Add('   LEFT OUTER JOIN Usuarios f on f.id = a.id_Usuario_Designado');
      Sql.Add('   LEFT OUTER JOIN Setores g on g.id = a.id_Setor_Designado');
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

function TSMControlPc.ObterIdTipoClassificacao(const AValor: String): integer;
begin
   if not qryTiposClassificacao.Locate('Tipo_Classificacao',AValor) then
      begin
      qryTiposClassificacao.Append;
      qryTiposClassificacaoTipo_Classificacao.AsString := AValor;
      qryTiposClassificacao.Post;
   end;
   Result := qryTiposClassificacaoid.AsInteger
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

function TSMControlPc.ObterIdTipoPrazo(const AValor: String): integer;
begin
   if not qryTiposPrazo.Locate('Tipo_Prazo_Caixa',AValor) then
      begin
      qryTiposPrazo.Append;
      qryTiposPrazoTipo_Prazo_Caixa.AsString := AValor;
      qryTiposPrazoCONTROLPC.AsInteger       := 1;
      qryTiposPrazo.Post;
   end else if qryTiposPrazoCONTROLPC.AsInteger = 0 then
      begin
      qryTiposPrazo.Edit;
      qryTiposPrazoCONTROLPC.AsInteger := 1;
      qryTiposPrazo.Post;
   end;

   Result := qryTiposPrazoid.AsInteger
end;

function TSMControlPc.ObterIdTipoStatus(const AValor: String): integer;
begin
   if not qryTiposStatus.Locate('Tipo_Status',AValor) then
      begin
      qryTiposStatus.Append;
      qryTiposStatusTipo_Status.AsString := AValor;
      qryTiposStatusCONTROLPC.AsInteger  := 1;
      qryTiposStatus.Post;
   end else if qryTiposStatusCONTROLPC.AsInteger = 0 then
      begin
      qryTiposStatus.Edit;
      qryTiposStatusCONTROLPC.AsInteger := 1;
      qryTiposStatus.Post;
   end;
   Result := qryTiposStatusid.AsInteger
end;

function TSMControlPc.RegistrarObservacao(const AIdProtocolo: LongInt; const AObservacao: String; const AIdUsuarioResponsavel: integer; out ADataHora: TDateTime): Boolean;
begin
   Result := False;

   try
      TTransacao.IniciarTransacao(ServerContainer.FDConnection);

      ADataHora := Now;
      try
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

   finally
      qryControlPcLog.Close;
      qryControlPcHistorico.Close;
      qryControlPc.Close;
   end;
end;


function TSMControlPc.Setores: TJSONArray;
begin
  Result := TFuncoesJSON.MontarJSON(qrySetores);
end;

function TSMControlPc.Tecnicos: TJSONArray;
begin
  Result := TFuncoesJSON.MontarJSON(qryTecnicos);
end;

function TSMControlPc.TiposDeClassificacao: TJSONArray;
begin
  Result := TFuncoesJSON.MontarJSON(qryTiposClassificacao);
end;

function TSMControlPc.TiposDeCliente: TJSONArray;
begin
  Result := TFuncoesJSON.MontarJSON(qryTiposCliente);
end;

function TSMControlPc.TiposDePrazo: TJSONArray;
begin
   qryTiposPrazo.Close;
   qryTiposPrazo.ParamByName('CONTROLPC').AsInteger := 1;

   Result := TFuncoesJSON.MontarJSON(qryTiposPrazo);
end;

function TSMControlPc.TiposDeStatus: TJSONArray;
begin
   qryTiposStatus.Close;
   qryTiposStatus.ParamByName('CONTROLPC').AsInteger := 1;
   Result := TFuncoesJSON.MontarJSON(qryTiposStatus);

end;

function TSMControlPc.Usuarios: TJSONArray;
begin
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add('Select id, Nome_Usuario From');

   qryAux.Sql.Add('   (Select ');
   qryAux.Sql.Add('       id, Nome_Usuario, ');

   qryAux.Sql.Add('       isnull((Select 1 ');
   qryAux.Sql.Add('               From Usuarios_Setores us ');
   qryAux.Sql.Add('                    Inner Join Setores st on st.id = us.id_Setor ');
   qryAux.Sql.Add('               where st.ControlPc = ' + QuotedStr('Sim') + '),0) as ControlPc ');
   qryAux.Sql.Add('    from ');
   qryAux.Sql.Add('       Usuarios u ');
   qryAux.Sql.Add('    where ');
   qryAux.Sql.Add('       u.ativo = ' + QuotedStr(C_SIM));
   qryAux.Sql.Add('   ) as usu');
   qryAux.Sql.Add('where ');
   qryAux.Sql.Add('   usu.ControlPc = 1');

   Result := TFuncoesJSON.MontarJSON(qryAux);
end;

end.

