unit Forms.Principal;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, ServerMethods.Container, Vcl.ExtCtrls, FuncoesGerais;

type
  TfrmPrincipal = class(TForm)
    pnForm: TPanel;
    pnAmbiente: TPanel;
    pnBotoes: TPanel;
    btnDesenvolvimento: TBitBtn;
    btnProducao: TBitBtn;
    btnParar: TBitBtn;
    pnStatus: TPanel;
    lblStatus: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    lblDataHora: TLabel;
    Label3: TLabel;
    lblBD: TLabel;
    Label4: TLabel;
    lblConexoes: TLabel;
    Label5: TLabel;
    lsbIps: TListBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure btnDesenvolvimentoClick(Sender: TObject);
    procedure btnProducaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPararClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }

    FConexoes : integer;

    function InciciarServicoDataSnap : Boolean;
    function ConfigurarAcessoAoBanco(const AAmbiente : integer) : Boolean;
    procedure StatusDoServidor(const AStatus : integer);

    procedure ConectarBancoDeDados(const AConectar : integer);

  public
    { Public declarations }
    procedure AtualizarListaDeConexoes(const AAcao : integer; const AIP : String);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses Utils.AtualizacaoBD, Funcoes;

procedure TfrmPrincipal.btnPararClick(Sender: TObject);
begin
   ServerContainer.DSServer.Stop;
   StatusDoServidor(0);
   ConectarBancoDeDados(0);
end;

procedure TfrmPrincipal.AtualizarListaDeConexoes(const AAcao: integer; const AIP: String);
var
   LLinha : String;
begin
   if AAcao = 0 then
      begin
      FConexoes := FConexoes - 1;
      lsbIps.Items.delete(lsbIps.Items.IndexOf(AIP));
   end else
      begin
      FConexoes := FConexoes + 1;
      lsbIps.Items.Add(AIp);
   end;
   lblConexoes.Caption := inttostr(FConexoes);
end;

procedure TfrmPrincipal.btnDesenvolvimentoClick(Sender: TObject);
begin
   if not InciciarServicoDataSnap then exit;

   ConfigurarAcessoAoBanco(0);
   ConectarBancoDeDados(1);

end;


procedure TfrmPrincipal.btnProducaoClick(Sender: TObject);
begin
   if not InciciarServicoDataSnap then exit;

   ConfigurarAcessoAoBanco(1);
   ConectarBancoDeDados(1);
end;


procedure TfrmPrincipal.ConectarBancoDeDados(const AConectar: integer);
begin
   try
      ServerContainer.FDConnection.Connected := AConectar = 1;
   except
      StatusDoServidor(0);
      InformationMessage('Erro ao Conectar o Banco de Dados','Servidor de Aplicações');
   end;

   if ServerContainer.FDConnection.Connected then
      begin
      lblBD.Caption := 'Conectado';
      lblBD.Font.Color := clBlue;
      AtualizarBD;
   end else
      begin
      lblBD.Caption := 'Desconectado';
      lblBD.Font.Color := clRed;
   end;
end;

function TfrmPrincipal.ConfigurarAcessoAoBanco(
   const AAmbiente : integer) : Boolean;
begin
   ServerContainer.FDConnection.Params.Clear;
   ServerContainer.FDConnection.Params.Values['DriverID']  := 'MSSQL';
   ServerContainer.FDConnection.Params.Values['User_name']  := 'sa';
   ServerContainer.FDConnection.Params.Values['Server']  := 'localhost\SqlExpress';
   ServerContainer.FDConnection.Params.Values['Database']  := 'ControleDeTarefas';

   if AAmbiente = 0 then
      begin
      ServerContainer.FDConnection.Params.Values['Password']  := 'mccb01';
      pnAmbiente.Color   := clTeal;
      pnAmbiente.Caption := 'Ambiente de Desenvolvimento';
   end else if AAmbiente = 1 then
      begin
      ServerContainer.FDConnection.Params.Values['Password']  := '@True#2021Med';
      pnAmbiente.Color   := $00A00000;
      pnAmbiente.Caption := 'Ambiente de Produção';
   end;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   StatusDoServidor(0);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
   StatusDoServidor(0);
   lblConexoes.Caption := '0';
   FConexoes           := 0;

   btnDesenvolvimento.Enabled := NomeDoComputador = 'NOTE-MCCB';
end;

function TfrmPrincipal.InciciarServicoDataSnap : Boolean;
begin
   Result := True;
   try
      ServerContainer.DSServer.Start;
      StatusDoServidor(1);
   except
      Result := False;
      Application.MessageBox('Erro ao Iniciar o Serviço DataSnap','Servidor de Aplicações',mb_ok);
   end;

end;

procedure TfrmPrincipal.StatusDoServidor(const AStatus: integer);
var
   LCor : TColor;
begin
   case AStatus of
      0 : begin
          lblStatus.Caption := 'Parado';
          LCor              := clRed;
      end;
      1 : begin
          lblStatus.Caption := 'Em Execução';
          LCor              := clBlue;
      end;
   end;

   lblStatus.Font.Color   := LCor;
   lblDataHora.Font.Color := LCor;
   lblDataHora.Caption    := FormatDateTime('dd/mm/yyyy hh:MM:ss',Now);

   btnDesenvolvimento.Enabled := AStatus = 0;
   btnProducao.Enabled        := btnDesenvolvimento.Enabled;
   btnParar.Enabled           := not btnProducao.Enabled;
end;

end.

