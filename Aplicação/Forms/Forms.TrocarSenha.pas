unit Forms.TrocarSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.Buttons,
  Proxy.Classes, Services.Login;

type
  TfrmTrocarSenha = class(TForm)
    Panel1: TPanel;
    pnlUsuario: TPanel;
    Label1: TLabel;
    edtSenha: TEdit;
    pnlSenha: TPanel;
    Label2: TLabel;
    edtConfirmacao: TEdit;
    Image1: TImage;
    pnlMensagem: TPanel;
    pnlAlterarSenha: TPanel;
    btnAlterarSenha: TSpeedButton;
    pnlEncerrar: TPanel;
    btnCancelar: TSpeedButton;
    procedure btnAlterarSenhaClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
     FService      : TSrvLogin;
     FTrocarSenha  : Boolean;
    { Private declarations }
  public
    { Public declarations }

    constructor create(AOwner : TComponent; AService: TSrvLogin; ATrocarSenha : Boolean);
    destructor destroy();
  end;

(*
var
  frmTrocarSenha: TfrmTrocarSenha;
*)


implementation

{$R *.dfm}

uses Funcoes;

procedure TfrmTrocarSenha.btnAlterarSenhaClick(Sender: TObject);
begin
   if FService.AlterarSenha(edtSenha.Text, edtConfirmacao.Text) then
      Close
   else
      edtSenha.SetFocus;
end;

procedure TfrmTrocarSenha.btnCancelarClick(Sender: TObject);
begin
   if FTrocarSenha then
      begin
       if QuestionMessage('Não é possível acessar o sistema sem realizar a alteração da senha de acesso. Deseja encerrar ?','Controle de Tarefas') then
          Application.Terminate;
   end else
      begin
      Close;
   end;
end;

constructor TfrmTrocarSenha.create(AOwner : TComponent; AService: TSrvLogin; ATrocarSenha : Boolean);
begin
   inherited create(AOwner);
   FService     := AService;
   FTrocarSenha := ATrocarSenha;
end;

destructor TfrmTrocarSenha.destroy;
begin

end;

procedure TfrmTrocarSenha.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = chr(13) then
      begin
      if (edtConfirmacao.Focused) then
         btnAlterarSenhaClick(Self)
      else
         begin
         perform(wm_nextdlgctl,0,0);  {ativa API do windows para mudar para o próximo campo}
         key:=chr(0);                 {tecla recebe 0}
      end;
   end;
end;

procedure TfrmTrocarSenha.FormShow(Sender: TObject);
begin
   if FTrocarSenha then
      pnlMensagem.Caption := 'É necessário trocar a sua senha de acesso'
   else
      pnlMensagem.Caption := 'Alteração de senha';
end;

end.
