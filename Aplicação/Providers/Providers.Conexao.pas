unit Providers.Conexao;

interface

uses
  System.SysUtils,
  System.Classes,

  IPPeerClient,


  Data.DB,
  Data.SqlExpr,

  Data.DBXDataSnap,
  Data.DBXCommon,
  Datasnap.DBClient,
  Datasnap.DSConnect;
type
  TdtmConexao = class(TDataModule)
    SQLConnection: TSQLConnection;
    DSProviderConnection: TDSProviderConnection;
    cdsPesquisa: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmConexao: TdtmConexao;

implementation
{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Proxy.Classes;


{$R *.dfm}

end.
