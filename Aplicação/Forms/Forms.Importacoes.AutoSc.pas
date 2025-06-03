unit Forms.Importacoes.AutoSc;

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

  Services.Importacao.AutoSc,
  Libs.TSeguranca;

type
  TfrmImportacoesAutoSc = class(TfrmImportacoes)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnLocalizarArquivoClick(Sender: TObject);
    procedure btnAnalisarDadosClick(Sender: TObject);
    procedure btnEfetivarImportacaoClick(Sender: TObject);
  private
    { Private declarations }

    FService : TSrvImportacaoAutoAc;
    function ValidarPlanilha : Boolean; override;

    const
       C_TITULO_MENSAGENS = 'Importação de Planilha AUTOSC';


  public
    { Public declarations }
  end;

(*
var
  frmImportacoesAutoSc: TfrmImportacoesAutoSc;
*)

implementation

{$R *.dfm}

procedure TfrmImportacoesAutoSc.btnAnalisarDadosClick(Sender: TObject);
begin
   inherited;

   btnEfetivarImportacao.Enabled := FService.Analisar(lblgauge, Gauge, FSheet);
   FecharPlanilha;
   btnAnalisarDados.Enabled := False;
end;

procedure TfrmImportacoesAutoSc.btnEfetivarImportacaoClick(Sender: TObject);
begin
   if FService.ImportarDados then
      begin
      LimparTela(Self);
      inherited;
   end;
end;

procedure TfrmImportacoesAutoSc.btnLocalizarArquivoClick(Sender: TObject);
begin
  inherited;

  FService.TotalLinhas := FTotalLinhas;
end;

procedure TfrmImportacoesAutoSc.FormCreate(Sender: TObject);
begin
   inherited;
   FService := TSrvImportacaoAutoAc.Create;
end;

procedure TfrmImportacoesAutoSc.FormDestroy(Sender: TObject);
begin
   FreeAndNil(FService);

   inherited;
end;


function TfrmImportacoesAutoSc.ValidarPlanilha: Boolean;
begin
   Result := FService.Validar(FSheet);

   if not Result then
      FecharPlanilha;
end;

end.
