unit Forms.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Vcl.Buttons, Proxy.Classes, Vcl.Menus, Vcl.ComCtrls, Forms.Seguranca, Forms.Paineis, Funcoes, Forms.Relatorios.Designacoes;

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
  private
    { Private declarations }
    FEncerrar : Boolean;
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
     Forms.Resumos.QuadroResumo;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
//   mniQuadroResumoClick(Self);
   if (FEncerrar) or (not mniQuadroResumo.Visible) then  Exit;

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
end;

procedure TfrmPrincipal.FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer; var Resize: Boolean);
begin
   imgLogo.Top  := round ((frmPrincipal.ClientHeight - imgLogo.Height) / 2);
   imgLogo.Left := round ((frmPrincipal.ClientWidth - imgLogo.Width) / 2);
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

procedure TfrmPrincipal.mniCadastroUsuariosClick(Sender: TObject);
var
   LForm : TfrmCadastroUsuarios;
begin
   Application.CreateForm(TfrmCadastroUsuarios, LForm);
   LForm.ShowModal;
   FreeAndNil(LForm);
end;

procedure TfrmPrincipal.mniImportacaoAutoSCClick(Sender: TObject);
var
   LForm : TfrmImportacoesAutoSc;
begin
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

end.
