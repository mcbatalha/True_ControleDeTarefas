unit Forms.Paineis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Funcoes, Vcl.ComCtrls, Vcl.StdCtrls,
  Services.Importacao.AutoSc, Services.Panels.AutoSC, Vcl.Grids, vcl.wwdbigrd, vcl.wwdbgrid,
  Data.DB, Vcl.DBCtrls, Vcl.Mask, Libs.TFiltros, Providers.Panels.Conexao;

type
  TfrmPaineis = class(TForm)
    pnlForm: TPanel;
    pnlBotoes: TPanel;
    btnFiltrar: TSpeedButton;
    btnExportar: TSpeedButton;
    pnlSair: TPanel;
    btnSair: TSpeedButton;
    btnImprimir: TSpeedButton;
    btnDesignar: TSpeedButton;
    pgcPaineis: TPageControl;
    tbsSiags: TTabSheet;
    tbsControlPc: TTabSheet;
    tbsAutoSC: TTabSheet;
    pgcPaineisConteiner: TPageControl;
    TabSheet1: TTabSheet;
    pnlFiltrosAutoSC: TPanel;
    Label1: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    cmbAuditorias: TDBLookupComboBox;
    Label3: TLabel;
    cmbPrazosCaixa: TDBLookupComboBox;
    Label4: TLabel;
    cmbPrazosCaixaHoje: TDBLookupComboBox;
    Label5: TLabel;
    cmbTipoProcesso: TDBLookupComboBox;
    cmbTipoProcessoE: TDBLookupComboBox;
    Label6: TLabel;
    cmbStatus: TDBLookupComboBox;
    Label7: TLabel;
    Label8: TLabel;
    cmbSetores: TDBLookupComboBox;
    edtUsuario: TEdit;
    Label9: TLabel;
    btnPesquisarUsuario: TSpeedButton;
    btnFiltrarAutoSC: TBitBtn;
    btnCancelarFiltroAutoSC: TBitBtn;
    Label10: TLabel;
    edtDataInicio: TMaskEdit;
    Label11: TLabel;
    edtDataFim: TMaskEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnCancelarFiltroAutoSCClick(Sender: TObject);
    procedure btnFiltrarAutoSCClick(Sender: TObject);
  private
    FServiceAutoSC : TSrvAutoSC;
    FFiltroAutoSC  : TFiltros;

    Fdm            : TdtmPaineisConexao;


    procedure ConfigurarBotoes;
    procedure FiltrosAutoSC;
    function AplicarFiltrosAutoSC : Boolean;
  public
    { Public declarations }

    procedure BotoesDeEdicao(const AHabilitar : Boolean);
  end;

var
  frmPaineis: TfrmPaineis;

implementation

{$R *.dfm}

uses Providers.Importacoes, Providers.Panels.AutoSC, Libs.Constantes;

function TfrmPaineis.AplicarFiltrosAutoSC: Boolean;
var
   LFiltro : TFiltrosAutoSc;
begin
   Result := False;
   if (edtDataInicio.Text <> C_DATA_EM_BRANCO) or (edtDataFim.Text <> C_DATA_EM_BRANCO) then
      begin
      if not VerificarPeriodoDeDatas(edtDataInicio, edtDataFim) then
         exit;

      LFiltro.usaDataStatus := True;
      LFiltro.dataInicio    := StrToDate(edtDataInicio.Text);
      LFiltro.dataFim       := StrToDate(edtDataFim.Text);
   end else
      LFiltro.usaDataStatus := False;

    LFiltro.idTipoAuditoria        := cmbAuditorias.KeyValue;
    LFiltro.idTipoPrazoCaixa       := cmbPrazosCaixa.KeyValue;
    LFiltro.idTipoPrazoCaixaHoje   := cmbPrazosCaixaHoje.KeyValue;
    LFiltro.idTipoProcesso         := cmbTipoProcesso.KeyValue;
    LFiltro.idTipoProcessoE        := cmbTipoProcessoE.KeyValue;
    LFiltro.idTipoStatus           := cmbStatus.KeyValue;
    LFiltro.idSetorDesignado       := cmbSetores.KeyValue;
    LFiltro.nomeUsuario            := edtUsuario.Text;

    FFiltroAutoSC.setFiltrosAutoSC(LFiltro);
    Result := True;

end;

procedure TfrmPaineis.BotoesDeEdicao(const AHabilitar: Boolean);
begin

   btnDesignar.Enabled := not AHabilitar;
   btnExportar.Enabled := not AHabilitar;
   btnExportar.Enabled := not AHabilitar;
   btnImprimir.Enabled := not AHabilitar;
   btnSair.Enabled     := not AHabilitar;
end;

procedure TfrmPaineis.FiltrosAutoSC;
var
   LFiltro : TFiltrosAutoSc;
begin
   LFiltro := FFiltroAutoSC.getFiltrosAutoSC;

   cmbAuditorias.KeyValue      := LFiltro.idTipoAuditoria;
   cmbPrazosCaixa.KeyValue     := LFiltro.idTipoPrazoCaixa;
   cmbPrazosCaixaHoje.KeyValue := LFiltro.idTipoPrazoCaixaHoje;
   cmbTipoProcesso.KeyValue    := LFiltro.idTipoProcesso;
   cmbTipoProcessoE.KeyValue   := LFiltro.idTipoProcessoE;
   cmbStatus.KeyValue          := LFiltro.idTipoStatus;
   cmbSetores.KeyValue         := LFiltro.idSetorDesignado;
   edtUsuario.Text             := LFiltro.nomeUsuario;

   if LFiltro.usaDataStatus then
      begin
      edtDataInicio.Text := DateToStr(LFiltro.dataInicio);
      edtDataFim.Text := DateToStr(LFiltro.dataFim);
   end else
      begin
      edtDataInicio.Text := '';
      edtDataFim.Text    := '';
   end;

   HabilitarEdicaoDoPainel(Self, pnlFiltrosAutoSC, True);

end;

procedure TfrmPaineis.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if not btnSair.Enabled then Abort;
end;

procedure TfrmPaineis.FormCreate(Sender: TObject);
begin
   pnlForm.Align := alClient;
   BotoesDeEdicao(False);
   ConfigurarBotoes;

   Application.CreateForm(TdtmPaineisConexao, Fdm);

   FServiceAutoSC := TSrvAutoSC.create(Fdm.SQLConnection);
   FFiltroAutoSC := TFiltros.create(C_FILTRO_AUTOSC);

end;

procedure TfrmPaineis.FormDestroy(Sender: TObject);
begin
   FreeAndNil(FFiltroAutoSC);
   FreeAndNil(FServiceAutoSC);
   FreeAndNil(Fdm);
end;

procedure TfrmPaineis.FormKeyPress(Sender: TObject; var Key: Char);
begin
   Case Key of
      Chr(39) : Key := chr(180);

      Chr(13) : begin
         perform(wm_nextdlgctl,0,0);  {ativa API do windows para mudar para o próximo campo}
         key:=Chr(0);                 {tecla recebe 0}
      end;
   end;
end;

procedure TfrmPaineis.FormShow(Sender: TObject);
begin
   LimparTela(Self);
end;

procedure TfrmPaineis.btnCancelarFiltroAutoSCClick(Sender: TObject);
begin
   HabilitarEdicaoDoPainel(Self, pnlFiltrosAutoSC, False);
end;

procedure TfrmPaineis.btnFiltrarAutoSCClick(Sender: TObject);
begin
   if AplicarFiltrosAutoSC then
      begin
      FServiceAutoSC.Filtrar(FFiltroAutoSC);
      HabilitarEdicaoDoPainel(Self, pnlFiltrosAutoSC, False);
   end;
end;

procedure TfrmPaineis.btnFiltrarClick(Sender: TObject);
begin
   if pgcPaineis.ActivePage = tbsAutoSC then
      FiltrosAutoSC;
end;

procedure TfrmPaineis.btnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmPaineis.ConfigurarBotoes;
begin
   btnFiltrar.Visible  := True;
   btnExportar.Visible := True;
   btnImprimir.Visible := True;
   btnDesignar.Visible := True;
end;


end.
