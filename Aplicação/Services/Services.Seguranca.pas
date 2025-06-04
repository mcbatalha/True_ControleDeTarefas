unit Services.Seguranca;

interface

uses
  Vcl.Forms,
  System.SysUtils,
  System.Classes,
  System.JSON,
  Providers.Seguranca,
  Proxy.Classes,
  Funcoes,
  Libs.Constantes;

type

  TSrvSeguranca = class
  private
     FPxySeguranca : TSMUsuariosClient;
     FPxyMetodos   : TSMMetodosGeraisClient;
     Fdm           : TdtmSeguranca;

     FIdUsuario    : Integer;
     FNome         : String;
     FLogin        : String;
     FItensMenu    : TJSONArray;

  public
     constructor Create();

     function Localizar(const ALogin : String): Boolean;

     function getId   : integer;
     function getNome : String;
     function getLogin: String;
     function getItens: TJSONArray;
     function Gravar(const AItensMenu : TJSONArray) : Boolean;

     destructor Destroy(); override;
  end;



implementation

{ TSrvSeguracan }

constructor TSrvSeguranca.Create;
begin
   inherited;

   Application.CreateForm(TdtmSeguranca, Fdm);
   FPxySeguranca := TSMUsuariosClient.Create(Fdm.SQLConnection.DBXConnection);
   FPxyMetodos   := TSMMetodosGeraisClient.Create(Fdm.SQLConnection.DBXConnection);

   Fdm.SQLConnection.Connected := True;
end;

destructor TSrvSeguranca.Destroy;
begin
   FreeAndNil(FPxySeguranca);
   FreeAndNil(FPxyMetodos);
   Fdm.SQLConnection.Connected := False;
   FreeAndNil(Fdm);

   inherited;
end;

function TSrvSeguranca.getId: integer;
begin
   Result := FIdUsuario;
end;

function TSrvSeguranca.getItens: TJSONArray;
begin
   Result := FItensMenu;
end;

function TSrvSeguranca.getLogin: String;
begin
   Result := FLogin;
end;

function TSrvSeguranca.getNome: String;
begin
   Result := FNome;
end;

function TSrvSeguranca.Gravar(const AItensMenu: TJSONArray): Boolean;
begin
   Result := FPxyMetodos.GravarSeguranca(FIdUsuario, AItensMenu);
end;

function TSrvSeguranca.Localizar(const ALogin: String): Boolean;
var
   LRetorno   : TJSONArray;
   LObject    : TJSONObject;
   LItensMenu : TJSONArray;
begin
   LRetorno := FPxySeguranca.LocalizarLogin(ALogin);
   LObject := LRetorno.Items[0] as TJSONObject;
   Result := LObject.Values['localizou'].AsType<Boolean>;

   if not Result then exit;

   FIdUsuario := LObject.Values['id'].AsType<Integer>;
   FNome      := LObject.Values['nome'].AsType<String>;
   FItensMenu := LObject.Values['itensMenu']as TJSONArray;
   FLogin     := ALogin;
end;

end.
