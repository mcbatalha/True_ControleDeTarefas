unit Providers.Connection;

interface
uses
  Vcl.Forms,
  System.SysUtils,
  System.Classes,
  Data.SqlExpr;

type


  TConnectionProvider = class
  private
      FHostName: String;

  public

    property HostName: String read FHostName write FHostName;
    procedure ConfigurarConexao(var ASQLConnection: TSQLConnection;
                                AFechar : Boolean = False);

  end;

Var
  ConnectionProvider : TConnectionProvider;

implementation

{ TConectionProvider }

procedure TConnectionProvider.ConfigurarConexao(var ASQLConnection: TSQLConnection; AFechar : Boolean = False);
begin
   ASQLConnection.Params.Clear;
   ASQLConnection.Params.Add('DriverUnit=Data.DBXDataSnap');
   ASQLConnection.Params.Add('HostName='+FHostName);
   ASQLConnection.Params.Add('Port=211');
   ASQLConnection.Params.Add('CommunicationProtocol=tcp/ip');
   ASQLConnection.Params.Add('DatasnapContext=datasnap/');
   ASQLConnection.Params.Add('DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland.Data.DbxClientDriver,Version=24.0.0.0,Culture=neutral,PublicKeyToken=91d62ebb5b0d1b1b');
   ASQLConnection.Params.Add('Filters={}');
   ASQLConnection.Params.Add('DSAuthenticationUser=ConotroladorDeTarefas@2025');
   ASQLConnection.Params.Add('DSAuthenticationPassword=!Tarefas@2025#True-Auditoria');

   Try
    ASQLConnection.Connected := True;
   Except
      raise Exception.Create('Erro na tentativa de conexão com o servidor');
   End;

   if AFechar then
      ASQLConnection.Connected := False;


end;



initialization
  ConnectionProvider := TConnectionProvider.Create;

finalization
  ConnectionProvider.Free;

end.
