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
        UsaDataStatus        : Boolean;
        DataInicio           : TDateTime;
        DataFim              : TDateTime;
    end;


type
   TFitros = class

    private
      FFiltrosAutoSc : TFiltrosAutoSc;

      procedure IniciarFiltrosAutoSc;
    public

      constructor create(AFiltros : TFiltrosAutoSc);
      destructor destroy();


   end;



implementation



{ TFitros }

constructor TFitros.create(AFiltros : TFiltrosAutoSc);
begin
   FFiltrosAutoSc := AFiltros;

end;

destructor TFitros.destroy;
begin
  inherited;
end;

procedure TFitros.IniciarFiltrosAutoSc;
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
   FFiltrosAutoSc.UsaDataStatus        := False;
   FFiltrosAutoSc.DataInicio           := Date;
   FFiltrosAutoSc.DataFim              := Date;
end;

end.
