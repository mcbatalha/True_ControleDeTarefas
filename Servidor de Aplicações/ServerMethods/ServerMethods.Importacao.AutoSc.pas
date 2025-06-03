unit ServerMethods.Importacao.AutoSc;

interface

uses
  System.SysUtils,
  System.Classes,
  System.JSON,

  Datasnap.DSServer,
  Datasnap.DSAuth,
  Datasnap.DSProviderDataModuleAdapter,

  Libs.Constantes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uTTransacao;

type
  TSMImportacaoAutoSC = class(TDSServerModule)
    qryAux: TFDQuery;
    qryTiposAuditoria: TFDQuery;
    qryTiposAuditoriaid: TFDAutoIncField;
    qryTiposAuditoriaTipo_Auditoria: TStringField;
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
    qryAutoScid_Usuario_Desiginado: TIntegerField;
    qryAutoScHistorico: TFDQuery;
    qryAutoScHistoricoid: TLargeintField;
    qryAutoScHistoricoid_AutoSC: TLargeintField;
    qryAutoScHistoricoid_Tipo_Prazo_Caixa: TIntegerField;
    qryAutoScHistoricoid_Tipo_Prazo_Caixa_Hoje: TIntegerField;
    qryAutoScHistoricoid_Tipo_Status: TIntegerField;
    qryAutoScHistoricoData_Status: TDateTimeField;
    qryAutoScHistoricoid_Usuario_Responsavel: TIntegerField;
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
    FDataHoraImportacao  : TDateTime;


    procedure AbrirTabelasDeCadastro;
    procedure FecharTabelasDeCadastro;

    function ObterIdTipoAuditoria(const AValor : String) : integer;
    function ObterIdTipoPrazoHJ(const AValor : String) : integer;
    function ObterIdProcesso(const AValor : String) : integer;
    function ObterIdTipoStatus(const AValor : String) : integer;
    function ObterIdTipoProcesso(const AValor : String) : integer;
    function ObterIdTipoProcessoE(const AValor : String) : integer;
    function ObterIdTipoPrazo(const AValor : String) : integer;

    procedure GravarProcesso;
    procedure GravarHistorico(const AId : Largeint);

  public
    function Importar(const ARegistros : TJSONArray; const AIdUsuario : integer) : TJSONObject;
    { Public declarations }
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses ServerMethods.Container;

{$R *.dfm}

{ TSMImportacoesAutoSC }


function TSMImportacaoAutoSC.ObterIdTipoAuditoria(const AValor: String): integer;
begin
   if not qryTiposAuditoria.Locate('Tipo_Auditoria',AValor) then
      begin
      qryTiposAuditoria.Append;
      qryTiposAuditoriaTipo_Auditoria.AsString := AValor;
      qryTiposAuditoria.Post;
   end;
   Result := qryTiposAuditoriaid.AsInteger
end;

function TSMImportacaoAutoSC.ObterIdTipoPrazo(const AValor: String): integer;
begin
   if not qryTiposPrazo.Locate('Tipo_Prazo_Caixa',AValor) then
      begin
      qryTiposPrazo.Append;
      qryTiposPrazoTipo_Prazo_Caixa.AsString := AValor;
      qryTiposPrazo.Post;
   end;
   Result := qryTiposPrazoid.AsInteger
end;


function TSMImportacaoAutoSC.ObterIdTipoPrazoHJ(const AValor: String): integer;
begin
   if not qryTiposPrazoHoje.Locate('Tipo_Prazo_Caixa_Hoje',AValor) then
      begin
      qryTiposPrazoHoje.Append;
      qryTiposPrazoHojeTipo_Prazo_Caixa_Hoje.AsString := AValor;
      qryTiposPrazoHoje.Post;
   end;
   Result := qryTiposPrazoHojeid.AsInteger
end;

function TSMImportacaoAutoSC.ObterIdProcesso(const AValor: String): integer;
begin
end;

function TSMImportacaoAutoSC.ObterIdTipoStatus(const AValor: String): integer;
begin
   if not qryTiposStatus.Locate('Tipo_Status',AValor) then
      begin
      qryTiposStatus.Append;
      qryTiposStatusTipo_Status.AsString := AValor;
      qryTiposStatus.Post;
   end;
   Result := qryTiposStatusid.AsInteger
end;

function TSMImportacaoAutoSC.ObterIdTipoProcesso(const AValor: String): integer;
begin
   if not qryTiposProcesso.Locate('Tipo_Processo',AValor) then
      begin
      qryTiposProcesso.Append;
      qryTiposProcessoTipo_Processo.AsString := AValor;
      qryTiposProcesso.Post;
   end;
   Result := qryTiposProcessoid.AsInteger
end;

function TSMImportacaoAutoSC.ObterIdTipoProcessoE(const AValor: String): integer;
begin
   if not qryTiposProcessoE.Locate('Tipo_Processo_E',AValor) then
      begin
      qryTiposProcessoE.Append;
      qryTiposProcessoETipo_Processo_E.AsString := AValor;
      qryTiposProcessoE.Post;
   end;
   Result := qryTiposProcessoEid.AsInteger
end;

procedure TSMImportacaoAutoSC.AbrirTabelasDeCadastro;
begin
   qryTiposAuditoria.Open;
   qryTiposPrazo.Open;
   qryTiposPrazoHoje.Open;
   qryTiposProcesso.Open;
   qryTiposProcessoE.Open;
   qryTiposStatus.Open;
   qryTiposAuditoria.Open;
end;

procedure TSMImportacaoAutoSC.FecharTabelasDeCadastro;
begin
   qryTiposAuditoria.Close;
   qryTiposPrazo.Close;
   qryTiposPrazoHoje.Close;
   qryTiposProcesso.Close;
   qryTiposProcessoE.Close;
   qryTiposStatus.Close;
   qryTiposAuditoria.Close;
end;

procedure TSMImportacaoAutoSC.GravarHistorico(const AId: Largeint);
begin
   qryAutoScHistorico.Close;
   try
      qryAutoScHistorico.ParamByName('pIdAutoSC').AsInteger := AId;
      qryAutoScHistorico.Open;
      qryAutoScHistorico.Append;
      qryAutoScHistoricoid_AutoSC.AsInteger                := AId;
      qryAutoScHistoricoid_Tipo_Prazo_Caixa.AsInteger      := qryAutoScid_Tipo_Prazo_Caixa.AsInteger;
      qryAutoScHistoricoid_Tipo_Prazo_Caixa_Hoje.AsInteger := qryAutoScid_Tipo_Prazo_Caixa_Hoje.AsInteger;
      qryAutoScHistoricoid_Tipo_Status.AsInteger           := qryAutoScid_Tipo_Status.AsInteger;
      qryAutoScHistoricoid_Usuario_Responsavel.AsInteger   := qryAutoScid_Usuario_Importacao.AsInteger;
      qryAutoScHistoricoData_Status.AsDateTime             := qryAutoScData_Status.AsDateTime;
      qryAutoScHistorico.Post;
   finally
      qryAutoScHistorico.Close;

   end;
end;

procedure TSMImportacaoAutoSC.GravarProcesso;
var
   LNovo      : Boolean;
   LAtualizou : Boolean;
   LAtualizar : Boolean;
begin
   qryAutoSc.Close;
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
         qryAutoScid_Tipo_Processo_E.AsInteger       := FIdTipoProcessoE;
         qryAutoScid_Tipo_Prazo_ANS.AsInteger        := FIdTipoPrazoANS;

         qryAutoScQtd_Arquivos.AsInteger             := FQtdArquivos;
         qryAutoScData_Status.AsDateTime             := FDataStatus;
         qryAutoScUF.AsString                        := FUF;
         qryAutoScid_Usuario_Importacao.AsInteger    := FIdUsuarioResponsavel;
         qryAutoScData_Hora_Importacao.AsDateTime    := FDataHoraImportacao;
         qryAutoSc.Post;
      end else
         FTotalNaoAtualizados := FTotalNaoAtualizados + 1;
   finally
      qryAutoSc.Close;
   end;
end;

function TSMImportacaoAutoSC.Importar(const ARegistros: TJSONArray; const AIdUsuario : integer): TJSONObject;
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
   FDataHoraImportacao  := Now;

   try
      AbrirTabelasDeCadastro;
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
      except
         begin
         Result.AddPair('importou',TJSONBool.Create(False));
         TTransacao.CancelarTransacao(ServerContainer.FDConnection);
         end;
      end;

      if TTransacao.ComitarTransacao(ServerContainer.FDConnection) then
         begin
         Result.AddPair('importou',TJSONBool.Create(True));
         Result.AddPair('totalRegistros',TJSONNumber.Create(FTotalRegistros));
         Result.AddPair('totalNovos',TJSONNumber.Create(FTotalNovos));
         Result.AddPair('totalAtualizados',TJSONNumber.Create(FTotalAtualizados));
         Result.AddPair('totalNaoAtualizados',TJSONNumber.Create(FTotalNaoAtualizados));
      end else
         Result.AddPair('importou',TJSONBool.Create(False));
   finally
      FecharTabelasDeCadastro;
   end;
end;

end.

