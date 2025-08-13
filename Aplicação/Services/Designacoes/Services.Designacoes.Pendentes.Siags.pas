unit Services.Designacoes.Pendentes.Siags;

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
  Providers.Designacoes.Pendentes.Siags,

  Forms.Mensagem,
  Libs.Constantes,
  Libs.TSeguranca,
  Libs.TFuncoesJSON;

type

  TSrvDesignacoesPendentesSiags = class
  private
     FDM       : TdtmDesignacoesPendentesSiags;
     FPxySiags : TSMSiagsClient;
  public
     constructor Create();

     function TemDesignacoesPendentes : Boolean;
     procedure DesignacoesPendentes;
     function NumeroAutorizacao : String;
     function DataSourcePainel : TDataSource;

     function ResponderSolicitacao(const AAutorizar : Boolean) : Boolean;

     destructor Destroy(); override;

  end;



implementation

{ TSrvPanels }

constructor TSrvDesignacoesPendentesSiags.Create;
begin
   Application.CreateForm(TdtmDesignacoesPendentesSiags, FDM);
   FDM.SQLConnection.Connected := True;

   FPxySiags := TSMSiagsClient.Create(FDM.SQLConnection.DBXConnection);

   FDM.cdsPainel.Open;
end;

function TSrvDesignacoesPendentesSiags.DataSourcePainel: TDataSource;
begin
   Result := FDM.dtsPainel;
end;

procedure TSrvDesignacoesPendentesSiags.DesignacoesPendentes;
begin
   FDM.cdsPainel.Close;
   TFuncoesJSON.PopularTabela(FDM.cdsPainel, FPxySiags.DesignacoesPendentes);
end;

destructor TSrvDesignacoesPendentesSiags.Destroy;
begin
   FreeAndNil(FPxySiags);
   FreeAndNil(FDM);

   inherited;
end;

function TSrvDesignacoesPendentesSiags.NumeroAutorizacao: String;
begin
   Result := FDM.cdsPainelNumero_Autorizacao.AsString;
end;

function TSrvDesignacoesPendentesSiags.ResponderSolicitacao(const AAutorizar: Boolean): Boolean;
begin
   Result := FPxySiags.AutorizarDesiganacao(FDM.cdsPainelid_Autorizacao.AsInteger,
                                            FDM.cdsPainelid_Solicitacao.AsInteger,
                                            AAutorizar,
                                            Seguranca.id);

   if Result then
      FDM.cdsPainel.Delete;
end;

function TSrvDesignacoesPendentesSiags.TemDesignacoesPendentes: Boolean;
begin
   Result := not FDM.cdsPainel.IsEmpty;
end;

end.
