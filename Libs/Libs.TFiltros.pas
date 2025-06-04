unit Libs.TFiltros;

interface
uses
   System.SysUtils;

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
     usaDataStatus        : Boolean;
     dataInicio           : TDateTime;
     dataFim              : TDateTime;
     nomeUsuario          : String;
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
      function getFiltrosAutoSC : TFiltrosAutoSc;


      destructor destroy; override;


   end;



implementation



{ TFitros }

uses Libs.Constantes;

constructor TFiltros.create(const ATipo : Integer);
begin
   case ATipo of
      C_FILTRO_AUTOSC : LimparFiltrosAutoSc;
   end;
end;

destructor TFiltros.destroy;
begin
  inherited;
end;


function TFiltros.getFiltrosAutoSC: TFiltrosAutoSc;
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
   FFiltrosAutoSc.UF                   := '';
   FFiltrosAutoSc.usaDataStatus        := False;
   FFiltrosAutoSc.dataInicio           := Date;
   FFiltrosAutoSc.dataFim              := Date;
   FFiltrosAutoSc.nomeUsuario          := C_TODOS;
end;

procedure TFiltros.setFiltrosAutoSC(const AFiltro: TFiltrosAutoSc);
begin
   FFiltrosAutoSC := AFiltro;
end;

end.
