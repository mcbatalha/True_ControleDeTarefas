unit Services.Designacoes.Pendentes.ControlPC;

interface

uses
  Vcl.Forms,
  Vcl.Samples.Gauges,
  Vcl.StdCtrls,

  System.SysUtils,
  System.Classes,
  System.JSON,

  Data.DB,

  Proxy.Classes,
  Funcoes,

  Providers.Seguranca,
  Providers.Designacoes.Pendentes.ControlPC,

  Forms.Mensagem,
  Libs.Constantes,
  Libs.TSeguranca,
  Libs.TFuncoesJSON;

type

  TSrvDesignacoesPendentesControlPC = class
  private
     FDM           : TdtmDesignacoesPendentesControlPC;
     FPxyControlPc : TSMControlPcClient;
  public
     constructor Create();

     function TemDesignacoesPendentes : Boolean;
     procedure DesignacoesPendentes;
     function NumeroProtocolo : String;
     function DataSourcePainel : TDataSource;

     function ResponderSolicitacao(const AAutorizar : Boolean) : Boolean;

     destructor Destroy(); override;

  end;



implementation

{ TSrvPanels }

constructor TSrvDesignacoesPendentesControlPC.Create;
begin
   Application.CreateForm(TdtmDesignacoesPendentesControlPc, FDM);
   FDM.SQLConnection.Connected := True;

   FPxyControlPc := TSMControlPcClient.Create(FDM.SQLConnection.DBXConnection);
   FDM.cdsPainel.Open;
end;

function TSrvDesignacoesPendentesControlPC.DataSourcePainel: TDataSource;
begin
   Result := FDM.dtsPainel;
end;

procedure TSrvDesignacoesPendentesControlPC.DesignacoesPendentes;
begin
   FDM.cdsPainel.Close;
   TFuncoesJSON.PopularTabela(FDM.cdsPainel, FPxyControlPc.DesignacoesPendentes);
end;

destructor TSrvDesignacoesPendentesControlPC.Destroy;
begin
   FreeAndNil(FPxyControlPc);
   FreeAndNil(FDM);

   inherited;
end;

function TSrvDesignacoesPendentesControlPC.NumeroProtocolo: String;
begin
   Result := FDM.cdsPainelProtocolo.AsString;
end;

function TSrvDesignacoesPendentesControlPC.ResponderSolicitacao(const AAutorizar: Boolean): Boolean;
begin
   Result := FPxyControlPc.AutorizarDesiganacao(FDM.cdsPainelid_Protocolo.AsInteger,
                                                FDM.cdsPainelid_Solicitacao.AsInteger,
                                                AAutorizar,
                                                Seguranca.id);

   if Result then
      FDM.cdsPainel.Delete;
end;

function TSrvDesignacoesPendentesControlPC.TemDesignacoesPendentes: Boolean;
begin
   Result := not FDM.cdsPainel.IsEmpty;
end;

end.
