unit Forms.Cadastro.Setores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, FrameBotoes, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, Data.DB, Forms.Cadastro, Services.Setores;

type
  TfrmCadastroSetores = class(TfrmCadastro)
    Label1: TLabel;
    dbeNome: TDBEdit;
    Label2: TLabel;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure fraBotoesbtnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure fraBotoesbtnPesquisarClick(Sender: TObject);
    procedure fraBotoesbtnAlterarClick(Sender: TObject);
    procedure fraBotoesbtnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    FService : TSrvSetores;
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

uses Providers.Cadastros.Setores;


procedure TfrmCadastroSetores.btnCancelarClick(Sender: TObject);
begin
   FService.Cancelar;
   inherited;
end;

procedure TfrmCadastroSetores.btnGravarClick(Sender: TObject);
begin
  if not FService.Gravar then exit;

  inherited;
end;

procedure TfrmCadastroSetores.FormCreate(Sender: TObject);
begin
   inherited;
   FService := TSrvSetores.Create;
end;

procedure TfrmCadastroSetores.FormDestroy(Sender: TObject);
begin
   inherited;
   FreeAndNil(FService)
end;

procedure TfrmCadastroSetores.fraBotoesbtnAlterarClick(Sender: TObject);
begin
   if not FService.Alterar then exit;

   Botoes(True, 'Alteração');
   dbeNome.SetFocus;

   inherited;
end;

procedure TfrmCadastroSetores.fraBotoesbtnExcluirClick(Sender: TObject);
begin
   inherited;
   if not FService.Excluir then exit;

   HabilitarAlterarExcluir(False);
   Botoes(False);
end;

procedure TfrmCadastroSetores.fraBotoesbtnNovoClick(Sender: TObject);
begin
   inherited;
   Botoes(True, 'Inclusão');
   FService.Incluir;
   dbeNome.SetFocus;
end;

procedure TfrmCadastroSetores.fraBotoesbtnPesquisarClick(Sender: TObject);
begin
   inherited;
   HabilitarAlterarExcluir(FService.Pesquisar);
end;

end.
