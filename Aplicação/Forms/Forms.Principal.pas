unit Forms.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.JSON,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage, SyncObjs,
  Vcl.StdCtrls, Vcl.Buttons, Proxy.Classes, Vcl.Menus, Vcl.ComCtrls, Forms.Seguranca, Forms.Paineis, Funcoes, Forms.Relatorios.Designacoes, Forms.Designacoes.Pendentes;

type
  TThreadDesignacoes = class(TThread)
     public
       constructor Create;
       destructor Destroy; override;

     private
        FTerminateEvent: TEvent;
     protected
       procedure Execute; override;
       procedure VerificarDesignacoes;
  end;

type
  TfrmPrincipal = class(TForm)
    imgLogo: TImage;
    Timer: TTimer;
    MainMenu1: TMainMenu;
    mngCadastros: TMenuItem;
    mniCadastroSetores: TMenuItem;
    mniCadastroUsuarios: TMenuItem;
    StatusBar: TStatusBar;
    lblAmbiente: TLabel;
    mngManutencaoSistema: TMenuItem;
    mniSeguranca: TMenuItem;
    mngImportaoPlanilhas: TMenuItem;
    mniImportacaoAutoSC: TMenuItem;
    mniImportacaoSiags: TMenuItem;
    mniPainelAcompanhamento: TMenuItem;
    mniSair: TMenuItem;
    mniImportacaoControlPc: TMenuItem;
    mngPaineis: TMenuItem;
    mngRelatorios: TMenuItem;
    mniRelatorioDesignacoes: TMenuItem;
    mniRelatorioEncerramentos: TMenuItem;
    mniRelatorioExtrato: TMenuItem;
    mniQuadroResumo: TMenuItem;
    N1: TMenuItem;
    pnlBotoes: TPanel;
    btnImportacaoAutoSc: TSpeedButton;
    btnImportacaoSiags: TSpeedButton;
    btnImportacaoControlPc: TSpeedButton;
    btnPainelAcompanhamento: TSpeedButton;
    btnQuadroResumo: TSpeedButton;
    btnSair: TSpeedButton;
    mniCadastroStatusTrue: TMenuItem;
    mngExportacaoDados: TMenuItem;
    mniExportacaoAutoSc: TMenuItem;
    mniExportacaoSiags: TMenuItem;
    mniExportacaoControlPC: TMenuItem;
    N2: TMenuItem;
    mniExportacaoSetores: TMenuItem;
    mniExportacaoUsuarios: TMenuItem;
    mniPainelDesigancoesPendentes: TMenuItem;
    btnDesignacoesPendentes: TSpeedButton;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer; var Resize: Boolean);
    procedure mniCadastroSetoresClick(Sender: TObject);
    procedure mniCadastroUsuariosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mniSegurancaClick(Sender: TObject);
    procedure mniImportacaoAutoSCClick(Sender: TObject);
    procedure mniPainelAcompanhamentoClick(Sender: TObject);
    procedure mniSairClick(Sender: TObject);
    procedure mniImportacaoSiagsClick(Sender: TObject);
    procedure mniImportacaoControlPcClick(Sender: TObject);
    procedure mniRelatorioDesignacoesClick(Sender: TObject);
    procedure mniRelatorioEncerramentosClick(Sender: TObject);
    procedure mniRelatorioExtratoClick(Sender: TObject);
    procedure mniQuadroResumoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mniCadastroStatusTrueClick(Sender: TObject);
    procedure mniExportacaoSiagsClick(Sender: TObject);
    procedure mniExportacaoAutoScClick(Sender: TObject);
    procedure mniExportacaoControlPCClick(Sender: TObject);
    procedure mniExportacaoSetoresClick(Sender: TObject);
    procedure mniExportacaoUsuariosClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure mniPainelDesigancoesPendentesClick(Sender: TObject);
  private
    { Private declarations }
    FEncerrar          : Boolean;
    FInicializacao     : Boolean;
    FCriouThread       : Boolean;
    FThreadDesignacoes : TThreadDesignacoes;

    procedure ExportacaoDeDados(const ATipo : integer);

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses Forms.Cadastro.Setores,
     Forms.Cadastro.Usuarios,
     Libs.TSeguranca,
     Forms.Login,
     Forms.Importacoes.AutoSc,
     Forms.Importacoes.Siags,
     Forms.Importacoes.ControlPc,
     Forms.Relatorios.Encerramentos,
     Forms.Relatorios.Extrato,
     Forms.Resumos.QuadroResumo, Forms.Cadastro.StatusTrue, Services.Exportacoes, Libs.Constantes, Providers.Conexao;

procedure TfrmPrincipal.ExportacaoDeDados(const ATipo: integer);
var
   LService : TSrvExportacoes;
begin
   try
      LService := TSrvExportacoes.Create;
      LService.Exportar(ATipo);
   finally
      FreeAndNil(LService);
   end;
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
//   mniQuadroResumoClick(Self);
   if (FEncerrar) or (not mniQuadroResumo.Visible) or (not FInicializacao) then  Exit;

   TThread.CreateAnonymousThread(
      procedure
         begin
         TThread.Synchronize(nil,
          procedure
            begin
            mniQuadroResumoClick(Self);
          end
        );
      end
    ).Start;
   FInicializacao := False;

   if (Seguranca.Perfil <> C_PERFIL_USUARIO) and (not FCriouThread) then
      begin
      FThreadDesignacoes := TThreadDesignacoes.Create;
      FCriouThread := True;
   end;
end;

procedure TfrmPrincipal.FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer; var Resize: Boolean);
begin
   imgLogo.Top  := round ((frmPrincipal.ClientHeight - imgLogo.Height) / 2);
   imgLogo.Left := round ((frmPrincipal.ClientWidth - imgLogo.Width) / 2);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
   FInicializacao := True;
   FCriouThread   := False;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
   if Assigned(FThreadDesignacoes) then
      begin
      FThreadDesignacoes.Terminate;
      FThreadDesignacoes.FTerminateEvent.SetEvent;
      FThreadDesignacoes.WaitFor;
      FThreadDesignacoes.Free;
      FThreadDesignacoes := nil;
   end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
var
   frmLogin : TfrmLogin;
begin
   Application.CreateForm(TfrmLogin, frmLogin);
   frmLogin.Seguranca := Seguranca;
   frmLogin.ShowModal;
   FEncerrar := frmLogin.Encerrar;
   FreeAndNil(frmLogin);

   if FEncerrar then
      begin
      Application.Terminate;
      Exit;
   end;
end;

procedure TfrmPrincipal.mniSairClick(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TfrmPrincipal.mniSegurancaClick(Sender: TObject);
var
   LForm : TfrmSeguranca;
begin
   Application.CreateForm(TfrmSeguranca, LForm);
   LForm.ShowModal;
   FreeAndNil(LForm);
end;

procedure TfrmPrincipal.mniPainelDesigancoesPendentesClick(Sender: TObject);
var
   LForm : TfrmDesignacoesPendentes;
begin
   if (not Seguranca.PodeAUTOSC) and (not Seguranca.PodeSIAGS) and (not Seguranca.PodeCONTROLPC) then
      begin
      InformationMessage('Usuário não habilitado para processos (AUTOSC, SIAGS ou CONTROLPC).','Controle de Tarefas');
      Exit;
   end;

   Application.CreateForm(TfrmDesignacoesPendentes, LForm);
   LForm.ShowModal;
   FreeAndNil(LForm);
end;

procedure TfrmPrincipal.mniPainelAcompanhamentoClick(Sender: TObject);
var
   LForm : TfrmPaineis;
begin
   if (not Seguranca.PodeAUTOSC) and (not Seguranca.PodeSIAGS) and (not Seguranca.PodeCONTROLPC) then
      begin
      InformationMessage('Usuário não habilitado para processos (AUTOSC, SIAGS ou CONTROLPC).','Controle de Tarefas');
      Exit;
   end;


   Application.CreateForm(TfrmPaineis, LForm);
   LForm.ShowModal;
   FreeAndNil(LForm);
end;

procedure TfrmPrincipal.mniQuadroResumoClick(Sender: TObject);
var
   LForm   : TfrmQuadroResumo;
   LAltura : Integer;
begin
   Application.CreateForm(TfrmQuadroResumo, LForm);
   LAltura := frmPrincipal.ClientHeight-50;
   LForm.Height := LAltura;
   LForm.ShowModal;
   FreeAndNil(LForm);
end;

procedure TfrmPrincipal.mniCadastroSetoresClick(Sender: TObject);
var
   LForm : TfrmCadastroSetores;
begin
   Application.CreateForm(TfrmCadastroSetores, LForm);
   LForm.ShowModal;
   FreeAndNil(LForm);
end;

procedure TfrmPrincipal.mniCadastroStatusTrueClick(Sender: TObject);
var
   LForm : TfrmCadastroStatusTrue;
begin
   Application.CreateForm(TfrmCadastroStatusTrue, LForm);
   LForm.ShowModal;
   FreeAndNil(LForm);
end;

procedure TfrmPrincipal.mniCadastroUsuariosClick(Sender: TObject);
var
   LForm : TfrmCadastroUsuarios;
begin
   Application.CreateForm(TfrmCadastroUsuarios, LForm);
   LForm.ShowModal;
   FreeAndNil(LForm);
end;

procedure TfrmPrincipal.mniExportacaoAutoScClick(Sender: TObject);
begin
   InformationMessage('Em manutenção','AUTOSC');
end;

procedure TfrmPrincipal.mniExportacaoControlPCClick(Sender: TObject);
begin
   ExportacaoDeDados(C_TIPO_EXPORTACAO_CONTROLPC);
end;

procedure TfrmPrincipal.mniExportacaoSetoresClick(Sender: TObject);
begin
   ExportacaoDeDados(C_TIPO_EXPORTACAO_SETORES);
end;

procedure TfrmPrincipal.mniExportacaoSiagsClick(Sender: TObject);
begin
   ExportacaoDeDados(C_TIPO_EXPORTACAO_SIAGS);
end;

procedure TfrmPrincipal.mniExportacaoUsuariosClick(Sender: TObject);
begin
   ExportacaoDeDados(C_TIPO_EXPORTACAO_USUARIOS);
end;

procedure TfrmPrincipal.mniImportacaoAutoSCClick(Sender: TObject);
var
   LForm : TfrmImportacoesAutoSc;
begin
   InformationMessage('Em manutenção','AutoSc');
   Exit;

   Application.CreateForm(TfrmImportacoesAutoSc, LForm);
   LForm.ShowModal;
   FreeAndNil(LForm);
end;

procedure TfrmPrincipal.mniImportacaoControlPcClick(Sender: TObject);
var
   LForm : TfrmImportacoesControlPc;
begin
   Application.CreateForm(TfrmImportacoesControlPc, LForm);
   LForm.ShowModal;
   FreeAndNil(LForm);
end;

procedure TfrmPrincipal.mniImportacaoSiagsClick(Sender: TObject);
var
   LForm : TfrmImportacoesSiags;
begin
   Application.CreateForm(TfrmImportacoesSiags, LForm);
   LForm.ShowModal;
   FreeAndNil(LForm);
end;

procedure TfrmPrincipal.mniRelatorioDesignacoesClick(Sender: TObject);
var
   LForm : TfrmRelatorioDesignacoes;
begin
   Application.CreateForm(TfrmRelatorioDesignacoes, LForm);
   LForm.ShowModal;
   FreeAndNil(LForm);
end;

procedure TfrmPrincipal.mniRelatorioEncerramentosClick(Sender: TObject);
var
   LForm : TfrmRelatorioEncerramentos;
begin
   Application.CreateForm(TfrmRelatorioEncerramentos, LForm);
   LForm.ShowModal;
   FreeAndNil(LForm);
end;

procedure TfrmPrincipal.mniRelatorioExtratoClick(Sender: TObject);
var
   LForm : TfrmRelatorioExtrato;
begin
   Application.CreateForm(TfrmRelatorioExtrato, LForm);
   LForm.ShowModal;
   FreeAndNil(LForm);
end;

{ TThreadDesignacoes }

constructor TThreadDesignacoes.create;
begin
   inherited Create(False);
   FreeOnTerminate := False;
   FTerminateEvent := TEvent.Create(nil, True, False, '');
end;

destructor TThreadDesignacoes.destroy;
begin
   FTerminateEvent.Free;
   inherited;
end;

procedure TThreadDesignacoes.Execute;
begin
   inherited;
   while not Terminated do
      begin
      Synchronize(VerificarDesignacoes);
      if FTerminateEvent.WaitFor(5 * 60 * 1000) = wrSignaled then
         Break;
   end;
end;


procedure TThreadDesignacoes.VerificarDesignacoes;
var
   LService  : TSMMetodosGeraisClient;
   Ldm       : TdtmConexao;
   LMensagem : String;
   LTipo     : String;
   LQtd      : Integer;

   LRetorno  : TJSONArray;
   LObjeto   : TJSONObject;
   I         : Integer;
begin
   try
      Application.CreateForm(TdtmConexao, Ldm);
      Ldm.SQLConnection.Connected := True;

      LService := TSMMetodosGeraisClient.Create(Ldm.SQLConnection.DBXConnection);
      LRetorno := LService.DesignacoesPendentes(Seguranca.id);

     if (LRetorno <> nil) and (LRetorno.Count > 0) then
        begin
        LMensagem := 'Existem designações pendentes de autoriazação' + chr(13);

        for I := 0 to LRetorno.Count - 1 do
           begin
           LObjeto := LRetorno.Items[I] as TJSONObject;

           LTipo := LObjeto.GetValue<string>('Tipo');
           LQtd  := LObjeto.GetValue<Integer>('Qtd');

           LMensagem := LMensagem + Format('- %s: %d%s', [LTipo, LQtd, sLineBreak]);
        end;

        InformationMessage(LMensagem, 'Atenção');
     end;

   finally
     Ldm.SQLConnection.Connected := False;
     FreeAndNil(LService);
     FreeAndNil(Ldm);
   end;
end;

end.
