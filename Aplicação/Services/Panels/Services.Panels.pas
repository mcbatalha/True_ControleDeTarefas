unit Services.Panels;

interface
uses
  Vcl.Forms,
  Vcl.Samples.Gauges,
  Vcl.StdCtrls,

  System.SysUtils,
  System.Classes,
  System.JSON,

  Proxy.Classes,
  Funcoes,

  Providers.Seguranca,
  Providers.Panels.AutoSC,
  Providers.Panels.Siags,

  Forms.Mensagem,
  Libs.Constantes,
  Libs.TSeguranca;

type

  TSrvPanels = class
  private
     FdmAutoSc      : TdtmPainelAutoSC;
     FPxyAutoSC     : TSMAutoSCClient;

     FdmSiags      : TdtmPainelSiags;
     FPxySiags     : TSMSiagsClient;
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

   Application.CreateForm(TdtmPainelSiags, FdmSiags);
   FPxySiags := TSMSiagsClient.Create(FdmSiags.SQLConnection.DBXConnection);
end;

destructor TSrvPanels.Destroy;
begin
   FreeAndNil(FPxyAutoSC);
   FreeAndNil(FdmAutoSc);

   FreeAndNil(FPxySiags);
   FreeAndNil(FdmSiags);

   inherited;
end;

end.
