unit Forms.Cadastro.Usuarios;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.Mask,
  Vcl.DBCtrls,
  Vcl.ComCtrls,

  Forms.Cadastro,

  Data.DB,
  FrameBotoes,

  Providers.Cadastros.Usuarios,
  Services.Usuarios, Funcoes;

type
  TfrmCadastroUsuarios = class(TfrmCadastro)
    pgcUsuarios: TPageControl;
    tbsDadosUsuario: TTabSheet;
    tbsSetores: TTabSheet;
    pnlDados: TPanel;
    Label1: TLabel;
    dbeNome: TDBEdit;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    chbForcarTrocaSenha: TDBCheckBox;
    chbLimparSenha: TCheckBox;
    pnlSetores: TPanel;
    dtsSetores: TDataSource;
    dtsUsuarioSetores: TDataSource;
    btnAssociarSetor: TBitBtn;
    btnDesassociarSetor: TBitBtn;
    Label4: TLabel;
    lsbSetoresCadastrados: TDBLookupListBox;
    Label5: TLabel;
    lsbSetoresAssociados: TDBLookupListBox;
    cmbPerfil: TDBComboBox;
    Label6: TLabel;
    procedure fraBotoesbtnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure fraBotoesbtnExcluirClick(Sender: TObject);
    procedure fraBotoesbtnAlterarClick(Sender: TObject);
    procedure fraBotoesbtnPesquisarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure lsbSetoresAssociadosDblClick(Sender: TObject);
    procedure btnAssociarSetorClick(Sender: TObject);
    procedure btnDesassociarSetorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chbLimparSenhaClick(Sender: TObject);
  private
    { Private declarations }
    FService : TSrvUsuarios;

    procedure Edicao(const AHabilitar : Boolean; const AOpcao : String = '');
  public
    { Public declarations }
  end;

var
  frmCadastroUsuarios: TfrmCadastroUsuarios;

implementation

{$R *.dfm}


procedure TfrmCadastroUsuarios.btnAssociarSetorClick(Sender: TObject);
begin
   inherited;
   FService.AssociarSetor;
end;

procedure TfrmCadastroUsuarios.btnCancelarClick(Sender: TObject);
begin
   pgcUsuarios.ActivePageIndex := 0;
   FService.Cancelar;

   Edicao(False);
   inherited;
end;

procedure TfrmCadastroUsuarios.btnDesassociarSetorClick(Sender: TObject);
begin
   inherited;
   FService.DesassociarSetor;
end;

procedure TfrmCadastroUsuarios.btnGravarClick(Sender: TObject);
begin
   if not FService.Gravar(chbLimparSenha.Checked) then exit;

   if FOpcao = 'I' then
      FService.GravarSeguranca;

   pgcUsuarios.ActivePageIndex := 0;
   Edicao(False);

   inherited;
end;

procedure TfrmCadastroUsuarios.chbLimparSenhaClick(Sender: TObject);
begin
   inherited;

   if not chbLimparSenha.Focused then Exit;

   chbForcarTrocaSenha.Enabled :=  not chbLimparSenha.Checked;
   FService.ForcarTrocaSenha(chbLimparSenha.Checked)
end;

procedure TfrmCadastroUsuarios.Edicao(const AHabilitar: Boolean; const AOpcao : String);
begin
   LimparTela(Self);
   Botoes(AHabilitar);
   pnlDados.Enabled   := AHabilitar;
   pnlSetores.Enabled := AHabilitar;
end;

procedure TfrmCadastroUsuarios.lsbSetoresAssociadosDblClick(Sender: TObject);
begin
   inherited;
   FService.DesassociarSetor;
end;

procedure TfrmCadastroUsuarios.FormCreate(Sender: TObject);
begin
   inherited;
   FService := TSrvUsuarios.Create;
   pgcUsuarios.ActivePageIndex := 0;
end;

procedure TfrmCadastroUsuarios.FormDestroy(Sender: TObject);
begin
  inherited;
   FreeAndNil(FService)

end;

procedure TfrmCadastroUsuarios.FormShow(Sender: TObject);
begin
   inherited;
   Edicao(False);
   pnlCentral.Enabled := true;
end;

procedure TfrmCadastroUsuarios.fraBotoesbtnAlterarClick(Sender: TObject);
begin
   if not FService.Alterar then exit;

   Edicao(True, 'Alteração');
   if dbeNome.CanFocus then
      dbeNome.SetFocus;

   chbForcarTrocaSenha.Enabled := not FService.TrocarSenha;
   chbLimparSenha.Enabled      := not FService.TrocarSenha;

   inherited;
end;

procedure TfrmCadastroUsuarios.fraBotoesbtnExcluirClick(Sender: TObject);
begin
   inherited;

   if not FService.Excluir then exit;

   HabilitarAlterarExcluir(False);
   Botoes(False);
end;

procedure TfrmCadastroUsuarios.fraBotoesbtnNovoClick(Sender: TObject);
begin
   inherited;

   Edicao(True, 'Inclusão');
   FService.Incluir;

   chbForcarTrocaSenha.Enabled := false;
   chbLimparSenha.Enabled      := false;

   if dbeNome.CanFocus then
      dbeNome.SetFocus;
end;

procedure TfrmCadastroUsuarios.fraBotoesbtnPesquisarClick(Sender: TObject);
begin
   inherited;
   HabilitarAlterarExcluir(FService.Pesquisar);
end;

end.
