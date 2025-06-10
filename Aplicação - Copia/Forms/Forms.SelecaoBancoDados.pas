unit Forms.SelecaoBancoDados;

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
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Funcoes,
  Libs.Constantes,
  Providers.Conexao,
  Providers.Connection;

type
  TfrmSelecaoBancoDados = class(TForm)
    pnlForm: TPanel;
    btnAmbienteDesenvolvimento: TSpeedButton;
    btnAmbienteProducao: TSpeedButton;
    StaticText1: TStaticText;
    btnFinalizar: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure btnAmbienteProducaoClick(Sender: TObject);
    procedure btnAmbienteDesenvolvimentoClick(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FConfigurou : boolean;
  end;


implementation
Uses Forms.Principal;

{$R *.dfm}

procedure TfrmSelecaoBancoDados.FormCreate(Sender: TObject);
begin
   FConfigurou := True;
end;

procedure TfrmSelecaoBancoDados.FormShow(Sender: TObject);
var vNomeDoComputador: Array[0..255] of char;
    vTamanho: DWord;
begin
   CentralizarPainel(Self, pnlForm);

   GetComputerName (vNomeDoComputador,vTamanho);
   btnAmbienteDesenvolvimento.Enabled := vNomeDoComputador = 'NOTE-MCCB';

end;

procedure TfrmSelecaoBancoDados.btnAmbienteDesenvolvimentoClick(Sender: TObject);
begin
   dtmConexao.SQLConnection.Connected := False;

   ConnectionProvider.HostName := 'localhost';
   ConnectionProvider.ConfigurarConexao(dtmConexao.SQLConnection, True);
   Close;
end;


procedure TfrmSelecaoBancoDados.btnAmbienteProducaoClick(Sender: TObject);
begin
   dtmConexao.SQLConnection.Connected := False;

   ConnectionProvider.HostName := C_HOST_CONEXAO;
   ConnectionProvider.ConfigurarConexao(dtmConexao.SQLConnection, True);
   Close;
end;

procedure TfrmSelecaoBancoDados.btnFinalizarClick(Sender: TObject);
begin
   Try
    dtmConexao.SQLConnection.Connected := False;
   Except
   End;

   FConfigurou := False;
   Application.Terminate;
   Close;
end;


end.
