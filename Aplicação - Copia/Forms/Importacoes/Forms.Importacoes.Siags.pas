unit Forms.Importacoes.Siags;

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

  Services.Importacao.Siags,
  Libs.TSeguranca;

type
  TfrmImportacoesSiags = class(TfrmImportacoes)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnLocalizarArquivoClick(Sender: TObject);
    procedure btnAnalisarDadosClick(Sender: TObject);
    procedure btnEfetivarImportacaoClick(Sender: TObject);
  private
    { Private declarations }

    FService  : TSrvImportacaoSiags;

    function ValidarPlanilha : Boolean; override;

    const
       C_TITULO_MENSAGENS = 'Importação de Planilha Siags';


  public
    { Public declarations }
  end;

(*
var
  frmImportacoesSiags: TfrmImportacoesSiags;
*)

implementation

{$R *.dfm}

procedure TfrmImportacoesSiags.btnAnalisarDadosClick(Sender: TObject);
begin
   inherited;

   btnEfetivarImportacao.Enabled := FService.Analisar(lblgauge, Gauge, FSheet);
   FecharPlanilha;
   btnAnalisarDados.Enabled := False;
end;

procedure TfrmImportacoesSiags.btnEfetivarImportacaoClick(Sender: TObject);
begin
   if FService.ImportarDados then
      begin
      LimparTela(Self);
      inherited;
   end;
end;

procedure TfrmImportacoesSiags.btnLocalizarArquivoClick(Sender: TObject);
begin
  inherited;

  FService.TotalLinhas := FTotalLinhas;
end;

procedure TfrmImportacoesSiags.FormCreate(Sender: TObject);
begin
   inherited;
   FService := TSrvImportacaoSiags.Create;
end;

procedure TfrmImportacoesSiags.FormDestroy(Sender: TObject);
begin
   FreeAndNil(FService);

   inherited;
end;


function TfrmImportacoesSiags.ValidarPlanilha: Boolean;
begin
   Result := FService.Validar(FSheet);

   if not Result then
      FecharPlanilha;
end;

end.
