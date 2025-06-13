program ControleDeTarefas;

uses
  Vcl.Forms,
  MidasLib,
  Proxy.Classes in 'ProxyClasses\Proxy.Classes.pas',
  Funcoes in '..\..\..\GeralAppServer\Funcoes.pas',
  Libs.TSeguranca in '..\Libs\Libs.TSeguranca.pas',
  Forms.SelecaoBancoDados in 'Forms\Forms.SelecaoBancoDados.pas' {frmSelecaoBancoDados},
  Libs.Constantes in '..\Libs\Libs.Constantes.pas',
  FrameBotoes in '..\..\..\GeralAppServer\FrameBotoes.pas' {fraBotoes: TFrame},
  Services.Setores in 'Services\Services.Setores.pas',
  Forms.Cadastro.Setores in 'Forms\Cadastros\Forms.Cadastro.Setores.pas',
  Forms.Cadastro in 'Forms\Cadastros\Forms.Cadastro.pas' {frmCadastro},
  Forms.Pesquisa in 'Forms\Forms.Pesquisa.pas' {frmPesquisa},
  Providers.Connection in 'Providers\Providers.Connection.pas',
  Providers.Cadastros in 'Providers\Models\Providers.Cadastros.pas' {dtmCadastros: TDataModule},
  Forms.Principal in 'Forms\Forms.Principal.pas' {frmPrincipal},
  Providers.Conexao in 'Providers\Providers.Conexao.pas' {dtmConexao: TDataModule},
  Forms.Cadastro.Usuarios in 'Forms\Cadastros\Forms.Cadastro.Usuarios.pas' {frmCadastroUsuarios},
  Providers.Cadastros.Usuarios in 'Providers\Models\Providers.Cadastros.Usuarios.pas' {dtmCadastroUsusarios: TDataModule},
  Services.Usuarios in 'Services\Services.Usuarios.pas',
  Providers.Cadastros.Setores in 'Providers\Models\Providers.Cadastros.Setores.pas' {dtmCadastroSetores: TDataModule},
  Forms.Login in 'Forms\Forms.Login.pas' {frmLogin},
  Services.Login in 'Services\Services.Login.pas',
  Forms.TrocarSenha in 'Forms\Forms.TrocarSenha.pas' {frmTrocarSenha},
  Forms.Base in 'Forms\Forms.Base.pas' {frmBase},
  Forms.Seguranca in 'Forms\Forms.Seguranca.pas' {frmSeguranca},
  Providers.Base in 'Providers\Providers.Base.pas' {dtmBase: TDataModule},
  Providers.Seguranca in 'Providers\Providers.Seguranca.pas' {dtmSeguranca: TDataModule},
  Services.Seguranca in 'Services\Services.Seguranca.pas',
  Util.Menu in 'Utils\Util.Menu.pas',
  Forms.Mensagem in '..\..\..\Geral\Forms.Mensagem.pas' {frmMensagem},
  Providers.Importacoes in 'Providers\Importacoes\Providers.Importacoes.pas' {dtmImportacoes: TDataModule},
  Forms.Importacoes in 'Forms\Importacoes\Forms.Importacoes.pas' {frmImportacoes},
  Providers.Importacoes.AutoSc in 'Providers\Importacoes\Providers.Importacoes.AutoSc.pas' {dtmImportacoesAutoSC: TDataModule},
  Forms.Importacoes.AutoSc in 'Forms\Importacoes\Forms.Importacoes.AutoSc.pas' {frmImportacoesAutoSc},
  Providers.Panels in 'Providers\Panels\Providers.Panels.pas' {dtmPainel: TDataModule},
  Providers.Panels.AutoSC in 'Providers\Panels\Providers.Panels.AutoSC.pas' {dtmPainelAutoSC: TDataModule},
  Services.Panels in 'Services\Panels\Services.Panels.pas',
  Services.Panels.AutoSC in 'Services\Panels\Services.Panels.AutoSC.pas',
  Libs.TFuncoesJSON in '..\Libs\Libs.TFuncoesJSON.pas',
  Libs.TFiltros in '..\Libs\Libs.TFiltros.pas',
  Providers.Panels.Conexao in 'Providers\Panels\Providers.Panels.Conexao.pas' {dtmPaineisConexao: TDataModule},
  Frames.Pesquisa.Usuario in 'Forms\Frames\Frames.Pesquisa.Usuario.pas' {fraPesquisaUsuario: TFrame},
  Forms.Paineis in 'Forms\Forms.Paineis.pas' {frmPaineis},
  Services.Importacao.AutoSc in 'Services\Importacoes\Services.Importacao.AutoSc.pas',
  Services.Panels.Siags in 'Services\Panels\Services.Panels.Siags.pas',
  Providers.Importacoes.Siags in 'Providers\Importacoes\Providers.Importacoes.Siags.pas' {dtmImportacoesSiags: TDataModule},
  Providers.Panels.Siags in 'Providers\Panels\Providers.Panels.Siags.pas' {dtmPainelSiags: TDataModule},
  Forms.Importacoes.Siags in 'Forms\Importacoes\Forms.Importacoes.Siags.pas' {frmImportacoesSiags},
  Services.Importacao.Siags in 'Services\Importacoes\Services.Importacao.Siags.pas',
  Providers.Importacoes.ControlPc in 'Providers\Importacoes\Providers.Importacoes.ControlPc.pas' {dtmImportacoesControlPc: TDataModule},
  Services.Importacao.ControlPc in 'Services\Importacoes\Services.Importacao.ControlPc.pas',
  Forms.Importacoes.ControlPc in 'Forms\Importacoes\Forms.Importacoes.ControlPc.pas' {frmImportacoesControlPc},
  Providers.Panels.ControlPc in 'Providers\Panels\Providers.Panels.ControlPc.pas' {dtmPainelControlPc: TDataModule},
  Services.Panels.ControlPc in 'Services\Panels\Services.Panels.ControlPc.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdtmConexao, dtmConexao);
  Application.CreateForm(TdtmPainelControlPc, dtmPainelControlPc);
  Application.Run;
end.
