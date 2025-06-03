unit ServerMethods.Container;

interface

uses
  System.SysUtils,
  System.Classes,
  Datasnap.DSTCPServerTransport,
  Datasnap.DSServer,
  Datasnap.DSCommonServer,
  Datasnap.DSAuth,

  IPPeerServer,
  IPPeerAPI,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI,
  FireDAC.Phys.ODBCBase,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,

  Data.DB,

  FuncoesGerais;


type
  TServerContainer = class(TDataModule)
    DSServer: TDSServer;
    DSTCPServerTransport: TDSTCPServerTransport;
    dsscCadastro: TDSServerClass;
    DSAuthenticationManager: TDSAuthenticationManager;
    FDConnection: TFDConnection;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDSP_ProximoId: TFDStoredProc;
    dsscSetores: TDSServerClass;
    dsscUsuarios: TDSServerClass;
    dsscImportacaoAutoSC: TDSServerClass;
    procedure dsscMetodosGerais(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSAuthenticationManagerUserAuthenticate(Sender: TObject; const Protocol, Context, User, Password: string; var valid: Boolean; UserRoles: TStrings);
    procedure DSAuthenticationManagerUserAuthorize(Sender: TObject; AuthorizeEventObject: TDSAuthorizeEventObject; var valid: Boolean);
    procedure DSServerConnect(DSConnectEventObject: TDSConnectEventObject);
    procedure DSServerDisconnect(DSConnectEventObject: TDSConnectEventObject);
    procedure dsscSetoresGetClass(DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
    procedure dsscUsuariosGetClass(DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
    procedure dsscImportacaoAutoSCGetClass(DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
  private
    { Private declarations }
  public
  end;

var
  ServerContainer: TServerContainer;

implementation


{$R *.dfm}

uses
  Forms.Principal,
  ServerMethods.MetodosGerais,
  ServerMethods.Cadastro.Usuarios,
  ServerMethods.Cadastro.Setores,
  ServerMethods.Importacao.AutoSc;

procedure TServerContainer.DSAuthenticationManagerUserAuthenticate(Sender: TObject; const Protocol, Context, User, Password: string; var valid: Boolean; UserRoles: TStrings);
begin
  { TODO : Validate the client user and password.
    If role-based authorization is needed, add role names to the UserRoles parameter  }
//  valid := True;

  if (User = 'ConotroladorDeTarefas@2025') and (Password = '!Tarefas@2025#True-Auditoria') then
     valid := true
  else
     valid := false;
end;

procedure TServerContainer.DSAuthenticationManagerUserAuthorize(Sender: TObject; AuthorizeEventObject: TDSAuthorizeEventObject; var valid: Boolean);
begin
  { TODO : Authorize a user to execute a method.
    Use values from EventObject such as UserName, UserRoles, AuthorizedRoles and DeniedRoles.
    Use DSAuthenticationManager1.Roles to define Authorized and Denied roles
    for particular server methods. }
  valid := True;

end;

procedure TServerContainer.dsscSetoresGetClass(DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := ServerMethods.Cadastro.Setores.TSMSetores;
end;

procedure TServerContainer.dsscUsuariosGetClass(DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := ServerMethods.Cadastro.Usuarios.TSMUsuarios;
end;

procedure TServerContainer.dsscImportacaoAutoSCGetClass(DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := ServerMethods.Importacao.AutoSc.TSMImportacaoAutoSC;

end;

procedure TServerContainer.dsscMetodosGerais(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := ServerMethods.MetodosGerais.TSMMetodosGerais;
end;

procedure TServerContainer.DSServerConnect(DSConnectEventObject: TDSConnectEventObject);
var
  IP: string;
begin
  IP := DSConnectEventObject.ChannelInfo.Info;

  frmPrincipal.AtualizarListaDeConexoes(1, IP);
end;

procedure TServerContainer.DSServerDisconnect(DSConnectEventObject: TDSConnectEventObject);
var
  IP: string;
begin
  IP := DSConnectEventObject.ChannelInfo.Info;

  frmPrincipal.AtualizarListaDeConexoes(0, IP);
end;

end.

