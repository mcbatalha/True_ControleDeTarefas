unit Forms.Base;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Funcoes;

type
  TfrmBase = class(TForm)
    pnlForm: TPanel;
    pnlBotoes: TPanel;
    btnFiltrar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnConfirmar: TSpeedButton;
    btnExportar: TSpeedButton;
    btnIncluir: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnAlterar: TSpeedButton;
    pnlSair: TPanel;
    btnSair: TSpeedButton;
    btnImprimir: TSpeedButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure BotoesDeEdicao(const AHabilitar : Boolean);
  end;

var
  frmBase: TfrmBase;

implementation

{$R *.dfm}

procedure TfrmBase.BotoesDeEdicao(const AHabilitar: Boolean);
begin
   btnConfirmar.Enabled := AHabilitar;
   btnCancelar.Enabled  := AHabilitar;

   btnIncluir.Enabled  := not AHabilitar;
   btnExportar.Enabled := not AHabilitar;
   btnExportar.Enabled := not AHabilitar;
   btnImprimir.Enabled := not AHabilitar;
   btnSair.Enabled     := not AHabilitar;
end;

procedure TfrmBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if not btnSair.Enabled then Abort;
end;

procedure TfrmBase.FormCreate(Sender: TObject);
begin
   BotoesDeEdicao(False);
end;

procedure TfrmBase.FormKeyPress(Sender: TObject; var Key: Char);
begin
   Case Key of
      Chr(39) : Key := chr(180);

      Chr(13) : begin
         perform(wm_nextdlgctl,0,0);  {ativa API do windows para mudar para o próximo campo}
         key:=Chr(0);                 {tecla recebe 0}
      end;
   end;
end;

procedure TfrmBase.FormShow(Sender: TObject);
begin
   LimparTela(Self);
end;

procedure TfrmBase.btnSairClick(Sender: TObject);
begin
   Close;
end;

end.
