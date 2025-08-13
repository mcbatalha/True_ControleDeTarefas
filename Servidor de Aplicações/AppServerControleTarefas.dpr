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
  Libs.TFuncoesServer in '..\..\..\GeralAppServer\Libs.TFuncoesServer.pas',
  ServerMethods.Cadastro.Usuarios in 'ServerMethods\ServerMethods.Cadastro.Usuarios.pas' {SMUsuarios: TDSServerModule},
  Utils.AtualizacaoBD in 'Utils\Utils.AtualizacaoBD.pas',
  Libs.TTransacao in '..\..\..\GeralAppServer\Libs.TTransacao.pas',
  Funcoes in '..\..\..\GeralAppServer\Funcoes.pas',
  Libs.TSeguranca in '..\Libs\Libs.TSeguranca.pas',
  ServerMethods.AutoSc in 'ServerMethods\ServerMethods.AutoSc.pas' {SMAutoSC: TDSServerModule},
  Libs.TFiltros in '..\Libs\Libs.TFiltros.pas',
  Libs.TFuncoesJSON in '..\Libs\Libs.TFuncoesJSON.pas',
  Utils.TFuncoesServer in 'Utils\Utils.TFuncoesServer.pas',
  Libs.Constantes in '..\Libs\Libs.Constantes.pas',
  ServerMethods.Siags in 'ServerMethods\ServerMethods.Siags.pas' {SMSiags: TDSServerModule},
  ServerMethods.ControlPc in 'ServerMethods\ServerMethods.ControlPc.pas' {SMControlPc: TDSServerModule},
  ServerMethods.Resumos in 'ServerMethods\ServerMethods.Resumos.pas' {SMResumos: TDSServerModule},
  ServerMethods.Cadastro.StatusTrue in 'ServerMethods\ServerMethods.Cadastro.StatusTrue.pas' {SMStatusTrue: TDSServerModule};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TServerContainer, ServerContainer);
  Application.Run;
end.

