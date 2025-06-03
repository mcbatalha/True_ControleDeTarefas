program AppServerControleTarefas;

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  Forms.Principal in 'Forms\Forms.Principal.pas' {frmPrincipal},
  ServerMethods.MetodosGerais in 'ServerMethods\ServerMethods.MetodosGerais.pas' {SMMetodosGerais: TDataModule},
  ServerMethods.Container in 'ServerMethods\ServerMethods.Container.pas' {ServerContainer: TDataModule},
  ServerMethods.Cadastro.Setores in 'ServerMethods\ServerMethods.Cadastro.Setores.pas' {SMSetores: TDSServerModule},
  FuncoesGerais in '..\..\..\Geral\FuncoesGerais.pas',
  uTFuncoesServer in '..\..\..\GeralAppServer\uTFuncoesServer.pas',
  Libs.Constantes in '..\Libs\Libs.Constantes.pas',
  ServerMethods.Cadastro.Usuarios in 'ServerMethods\ServerMethods.Cadastro.Usuarios.pas' {SMUsuarios: TDSServerModule},
  Utils.AtualizacaoBD in 'Utils\Utils.AtualizacaoBD.pas',
  uTTransacao in '..\..\..\GeralAppServer\uTTransacao.pas',
  Funcoes in '..\..\..\GeralAppServer\Funcoes.pas',
  Libs.TSeguranca in '..\Libs\Libs.TSeguranca.pas',
  ServerMethods.AutoSc in 'ServerMethods\ServerMethods.AutoSc.pas' {SMAutoSC: TDSServerModule},
  Libs.TFiltros in '..\Libs\Libs.TFiltros.pas',
  Utils.TFuncoesJSON in 'Utils\Utils.TFuncoesJSON.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TServerContainer, ServerContainer);
  Application.Run;
end.

