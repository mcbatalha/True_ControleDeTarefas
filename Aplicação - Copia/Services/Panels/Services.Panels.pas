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

  TSrvPanels = class
  private
     FdmAutoSc      : TdtmPainelAutoSC;
     FPxyAutoSC     : TSMAutoSCClient;

  public
     constructor Create();
     destructor Destroy();

  end;



implementation

{ TSrvImportacaoAutoAc }

constructor TSrvPanels.Create;
begin
   Application.CreateForm(TdtmPainelAutoSC, FdmAutoSc);
   FPxyAutoSC := TSMAutoSCClient.Create(FdmAutoSc.SQLConnection.DBXConnection);
end;

destructor TSrvPanels.Destroy;
begin
   FreeAndNil(FPxyAutoSC);
   FreeAndNil(FdmAutoSc);

   inherited;
end;

end.
