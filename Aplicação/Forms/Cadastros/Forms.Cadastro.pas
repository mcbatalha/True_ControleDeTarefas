unit Forms.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FrameBotoes, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Funcoes, Data.DB;

type
  TfrmCadastro = class(TForm)
    pnlForm: TPanel;
    fraBotoes: TfraBotoes;
    pnlBotoes: TPanel;
    pnlCentral: TPanel;
    pnlOpcao: TPanel;
    dtsCadastro: TDataSource;
    Panel1: TPanel;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    procedure fraBotoes1btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure fraBotoesbtnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure fraBotoesbtnAlterarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  protected
    { Private declarations }

    procedure Botoes(const AHabilitar : Boolean; const AOperacao : String = '');
    procedure HabilitarAlterarExcluir(const AHabilitar : Boolean);
  private
  public
    { Public declarations }
     FOpcao : Char;
  end;
(*
var
  frmCadastro: TfrmCadastro;
*)
implementation

{$R *.dfm}

procedure TfrmCadastro.Botoes(const AHabilitar: Boolean; const AOperacao : String);
begin

   pnlCentral.Enabled  := AHabilitar;

   btnGravar.Enabled   := AHabilitar;
   btnCancelar.enabled := AHabilitar;    {habilita / desabilita o Btn_Cancelar}

   fraBotoes.btnNovo.Enabled      := not AHabilitar;
   fraBotoes.btnPesquisar.enabled := not AHabilitar;      {habilita / desabilita o Frame_Botoes1.Btn_Novo}
   fraBotoes.btnSair.enabled      := not AHabilitar;      {habilita / desabilita o Frame_Botoes1.Btn_Sair}

   pnlOpcao.Caption := AOperacao;

end;

procedure TfrmCadastro.btnCancelarClick(Sender: TObject);
begin
   Botoes(False);
   HabilitarAlterarExcluir(False);
end;

procedure TfrmCadastro.btnGravarClick(Sender: TObject);
begin
   Botoes(False);
   HabilitarAlterarExcluir(False);
   FOpcao := 'Z';
end;

procedure TfrmCadastro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if not fraBotoes.btnSair.enabled then Abort;
end;

procedure TfrmCadastro.FormCreate(Sender: TObject);
begin
   LimparTela(Self);
end;

procedure TfrmCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
   Case Key of
      Chr(39) : Key := chr(180);

      Chr(13) : begin
         perform(wm_nextdlgctl,0,0);  {ativa API do windows para mudar para o próximo campo}
         key:=Chr(0);                 {tecla recebe 0}
      end;
   end;
end;

procedure TfrmCadastro.FormShow(Sender: TObject);
begin
   Botoes(False);
end;

procedure TfrmCadastro.fraBotoes1btnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmCadastro.fraBotoesbtnAlterarClick(Sender: TObject);
begin
   HabilitarAlterarExcluir(False);
   FOpcao := 'A';
end;

procedure TfrmCadastro.fraBotoesbtnNovoClick(Sender: TObject);
begin
   HabilitarAlterarExcluir(False);
   FOpcao := 'I';
end;

procedure TfrmCadastro.HabilitarAlterarExcluir(const AHabilitar: Boolean);
begin
   fraBotoes.btnAlterar.Enabled := AHabilitar;
   fraBotoes.btnExcluir.Enabled := AHabilitar;
end;

end.
