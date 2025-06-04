//
// Created by the DataSnap proxy generator.
// 04/06/2025 19:42:07
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

  TSMAutoSCClient = class(TDSAdminClient)
  private
    FImportarCommand: TDBXCommand;
    FFiltrarProcessosCommand: TDBXCommand;
    FTiposDeAuditoriaCommand: TDBXCommand;
    FTiposDePrazoCommand: TDBXCommand;
    FTiposDePrazoHojeCommand: TDBXCommand;
    FTiposDeProcessoCommand: TDBXCommand;
    FTiposDeProcessoECommand: TDBXCommand;
    FTiposDeStatusCommand: TDBXCommand;
    FSetoresCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Importar(ARegistros: TJSONArray; AIdUsuario: Integer): TJSONObject;
    function FiltrarProcessos(AFiltros: TJSONObject): TJSONArray;
    function TiposDeAuditoria: TJSONArray;
    function TiposDePrazo: TJSONArray;
    function TiposDePrazoHoje: TJSONArray;
    function TiposDeProcesso: TJSONArray;
    function TiposDeProcessoE: TJSONArray;
    function TiposDeStatus: TJSONArray;
    function Setores: TJSONArray;
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

function TSMAutoSCClient.Importar(ARegistros: TJSONArray; AIdUsuario: Integer): TJSONObject;
begin
  if FImportarCommand = nil then
  begin
    FImportarCommand := FDBXConnection.CreateCommand;
    FImportarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FImportarCommand.Text := 'TSMAutoSC.Importar';
    FImportarCommand.Prepare;
  end;
  FImportarCommand.Parameters[0].Value.SetJSONValue(ARegistros, FInstanceOwner);
  FImportarCommand.Parameters[1].Value.SetInt32(AIdUsuario);
  FImportarCommand.ExecuteUpdate;
  Result := TJSONObject(FImportarCommand.Parameters[2].Value.GetJSONValue(FInstanceOwner));
end;

function TSMAutoSCClient.FiltrarProcessos(AFiltros: TJSONObject): TJSONArray;
begin
  if FFiltrarProcessosCommand = nil then
  begin
    FFiltrarProcessosCommand := FDBXConnection.CreateCommand;
    FFiltrarProcessosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarProcessosCommand.Text := 'TSMAutoSC.FiltrarProcessos';
    FFiltrarProcessosCommand.Prepare;
  end;
  FFiltrarProcessosCommand.Parameters[0].Value.SetJSONValue(AFiltros, FInstanceOwner);
  FFiltrarProcessosCommand.ExecuteUpdate;
  Result := TJSONArray(FFiltrarProcessosCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TSMAutoSCClient.TiposDeAuditoria: TJSONArray;
begin
  if FTiposDeAuditoriaCommand = nil then
  begin
    FTiposDeAuditoriaCommand := FDBXConnection.CreateCommand;
    FTiposDeAuditoriaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FTiposDeAuditoriaCommand.Text := 'TSMAutoSC.TiposDeAuditoria';
    FTiposDeAuditoriaCommand.Prepare;
  end;
  FTiposDeAuditoriaCommand.ExecuteUpdate;
  Result := TJSONArray(FTiposDeAuditoriaCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TSMAutoSCClient.TiposDePrazo: TJSONArray;
begin
  if FTiposDePrazoCommand = nil then
  begin
    FTiposDePrazoCommand := FDBXConnection.CreateCommand;
    FTiposDePrazoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FTiposDePrazoCommand.Text := 'TSMAutoSC.TiposDePrazo';
    FTiposDePrazoCommand.Prepare;
  end;
  FTiposDePrazoCommand.ExecuteUpdate;
  Result := TJSONArray(FTiposDePrazoCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TSMAutoSCClient.TiposDePrazoHoje: TJSONArray;
begin
  if FTiposDePrazoHojeCommand = nil then
  begin
    FTiposDePrazoHojeCommand := FDBXConnection.CreateCommand;
    FTiposDePrazoHojeCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FTiposDePrazoHojeCommand.Text := 'TSMAutoSC.TiposDePrazoHoje';
    FTiposDePrazoHojeCommand.Prepare;
  end;
  FTiposDePrazoHojeCommand.ExecuteUpdate;
  Result := TJSONArray(FTiposDePrazoHojeCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TSMAutoSCClient.TiposDeProcesso: TJSONArray;
begin
  if FTiposDeProcessoCommand = nil then
  begin
    FTiposDeProcessoCommand := FDBXConnection.CreateCommand;
    FTiposDeProcessoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FTiposDeProcessoCommand.Text := 'TSMAutoSC.TiposDeProcesso';
    FTiposDeProcessoCommand.Prepare;
  end;
  FTiposDeProcessoCommand.ExecuteUpdate;
  Result := TJSONArray(FTiposDeProcessoCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TSMAutoSCClient.TiposDeProcessoE: TJSONArray;
begin
  if FTiposDeProcessoECommand = nil then
  begin
    FTiposDeProcessoECommand := FDBXConnection.CreateCommand;
    FTiposDeProcessoECommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FTiposDeProcessoECommand.Text := 'TSMAutoSC.TiposDeProcessoE';
    FTiposDeProcessoECommand.Prepare;
  end;
  FTiposDeProcessoECommand.ExecuteUpdate;
  Result := TJSONArray(FTiposDeProcessoECommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TSMAutoSCClient.TiposDeStatus: TJSONArray;
begin
  if FTiposDeStatusCommand = nil then
  begin
    FTiposDeStatusCommand := FDBXConnection.CreateCommand;
    FTiposDeStatusCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FTiposDeStatusCommand.Text := 'TSMAutoSC.TiposDeStatus';
    FTiposDeStatusCommand.Prepare;
  end;
  FTiposDeStatusCommand.ExecuteUpdate;
  Result := TJSONArray(FTiposDeStatusCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TSMAutoSCClient.Setores: TJSONArray;
begin
  if FSetoresCommand = nil then
  begin
    FSetoresCommand := FDBXConnection.CreateCommand;
    FSetoresCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSetoresCommand.Text := 'TSMAutoSC.Setores';
    FSetoresCommand.Prepare;
  end;
  FSetoresCommand.ExecuteUpdate;
  Result := TJSONArray(FSetoresCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

constructor TSMAutoSCClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;

constructor TSMAutoSCClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;

destructor TSMAutoSCClient.Destroy;
begin
  FImportarCommand.DisposeOf;
  FFiltrarProcessosCommand.DisposeOf;
  FTiposDeAuditoriaCommand.DisposeOf;
  FTiposDePrazoCommand.DisposeOf;
  FTiposDePrazoHojeCommand.DisposeOf;
  FTiposDeProcessoCommand.DisposeOf;
  FTiposDeProcessoECommand.DisposeOf;
  FTiposDeStatusCommand.DisposeOf;
  FSetoresCommand.DisposeOf;
  inherited;
end;

end.

