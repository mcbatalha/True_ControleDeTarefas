unit Providers.Base;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DBXDataSnap,
  Data.DBXCommon,
  IPPeerClient,
  Data.DB,
  Datasnap.DBClient,
  Datasnap.DSConnect,
  Data.SqlExpr,
  Providers.Conexao,
  Providers.Connection;

type
  TdtmBase = class(TdtmConexao)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmBase: TdtmBase;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdtmBase.DataModuleCreate(Sender: TObject);
begin
   inherited;
   ConnectionProvider.ConfigurarConexao(SQLConnection);
end;

procedure TdtmBase.DataModuleDestroy(Sender: TObject);
begin
   SQLConnection.Connected := False;
   inherited;
end;

end.
