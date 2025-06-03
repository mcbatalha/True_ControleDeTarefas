//
// Created by the DataSnap proxy generator.
// 01/06/2025 14:22:59
//

unit Proxy.Classes;

interface

uses System.JSON, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TSMMetodosGeraisClient = class(TDSAdminClient)
  private
    FProximoIdCommand: TDBXCommand;
    FItensDoMenuCommand: TDBXCommand;
    FLoginCommand: TDBXCommand;
    FAlterarSenhaCommand: TDBXCommand;
    FGravarSegurancaCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function ProximoId(ATabela: string): Integer;
    function ItensDoMenu(AIdUsuario: Integer): TJSONArray;
    function Login(ALogin: string; ASenha: string): TJSONObject;
    function AlterarSenha(AIdUsuario: Integer; ASenha: string): Boolean;
    function GravarSeguranca(AIdUsuario: Integer; AItensMenu: TJSONArray): Boolean;
  end;

  TSMSetoresClient = class(TDSAdminClient)
  private
    FIncluirCommand: TDBXCommand;
    FLocalizarCommand: TDBXCommand;
    FJaExisteCommand: TDBXCommand;
    FPesquisarCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure Incluir;
    function Localizar(AId: Integer): Boolean;
    function JaExiste(AId: Integer; ADescricao: string): Boolean;
    procedure Pesquisar(ACampo: Integer; ATipo: Integer; AChave: string; AIncluirInativos: Boolean);
  end;

  TSMUsuariosClient = class(TDSAdminClient)
  private
    FIncluirCommand: TDBXCommand;
    FLocalizarCommand: TDBXCommand;
    FJaExisteCommand: TDBXCommand;
    FPesquisarCommand: TDBXCommand;
    FLocalizarLoginCommand: TDBXCommand;
    FGravarLogLimpesaSenhaCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure Incluir;
    function Localizar(AId: Integer): Boolean;
    function JaExiste(AId: Integer; ADescricao: string): Boolean;
    procedure Pesquisar(ACampo: Integer; ATipo: Integer; AChave: string; AIncluirInativos: Boolean);
    function LocalizarLogin(ALogin: string): TJSONArray;
    procedure GravarLogLimpesaSenha(AIdUsuario: Integer; AIdUsuarioResponsavel: Integer);
  end;

  TSMImportacaoAutoSCClient = class(TDSAdminClient)
  private
    FImportarCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Importar(ARegistros: TJSONArray; AIdUsuario: Integer): TJSONObject;
  end;

implementation

function TSMMetodosGeraisClient.ProximoId(ATabela: string): Integer;
begin
  if FProximoIdCommand = nil then
  begin
    FProximoIdCommand := FDBXConnection.CreateCommand;
    FProximoIdCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FProximoIdCommand.Text := 'TSMMetodosGerais.ProximoId';
    FProximoIdCommand.Prepare;
  end;
  FProximoIdCommand.Parameters[0].Value.SetWideString(ATabela);
  FProximoIdCommand.ExecuteUpdate;
  Result := FProximoIdCommand.Parameters[1].Value.GetInt32;
end;

function TSMMetodosGeraisClient.ItensDoMenu(AIdUsuario: Integer): TJSONArray;
begin
  if FItensDoMenuCommand = nil then
  begin
    FItensDoMenuCommand := FDBXConnection.CreateCommand;
    FItensDoMenuCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FItensDoMenuCommand.Text := 'TSMMetodosGerais.ItensDoMenu';
    FItensDoMenuCommand.Prepare;
  end;
  FItensDoMenuCommand.Parameters[0].Value.SetInt32(AIdUsuario);
  FItensDoMenuCommand.ExecuteUpdate;
  Result := TJSONArray(FItensDoMenuCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TSMMetodosGeraisClient.Login(ALogin: string; ASenha: string): TJSONObject;
begin
  if FLoginCommand = nil then
  begin
    FLoginCommand := FDBXConnection.CreateCommand;
    FLoginCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLoginCommand.Text := 'TSMMetodosGerais.Login';
    FLoginCommand.Prepare;
  end;
  FLoginCommand.Parameters[0].Value.SetWideString(ALogin);
  FLoginCommand.Parameters[1].Value.SetWideString(ASenha);
  FLoginCommand.ExecuteUpdate;
  Result := TJSONObject(FLoginCommand.Parameters[2].Value.GetJSONValue(FInstanceOwner));
end;

function TSMMetodosGeraisClient.AlterarSenha(AIdUsuario: Integer; ASenha: string): Boolean;
begin
  if FAlterarSenhaCommand = nil then
  begin
    FAlterarSenhaCommand := FDBXConnection.CreateCommand;
    FAlterarSenhaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAlterarSenhaCommand.Text := 'TSMMetodosGerais.AlterarSenha';
    FAlterarSenhaCommand.Prepare;
  end;
  FAlterarSenhaCommand.Parameters[0].Value.SetInt32(AIdUsuario);
  FAlterarSenhaCommand.Parameters[1].Value.SetWideString(ASenha);
  FAlterarSenhaCommand.ExecuteUpdate;
  Result := FAlterarSenhaCommand.Parameters[2].Value.GetBoolean;
end;

function TSMMetodosGeraisClient.GravarSeguranca(AIdUsuario: Integer; AItensMenu: TJSONArray): Boolean;
begin
  if FGravarSegurancaCommand = nil then
  begin
    FGravarSegurancaCommand := FDBXConnection.CreateCommand;
    FGravarSegurancaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGravarSegurancaCommand.Text := 'TSMMetodosGerais.GravarSeguranca';
    FGravarSegurancaCommand.Prepare;
  end;
  FGravarSegurancaCommand.Parameters[0].Value.SetInt32(AIdUsuario);
  FGravarSegurancaCommand.Parameters[1].Value.SetJSONValue(AItensMenu, FInstanceOwner);
  FGravarSegurancaCommand.ExecuteUpdate;
  Result := FGravarSegurancaCommand.Parameters[2].Value.GetBoolean;
end;

constructor TSMMetodosGeraisClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;

constructor TSMMetodosGeraisClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;

destructor TSMMetodosGeraisClient.Destroy;
begin
  FProximoIdCommand.DisposeOf;
  FItensDoMenuCommand.DisposeOf;
  FLoginCommand.DisposeOf;
  FAlterarSenhaCommand.DisposeOf;
  FGravarSegurancaCommand.DisposeOf;
  inherited;
end;

procedure TSMSetoresClient.Incluir;
begin
  if FIncluirCommand = nil then
  begin
    FIncluirCommand := FDBXConnection.CreateCommand;
    FIncluirCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FIncluirCommand.Text := 'TSMSetores.Incluir';
    FIncluirCommand.Prepare;
  end;
  FIncluirCommand.ExecuteUpdate;
end;

function TSMSetoresClient.Localizar(AId: Integer): Boolean;
begin
  if FLocalizarCommand = nil then
  begin
    FLocalizarCommand := FDBXConnection.CreateCommand;
    FLocalizarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLocalizarCommand.Text := 'TSMSetores.Localizar';
    FLocalizarCommand.Prepare;
  end;
  FLocalizarCommand.Parameters[0].Value.SetInt32(AId);
  FLocalizarCommand.ExecuteUpdate;
  Result := FLocalizarCommand.Parameters[1].Value.GetBoolean;
end;

function TSMSetoresClient.JaExiste(AId: Integer; ADescricao: string): Boolean;
begin
  if FJaExisteCommand = nil then
  begin
    FJaExisteCommand := FDBXConnection.CreateCommand;
    FJaExisteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FJaExisteCommand.Text := 'TSMSetores.JaExiste';
    FJaExisteCommand.Prepare;
  end;
  FJaExisteCommand.Parameters[0].Value.SetInt32(AId);
  FJaExisteCommand.Parameters[1].Value.SetWideString(ADescricao);
  FJaExisteCommand.ExecuteUpdate;
  Result := FJaExisteCommand.Parameters[2].Value.GetBoolean;
end;

procedure TSMSetoresClient.Pesquisar(ACampo: Integer; ATipo: Integer; AChave: string; AIncluirInativos: Boolean);
begin
  if FPesquisarCommand = nil then
  begin
    FPesquisarCommand := FDBXConnection.CreateCommand;
    FPesquisarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPesquisarCommand.Text := 'TSMSetores.Pesquisar';
    FPesquisarCommand.Prepare;
  end;
  FPesquisarCommand.Parameters[0].Value.SetInt32(ACampo);
  FPesquisarCommand.Parameters[1].Value.SetInt32(ATipo);
  FPesquisarCommand.Parameters[2].Value.SetWideString(AChave);
  FPesquisarCommand.Parameters[3].Value.SetBoolean(AIncluirInativos);
  FPesquisarCommand.ExecuteUpdate;
end;

constructor TSMSetoresClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;

constructor TSMSetoresClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;

destructor TSMSetoresClient.Destroy;
begin
  FIncluirCommand.DisposeOf;
  FLocalizarCommand.DisposeOf;
  FJaExisteCommand.DisposeOf;
  FPesquisarCommand.DisposeOf;
  inherited;
end;

procedure TSMUsuariosClient.Incluir;
begin
  if FIncluirCommand = nil then
  begin
    FIncluirCommand := FDBXConnection.CreateCommand;
    FIncluirCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FIncluirCommand.Text := 'TSMUsuarios.Incluir';
    FIncluirCommand.Prepare;
  end;
  FIncluirCommand.ExecuteUpdate;
end;

function TSMUsuariosClient.Localizar(AId: Integer): Boolean;
begin
  if FLocalizarCommand = nil then
  begin
    FLocalizarCommand := FDBXConnection.CreateCommand;
    FLocalizarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLocalizarCommand.Text := 'TSMUsuarios.Localizar';
    FLocalizarCommand.Prepare;
  end;
  FLocalizarCommand.Parameters[0].Value.SetInt32(AId);
  FLocalizarCommand.ExecuteUpdate;
  Result := FLocalizarCommand.Parameters[1].Value.GetBoolean;
end;

function TSMUsuariosClient.JaExiste(AId: Integer; ADescricao: string): Boolean;
begin
  if FJaExisteCommand = nil then
  begin
    FJaExisteCommand := FDBXConnection.CreateCommand;
    FJaExisteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FJaExisteCommand.Text := 'TSMUsuarios.JaExiste';
    FJaExisteCommand.Prepare;
  end;
  FJaExisteCommand.Parameters[0].Value.SetInt32(AId);
  FJaExisteCommand.Parameters[1].Value.SetWideString(ADescricao);
  FJaExisteCommand.ExecuteUpdate;
  Result := FJaExisteCommand.Parameters[2].Value.GetBoolean;
end;

procedure TSMUsuariosClient.Pesquisar(ACampo: Integer; ATipo: Integer; AChave: string; AIncluirInativos: Boolean);
begin
  if FPesquisarCommand = nil then
  begin
    FPesquisarCommand := FDBXConnection.CreateCommand;
    FPesquisarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPesquisarCommand.Text := 'TSMUsuarios.Pesquisar';
    FPesquisarCommand.Prepare;
  end;
  FPesquisarCommand.Parameters[0].Value.SetInt32(ACampo);
  FPesquisarCommand.Parameters[1].Value.SetInt32(ATipo);
  FPesquisarCommand.Parameters[2].Value.SetWideString(AChave);
  FPesquisarCommand.Parameters[3].Value.SetBoolean(AIncluirInativos);
  FPesquisarCommand.ExecuteUpdate;
end;

function TSMUsuariosClient.LocalizarLogin(ALogin: string): TJSONArray;
begin
  if FLocalizarLoginCommand = nil then
  begin
    FLocalizarLoginCommand := FDBXConnection.CreateCommand;
    FLocalizarLoginCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLocalizarLoginCommand.Text := 'TSMUsuarios.LocalizarLogin';
    FLocalizarLoginCommand.Prepare;
  end;
  FLocalizarLoginCommand.Parameters[0].Value.SetWideString(ALogin);
  FLocalizarLoginCommand.ExecuteUpdate;
  Result := TJSONArray(FLocalizarLoginCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

procedure TSMUsuariosClient.GravarLogLimpesaSenha(AIdUsuario: Integer; AIdUsuarioResponsavel: Integer);
begin
  if FGravarLogLimpesaSenhaCommand = nil then
  begin
    FGravarLogLimpesaSenhaCommand := FDBXConnection.CreateCommand;
    FGravarLogLimpesaSenhaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGravarLogLimpesaSenhaCommand.Text := 'TSMUsuarios.GravarLogLimpesaSenha';
    FGravarLogLimpesaSenhaCommand.Prepare;
  end;
  FGravarLogLimpesaSenhaCommand.Parameters[0].Value.SetInt32(AIdUsuario);
  FGravarLogLimpesaSenhaCommand.Parameters[1].Value.SetInt32(AIdUsuarioResponsavel);
  FGravarLogLimpesaSenhaCommand.ExecuteUpdate;
end;

constructor TSMUsuariosClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;

constructor TSMUsuariosClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;

destructor TSMUsuariosClient.Destroy;
begin
  FIncluirCommand.DisposeOf;
  FLocalizarCommand.DisposeOf;
  FJaExisteCommand.DisposeOf;
  FPesquisarCommand.DisposeOf;
  FLocalizarLoginCommand.DisposeOf;
  FGravarLogLimpesaSenhaCommand.DisposeOf;
  inherited;
end;

function TSMImportacaoAutoSCClient.Importar(ARegistros: TJSONArray; AIdUsuario: Integer): TJSONObject;
begin
  if FImportarCommand = nil then
  begin
    FImportarCommand := FDBXConnection.CreateCommand;
    FImportarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FImportarCommand.Text := 'TSMImportacaoAutoSC.Importar';
    FImportarCommand.Prepare;
  end;
  FImportarCommand.Parameters[0].Value.SetJSONValue(ARegistros, FInstanceOwner);
  FImportarCommand.Parameters[1].Value.SetInt32(AIdUsuario);
  FImportarCommand.ExecuteUpdate;
  Result := TJSONObject(FImportarCommand.Parameters[2].Value.GetJSONValue(FInstanceOwner));
end;

constructor TSMImportacaoAutoSCClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;

constructor TSMImportacaoAutoSCClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;

destructor TSMImportacaoAutoSCClient.Destroy;
begin
  FImportarCommand.DisposeOf;
  inherited;
end;

end.

