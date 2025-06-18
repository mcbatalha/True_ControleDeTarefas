unit Libs.TFiltros;

interface
uses
   System.SysUtils,
   System.JSON;

type
    TFiltrosAutoSc = record
       numeroDoProcesso     : string;
       idTipoAuditoria      : integer;
       idTipoPrazoCaixa     : integer;
       idTipoPrazoCaixaHoje : integer;
       idTipoStatus         : integer;
       idTipoProcesso       : integer;
       idTipoProcessoE      : integer;
       idTipoPrazoANS       : integer;
       idSetorDesignado     : integer;
       idUsuarioDesignado   : integer;
       UF                   : String;
       nomeUsuario          : String;
       usaDataStatus        : Boolean;
       dataInicio           : TDateTime;
       dataFim              : TDateTime;
end;

type
    TFiltrosSiags = record
       numeroDaAutorizacao       : string;
       idTipoAuditoria           : integer;
       idTipoPrazoCaixa          : integer;
       idTipoPrazoANS            : integer;

       idTipoAutorizacao         : integer;
       idTipoAtendimento         : integer;
       idTipoSituacaoAutorizacao : integer;
       idTipoUltimaAnotacao      : integer;
       idBeneficiarios           : integer;

       idSetorDesignado          : integer;
       idUsuarioDesignado        : integer;
       UF                        : String;
       nomeUsuario               : String;
end;

type
    TFiltrosControlPc = record
       numeroDoProtocolo    : string;
       idTipoStatus         : integer;
       idTipoPrazo          : integer;
       idTecnico            : integer;
       idTipoCliente        : integer;
       usaDataAbertura      : Boolean;
       dataAbertura         : TDateTime;
       usaDataFechamento    : Boolean;
       dataFechamento       : TDateTime;
       usaDataTransferencia : Boolean;
       dataTransferencia    : TDateTime;
       usaPrevisaoSolucao   : Boolean;
       previsaoSolucao      : TDateTime;

       tipoReclame          : String;
       tipoNip              : String;

       idSetorDesignado     : integer;
       idUsuarioDesignado   : integer;
       nomeUsuario          : String;
end;


type
   TFiltros = class


    private
      FFiltrosAutoSC    : TFiltrosAutoSC;
      FFiltrosSiags     : TFiltrosSiags;
      FFiltrosControlPc : TFiltrosControlPc;

      property FiltrosAutoSC    : TFiltrosAutoSC read FFiltrosAutoSC write FFiltrosAutoSC;
      property FiltrosSiags     : TFiltrosSiags read FFiltrosSiags write FFiltrosSiags;
      property FiltrosControlPc : TFiltrosControlPc read FFiltrosControlPc write FFiltrosControlPc;

      procedure LimparFiltrosAutoSc;
      procedure LimparFiltrosSiags;
      procedure LimparFiltrosControlPc;
    public

      constructor create(const ATipo : integer);

      procedure setFiltrosAutoSC(const AFiltro : TFiltrosAutoSc);
      function getFiltrosAutoSCAsRecord : TFiltrosAutoSc;
      function getFiltrosAutoSCAsJSON : TJSONObject;

      procedure setFiltrosSiags(const AFiltro : TFiltrosSiags);
      function getFiltrosSiagsAsRecord : TFiltrosSiags;
      function getFiltrosSiagsAsJSON : TJSONObject;

      procedure setFiltrosControlPc(const AFiltro : TFiltrosControlPc);
      function getFiltrosControlPcAsRecord : TFiltrosControlPc;
      function getFiltrosControlPcAsJSON : TJSONObject;

      destructor destroy; override;


   end;

implementation

{ TFitros }

uses Libs.Constantes, Libs.TSeguranca;

constructor TFiltros.create(const ATipo : Integer);
begin
   case ATipo of
      C_CODIGO_AUTOSC    : LimparFiltrosAutoSc;
      C_CODIGO_SIAGS     : LimparFiltrosSiags;
      C_CODIGO_CONTROLPC : LimparFiltrosControlPc;
   end;
end;

destructor TFiltros.destroy;
begin
  inherited;
end;



function TFiltros.getFiltrosAutoSCAsJSON: TJSONObject;
begin
   Result := TJSONObject.Create;

   Result.AddPair('numeroDoProcesso',     TJSONString.Create(FFiltrosAutoSc.numeroDoProcesso));
   Result.AddPair('idTipoAuditoria',      TJSONNumber.Create(FFiltrosAutoSc.idTipoAuditoria));
   Result.AddPair('idTipoPrazoCaixa',     TJSONNumber.Create(FFiltrosAutoSc.idTipoPrazoCaixa));
   Result.AddPair('idTipoPrazoCaixaHoje', TJSONNumber.Create(FFiltrosAutoSc.idTipoPrazoCaixaHoje));
   Result.AddPair('idTipoStatus',         TJSONNumber.Create(FFiltrosAutoSc.idTipoStatus));
   Result.AddPair('idTipoProcesso',       TJSONNumber.Create(FFiltrosAutoSc.idTipoProcesso));
   Result.AddPair('idTipoProcessoE',      TJSONNumber.Create(FFiltrosAutoSc.idTipoProcessoE));
   Result.AddPair('idTipoPrazoANS',       TJSONNumber.Create(FFiltrosAutoSc.idTipoPrazoANS));
   Result.AddPair('idSetorDesignado',     TJSONNumber.Create(FFiltrosAutoSc.idSetorDesignado));
   Result.AddPair('idUsuarioDesignado',   TJSONNumber.Create(FFiltrosAutoSc.idUsuarioDesignado));
   Result.AddPair('UF',                   TJSONString.Create(FFiltrosAutoSc.UF));
   Result.AddPair('nomeUsuario',          TJSONString.Create(FFiltrosAutoSc.nomeUsuario));
   Result.AddPair('usaDataStatus',        TJSONBool.Create(FFiltrosAutoSc.usaDataStatus));
   if FFiltrosAutoSc.usaDataStatus then
      begin
      Result.AddPair('dataInicio',        TJSONString.Create(DateToStr(FFiltrosAutoSc.dataInicio)));
      Result.AddPair('dataFim',           TJSONString.Create(DateToStr(FFiltrosAutoSc.dataFim)));
   end;
end;

function TFiltros.getFiltrosAutoSCAsRecord: TFiltrosAutoSc;
begin
   Result := FFiltrosAutoSC;
end;

function TFiltros.getFiltrosControlPcAsJSON: TJSONObject;
begin
   Result := TJSONObject.Create;
   Result.AddPair('numeroDoProtocolo',    TJSONString.Create(FFiltrosControlPc.numeroDoProtocolo));
   Result.AddPair('idTipoStatus',         TJSONNumber.Create(FFiltrosControlPc.idTipoStatus));
   Result.AddPair('idTipoPrazo',          TJSONNumber.Create(FFiltrosControlPc.idTipoPrazo));
   Result.AddPair('idTecnico',            TJSONNumber.Create(FFiltrosControlPc.idTecnico));
   Result.AddPair('idTipoCliente',        TJSONNumber.Create(FFiltrosControlPc.idTipoCliente));
   Result.AddPair('tipoReclame',          TJSONString.Create(FFiltrosControlPc.tipoReclame));
   Result.AddPair('tipoNip',              TJSONString.Create(FFiltrosControlPc.tipoNip));

   Result.AddPair('usaDataAbertura',      TJSONBool.Create(FFiltrosControlPc.usaDataAbertura));
   Result.AddPair('usaDataFechamento',    TJSONBool.Create(FFiltrosControlPc.usaDataFechamento));
   Result.AddPair('usaDataTransferencia', TJSONBool.Create(FFiltrosControlPc.usaDataTransferencia));
   Result.AddPair('usaPrevisaoSolucao',   TJSONBool.Create(FFiltrosControlPc.usaPrevisaoSolucao));

   if FFiltrosControlPc.usaDataAbertura then
      Result.AddPair('dataAbertura',         TJSONString.Create(DateToStr(FFiltrosControlPc.dataAbertura)));
   if FFiltrosControlPc.usaDataFechamento then
      Result.AddPair('dataFechamento',       TJSONString.Create(DateToStr(FFiltrosControlPc.dataFechamento)));
   if FFiltrosControlPc.usaDataTransferencia then
      Result.AddPair('dataTransferencia',    TJSONString.Create(DateToStr(FFiltrosControlPc.dataTransferencia)));
   if FFiltrosControlPc.usaPrevisaoSolucao then
      Result.AddPair('PrevisaoSolucao',      TJSONString.Create(DateToStr(FFiltrosControlPc.previsaoSolucao)));


   Result.AddPair('idSetorDesignado',     TJSONNumber.Create(FFiltrosAutoSc.idSetorDesignado));
   Result.AddPair('idUsuarioDesignado',   TJSONNumber.Create(FFiltrosAutoSc.idUsuarioDesignado));
   Result.AddPair('nomeUsuario',          TJSONString.Create(FFiltrosAutoSc.nomeUsuario));

end;

function TFiltros.getFiltrosControlPcAsRecord: TFiltrosControlPc;
begin
   Result := FFiltrosControlPc;
end;

function TFiltros.getFiltrosSiagsAsJSON: TJSONObject;
begin
   Result := TJSONObject.Create;

   Result.AddPair('numeroDaAutorizacao',       TJSONString.Create(FFiltrosSiags.numeroDaAutorizacao));
   Result.AddPair('idTipoAuditoria',           TJSONNumber.Create(FFiltrosSiags.idTipoAuditoria));
   Result.AddPair('idTipoPrazoCaixa',          TJSONNumber.Create(FFiltrosSiags.idTipoPrazoCaixa));
   Result.AddPair('idTipoPrazoANS',            TJSONNumber.Create(FFiltrosSiags.idTipoPrazoANS));

   Result.AddPair('idTipoAutorizacao',         TJSONNumber.Create(FFiltrosSiags.idTipoAutorizacao));
   Result.AddPair('idTipoAtendimento',         TJSONNumber.Create(FFiltrosSiags.idTipoAtendimento));
   Result.AddPair('idTipoSituacaoAutorizacao', TJSONNumber.Create(FFiltrosSiags.idTipoSituacaoAutorizacao));
   Result.AddPair('idTipoUltimaAnotacao',      TJSONNumber.Create(FFiltrosSiags.idTipoUltimaAnotacao));
   Result.AddPair('idBeneficiarios',           TJSONNumber.Create(FFiltrosSiags.idBeneficiarios));

   Result.AddPair('idSetorDesignado',          TJSONNumber.Create(FFiltrosSiags.idSetorDesignado));
   Result.AddPair('idUsuarioDesignado',        TJSONNumber.Create(FFiltrosSiags.idUsuarioDesignado));
   Result.AddPair('UF',                        TJSONString.Create(FFiltrosSiags.UF));
   Result.AddPair('nomeUsuario',               TJSONString.Create(FFiltrosSiags.nomeUsuario));
end;

function TFiltros.getFiltrosSiagsAsRecord: TFiltrosSiags;
begin
   Result := FFiltrosSiags;
end;

procedure TFiltros.LimparFiltrosAutoSc;
begin
   FFiltrosAutoSc.numeroDoProcesso     := '';
   FFiltrosAutoSc.idTipoAuditoria      := 0;
   FFiltrosAutoSc.idTipoPrazoCaixa     := 0;
   FFiltrosAutoSc.idTipoPrazoCaixaHoje := 0;
   FFiltrosAutoSc.idTipoStatus         := 0;
   FFiltrosAutoSc.idTipoProcesso       := 0;
   FFiltrosAutoSc.idTipoProcessoE      := 0;
   FFiltrosAutoSc.idTipoPrazoANS       := 0;
   FFiltrosAutoSc.idSetorDesignado     := 0;
   FFiltrosAutoSc.UF                   := C_TODOS;

   FFiltrosAutoSc.idUsuarioDesignado   := Seguranca.Id;
   FFiltrosAutoSc.nomeUsuario          := Seguranca.Nome;
   FFiltrosAutoSc.usaDataStatus        := False;
end;

procedure TFiltros.LimparFiltrosControlPc;
begin
   FFiltrosControlPc.numeroDoProtocolo    := '';
   FFiltrosControlPc.idTipoStatus         := 0;
   FFiltrosControlPc.idTipoPrazo          := 0;
   FFiltrosControlPc.idTecnico            := 0;
   FFiltrosControlPc.idTipoCliente        := 0;
   FFiltrosControlPc.tipoReclame          := C_TODOS;
   FFiltrosControlPc.tipoNip              := C_TODOS;

   FFiltrosControlPc.usaDataAbertura      := False;
   FFiltrosControlPc.dataAbertura         := Date;
   FFiltrosControlPc.usaDataFechamento    := False;
   FFiltrosControlPc.dataFechamento       := Date;
   FFiltrosControlPc.usaDataTransferencia := False;
   FFiltrosControlPc.dataTransferencia    := Date;
   FFiltrosControlPc.usaPrevisaoSolucao   := False;
   FFiltrosControlPc.previsaoSolucao      := Date;

   FFiltrosControlPc.idSetorDesignado     := 0;
   FFiltrosControlPc.idUsuarioDesignado   := 0;
   FFiltrosControlPc.nomeUsuario          := '';
end;

procedure TFiltros.LimparFiltrosSiags;
begin
   FFiltrosSiags.numeroDaAutorizacao       := '';
   FFiltrosSiags.idTipoAuditoria           := 0;
   FFiltrosSiags.idTipoPrazoCaixa          := 0;
   FFiltrosSiags.idTipoPrazoANS            := 0;
   FFiltrosSiags.idTipoAutorizacao         := 0;
   FFiltrosSiags.idTipoAtendimento         := 0;
   FFiltrosSiags.idTipoSituacaoAutorizacao := 0;
   FFiltrosSiags.idTipoUltimaAnotacao      := 0;
   FFiltrosSiags.idBeneficiarios           := 0;
   FFiltrosSiags.UF                        := C_TODOS;

   FFiltrosSiags.idSetorDesignado          := 0;
   FFiltrosSiags.idUsuarioDesignado   := Seguranca.Id;
   FFiltrosSiags.nomeUsuario          := Seguranca.Nome;
end;

procedure TFiltros.setFiltrosAutoSC(const AFiltro: TFiltrosAutoSc);
begin
   FFiltrosAutoSC := AFiltro;
end;

procedure TFiltros.setFiltrosControlPc(const AFiltro: TFiltrosControlPc);
begin
   FFiltrosControlPc := AFiltro;
end;

procedure TFiltros.setFiltrosSiags(const AFiltro: TFiltrosSiags);
begin
   FFiltrosSiags := AFiltro;
end;

end.
