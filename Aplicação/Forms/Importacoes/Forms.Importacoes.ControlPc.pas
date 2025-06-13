unit Forms.Importacoes.ControlPc;

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
  Vcl.Samples.Gauges,
  Vcl.ExtCtrls,

  Forms.Importacoes,
  Proxy.Classes,
  Funcoes,

  Services.Importacao.ControlPc,
  Libs.TSeguranca;

type
  TfrmImportacoesControlPc = class(TfrmImportacoes)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnLocalizarArquivoClick(Sender: TObject);
    procedure btnAnalisarDadosClick(Sender: TObject);
    procedure btnEfetivarImportacaoClick(Sender: TObject);
  private
    { Private declarations }

    FService  : TSrvImportacaoControlPc;

    function ValidarPlanilha : Boolean; override;

    const
       C_TITULO_MENSAGENS = 'Importação de Planilha CONTROLPC';


  public
    { Public declarations }
  end;

(*
var
  frmImportacoesControlPc: TfrmImportacoesControlPc;
*)

implementation

{$R *.dfm}

procedure TfrmImportacoesControlPc.btnAnalisarDadosClick(Sender: TObject);
begin
   inherited;

   btnEfetivarImportacao.Enabled := FService.Analisar(lblgauge, Gauge, FSheet);
   FecharPlanilha;
   btnAnalisarDados.Enabled := False;
end;

procedure TfrmImportacoesControlPc.btnEfetivarImportacaoClick(Sender: TObject);
begin
   if FService.ImportarDados then
      begin
      LimparTela(Self);
      inherited;
   end;
end;

procedure TfrmImportacoesControlPc.btnLocalizarArquivoClick(Sender: TObject);
begin
  inherited;

  FService.TotalLinhas := FTotalLinhas;
end;

procedure TfrmImportacoesControlPc.FormCreate(Sender: TObject);
begin
   inherited;
   FService := TSrvImportacaoControlPc.Create;
end;

procedure TfrmImportacoesControlPc.FormDestroy(Sender: TObject);
begin
   FreeAndNil(FService);

   inherited;
end;


function TfrmImportacoesControlPc.ValidarPlanilha: Boolean;
var
  LMensagem : String;
begin
   Result := FService.Validar(FSheet, LMensagem);

   if not Result then
      begin
      FecharPlanilha;
      frmMensagem.close;
      InformationMessage(LMensagem, C_TITULO_MENSAGENS);
   end;
end;

end.
