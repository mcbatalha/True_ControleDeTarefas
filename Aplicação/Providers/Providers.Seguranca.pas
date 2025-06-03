unit Providers.Seguranca;

interface

uses
  System.SysUtils, System.Classes, Providers.Base, Data.DBXDataSnap, Data.DBXCommon, IPPeerClient, Data.DB, Datasnap.DBClient, Datasnap.DSConnect, Data.SqlExpr, Proxy.Classes;

type
  TdtmSeguranca = class(TdtmBase)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FPxyMetodosGerais : TSMMetodosGeraisClient;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmSeguranca: TdtmSeguranca;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdtmSeguranca.DataModuleCreate(Sender: TObject);
begin
   inherited;
   FPxyMetodosGerais := TSMMetodosGeraisClient(SQLConnection);
end;

procedure TdtmSeguranca.DataModuleDestroy(Sender: TObject);
begin
   inherited;
   FreeAndNil(FPxyMetodosGerais);
end;

end.
