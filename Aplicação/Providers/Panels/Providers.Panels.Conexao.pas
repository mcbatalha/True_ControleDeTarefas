unit Providers.Panels.Conexao;

interface

uses
  System.SysUtils, System.Classes, Providers.Conexao, Data.DBXDataSnap, Data.DBXCommon, IPPeerClient, Data.DB, Datasnap.DBClient, Datasnap.DSConnect, Data.SqlExpr;

type
  TdtmPaineisConexao = class(TdtmConexao)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

(*
var
  dtmPaineisConexao: TdtmPaineisConexao;
*)

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Providers.Connection;

{$R *.dfm}

procedure TdtmPaineisConexao.DataModuleCreate(Sender: TObject);
begin
   inherited;
   ConnectionProvider.ConfigurarConexao(SQLConnection);
end;

procedure TdtmPaineisConexao.DataModuleDestroy(Sender: TObject);
begin
   SQLConnection.Connected := False;
   inherited;
end;

end.
