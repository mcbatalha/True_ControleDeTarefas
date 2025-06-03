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
  Forms.Cadastro.Setores in 'Forms\Forms.Cadastro.Setores.pas',
  Forms.Cadastro in 'Forms\Forms.Cadastro.pas' {frmCadastro},
  Forms.Pesquisa in 'Forms\Forms.Pesquisa.pas' {frmPesquisa},
  Providers.Connection in 'Providers\Providers.Connection.pas',
  Providers.Cadastros in 'Providers\Models\Providers.Cadastros.pas' {dtmCadastros: TDataModule},
  Forms.Principal in 'Forms\Forms.Principal.pas' {frmPrincipal},
  Providers.Conexao in 'Providers\Providers.Conexao.pas' {dtmConexao: TDataModule},
  Forms.Cadastro.Usuarios in 'Forms\Forms.Cadastro.Usuarios.pas' {frmCadastroUsuarios},
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
  Forms.Importacoes in 'Forms\Forms.Importacoes.pas' {frmImportacoes},
  Providers.Importacoes.AutoSc in 'Providers\Importacoes\Providers.Importacoes.AutoSc.pas' {dtmImportacoesAutoSC: TDataModule},
  Forms.Importacoes.AutoSc in 'Forms\Forms.Importacoes.AutoSc.pas' {frmImportacoesAutoSc},
  Services.Importacao.AutoSc in 'Services\Services.Importacao.AutoSc.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdtmConexao, dtmConexao);
  Application.CreateForm(TfrmMensagem, frmMensagem);
  Application.Run;
end.
