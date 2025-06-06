unit Libs.TFiltros;

interface
uses
   System.SysUtils,
   System.JSON;

type
    TFiltrosAutoSc = record
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
   TFiltros = class


    private
      FFiltrosAutoSC: TFiltrosAutoSC;
      property FiltrosAutoSC: TFiltrosAutoSC read FFiltrosAutoSC write FFiltrosAutoSC;

      procedure LimparFiltrosAutoSc;
    public

      constructor create(const ATipo : integer);

      procedure setFiltrosAutoSC(const AFiltro : TFiltrosAutoSc);
      function getFiltrosAutoSCAsRecord : TFiltrosAutoSc;
      function getFiltrosAutoSCAsJSON : TJSONObject;


      destructor destroy; override;


   end;



implementation



{ TFitros }

uses Libs.Constantes;

constructor TFiltros.create(const ATipo : Integer);
begin
   case ATipo of
      C_TIPO_AUTOSC : LimparFiltrosAutoSc;
   end;
end;

destructor TFiltros.destroy;
begin
  inherited;
end;



function TFiltros.getFiltrosAutoSCAsJSON: TJSONObject;
begin
   Result := TJSONObject.Create;

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
      Result.AddPair('dataInicio',           TJSONString.Create(DateToStr(FFiltrosAutoSc.dataInicio)));
      Result.AddPair('dataFim',              TJSONString.Create(DateToStr(FFiltrosAutoSc.dataFim)));
   end;


end;

function TFiltros.getFiltrosAutoSCAsRecord: TFiltrosAutoSc;
begin
   Result := FFiltrosAutoSC;
end;

procedure TFiltros.LimparFiltrosAutoSc;
begin
   FFiltrosAutoSc.idTipoAuditoria      := 0;
   FFiltrosAutoSc.idTipoPrazoCaixa     := 0;
   FFiltrosAutoSc.idTipoPrazoCaixaHoje := 0;
   FFiltrosAutoSc.idTipoStatus         := 0;
   FFiltrosAutoSc.idTipoProcesso       := 0;
   FFiltrosAutoSc.idTipoProcessoE      := 0;
   FFiltrosAutoSc.idTipoPrazoANS       := 0;
   FFiltrosAutoSc.idSetorDesignado     := 0;
   FFiltrosAutoSc.idUsuarioDesignado   := 0;
   FFiltrosAutoSc.UF                   := C_TODOS;
   FFiltrosAutoSc.nomeUsuario          := C_TODOS;
   FFiltrosAutoSc.usaDataStatus        := False;
end;

procedure TFiltros.setFiltrosAutoSC(const AFiltro: TFiltrosAutoSc);
begin
   FFiltrosAutoSC := AFiltro;
end;

end.
