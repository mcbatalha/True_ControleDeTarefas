unit Forms.Importacoes;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Win.ComObj,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Samples.Gauges,

  Forms.Base,
  Proxy.Classes;

type
  TfrmImportacoes = class(TfrmBase)
    edtArquivo: TEdit;
    Label1: TLabel;
    btnLocalizarArquivo: TSpeedButton;
    OpenDialog: TOpenDialog;
    Label2: TLabel;
    edtTotalRegistros: TEdit;
    btnAnalisarDados: TBitBtn;
    Gauge: TGauge;
    lblgauge: TLabel;
    btnEfetivarImportacao: TBitBtn;
    procedure btnLocalizarArquivoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnEfetivarImportacaoClick(Sender: TObject);
  private
    procedure AbrirPlanilha;
    function  ObterInformacoesDaPlanilha : Boolean;

  protected
    FPlanilha : Variant;
    FWorkbook : Variant;
    FSheet    : Variant;

    FLinha    : string;
    FColunas  : TArray<string>;

    FTotalLinhas       : Integer;
    FTotalColunas      : Integer;

    FPlanilhaCarregada : Boolean;

    procedure FecharPlanilha;
    function  ValidarPlanilha : Boolean; virtual;
    procedure ReiniciarTela;
  public
  end;

(*
var
  frmImportacoes: TfrmImportacoes;
*)

implementation

{$R *.dfm}

uses Forms.Mensagem;

procedure TfrmImportacoes.AbrirPlanilha;
begin
   try
      FPlanilha := CreateOleObject('Excel.Application');
      FWorkbook := FPlanilha.Workbooks.Open(edtArquivo.Text);
      FSheet := FWorkbook.Sheets[1];
      FPlanilha.Visible := False; // Mantém o Excel invisível durante a leitura

      FPlanilhaCarregada := True;
  except
      on E: Exception do
         Writeln('Erro ao abrir o arquivo: ' + E.Message);
  end;
end;


procedure TfrmImportacoes.btnEfetivarImportacaoClick(Sender: TObject);
begin
   inherited;
   ReiniciarTela;
end;

procedure TfrmImportacoes.btnLocalizarArquivoClick(Sender: TObject);
begin
   inherited;

   Gauge.MinValue := 1;
   Gauge.Progress := 1;

   btnAnalisarDados.Enabled := false;
   if not OpenDialog.Execute() then Exit;

   edtArquivo.Text := OpenDialog.FileName;
   frmMensagem.btnMensagem.Caption := 'Aguarde, abrindo planilha.';
   frmMensagem.Show;
   Application.ProcessMessages;

   AbrirPlanilha;

   if ObterInformacoesDaPlanilha then exit;
      begin
      Gauge.MaxValue := FTotalLinhas;
   end;

   btnAnalisarDados.Enabled := FPlanilhaCarregada;
   frmMensagem.Close;
end;


procedure TfrmImportacoes.FecharPlanilha;
begin
   FWorkbook.Close(False);
   FPlanilha.Quit;

   FSheet    := Unassigned;
   FWorkbook := Unassigned;
   FPlanilha := Unassigned;

   FPlanilhaCarregada := False;
end;

procedure TfrmImportacoes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if FPlanilhaCarregada then
     FecharPlanilha;
end;

procedure TfrmImportacoes.FormShow(Sender: TObject);
begin
   inherited;
   lblgauge.Caption := '';
end;

function TfrmImportacoes.ObterInformacoesDaPlanilha: Boolean;
var
   LValor : Variant;
begin

    Result := ValidarPlanilha;

    try
       if not Result then Exit;

       FTotalLinhas  := FSheet.UsedRange.Rows.Count - 1;
       FTotalColunas := FSheet.UsedRange.Columns.Count;

       LValor        := FSheet.Cells[2, 4].Value;

       edtTotalRegistros.Text   := IntToStr(FTotalLinhas);
       btnAnalisarDados.Enabled := FTotalLinhas > 1;

       FPlanilhaCarregada := True;
    finally
       frmMensagem.Close;
    end;
end;

procedure TfrmImportacoes.ReiniciarTela;
begin
   edtArquivo.Text  := '';
   Gauge.Progress   := 0;
   lblgauge.Caption := '';

   btnAnalisarDados.Enabled      := False;
   btnEfetivarImportacao.Enabled := False;
end;

function TfrmImportacoes.ValidarPlanilha: Boolean;
begin
   Result := true;
end;

end.
