//
// Created by the DataSnap proxy generator.
// 08/08/2025 17:14:32
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
    FDesignacoesPendentesCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function ProximoId(ATabela: string): Integer;
    function ItensDoMenu(AIdUsuario: Integer): TJSONArray;
    function Login(ALogin: string; ASenha: string): TJSONObject;
    function AlterarSenha(AIdUsuario: Integer; ASenha: string): Boolean;
    function GravarSeguranca(AIdUsuario: Integer; AItensMenu: TJSONArray): Boolean;
    function DesignacoesPendentes(AIdUsuario: Integer): TJSONArray;
  end;

  TSMSetoresClient = class(TDSAdminClient)
  private
    FIncluirCommand: TDBXCommand;
    FLocalizarCommand: TDBXCommand;
    FJaExisteCommand: TDBXCommand;
    FPesquisarCommand: TDBXCommand;
    FSetoresCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure Incluir;
    function Localizar(AId: Integer): Boolean;
    function JaExiste(AId: Integer; ADescricao: string): Boolean;
    procedure Pesquisar(ACampo: Integer; ATipo: Integer; AChave: string; AIncluirInativos: Boolean);
    function Setores: TJSONArray;
  end;

  TSMUsuariosClient = class(TDSAdminClient)
  private
    FIncluirCommand: TDBXCommand;
    FLocalizarCommand: TDBXCommand;
    FJaExisteCommand: TDBXCommand;
    FPesquisarCommand: TDBXCommand;
    FLocalizarLoginCommand: TDBXCommand;
    FGravarLogLimpesaSenhaCommand: TDBXCommand;
    FUsuariosCommand: TDBXCommand;
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
    function Usuarios: TJSONArray;
  end;

  TSMAutoSCClient = class(TDSAdminClient)
  private
    FImportarCommand: TDBXCommand;
    FFiltrarProcessosCommand: TDBXCommand;
    FDesignarCommand: TDBXCommand;
    FRegistrarObservacaoCommand: TDBXCommand;
    FAlterarStatusCommand: TDBXCommand;
    FHistoricoDeDesignacoesCommand: TDBXCommand;
    FHistoricoDeAtualizacoesCommand: TDBXCommand;
    FObservacoesDoProcessoCommand: TDBXCommand;
    FTiposDeAuditoriaCommand: TDBXCommand;
    FTiposDePrazoCommand: TDBXCommand;
    FTiposDePrazoHojeCommand: TDBXCommand;
    FTiposDeProcessoCommand: TDBXCommand;
    FTiposDeProcessoECommand: TDBXCommand;
    FTiposDeStatusCommand: TDBXCommand;
    FSetoresCommand: TDBXCommand;
    FUsuariosCommand: TDBXCommand;
    FRelatorioDeDesignacoesCommand: TDBXCommand;
    FRelatorioDeEncerramentosCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Importar(ARegistros: TJSONArray; AIdUsuario: Integer): TJSONObject;
    function FiltrarProcessos(AFiltros: TJSONObject; AIncluirEncerrados: Boolean): TJSONArray;
    function Designar(AJustificativa: string; AIdSetor: Integer; AIdUsuario: Integer; AIdUsuarioResponsavel: Integer; AIdProcesso: Integer): Boolean;
    function RegistrarObservacao(AIdProcesso: Integer; AObservacao: string; AIdUsuarioResponsavel: Integer; out ADataHora: TDateTime): Boolean;
    function AlterarStatus(AIdProcesso: Integer; AIdStatus: Integer; AJustificativa: string; AIdUsuarioResponsavel: Integer): Boolean;
    function HistoricoDeDesignacoes(AIdProcesso: Integer): TJSONArray;
    function HistoricoDeAtualizacoes(AIdProcesso: Integer): TJSONArray;
    function ObservacoesDoProcesso(AIdProcesso: Integer): TJSONArray;
    function TiposDeAuditoria: TJSONArray;
    function TiposDePrazo: TJSONArray;
    function TiposDePrazoHoje: TJSONArray;
    function TiposDeProcesso: TJSONArray;
    function TiposDeProcessoE: TJSONArray;
    function TiposDeStatus: TJSONArray;
    function Setores: TJSONArray;
    function Usuarios: TJSONArray;
    function RelatorioDeDesignacoes(AUsaDatas: Boolean; ADataInicial: TDateTime; ADataFinal: TDateTime; ANumeroProceso: string; AIdUsuarioResponsavel: Integer): TJSONArray;
    function RelatorioDeEncerramentos(ADataInicial: TDateTime; ADataFinal: TDateTime; AIdUsuarioResponsavel: Integer): TJSONArray;
  end;

  TSMSiagsClient = class(TDSAdminClient)
  private
    FImportarCommand: TDBXCommand;
    FFiltrarAutorizacoesCommand: TDBXCommand;
    FDesignarCommand: TDBXCommand;
    FRegistrarObservacaoCommand: TDBXCommand;
    FAlterarStatusCommand: TDBXCommand;
    FHistoricoDeDesignacoesCommand: TDBXCommand;
    FHistoricoDeAtualizacoesCommand: TDBXCommand;
    FObservacoesDaAutorizacaoCommand: TDBXCommand;
    FTiposDeAutoriazacaoCommand: TDBXCommand;
    FTiposDeAtendimentoCommand: TDBXCommand;
    FStatusTrueCommand: TDBXCommand;
    FAutorizacoesAtivasCommand: TDBXCommand;
    FSetoresCommand: TDBXCommand;
    FUsuariosCommand: TDBXCommand;
    FUsuariosDoSetorCommand: TDBXCommand;
    FRelatorioDeDesignacoesCommand: TDBXCommand;
    FRelatorioDeEncerramentosCommand: TDBXCommand;
    FDesignacoesPendentesCommand: TDBXCommand;
    FAutorizarDesiganacaoCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Importar(ARegistros: TJSONArray; AIdUsuario: Integer): TJSONObject;
    function FiltrarAutorizacoes(AFiltros: TJSONObject; AIncluirEncerrados: Boolean): TJSONArray;
    function Designar(AAutorizacoes: TJSONArray; AJustificativa: string; AIdSetor: Integer; AIdUsuario: Integer; AIdUsuarioResponsavel: Integer; AIdAutorizacao: Integer): Boolean;
    function RegistrarObservacao(AIdAutorizacao: Integer; AObservacao: string; AIdUsuarioResponsavel: Integer; out ADataHora: TDateTime): Boolean;
    function AlterarStatus(AIdAutorizacao: Integer; AIdStatus: Integer; AJustificativa: string; AIdUsuarioResponsavel: Integer): Boolean;
    function HistoricoDeDesignacoes(AIdAutorizacao: Integer): TJSONArray;
    function HistoricoDeAtualizacoes(AIdAutorizacao: Integer): TJSONArray;
    function ObservacoesDaAutorizacao(AIdAutorizacao: Integer): TJSONArray;
    function TiposDeAutoriazacao: TJSONArray;
    function TiposDeAtendimento: TJSONArray;
    function StatusTrue: TJSONArray;
    function AutorizacoesAtivas: TJSONArray;
    function Setores(AIdUsuario: Integer): TJSONArray;
    function Usuarios(AIdUsuario: Integer): TJSONArray;
    function UsuariosDoSetor(AIdSetor: Integer): TJSONArray;
    function RelatorioDeDesignacoes(AUsaDatas: Boolean; ADataInicial: TDateTime; ADataFinal: TDateTime; ANumeroAutorizacao: string; AIdUsuarioResponsavel: Integer): TJSONArray;
    function RelatorioDeEncerramentos(ADataInicial: TDateTime; ADataFinal: TDateTime; AIdUsuarioResponsavel: Integer): TJSONArray;
    function DesignacoesPendentes: TJSONArray;
    function AutorizarDesiganacao(AIdAutorizacao: Integer; AIdSolicitacao: Integer; AAutorizado: Boolean; AIdUsuario: Integer): Boolean;
  end;

  TSMControlPcClient = class(TDSAdminClient)
  private
    FImportarCommand: TDBXCommand;
    FFiltrarProtocolosCommand: TDBXCommand;
    FDesignarCommand: TDBXCommand;
    FRegistrarObservacaoCommand: TDBXCommand;
    FAlterarStatusCommand: TDBXCommand;
    FHistoricoDeDesignacoesCommand: TDBXCommand;
    FHistoricoDeAtualizacoesCommand: TDBXCommand;
    FObservacoesDoProtocoloCommand: TDBXCommand;
    FTecnicosCommand: TDBXCommand;
    FTiposDeClienteCommand: TDBXCommand;
    FStatusTrueCommand: TDBXCommand;
    FProtocolosAtivosCommand: TDBXCommand;
    FSetoresCommand: TDBXCommand;
    FUsuariosCommand: TDBXCommand;
    FUsuariosDoSetorCommand: TDBXCommand;
    FRelatorioDeDesignacoesCommand: TDBXCommand;
    FRelatorioDeEncerramentosCommand: TDBXCommand;
    FDesignacoesPendentesCommand: TDBXCommand;
    FAutorizarDesiganacaoCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Importar(ARegistros: TJSONArray; AIdUsuario: Integer): TJSONObject;
    function FiltrarProtocolos(AFiltros: TJSONObject; AIncluirEncerrados: Boolean): TJSONArray;
    function Designar(AProtocolos: TJSONArray; AJustificativa: string; AIdSetor: Integer; AIdUsuario: Integer; AIdUsuarioResponsavel: Integer; AIdProtocolo: Integer): Boolean;
    function RegistrarObservacao(AIdProtocolo: Integer; AObservacao: string; AIdUsuarioResponsavel: Integer; out ADataHora: TDateTime): Boolean;
    function AlterarStatus(AIdProtocolo: Integer; AIdStatus: Integer; AJustificativa: string; AIdUsuarioResponsavel: Integer): Boolean;
    function HistoricoDeDesignacoes(AIdProtocolo: Integer): TJSONArray;
    function HistoricoDeAtualizacoes(AIdProtocolo: Integer): TJSONArray;
    function ObservacoesDoProtocolo(AIdProtocolo: Integer): TJSONArray;
    function Tecnicos: TJSONArray;
    function TiposDeCliente: TJSONArray;
    function StatusTrue: TJSONArray;
    function ProtocolosAtivos: TJSONArray;
    function Setores(AIdUsuario: Integer): TJSONArray;
    function Usuarios(AIdUsuario: Integer): TJSONArray;
    function UsuariosDoSetor(AIdSetor: Integer): TJSONArray;
    function RelatorioDeDesignacoes(AUsaDatas: Boolean; ADataInicial: TDateTime; ADataFinal: TDateTime; ANumeroProtocolo: string; AIdUsuarioResponsavel: Integer): TJSONArray;
    function RelatorioDeEncerramentos(ADataInicial: TDateTime; ADataFinal: TDateTime; AIdUsuarioResponsavel: Integer): TJSONArray;
    function DesignacoesPendentes: TJSONArray;
    function AutorizarDesiganacao(AIdProtocolo: Integer; AIdSolicitacao: Integer; AAutorizado: Boolean; AIdUsuario: Integer): Boolean;
  end;

  TSMResumosClient = class(TDSAdminClient)
  private
    FQuadroResumoCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function QuadroResumo: TJSONArray;
  end;

  TSMStatusTrueClient = class(TDSAdminClient)
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

function TSMMetodosGeraisClient.DesignacoesPendentes(AIdUsuario: Integer): TJSONArray;
begin
  if FDesignacoesPendentesCommand = nil then
  begin
    FDesignacoesPendentesCommand := FDBXConnection.CreateCommand;
    FDesignacoesPendentesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDesignacoesPendentesCommand.Text := 'TSMMetodosGerais.DesignacoesPendentes';
    FDesignacoesPendentesCommand.Prepare;
  end;
  FDesignacoesPendentesCommand.Parameters[0].Value.SetInt32(AIdUsuario);
  FDesignacoesPendentesCommand.ExecuteUpdate;
  Result := TJSONArray(FDesignacoesPendentesCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
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
  FDesignacoesPendentesCommand.DisposeOf;
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

function TSMSetoresClient.Setores: TJSONArray;
begin
  if FSetoresCommand = nil then
  begin
    FSetoresCommand := FDBXConnection.CreateCommand;
    FSetoresCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSetoresCommand.Text := 'TSMSetores.Setores';
    FSetoresCommand.Prepare;
  end;
  FSetoresCommand.ExecuteUpdate;
  Result := TJSONArray(FSetoresCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
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
  FSetoresCommand.DisposeOf;
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

function TSMUsuariosClient.Usuarios: TJSONArray;
begin
  if FUsuariosCommand = nil then
  begin
    FUsuariosCommand := FDBXConnection.CreateCommand;
    FUsuariosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FUsuariosCommand.Text := 'TSMUsuarios.Usuarios';
    FUsuariosCommand.Prepare;
  end;
  FUsuariosCommand.ExecuteUpdate;
  Result := TJSONArray(FUsuariosCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
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
  FUsuariosCommand.DisposeOf;
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

function TSMAutoSCClient.FiltrarProcessos(AFiltros: TJSONObject; AIncluirEncerrados: Boolean): TJSONArray;
begin
  if FFiltrarProcessosCommand = nil then
  begin
    FFiltrarProcessosCommand := FDBXConnection.CreateCommand;
    FFiltrarProcessosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarProcessosCommand.Text := 'TSMAutoSC.FiltrarProcessos';
    FFiltrarProcessosCommand.Prepare;
  end;
  FFiltrarProcessosCommand.Parameters[0].Value.SetJSONValue(AFiltros, FInstanceOwner);
  FFiltrarProcessosCommand.Parameters[1].Value.SetBoolean(AIncluirEncerrados);
  FFiltrarProcessosCommand.ExecuteUpdate;
  Result := TJSONArray(FFiltrarProcessosCommand.Parameters[2].Value.GetJSONValue(FInstanceOwner));
end;

function TSMAutoSCClient.Designar(AJustificativa: string; AIdSetor: Integer; AIdUsuario: Integer; AIdUsuarioResponsavel: Integer; AIdProcesso: Integer): Boolean;
begin
  if FDesignarCommand = nil then
  begin
    FDesignarCommand := FDBXConnection.CreateCommand;
    FDesignarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDesignarCommand.Text := 'TSMAutoSC.Designar';
    FDesignarCommand.Prepare;
  end;
  FDesignarCommand.Parameters[0].Value.SetWideString(AJustificativa);
  FDesignarCommand.Parameters[1].Value.SetInt32(AIdSetor);
  FDesignarCommand.Parameters[2].Value.SetInt32(AIdUsuario);
  FDesignarCommand.Parameters[3].Value.SetInt32(AIdUsuarioResponsavel);
  FDesignarCommand.Parameters[4].Value.SetInt32(AIdProcesso);
  FDesignarCommand.ExecuteUpdate;
  Result := FDesignarCommand.Parameters[5].Value.GetBoolean;
end;

function TSMAutoSCClient.RegistrarObservacao(AIdProcesso: Integer; AObservacao: string; AIdUsuarioResponsavel: Integer; out ADataHora: TDateTime): Boolean;
begin
  if FRegistrarObservacaoCommand = nil then
  begin
    FRegistrarObservacaoCommand := FDBXConnection.CreateCommand;
    FRegistrarObservacaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRegistrarObservacaoCommand.Text := 'TSMAutoSC.RegistrarObservacao';
    FRegistrarObservacaoCommand.Prepare;
  end;
  FRegistrarObservacaoCommand.Parameters[0].Value.SetInt32(AIdProcesso);
  FRegistrarObservacaoCommand.Parameters[1].Value.SetWideString(AObservacao);
  FRegistrarObservacaoCommand.Parameters[2].Value.SetInt32(AIdUsuarioResponsavel);
  FRegistrarObservacaoCommand.ExecuteUpdate;
  ADataHora := FRegistrarObservacaoCommand.Parameters[3].Value.AsDateTime;
  Result := FRegistrarObservacaoCommand.Parameters[4].Value.GetBoolean;
end;

function TSMAutoSCClient.AlterarStatus(AIdProcesso: Integer; AIdStatus: Integer; AJustificativa: string; AIdUsuarioResponsavel: Integer): Boolean;
begin
  if FAlterarStatusCommand = nil then
  begin
    FAlterarStatusCommand := FDBXConnection.CreateCommand;
    FAlterarStatusCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAlterarStatusCommand.Text := 'TSMAutoSC.AlterarStatus';
    FAlterarStatusCommand.Prepare;
  end;
  FAlterarStatusCommand.Parameters[0].Value.SetInt32(AIdProcesso);
  FAlterarStatusCommand.Parameters[1].Value.SetInt32(AIdStatus);
  FAlterarStatusCommand.Parameters[2].Value.SetWideString(AJustificativa);
  FAlterarStatusCommand.Parameters[3].Value.SetInt32(AIdUsuarioResponsavel);
  FAlterarStatusCommand.ExecuteUpdate;
  Result := FAlterarStatusCommand.Parameters[4].Value.GetBoolean;
end;

function TSMAutoSCClient.HistoricoDeDesignacoes(AIdProcesso: Integer): TJSONArray;
begin
  if FHistoricoDeDesignacoesCommand = nil then
  begin
    FHistoricoDeDesignacoesCommand := FDBXConnection.CreateCommand;
    FHistoricoDeDesignacoesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FHistoricoDeDesignacoesCommand.Text := 'TSMAutoSC.HistoricoDeDesignacoes';
    FHistoricoDeDesignacoesCommand.Prepare;
  end;
  FHistoricoDeDesignacoesCommand.Parameters[0].Value.SetInt32(AIdProcesso);
  FHistoricoDeDesignacoesCommand.ExecuteUpdate;
  Result := TJSONArray(FHistoricoDeDesignacoesCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TSMAutoSCClient.HistoricoDeAtualizacoes(AIdProcesso: Integer): TJSONArray;
begin
  if FHistoricoDeAtualizacoesCommand = nil then
  begin
    FHistoricoDeAtualizacoesCommand := FDBXConnection.CreateCommand;
    FHistoricoDeAtualizacoesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FHistoricoDeAtualizacoesCommand.Text := 'TSMAutoSC.HistoricoDeAtualizacoes';
    FHistoricoDeAtualizacoesCommand.Prepare;
  end;
  FHistoricoDeAtualizacoesCommand.Parameters[0].Value.SetInt32(AIdProcesso);
  FHistoricoDeAtualizacoesCommand.ExecuteUpdate;
  Result := TJSONArray(FHistoricoDeAtualizacoesCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TSMAutoSCClient.ObservacoesDoProcesso(AIdProcesso: Integer): TJSONArray;
begin
  if FObservacoesDoProcessoCommand = nil then
  begin
    FObservacoesDoProcessoCommand := FDBXConnection.CreateCommand;
    FObservacoesDoProcessoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FObservacoesDoProcessoCommand.Text := 'TSMAutoSC.ObservacoesDoProcesso';
    FObservacoesDoProcessoCommand.Prepare;
  end;
  FObservacoesDoProcessoCommand.Parameters[0].Value.SetInt32(AIdProcesso);
  FObservacoesDoProcessoCommand.ExecuteUpdate;
  Result := TJSONArray(FObservacoesDoProcessoCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
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

function TSMAutoSCClient.Usuarios: TJSONArray;
begin
  if FUsuariosCommand = nil then
  begin
    FUsuariosCommand := FDBXConnection.CreateCommand;
    FUsuariosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FUsuariosCommand.Text := 'TSMAutoSC.Usuarios';
    FUsuariosCommand.Prepare;
  end;
  FUsuariosCommand.ExecuteUpdate;
  Result := TJSONArray(FUsuariosCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TSMAutoSCClient.RelatorioDeDesignacoes(AUsaDatas: Boolean; ADataInicial: TDateTime; ADataFinal: TDateTime; ANumeroProceso: string; AIdUsuarioResponsavel: Integer): TJSONArray;
begin
  if FRelatorioDeDesignacoesCommand = nil then
  begin
    FRelatorioDeDesignacoesCommand := FDBXConnection.CreateCommand;
    FRelatorioDeDesignacoesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRelatorioDeDesignacoesCommand.Text := 'TSMAutoSC.RelatorioDeDesignacoes';
    FRelatorioDeDesignacoesCommand.Prepare;
  end;
  FRelatorioDeDesignacoesCommand.Parameters[0].Value.SetBoolean(AUsaDatas);
  FRelatorioDeDesignacoesCommand.Parameters[1].Value.AsDateTime := ADataInicial;
  FRelatorioDeDesignacoesCommand.Parameters[2].Value.AsDateTime := ADataFinal;
  FRelatorioDeDesignacoesCommand.Parameters[3].Value.SetWideString(ANumeroProceso);
  FRelatorioDeDesignacoesCommand.Parameters[4].Value.SetInt32(AIdUsuarioResponsavel);
  FRelatorioDeDesignacoesCommand.ExecuteUpdate;
  Result := TJSONArray(FRelatorioDeDesignacoesCommand.Parameters[5].Value.GetJSONValue(FInstanceOwner));
end;

function TSMAutoSCClient.RelatorioDeEncerramentos(ADataInicial: TDateTime; ADataFinal: TDateTime; AIdUsuarioResponsavel: Integer): TJSONArray;
begin
  if FRelatorioDeEncerramentosCommand = nil then
  begin
    FRelatorioDeEncerramentosCommand := FDBXConnection.CreateCommand;
    FRelatorioDeEncerramentosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRelatorioDeEncerramentosCommand.Text := 'TSMAutoSC.RelatorioDeEncerramentos';
    FRelatorioDeEncerramentosCommand.Prepare;
  end;
  FRelatorioDeEncerramentosCommand.Parameters[0].Value.AsDateTime := ADataInicial;
  FRelatorioDeEncerramentosCommand.Parameters[1].Value.AsDateTime := ADataFinal;
  FRelatorioDeEncerramentosCommand.Parameters[2].Value.SetInt32(AIdUsuarioResponsavel);
  FRelatorioDeEncerramentosCommand.ExecuteUpdate;
  Result := TJSONArray(FRelatorioDeEncerramentosCommand.Parameters[3].Value.GetJSONValue(FInstanceOwner));
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
  FDesignarCommand.DisposeOf;
  FRegistrarObservacaoCommand.DisposeOf;
  FAlterarStatusCommand.DisposeOf;
  FHistoricoDeDesignacoesCommand.DisposeOf;
  FHistoricoDeAtualizacoesCommand.DisposeOf;
  FObservacoesDoProcessoCommand.DisposeOf;
  FTiposDeAuditoriaCommand.DisposeOf;
  FTiposDePrazoCommand.DisposeOf;
  FTiposDePrazoHojeCommand.DisposeOf;
  FTiposDeProcessoCommand.DisposeOf;
  FTiposDeProcessoECommand.DisposeOf;
  FTiposDeStatusCommand.DisposeOf;
  FSetoresCommand.DisposeOf;
  FUsuariosCommand.DisposeOf;
  FRelatorioDeDesignacoesCommand.DisposeOf;
  FRelatorioDeEncerramentosCommand.DisposeOf;
  inherited;
end;

function TSMSiagsClient.Importar(ARegistros: TJSONArray; AIdUsuario: Integer): TJSONObject;
begin
  if FImportarCommand = nil then
  begin
    FImportarCommand := FDBXConnection.CreateCommand;
    FImportarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FImportarCommand.Text := 'TSMSiags.Importar';
    FImportarCommand.Prepare;
  end;
  FImportarCommand.Parameters[0].Value.SetJSONValue(ARegistros, FInstanceOwner);
  FImportarCommand.Parameters[1].Value.SetInt32(AIdUsuario);
  FImportarCommand.ExecuteUpdate;
  Result := TJSONObject(FImportarCommand.Parameters[2].Value.GetJSONValue(FInstanceOwner));
end;

function TSMSiagsClient.FiltrarAutorizacoes(AFiltros: TJSONObject; AIncluirEncerrados: Boolean): TJSONArray;
begin
  if FFiltrarAutorizacoesCommand = nil then
  begin
    FFiltrarAutorizacoesCommand := FDBXConnection.CreateCommand;
    FFiltrarAutorizacoesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarAutorizacoesCommand.Text := 'TSMSiags.FiltrarAutorizacoes';
    FFiltrarAutorizacoesCommand.Prepare;
  end;
  FFiltrarAutorizacoesCommand.Parameters[0].Value.SetJSONValue(AFiltros, FInstanceOwner);
  FFiltrarAutorizacoesCommand.Parameters[1].Value.SetBoolean(AIncluirEncerrados);
  FFiltrarAutorizacoesCommand.ExecuteUpdate;
  Result := TJSONArray(FFiltrarAutorizacoesCommand.Parameters[2].Value.GetJSONValue(FInstanceOwner));
end;

function TSMSiagsClient.Designar(AAutorizacoes: TJSONArray; AJustificativa: string; AIdSetor: Integer; AIdUsuario: Integer; AIdUsuarioResponsavel: Integer; AIdAutorizacao: Integer): Boolean;
begin
  if FDesignarCommand = nil then
  begin
    FDesignarCommand := FDBXConnection.CreateCommand;
    FDesignarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDesignarCommand.Text := 'TSMSiags.Designar';
    FDesignarCommand.Prepare;
  end;
  FDesignarCommand.Parameters[0].Value.SetJSONValue(AAutorizacoes, FInstanceOwner);
  FDesignarCommand.Parameters[1].Value.SetWideString(AJustificativa);
  FDesignarCommand.Parameters[2].Value.SetInt32(AIdSetor);
  FDesignarCommand.Parameters[3].Value.SetInt32(AIdUsuario);
  FDesignarCommand.Parameters[4].Value.SetInt32(AIdUsuarioResponsavel);
  FDesignarCommand.Parameters[5].Value.SetInt32(AIdAutorizacao);
  FDesignarCommand.ExecuteUpdate;
  Result := FDesignarCommand.Parameters[6].Value.GetBoolean;
end;

function TSMSiagsClient.RegistrarObservacao(AIdAutorizacao: Integer; AObservacao: string; AIdUsuarioResponsavel: Integer; out ADataHora: TDateTime): Boolean;
begin
  if FRegistrarObservacaoCommand = nil then
  begin
    FRegistrarObservacaoCommand := FDBXConnection.CreateCommand;
    FRegistrarObservacaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRegistrarObservacaoCommand.Text := 'TSMSiags.RegistrarObservacao';
    FRegistrarObservacaoCommand.Prepare;
  end;
  FRegistrarObservacaoCommand.Parameters[0].Value.SetInt32(AIdAutorizacao);
  FRegistrarObservacaoCommand.Parameters[1].Value.SetWideString(AObservacao);
  FRegistrarObservacaoCommand.Parameters[2].Value.SetInt32(AIdUsuarioResponsavel);
  FRegistrarObservacaoCommand.ExecuteUpdate;
  ADataHora := FRegistrarObservacaoCommand.Parameters[3].Value.AsDateTime;
  Result := FRegistrarObservacaoCommand.Parameters[4].Value.GetBoolean;
end;

function TSMSiagsClient.AlterarStatus(AIdAutorizacao: Integer; AIdStatus: Integer; AJustificativa: string; AIdUsuarioResponsavel: Integer): Boolean;
begin
  if FAlterarStatusCommand = nil then
  begin
    FAlterarStatusCommand := FDBXConnection.CreateCommand;
    FAlterarStatusCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAlterarStatusCommand.Text := 'TSMSiags.AlterarStatus';
    FAlterarStatusCommand.Prepare;
  end;
  FAlterarStatusCommand.Parameters[0].Value.SetInt32(AIdAutorizacao);
  FAlterarStatusCommand.Parameters[1].Value.SetInt32(AIdStatus);
  FAlterarStatusCommand.Parameters[2].Value.SetWideString(AJustificativa);
  FAlterarStatusCommand.Parameters[3].Value.SetInt32(AIdUsuarioResponsavel);
  FAlterarStatusCommand.ExecuteUpdate;
  Result := FAlterarStatusCommand.Parameters[4].Value.GetBoolean;
end;

function TSMSiagsClient.HistoricoDeDesignacoes(AIdAutorizacao: Integer): TJSONArray;
begin
  if FHistoricoDeDesignacoesCommand = nil then
  begin
    FHistoricoDeDesignacoesCommand := FDBXConnection.CreateCommand;
    FHistoricoDeDesignacoesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FHistoricoDeDesignacoesCommand.Text := 'TSMSiags.HistoricoDeDesignacoes';
    FHistoricoDeDesignacoesCommand.Prepare;
  end;
  FHistoricoDeDesignacoesCommand.Parameters[0].Value.SetInt32(AIdAutorizacao);
  FHistoricoDeDesignacoesCommand.ExecuteUpdate;
  Result := TJSONArray(FHistoricoDeDesignacoesCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TSMSiagsClient.HistoricoDeAtualizacoes(AIdAutorizacao: Integer): TJSONArray;
begin
  if FHistoricoDeAtualizacoesCommand = nil then
  begin
    FHistoricoDeAtualizacoesCommand := FDBXConnection.CreateCommand;
    FHistoricoDeAtualizacoesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FHistoricoDeAtualizacoesCommand.Text := 'TSMSiags.HistoricoDeAtualizacoes';
    FHistoricoDeAtualizacoesCommand.Prepare;
  end;
  FHistoricoDeAtualizacoesCommand.Parameters[0].Value.SetInt32(AIdAutorizacao);
  FHistoricoDeAtualizacoesCommand.ExecuteUpdate;
  Result := TJSONArray(FHistoricoDeAtualizacoesCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TSMSiagsClient.ObservacoesDaAutorizacao(AIdAutorizacao: Integer): TJSONArray;
begin
  if FObservacoesDaAutorizacaoCommand = nil then
  begin
    FObservacoesDaAutorizacaoCommand := FDBXConnection.CreateCommand;
    FObservacoesDaAutorizacaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FObservacoesDaAutorizacaoCommand.Text := 'TSMSiags.ObservacoesDaAutorizacao';
    FObservacoesDaAutorizacaoCommand.Prepare;
  end;
  FObservacoesDaAutorizacaoCommand.Parameters[0].Value.SetInt32(AIdAutorizacao);
  FObservacoesDaAutorizacaoCommand.ExecuteUpdate;
  Result := TJSONArray(FObservacoesDaAutorizacaoCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TSMSiagsClient.TiposDeAutoriazacao: TJSONArray;
begin
  if FTiposDeAutoriazacaoCommand = nil then
  begin
    FTiposDeAutoriazacaoCommand := FDBXConnection.CreateCommand;
    FTiposDeAutoriazacaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FTiposDeAutoriazacaoCommand.Text := 'TSMSiags.TiposDeAutoriazacao';
    FTiposDeAutoriazacaoCommand.Prepare;
  end;
  FTiposDeAutoriazacaoCommand.ExecuteUpdate;
  Result := TJSONArray(FTiposDeAutoriazacaoCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TSMSiagsClient.TiposDeAtendimento: TJSONArray;
begin
  if FTiposDeAtendimentoCommand = nil then
  begin
    FTiposDeAtendimentoCommand := FDBXConnection.CreateCommand;
    FTiposDeAtendimentoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FTiposDeAtendimentoCommand.Text := 'TSMSiags.TiposDeAtendimento';
    FTiposDeAtendimentoCommand.Prepare;
  end;
  FTiposDeAtendimentoCommand.ExecuteUpdate;
  Result := TJSONArray(FTiposDeAtendimentoCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TSMSiagsClient.StatusTrue: TJSONArray;
begin
  if FStatusTrueCommand = nil then
  begin
    FStatusTrueCommand := FDBXConnection.CreateCommand;
    FStatusTrueCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FStatusTrueCommand.Text := 'TSMSiags.StatusTrue';
    FStatusTrueCommand.Prepare;
  end;
  FStatusTrueCommand.ExecuteUpdate;
  Result := TJSONArray(FStatusTrueCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TSMSiagsClient.AutorizacoesAtivas: TJSONArray;
begin
  if FAutorizacoesAtivasCommand = nil then
  begin
    FAutorizacoesAtivasCommand := FDBXConnection.CreateCommand;
    FAutorizacoesAtivasCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAutorizacoesAtivasCommand.Text := 'TSMSiags.AutorizacoesAtivas';
    FAutorizacoesAtivasCommand.Prepare;
  end;
  FAutorizacoesAtivasCommand.ExecuteUpdate;
  Result := TJSONArray(FAutorizacoesAtivasCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TSMSiagsClient.Setores(AIdUsuario: Integer): TJSONArray;
begin
  if FSetoresCommand = nil then
  begin
    FSetoresCommand := FDBXConnection.CreateCommand;
    FSetoresCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSetoresCommand.Text := 'TSMSiags.Setores';
    FSetoresCommand.Prepare;
  end;
  FSetoresCommand.Parameters[0].Value.SetInt32(AIdUsuario);
  FSetoresCommand.ExecuteUpdate;
  Result := TJSONArray(FSetoresCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TSMSiagsClient.Usuarios(AIdUsuario: Integer): TJSONArray;
begin
  if FUsuariosCommand = nil then
  begin
    FUsuariosCommand := FDBXConnection.CreateCommand;
    FUsuariosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FUsuariosCommand.Text := 'TSMSiags.Usuarios';
    FUsuariosCommand.Prepare;
  end;
  FUsuariosCommand.Parameters[0].Value.SetInt32(AIdUsuario);
  FUsuariosCommand.ExecuteUpdate;
  Result := TJSONArray(FUsuariosCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TSMSiagsClient.UsuariosDoSetor(AIdSetor: Integer): TJSONArray;
begin
  if FUsuariosDoSetorCommand = nil then
  begin
    FUsuariosDoSetorCommand := FDBXConnection.CreateCommand;
    FUsuariosDoSetorCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FUsuariosDoSetorCommand.Text := 'TSMSiags.UsuariosDoSetor';
    FUsuariosDoSetorCommand.Prepare;
  end;
  FUsuariosDoSetorCommand.Parameters[0].Value.SetInt32(AIdSetor);
  FUsuariosDoSetorCommand.ExecuteUpdate;
  Result := TJSONArray(FUsuariosDoSetorCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TSMSiagsClient.RelatorioDeDesignacoes(AUsaDatas: Boolean; ADataInicial: TDateTime; ADataFinal: TDateTime; ANumeroAutorizacao: string; AIdUsuarioResponsavel: Integer): TJSONArray;
begin
  if FRelatorioDeDesignacoesCommand = nil then
  begin
    FRelatorioDeDesignacoesCommand := FDBXConnection.CreateCommand;
    FRelatorioDeDesignacoesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRelatorioDeDesignacoesCommand.Text := 'TSMSiags.RelatorioDeDesignacoes';
    FRelatorioDeDesignacoesCommand.Prepare;
  end;
  FRelatorioDeDesignacoesCommand.Parameters[0].Value.SetBoolean(AUsaDatas);
  FRelatorioDeDesignacoesCommand.Parameters[1].Value.AsDateTime := ADataInicial;
  FRelatorioDeDesignacoesCommand.Parameters[2].Value.AsDateTime := ADataFinal;
  FRelatorioDeDesignacoesCommand.Parameters[3].Value.SetWideString(ANumeroAutorizacao);
  FRelatorioDeDesignacoesCommand.Parameters[4].Value.SetInt32(AIdUsuarioResponsavel);
  FRelatorioDeDesignacoesCommand.ExecuteUpdate;
  Result := TJSONArray(FRelatorioDeDesignacoesCommand.Parameters[5].Value.GetJSONValue(FInstanceOwner));
end;

function TSMSiagsClient.RelatorioDeEncerramentos(ADataInicial: TDateTime; ADataFinal: TDateTime; AIdUsuarioResponsavel: Integer): TJSONArray;
begin
  if FRelatorioDeEncerramentosCommand = nil then
  begin
    FRelatorioDeEncerramentosCommand := FDBXConnection.CreateCommand;
    FRelatorioDeEncerramentosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRelatorioDeEncerramentosCommand.Text := 'TSMSiags.RelatorioDeEncerramentos';
    FRelatorioDeEncerramentosCommand.Prepare;
  end;
  FRelatorioDeEncerramentosCommand.Parameters[0].Value.AsDateTime := ADataInicial;
  FRelatorioDeEncerramentosCommand.Parameters[1].Value.AsDateTime := ADataFinal;
  FRelatorioDeEncerramentosCommand.Parameters[2].Value.SetInt32(AIdUsuarioResponsavel);
  FRelatorioDeEncerramentosCommand.ExecuteUpdate;
  Result := TJSONArray(FRelatorioDeEncerramentosCommand.Parameters[3].Value.GetJSONValue(FInstanceOwner));
end;

function TSMSiagsClient.DesignacoesPendentes: TJSONArray;
begin
  if FDesignacoesPendentesCommand = nil then
  begin
    FDesignacoesPendentesCommand := FDBXConnection.CreateCommand;
    FDesignacoesPendentesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDesignacoesPendentesCommand.Text := 'TSMSiags.DesignacoesPendentes';
    FDesignacoesPendentesCommand.Prepare;
  end;
  FDesignacoesPendentesCommand.ExecuteUpdate;
  Result := TJSONArray(FDesignacoesPendentesCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TSMSiagsClient.AutorizarDesiganacao(AIdAutorizacao: Integer; AIdSolicitacao: Integer; AAutorizado: Boolean; AIdUsuario: Integer): Boolean;
begin
  if FAutorizarDesiganacaoCommand = nil then
  begin
    FAutorizarDesiganacaoCommand := FDBXConnection.CreateCommand;
    FAutorizarDesiganacaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAutorizarDesiganacaoCommand.Text := 'TSMSiags.AutorizarDesiganacao';
    FAutorizarDesiganacaoCommand.Prepare;
  end;
  FAutorizarDesiganacaoCommand.Parameters[0].Value.SetInt32(AIdAutorizacao);
  FAutorizarDesiganacaoCommand.Parameters[1].Value.SetInt32(AIdSolicitacao);
  FAutorizarDesiganacaoCommand.Parameters[2].Value.SetBoolean(AAutorizado);
  FAutorizarDesiganacaoCommand.Parameters[3].Value.SetInt32(AIdUsuario);
  FAutorizarDesiganacaoCommand.ExecuteUpdate;
  Result := FAutorizarDesiganacaoCommand.Parameters[4].Value.GetBoolean;
end;

constructor TSMSiagsClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;

constructor TSMSiagsClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;

destructor TSMSiagsClient.Destroy;
begin
  FImportarCommand.DisposeOf;
  FFiltrarAutorizacoesCommand.DisposeOf;
  FDesignarCommand.DisposeOf;
  FRegistrarObservacaoCommand.DisposeOf;
  FAlterarStatusCommand.DisposeOf;
  FHistoricoDeDesignacoesCommand.DisposeOf;
  FHistoricoDeAtualizacoesCommand.DisposeOf;
  FObservacoesDaAutorizacaoCommand.DisposeOf;
  FTiposDeAutoriazacaoCommand.DisposeOf;
  FTiposDeAtendimentoCommand.DisposeOf;
  FStatusTrueCommand.DisposeOf;
  FAutorizacoesAtivasCommand.DisposeOf;
  FSetoresCommand.DisposeOf;
  FUsuariosCommand.DisposeOf;
  FUsuariosDoSetorCommand.DisposeOf;
  FRelatorioDeDesignacoesCommand.DisposeOf;
  FRelatorioDeEncerramentosCommand.DisposeOf;
  FDesignacoesPendentesCommand.DisposeOf;
  FAutorizarDesiganacaoCommand.DisposeOf;
  inherited;
end;

function TSMControlPcClient.Importar(ARegistros: TJSONArray; AIdUsuario: Integer): TJSONObject;
begin
  if FImportarCommand = nil then
  begin
    FImportarCommand := FDBXConnection.CreateCommand;
    FImportarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FImportarCommand.Text := 'TSMControlPc.Importar';
    FImportarCommand.Prepare;
  end;
  FImportarCommand.Parameters[0].Value.SetJSONValue(ARegistros, FInstanceOwner);
  FImportarCommand.Parameters[1].Value.SetInt32(AIdUsuario);
  FImportarCommand.ExecuteUpdate;
  Result := TJSONObject(FImportarCommand.Parameters[2].Value.GetJSONValue(FInstanceOwner));
end;

function TSMControlPcClient.FiltrarProtocolos(AFiltros: TJSONObject; AIncluirEncerrados: Boolean): TJSONArray;
begin
  if FFiltrarProtocolosCommand = nil then
  begin
    FFiltrarProtocolosCommand := FDBXConnection.CreateCommand;
    FFiltrarProtocolosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarProtocolosCommand.Text := 'TSMControlPc.FiltrarProtocolos';
    FFiltrarProtocolosCommand.Prepare;
  end;
  FFiltrarProtocolosCommand.Parameters[0].Value.SetJSONValue(AFiltros, FInstanceOwner);
  FFiltrarProtocolosCommand.Parameters[1].Value.SetBoolean(AIncluirEncerrados);
  FFiltrarProtocolosCommand.ExecuteUpdate;
  Result := TJSONArray(FFiltrarProtocolosCommand.Parameters[2].Value.GetJSONValue(FInstanceOwner));
end;

function TSMControlPcClient.Designar(AProtocolos: TJSONArray; AJustificativa: string; AIdSetor: Integer; AIdUsuario: Integer; AIdUsuarioResponsavel: Integer; AIdProtocolo: Integer): Boolean;
begin
  if FDesignarCommand = nil then
  begin
    FDesignarCommand := FDBXConnection.CreateCommand;
    FDesignarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDesignarCommand.Text := 'TSMControlPc.Designar';
    FDesignarCommand.Prepare;
  end;
  FDesignarCommand.Parameters[0].Value.SetJSONValue(AProtocolos, FInstanceOwner);
  FDesignarCommand.Parameters[1].Value.SetWideString(AJustificativa);
  FDesignarCommand.Parameters[2].Value.SetInt32(AIdSetor);
  FDesignarCommand.Parameters[3].Value.SetInt32(AIdUsuario);
  FDesignarCommand.Parameters[4].Value.SetInt32(AIdUsuarioResponsavel);
  FDesignarCommand.Parameters[5].Value.SetInt32(AIdProtocolo);
  FDesignarCommand.ExecuteUpdate;
  Result := FDesignarCommand.Parameters[6].Value.GetBoolean;
end;

function TSMControlPcClient.RegistrarObservacao(AIdProtocolo: Integer; AObservacao: string; AIdUsuarioResponsavel: Integer; out ADataHora: TDateTime): Boolean;
begin
  if FRegistrarObservacaoCommand = nil then
  begin
    FRegistrarObservacaoCommand := FDBXConnection.CreateCommand;
    FRegistrarObservacaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRegistrarObservacaoCommand.Text := 'TSMControlPc.RegistrarObservacao';
    FRegistrarObservacaoCommand.Prepare;
  end;
  FRegistrarObservacaoCommand.Parameters[0].Value.SetInt32(AIdProtocolo);
  FRegistrarObservacaoCommand.Parameters[1].Value.SetWideString(AObservacao);
  FRegistrarObservacaoCommand.Parameters[2].Value.SetInt32(AIdUsuarioResponsavel);
  FRegistrarObservacaoCommand.ExecuteUpdate;
  ADataHora := FRegistrarObservacaoCommand.Parameters[3].Value.AsDateTime;
  Result := FRegistrarObservacaoCommand.Parameters[4].Value.GetBoolean;
end;

function TSMControlPcClient.AlterarStatus(AIdProtocolo: Integer; AIdStatus: Integer; AJustificativa: string; AIdUsuarioResponsavel: Integer): Boolean;
begin
  if FAlterarStatusCommand = nil then
  begin
    FAlterarStatusCommand := FDBXConnection.CreateCommand;
    FAlterarStatusCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAlterarStatusCommand.Text := 'TSMControlPc.AlterarStatus';
    FAlterarStatusCommand.Prepare;
  end;
  FAlterarStatusCommand.Parameters[0].Value.SetInt32(AIdProtocolo);
  FAlterarStatusCommand.Parameters[1].Value.SetInt32(AIdStatus);
  FAlterarStatusCommand.Parameters[2].Value.SetWideString(AJustificativa);
  FAlterarStatusCommand.Parameters[3].Value.SetInt32(AIdUsuarioResponsavel);
  FAlterarStatusCommand.ExecuteUpdate;
  Result := FAlterarStatusCommand.Parameters[4].Value.GetBoolean;
end;

function TSMControlPcClient.HistoricoDeDesignacoes(AIdProtocolo: Integer): TJSONArray;
begin
  if FHistoricoDeDesignacoesCommand = nil then
  begin
    FHistoricoDeDesignacoesCommand := FDBXConnection.CreateCommand;
    FHistoricoDeDesignacoesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FHistoricoDeDesignacoesCommand.Text := 'TSMControlPc.HistoricoDeDesignacoes';
    FHistoricoDeDesignacoesCommand.Prepare;
  end;
  FHistoricoDeDesignacoesCommand.Parameters[0].Value.SetInt32(AIdProtocolo);
  FHistoricoDeDesignacoesCommand.ExecuteUpdate;
  Result := TJSONArray(FHistoricoDeDesignacoesCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TSMControlPcClient.HistoricoDeAtualizacoes(AIdProtocolo: Integer): TJSONArray;
begin
  if FHistoricoDeAtualizacoesCommand = nil then
  begin
    FHistoricoDeAtualizacoesCommand := FDBXConnection.CreateCommand;
    FHistoricoDeAtualizacoesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FHistoricoDeAtualizacoesCommand.Text := 'TSMControlPc.HistoricoDeAtualizacoes';
    FHistoricoDeAtualizacoesCommand.Prepare;
  end;
  FHistoricoDeAtualizacoesCommand.Parameters[0].Value.SetInt32(AIdProtocolo);
  FHistoricoDeAtualizacoesCommand.ExecuteUpdate;
  Result := TJSONArray(FHistoricoDeAtualizacoesCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TSMControlPcClient.ObservacoesDoProtocolo(AIdProtocolo: Integer): TJSONArray;
begin
  if FObservacoesDoProtocoloCommand = nil then
  begin
    FObservacoesDoProtocoloCommand := FDBXConnection.CreateCommand;
    FObservacoesDoProtocoloCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FObservacoesDoProtocoloCommand.Text := 'TSMControlPc.ObservacoesDoProtocolo';
    FObservacoesDoProtocoloCommand.Prepare;
  end;
  FObservacoesDoProtocoloCommand.Parameters[0].Value.SetInt32(AIdProtocolo);
  FObservacoesDoProtocoloCommand.ExecuteUpdate;
  Result := TJSONArray(FObservacoesDoProtocoloCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TSMControlPcClient.Tecnicos: TJSONArray;
begin
  if FTecnicosCommand = nil then
  begin
    FTecnicosCommand := FDBXConnection.CreateCommand;
    FTecnicosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FTecnicosCommand.Text := 'TSMControlPc.Tecnicos';
    FTecnicosCommand.Prepare;
  end;
  FTecnicosCommand.ExecuteUpdate;
  Result := TJSONArray(FTecnicosCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TSMControlPcClient.TiposDeCliente: TJSONArray;
begin
  if FTiposDeClienteCommand = nil then
  begin
    FTiposDeClienteCommand := FDBXConnection.CreateCommand;
    FTiposDeClienteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FTiposDeClienteCommand.Text := 'TSMControlPc.TiposDeCliente';
    FTiposDeClienteCommand.Prepare;
  end;
  FTiposDeClienteCommand.ExecuteUpdate;
  Result := TJSONArray(FTiposDeClienteCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TSMControlPcClient.StatusTrue: TJSONArray;
begin
  if FStatusTrueCommand = nil then
  begin
    FStatusTrueCommand := FDBXConnection.CreateCommand;
    FStatusTrueCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FStatusTrueCommand.Text := 'TSMControlPc.StatusTrue';
    FStatusTrueCommand.Prepare;
  end;
  FStatusTrueCommand.ExecuteUpdate;
  Result := TJSONArray(FStatusTrueCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TSMControlPcClient.ProtocolosAtivos: TJSONArray;
begin
  if FProtocolosAtivosCommand = nil then
  begin
    FProtocolosAtivosCommand := FDBXConnection.CreateCommand;
    FProtocolosAtivosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FProtocolosAtivosCommand.Text := 'TSMControlPc.ProtocolosAtivos';
    FProtocolosAtivosCommand.Prepare;
  end;
  FProtocolosAtivosCommand.ExecuteUpdate;
  Result := TJSONArray(FProtocolosAtivosCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TSMControlPcClient.Setores(AIdUsuario: Integer): TJSONArray;
begin
  if FSetoresCommand = nil then
  begin
    FSetoresCommand := FDBXConnection.CreateCommand;
    FSetoresCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSetoresCommand.Text := 'TSMControlPc.Setores';
    FSetoresCommand.Prepare;
  end;
  FSetoresCommand.Parameters[0].Value.SetInt32(AIdUsuario);
  FSetoresCommand.ExecuteUpdate;
  Result := TJSONArray(FSetoresCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TSMControlPcClient.Usuarios(AIdUsuario: Integer): TJSONArray;
begin
  if FUsuariosCommand = nil then
  begin
    FUsuariosCommand := FDBXConnection.CreateCommand;
    FUsuariosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FUsuariosCommand.Text := 'TSMControlPc.Usuarios';
    FUsuariosCommand.Prepare;
  end;
  FUsuariosCommand.Parameters[0].Value.SetInt32(AIdUsuario);
  FUsuariosCommand.ExecuteUpdate;
  Result := TJSONArray(FUsuariosCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TSMControlPcClient.UsuariosDoSetor(AIdSetor: Integer): TJSONArray;
begin
  if FUsuariosDoSetorCommand = nil then
  begin
    FUsuariosDoSetorCommand := FDBXConnection.CreateCommand;
    FUsuariosDoSetorCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FUsuariosDoSetorCommand.Text := 'TSMControlPc.UsuariosDoSetor';
    FUsuariosDoSetorCommand.Prepare;
  end;
  FUsuariosDoSetorCommand.Parameters[0].Value.SetInt32(AIdSetor);
  FUsuariosDoSetorCommand.ExecuteUpdate;
  Result := TJSONArray(FUsuariosDoSetorCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TSMControlPcClient.RelatorioDeDesignacoes(AUsaDatas: Boolean; ADataInicial: TDateTime; ADataFinal: TDateTime; ANumeroProtocolo: string; AIdUsuarioResponsavel: Integer): TJSONArray;
begin
  if FRelatorioDeDesignacoesCommand = nil then
  begin
    FRelatorioDeDesignacoesCommand := FDBXConnection.CreateCommand;
    FRelatorioDeDesignacoesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRelatorioDeDesignacoesCommand.Text := 'TSMControlPc.RelatorioDeDesignacoes';
    FRelatorioDeDesignacoesCommand.Prepare;
  end;
  FRelatorioDeDesignacoesCommand.Parameters[0].Value.SetBoolean(AUsaDatas);
  FRelatorioDeDesignacoesCommand.Parameters[1].Value.AsDateTime := ADataInicial;
  FRelatorioDeDesignacoesCommand.Parameters[2].Value.AsDateTime := ADataFinal;
  FRelatorioDeDesignacoesCommand.Parameters[3].Value.SetWideString(ANumeroProtocolo);
  FRelatorioDeDesignacoesCommand.Parameters[4].Value.SetInt32(AIdUsuarioResponsavel);
  FRelatorioDeDesignacoesCommand.ExecuteUpdate;
  Result := TJSONArray(FRelatorioDeDesignacoesCommand.Parameters[5].Value.GetJSONValue(FInstanceOwner));
end;

function TSMControlPcClient.RelatorioDeEncerramentos(ADataInicial: TDateTime; ADataFinal: TDateTime; AIdUsuarioResponsavel: Integer): TJSONArray;
begin
  if FRelatorioDeEncerramentosCommand = nil then
  begin
    FRelatorioDeEncerramentosCommand := FDBXConnection.CreateCommand;
    FRelatorioDeEncerramentosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRelatorioDeEncerramentosCommand.Text := 'TSMControlPc.RelatorioDeEncerramentos';
    FRelatorioDeEncerramentosCommand.Prepare;
  end;
  FRelatorioDeEncerramentosCommand.Parameters[0].Value.AsDateTime := ADataInicial;
  FRelatorioDeEncerramentosCommand.Parameters[1].Value.AsDateTime := ADataFinal;
  FRelatorioDeEncerramentosCommand.Parameters[2].Value.SetInt32(AIdUsuarioResponsavel);
  FRelatorioDeEncerramentosCommand.ExecuteUpdate;
  Result := TJSONArray(FRelatorioDeEncerramentosCommand.Parameters[3].Value.GetJSONValue(FInstanceOwner));
end;

function TSMControlPcClient.DesignacoesPendentes: TJSONArray;
begin
  if FDesignacoesPendentesCommand = nil then
  begin
    FDesignacoesPendentesCommand := FDBXConnection.CreateCommand;
    FDesignacoesPendentesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDesignacoesPendentesCommand.Text := 'TSMControlPc.DesignacoesPendentes';
    FDesignacoesPendentesCommand.Prepare;
  end;
  FDesignacoesPendentesCommand.ExecuteUpdate;
  Result := TJSONArray(FDesignacoesPendentesCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TSMControlPcClient.AutorizarDesiganacao(AIdProtocolo: Integer; AIdSolicitacao: Integer; AAutorizado: Boolean; AIdUsuario: Integer): Boolean;
begin
  if FAutorizarDesiganacaoCommand = nil then
  begin
    FAutorizarDesiganacaoCommand := FDBXConnection.CreateCommand;
    FAutorizarDesiganacaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAutorizarDesiganacaoCommand.Text := 'TSMControlPc.AutorizarDesiganacao';
    FAutorizarDesiganacaoCommand.Prepare;
  end;
  FAutorizarDesiganacaoCommand.Parameters[0].Value.SetInt32(AIdProtocolo);
  FAutorizarDesiganacaoCommand.Parameters[1].Value.SetInt32(AIdSolicitacao);
  FAutorizarDesiganacaoCommand.Parameters[2].Value.SetBoolean(AAutorizado);
  FAutorizarDesiganacaoCommand.Parameters[3].Value.SetInt32(AIdUsuario);
  FAutorizarDesiganacaoCommand.ExecuteUpdate;
  Result := FAutorizarDesiganacaoCommand.Parameters[4].Value.GetBoolean;
end;

constructor TSMControlPcClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;

constructor TSMControlPcClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;

destructor TSMControlPcClient.Destroy;
begin
  FImportarCommand.DisposeOf;
  FFiltrarProtocolosCommand.DisposeOf;
  FDesignarCommand.DisposeOf;
  FRegistrarObservacaoCommand.DisposeOf;
  FAlterarStatusCommand.DisposeOf;
  FHistoricoDeDesignacoesCommand.DisposeOf;
  FHistoricoDeAtualizacoesCommand.DisposeOf;
  FObservacoesDoProtocoloCommand.DisposeOf;
  FTecnicosCommand.DisposeOf;
  FTiposDeClienteCommand.DisposeOf;
  FStatusTrueCommand.DisposeOf;
  FProtocolosAtivosCommand.DisposeOf;
  FSetoresCommand.DisposeOf;
  FUsuariosCommand.DisposeOf;
  FUsuariosDoSetorCommand.DisposeOf;
  FRelatorioDeDesignacoesCommand.DisposeOf;
  FRelatorioDeEncerramentosCommand.DisposeOf;
  FDesignacoesPendentesCommand.DisposeOf;
  FAutorizarDesiganacaoCommand.DisposeOf;
  inherited;
end;

function TSMResumosClient.QuadroResumo: TJSONArray;
begin
  if FQuadroResumoCommand = nil then
  begin
    FQuadroResumoCommand := FDBXConnection.CreateCommand;
    FQuadroResumoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FQuadroResumoCommand.Text := 'TSMResumos.QuadroResumo';
    FQuadroResumoCommand.Prepare;
  end;
  FQuadroResumoCommand.ExecuteUpdate;
  Result := TJSONArray(FQuadroResumoCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

constructor TSMResumosClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;

constructor TSMResumosClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;

destructor TSMResumosClient.Destroy;
begin
  FQuadroResumoCommand.DisposeOf;
  inherited;
end;

procedure TSMStatusTrueClient.Incluir;
begin
  if FIncluirCommand = nil then
  begin
    FIncluirCommand := FDBXConnection.CreateCommand;
    FIncluirCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FIncluirCommand.Text := 'TSMStatusTrue.Incluir';
    FIncluirCommand.Prepare;
  end;
  FIncluirCommand.ExecuteUpdate;
end;

function TSMStatusTrueClient.Localizar(AId: Integer): Boolean;
begin
  if FLocalizarCommand = nil then
  begin
    FLocalizarCommand := FDBXConnection.CreateCommand;
    FLocalizarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLocalizarCommand.Text := 'TSMStatusTrue.Localizar';
    FLocalizarCommand.Prepare;
  end;
  FLocalizarCommand.Parameters[0].Value.SetInt32(AId);
  FLocalizarCommand.ExecuteUpdate;
  Result := FLocalizarCommand.Parameters[1].Value.GetBoolean;
end;

function TSMStatusTrueClient.JaExiste(AId: Integer; ADescricao: string): Boolean;
begin
  if FJaExisteCommand = nil then
  begin
    FJaExisteCommand := FDBXConnection.CreateCommand;
    FJaExisteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FJaExisteCommand.Text := 'TSMStatusTrue.JaExiste';
    FJaExisteCommand.Prepare;
  end;
  FJaExisteCommand.Parameters[0].Value.SetInt32(AId);
  FJaExisteCommand.Parameters[1].Value.SetWideString(ADescricao);
  FJaExisteCommand.ExecuteUpdate;
  Result := FJaExisteCommand.Parameters[2].Value.GetBoolean;
end;

procedure TSMStatusTrueClient.Pesquisar(ACampo: Integer; ATipo: Integer; AChave: string; AIncluirInativos: Boolean);
begin
  if FPesquisarCommand = nil then
  begin
    FPesquisarCommand := FDBXConnection.CreateCommand;
    FPesquisarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPesquisarCommand.Text := 'TSMStatusTrue.Pesquisar';
    FPesquisarCommand.Prepare;
  end;
  FPesquisarCommand.Parameters[0].Value.SetInt32(ACampo);
  FPesquisarCommand.Parameters[1].Value.SetInt32(ATipo);
  FPesquisarCommand.Parameters[2].Value.SetWideString(AChave);
  FPesquisarCommand.Parameters[3].Value.SetBoolean(AIncluirInativos);
  FPesquisarCommand.ExecuteUpdate;
end;

constructor TSMStatusTrueClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;

constructor TSMStatusTrueClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;

destructor TSMStatusTrueClient.Destroy;
begin
  FIncluirCommand.DisposeOf;
  FLocalizarCommand.DisposeOf;
  FJaExisteCommand.DisposeOf;
  FPesquisarCommand.DisposeOf;
  inherited;
end;

end.

