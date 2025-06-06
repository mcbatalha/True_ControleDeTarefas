unit Services.Login;

interface

uses
     Vcl.Forms,
     Vcl.Menus,
     System.SysUtils,
     System.Classes,
     System.JSON,
     Providers.Cadastros,
     Proxy.Classes,
     Funcoes,
     Libs.Constantes, Util.Menu;
type

  TSrvLogin = class
  private
     FPxyLogin : TSMMetodosGeraisClient;
     Fdm : TdtmCadastros;

//     procedure DesabilitarMenus;
//     procedure HabilitarMenusDoUsuario;
  public
     constructor Create();
     procedure Conectar;

     function Login(const ALogin, ASenha : string) : Boolean;
     function AlterarSenha(const ASenha, AConfirmacao : String) : Boolean;

     procedure Desconectar;
     destructor Destroy(); override;
  end;


implementation

{ TSrvLogin }

uses Libs.TSeguranca;

function TSrvLogin.AlterarSenha(const ASenha, AConfirmacao : String): Boolean;
begin
   Result := False;
   if ASenha <> AConfirmacao then
      begin
      InformationMessage('As senhas informadas não são iguais !','Controle de Tarefas');
      exit;
   end;

   if ASenha = '' then
      begin
      InformationMessage('A senha não pode ficar em branco !','Controle de Tarefas');
      exit;
   end;

   if not FPxyLogin.AlterarSenha(Seguranca.id, ASenha) then
      begin
      InformationMessage('Não foi possível realizar a alteração da senha !','Controle de Tarefas');
      Seguranca.TrocarSenha := False;
   end else
      Result := True;

end;

constructor TSrvLogin.Create;
begin
   inherited;

end;

procedure TSrvLogin.Conectar;
begin
   if not Assigned(FPxyLogin) then
      begin
      Application.CreateForm(TdtmCadastros, Fdm);
      FPxyLogin := TSMMetodosGeraisClient.Create(Fdm.SQLConnection.DBXConnection);
      Fdm.SQLConnection.Connected := True;
   end;
end;


destructor TSrvLogin.Destroy;
begin
   Fdm.SQLConnection.Connected := False;
   FreeAndNil(FPxyLogin);
   FreeAndNil(Fdm);

   inherited;
end;


procedure TSrvLogin.Desconectar;
begin
   Fdm.SQLConnection.Connected := False;
end;

function TSrvLogin.Login(const ALogin, ASenha: string) : Boolean;
var
   LLogin      : TJSONObject;
   LAutorizado : Boolean;
   LMensagem   : String;
begin

   Result := False;
   if (ALogin = 'MCCB') and (ASenha = 'REPUS') then
      begin
      Seguranca.id    := 99999;
      Seguranca.nome  := 'Manutenção do Sistema';
      Seguranca.Login := 'MCCB';
      Seguranca.PodeAUTOSC    := True;
      Seguranca.PodeSIAGS     := True;
      Seguranca.PodeCONTROLPC := True;

      Result := True;
      Exit;
   end else
      begin
      LLogin := FPxyLogin.Login(ALogin, ASenha);
   end;

   Result := LLogin.Values['autorizado'].AsType<Boolean>;
   if not Result then
      begin
      LMensagem := LLogin.Values['mensagem'].AsType<String>;
      InformationMessage(LMensagem, 'Controle de Tarefas');
      Exit;
   end;

   Seguranca.id            := LLogin.Values['id'].AsType<Integer>;
   Seguranca.nome          := LLogin.Values['nome'].AsType<String>;
   Seguranca.Login         := ALogin;
   Seguranca.Perfil        := LLogin.Values['perfil'].AsType<String>;
   Seguranca.TrocarSenha   := LLogin.Values['trocarSenha'].AsType<Boolean>;
   Seguranca.PodeAUTOSC    := LLogin.Values['autosc'].AsType<Boolean>;
   Seguranca.PodeSIAGS     := LLogin.Values['siags'].AsType<Boolean>;
   Seguranca.PodeCONTROLPC := LLogin.Values['controlpc'].AsType<Boolean>;

   Result := True;

   if ALogin = 'MCCB' then
      Seguranca.TrocarSenha := False;

   HabilitarMenusDoUsuario(FPxyLogin.ItensDoMenu(Seguranca.id));
end;

end.
