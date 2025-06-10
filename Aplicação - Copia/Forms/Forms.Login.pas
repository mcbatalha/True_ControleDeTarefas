unit Forms.Login;

interface

uses
  Libs.TSeguranca,

  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,
  System.JSON,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Imaging.pngimage,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.Imaging.jpeg,
  Vcl.ComCtrls,

  Proxy.Classes,
  Services.Login;

type
  TfrmLogin = class(TForm)
    pnlForm: TPanel;
    Image1: TImage;
    pnlUsuario: TPanel;
    Label1: TLabel;
    edtLogin: TEdit;
    pnlSenha: TPanel;
    Label2: TLabel;
    edtSenha: TEdit;
    pnlLogin: TPanel;
    pnlAlterarSenha: TPanel;
    pnlEncerrar: TPanel;
    btnLogin: TSpeedButton;
    btnAlterarSenha: TSpeedButton;
    btnEncerrar: TSpeedButton;
    StatusBar: TStatusBar;
    cmbAmbiente: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEncerrarClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure btnAlterarSenhaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }

    FService   : TSrvLogin;
    FSeguranca : TSeguranca;
    FEncerrar  : Boolean;
    FServiceCriado : Boolean;


    procedure ConectarBancoDeDados;
    procedure AlterarSenha;

  public
    { Public declarations }
    Logou : boolean;

    property Seguranca: TSeguranca read FSeguranca write FSeguranca;
    property Encerrar : Boolean read FEncerrar write FEncerrar ;

  end;

var
  frmLogin : TfrmLogin;


implementation
{$R *.DFM}

uses Forms.Principal,
     Forms.SelecaoBancoDados,
     Forms.TrocarSenha,
     Funcoes,
     Libs.Constantes;


procedure TfrmLogin.FormShow(Sender: TObject);
begin
   Logou := False;
   edtSenha.Text := '';
   edtLogin.Text := '';

   if (UpperCase(NomeDoComputador) <> 'NOTE-MCCB') and (UpperCase(NomeDoComputador) <> 'L007525') then
      cmbAmbiente.ItemIndex := cmbAmbiente.Items.IndexOf(C_AMBIENTE_PRODUCAO)
   else
      cmbAmbiente.ItemIndex := cmbAmbiente.Items.IndexOf(C_AMBIENTE_DESENVOLVIMENTO);

   StatusBar.Panels[0].Text := 'Versão: ' + FormatdateTime('yymmdd"-"hhmm', FileDateToDateTime(FileAge(Application.ExeName)));
   edtLogin.setfocus;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if FSeguranca.id = 0 then
      FEncerrar := True;

//   FService.DesConectar;

end;

procedure TfrmLogin.btnEncerrarClick(Sender: TObject);
begin
   FEncerrar := True;
   Close;
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
begin
   ConectarBancoDeDados;

   if not FService.Login(edtLogin.Text, edtSenha.Text) then
      begin
      edtLogin.SetFocus;
      Exit;
   end;

   if Seguranca.UltimoAcesso <> '' then
      frmPrincipal.StatusBar.Panels[0].Text := 'Usuário: ' + Seguranca.nome + ' - Último acesso: ' + Seguranca.ultimoAcesso
   else
      frmPrincipal.StatusBar.Panels[0].Text := 'Usuário: ' + Seguranca.nome;

   if Seguranca.TrocarSenha then
      begin
      AlterarSenha;
      if Seguranca.TrocarSenha then
         Close;
      end
   else
      if Seguranca.id <> 0 then
         Close;
end;

procedure TfrmLogin.AlterarSenha;
begin
   frmTrocarSenha := TfrmTrocarSenha.create(self, FService, Seguranca.TrocarSenha);
   frmTrocarSenha.showmodal;
   FreeAndNil(frmTrocarSenha);
end;

procedure TfrmLogin.btnAlterarSenhaClick(Sender: TObject);
begin
   ConectarBancoDeDados;

   FService.Login(edtLogin.Text, edtSenha.Text);
   if Seguranca.id <> 0 then
      begin
      AlterarSenha;
      Close;
   end;

end;

procedure TfrmLogin.ConectarBancoDeDados;
var
   LForm : TfrmSelecaoBancoDados;
begin
   Application.CreateForm(TfrmSelecaoBancoDados, LForm);

   if cmbAmbiente.Text = C_AMBIENTE_DESENVOLVIMENTO then
      LForm.btnAmbienteDesenvolvimentoClick(Self)
   else
      LForm.btnAmbienteProducaoClick(Self);

//   FService.Conectar;

   if not FServiceCriado then
      begin
      FService := TSrvLogin.Create;
      FService.Conectar;
      FServiceCriado := True;
   end;

   FreeAndNil(LForm);

end;


procedure TfrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = chr(13) then
      begin
      if edtSenha.Focused then
         btnLoginClick(Self)
      else
         begin
         perform(wm_nextdlgctl,0,0);  {ativa API do windows para mudar para o próximo campo}
         key:=chr(0);                 {tecla recebe 0}
      end;
   end;
end;

procedure TfrmLogin.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
const
   sc_DragMove = $f012;
begin
   // Mover Tela - MoverTela
   // Mover Form - MoverForm
   ReleaseCapture;
   Perform(wm_SysCommand, sc_DragMove, 0);
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
//   FService  := TSrvLogin.Create;
   FServiceCriado := False;
   FEncerrar      := False;
end;

procedure TfrmLogin.FormDestroy(Sender: TObject);
begin
   FreeAndNil(FService);
end;

procedure TfrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   Case Key of
      VK_ESCAPE : btnEncerrarClick(self);
      VK_F2 : btnLoginClick(self);
      VK_F3 : btnAlterarSenhaClick(self);
   else
      begin
         if (Shift = [ssCtrl]) and (Key = Ord('D')) then
            begin
            cmbAmbiente.ItemIndex := cmbAmbiente.Items.IndexOf(C_AMBIENTE_DESENVOLVIMENTO);
            cmbAmbiente.Visible := True;
            frmPrincipal.lblAmbiente.Visible := False;
         end else if (Shift = [ssCtrl]) and (Key = Ord('H')) then
            begin
            cmbAmbiente.ItemIndex := cmbAmbiente.Items.IndexOf(C_AMBIENTE_HOMOLOGACAO);
            cmbAmbiente.Visible := True;
            frmPrincipal.lblAmbiente.Visible := True;
            Key := 0;
         end else if (Shift = [ssCtrl]) and (Key = Ord('P')) then
            begin
            cmbAmbiente.ItemIndex := cmbAmbiente.Items.IndexOf(C_AMBIENTE_PRODUCAO);
            cmbAmbiente.Visible := True;
            frmPrincipal.lblAmbiente.Visible := False;
         end;
         Key := 0;
      end;
   end;
end;

end.
