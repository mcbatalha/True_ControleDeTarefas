unit Services.Panels;

interface
uses
  Vcl.Forms,
  Vcl.Samples.Gauges,
  Vcl.StdCtrls,

  System.SysUtils,
  System.Classes,
  System.JSON,

  Providers.Seguranca,
  Proxy.Classes,
  Funcoes,
  Libs.Constantes,
  Providers.Panels.AutoSC,
  Forms.Mensagem,
  Libs.TSeguranca;

type

  TSrvImportacaoAutoAc = class
  private
     Fdm            : TdtmPainelAutoSC;
     FPxyAutoSC     : TSMAutoSCClient;

     const
        C_TITULO_MENSAGENS = 'Importação de Planilha AUTOSC';
  public
     constructor Create();
     destructor Destroy();

  end;



implementation

{ TSrvImportacaoAutoAc }

constructor TSrvImportacaoAutoAc.Create;
begin
   Application.CreateForm(TdtmPainelAutoSC, Fdm);
   FPxyAutoSC := TSMAutoSCClient.Create(Fdm.SQLConnection.DBXConnection);
end;

destructor TSrvImportacaoAutoAc.Destroy;
begin
   FreeAndNil(FPxyAutoSC);
   FreeAndNil(Fdm);

   inherited;
end;

end.
