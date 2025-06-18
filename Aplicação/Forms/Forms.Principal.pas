unit Forms.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Vcl.Buttons, Proxy.Classes, Vcl.Menus, Vcl.ComCtrls, Forms.Seguranca, Forms.Paineis, Funcoes, Forms.Listagens.Designacoes;

type
  TfrmPrincipal = class(TForm)
    imgLogo: TImage;
    Timer: TTimer;
    BitBtn1: TBitBtn;
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
    mngListagens: TMenuItem;
    mniListagemDesignacoes: TMenuItem;
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
    procedure mniListagemDesignacoesClick(Sender: TObject);
  private
    { Private declarations }
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
     Forms.Importacoes.AutoSc, Forms.Importacoes.Siags, Forms.Importacoes.ControlPc;

procedure TfrmPrincipal.FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer; var Resize: Boolean);
begin
   imgLogo.Top  := round ((frmPrincipal.ClientHeight - imgLogo.Height) / 2);
   imgLogo.Left := round ((frmPrincipal.ClientWidth - imgLogo.Width) / 2);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
var
   frmLogin : TfrmLogin;

   LEncerrar : Boolean;
begin
   Application.CreateForm(TfrmLogin, frmLogin);
   frmLogin.Seguranca := Seguranca;
   frmLogin.ShowModal;
   LEncerrar := frmLogin.Encerrar;
   FreeAndNil(frmLogin);

   if LEncerrar then
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

procedure TfrmPrincipal.mniListagemDesignacoesClick(Sender: TObject);
var
   LForm : TfrmListagemDesignacoes;
begin
   Application.CreateForm(TfrmListagemDesignacoes, LForm);
   LForm.ShowModal;
   FreeAndNil(LForm);
end;

end.
