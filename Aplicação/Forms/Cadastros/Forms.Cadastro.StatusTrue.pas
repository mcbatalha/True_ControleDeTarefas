unit Forms.Cadastro.StatusTrue;

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
  Vcl.DBCtrls,
  Vcl.Mask,

  Forms.Cadastro,
  Services.StatusTrue,

  Data.DB,

  FrameBotoes;

type
  TfrmCadastroStatusTrue = class(TfrmCadastro)
    Label1: TLabel;
    dbeNome: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    dbePrazo: TDBEdit;
    rdgTipoPrazo: TDBRadioGroup;
    procedure fraBotoesbtnNovoClick(Sender: TObject);
    procedure fraBotoesbtnExcluirClick(Sender: TObject);
    procedure fraBotoesbtnAlterarClick(Sender: TObject);
    procedure fraBotoesbtnPesquisarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure rdgTipoPrazoClick(Sender: TObject);
  private
    FService : TSrvStatusTrue;
  public
    { Public declarations }
  end;

var
  frmCadastroStatusTrue: TfrmCadastroStatusTrue;

implementation

{$R *.dfm}

uses Providers.Cadastros.StatusTrue;

procedure TfrmCadastroStatusTrue.btnCancelarClick(Sender: TObject);
begin
   FService.Cancelar;
   inherited;
end;

procedure TfrmCadastroStatusTrue.btnGravarClick(Sender: TObject);
begin
  if not FService.Gravar then exit;

  inherited;
end;

procedure TfrmCadastroStatusTrue.FormCreate(Sender: TObject);
begin
   inherited;
   FService := TSrvStatusTrue.Create;
end;

procedure TfrmCadastroStatusTrue.FormDestroy(Sender: TObject);
begin
   inherited;
   FreeAndNil(FService);
end;

procedure TfrmCadastroStatusTrue.fraBotoesbtnAlterarClick(Sender: TObject);
begin
   if not FService.Alterar then exit;

   Botoes(True, 'Alteração');
   dbeNome.SetFocus;

   inherited;
end;

procedure TfrmCadastroStatusTrue.fraBotoesbtnExcluirClick(Sender: TObject);
begin
   inherited;
   if not FService.Excluir then exit;

   HabilitarAlterarExcluir(False);
   Botoes(False);
end;

procedure TfrmCadastroStatusTrue.fraBotoesbtnNovoClick(Sender: TObject);
begin
   inherited;
   Botoes(True, 'Inclusão');
   FService.Incluir;
   dbeNome.SetFocus;
end;

procedure TfrmCadastroStatusTrue.fraBotoesbtnPesquisarClick(Sender: TObject);
begin
   inherited;
   HabilitarAlterarExcluir(FService.Pesquisar);
   rdgTipoPrazoClick(Self);
end;

procedure TfrmCadastroStatusTrue.rdgTipoPrazoClick(Sender: TObject);
begin
   inherited;
   dbePrazo.Enabled := rdgTipoPrazo.ItemIndex > 0;

   FService.LimparPrazo(rdgTipoPrazo.ItemIndex = 0);

   if dbePrazo.Enabled then
      dbePrazo.Color := dbeNome.Color
   else
      dbePrazo.Color := clBtnFace;
end;

end.
