unit Forms.Paineis;

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
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.ComCtrls,
  Vcl.StdCtrls,
  Vcl.Grids,
  vcl.wwdbigrd,
  vcl.wwdbgrid,
  Vcl.DBCtrls,
  Vcl.Mask,

  Data.DB,

  Services.Importacao.AutoSc,
  Services.Panels.AutoSC,
  Funcoes,
//
//  Data.DBXDataSnap,
//  Data.DBXCommon,
//  Data.SqlExpr,
  Datasnap.DBClient,
//
  Libs.TFiltros,
  Libs.TSeguranca,
  Providers.Panels.Conexao,
  Frames.Pesquisa.Usuario, Vcl.Menus;

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
    pnlCamposFiltroAutoSc: TPanel;
    pnlGridAutoSC: TPanel;
    dbgAutoSC: TwwDBGrid;
    pnlTituloAutoSC: TPanel;
    TabSheet2: TTabSheet;
    pnlDesignacao: TPanel;
    lblTituloDesignacao: TLabel;
    pnlCamposDesignacao: TPanel;
    pnlBotoesAutoSc: TPanel;
    btnConfirmarDesignacaoAutoSC: TBitBtn;
    btnCancelarDesignacaoAutoSC: TBitBtn;
    pnlBotoesFiltroAutoSc: TPanel;
    btnFiltrarAutoSC: TBitBtn;
    btnCancelarFiltroAutoSC: TBitBtn;
    Panel4: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    cmbAuditorias: TDBLookupComboBox;
    cmbPrazosCaixa: TDBLookupComboBox;
    cmbPrazosCaixaHoje: TDBLookupComboBox;
    cmbTipoProcesso: TDBLookupComboBox;
    cmbTipoProcessoE: TDBLookupComboBox;
    cmbStatus: TDBLookupComboBox;
    edtDataInicio: TMaskEdit;
    edtDataFim: TMaskEdit;
    cmbPrazosAns: TDBLookupComboBox;
    cmbUF: TDBLookupComboBox;
    Label9: TLabel;
    pnlSelecaoDesignacao: TPanel;
    Label8: TLabel;
    fraPesquisaUsuario: TfraPesquisaUsuario;
    cmbSetores: TDBLookupComboBox;
    Panel1: TPanel;
    memJustificativa: TMemo;
    Label13: TLabel;
    btnHistoricoDesignacoes: TSpeedButton;
    ppmAutoSc: TPopupMenu;
    Designar1: TMenuItem;
    Encerrar1: TMenuItem;
    N1: TMenuItem;
    VerHistricodedesignaes1: TMenuItem;
    VerHistricodealteraes1: TMenuItem;
    TabSheet3: TTabSheet;
    pnlHistoricoDesignacoes: TPanel;
    lblTituloHistoricoDesignacoes: TLabel;
    Panel3: TPanel;
    Panel5: TPanel;
    btnFecharHistoricoDesignacao: TBitBtn;
    dbnHistoricoDesignacoes: TDBNavigator;
    Label15: TLabel;
    DBEdit1: TDBEdit;
    Label16: TLabel;
    DBEdit2: TDBEdit;
    Label17: TLabel;
    DBEdit3: TDBEdit;
    Label18: TLabel;
    DBEdit4: TDBEdit;
    DBMemo1: TDBMemo;
    Label19: TLabel;
    btnEncerrar: TSpeedButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnCancelarFiltroAutoSCClick(Sender: TObject);
    procedure btnFiltrarAutoSCClick(Sender: TObject);
    procedure dbgAutoSCTitleButtonClick(Sender: TObject; AFieldName: string);
    procedure btnDesignarClick(Sender: TObject);
    procedure btnCancelarDesignacaoAutoSCClick(Sender: TObject);
    procedure btnConfirmarDesignacaoAutoSCClick(Sender: TObject);
    procedure dbgAutoSCDblClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure btnHistoricoDesignacoesClick(Sender: TObject);
    procedure dbgAutoSCRowChanged(Sender: TObject);
    procedure btnFecharHistoricoDesignacaoClick(Sender: TObject);
  private
    FServiceAutoSC : TSrvAutoSC;
    FFiltroAutoSC  : TFiltros;

    Fdm            : TdtmPaineisConexao;


    procedure ConfigurarTabSheets;
    procedure ConfigurarBotoes;
    procedure ConfigurarBotoesDeOperacao;
    procedure FiltrosAutoSC;
    function AplicarFiltrosAutoSC : Boolean;
    procedure OrdenarGrid(const AFieldName : String);

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
    LFiltro.idTipoPrazoANS         := cmbPrazosAns.KeyValue;
    LFiltro.UF                     := cmbUF.KeyValue;
    LFiltro.idTipoStatus           := cmbStatus.KeyValue;
    LFiltro.idSetorDesignado       := cmbSetores.KeyValue;
    LFiltro.idUsuarioDesignado     := fraPesquisaUsuario.getIdUsuario;

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
   pnlSelecaoDesignacao.Parent := pnlCamposFiltroAutoSc;
   fraPesquisaUsuario.setDataSet(FServiceAutoSC.ConfigurarPesquisaDeUsuario);

   LFiltro := FFiltroAutoSC.getFiltrosAutoSCAsRecord;

   cmbAuditorias.KeyValue      := LFiltro.idTipoAuditoria;
   cmbPrazosCaixa.KeyValue     := LFiltro.idTipoPrazoCaixa;
   cmbPrazosCaixaHoje.KeyValue := LFiltro.idTipoPrazoCaixaHoje;
   cmbPrazosAns.KeyValue       := LFiltro.idTipoPrazoANS;
   cmbUF.KeyValue              := LFiltro.UF;
   cmbTipoProcesso.KeyValue    := LFiltro.idTipoProcesso;
   cmbTipoProcessoE.KeyValue   := LFiltro.idTipoProcessoE;
   cmbStatus.KeyValue          := LFiltro.idTipoStatus;
   cmbSetores.KeyValue         := LFiltro.idSetorDesignado;
   fraPesquisaUsuario.setIdUsuario(LFiltro.idUsuarioDesignado);

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
   BotoesDeEdicao(False);
   ConfigurarBotoes;

   Application.CreateForm(TdtmPaineisConexao, Fdm);
   ConfigurarTabSheets;
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

procedure TfrmPaineis.OrdenarGrid(const AFieldName : String);
var
   LIndice: string;
   LExiste: boolean;
begin
   if (dbgAutoSC.DataSource.DataSet as TClientDataSet).IndexFieldNames = AFieldName then
     begin
     LIndice := AnsiUpperCase(AFieldName+'_INV');

     try
       (dbgAutoSC.DataSource.DataSet as TClientDataSet).IndexDefs.Find(LIndice);
       LExiste := true;
     except
       LExiste := false;
     end;

     if not LExiste then
       with (dbgAutoSC.DataSource.DataSet as TClientDataSet).IndexDefs.AddIndexDef do begin
         Name := LIndice;
         Fields := AFieldName;
         Options := [ixDescending];
       end;
      (dbgAutoSC.DataSource.DataSet as TClientDataSet).IndexName := LIndice;
      end
   else
     (dbgAutoSC.DataSource.DataSet as TClientDataSet).IndexFieldNames := AFieldName;
end;

procedure TfrmPaineis.btnCancelarDesignacaoAutoSCClick(Sender: TObject);
begin
   HabilitarEdicaoDoPainel(Self, pnlDesignacao, False);
end;

procedure TfrmPaineis.btnCancelarFiltroAutoSCClick(Sender: TObject);
begin
   HabilitarEdicaoDoPainel(Self, pnlFiltrosAutoSC, False);
end;

procedure TfrmPaineis.btnConfirmarDesignacaoAutoSCClick(Sender: TObject);
begin
   if FServiceAutoSC.Designar(memJustificativa.Text,
                              cmbSetores.KeyValue,
                              fraPesquisaUsuario.getIdUsuario) then
      HabilitarEdicaoDoPainel(Self, pnlDesignacao, False);

end;

procedure TfrmPaineis.btnDesignarClick(Sender: TObject);
begin
   if not btnDesignar.Enabled then Exit;

   if pgcPaineis.ActivePage = tbsAutoSC then
      begin
      FServiceAutoSC.DesignacaoExcluirTodos;

      if not FServiceAutoSC.SetorDesignado > 0 then
         cmbSetores.KeyValue := FServiceAutoSC.SetorDesignado
      else
         cmbSetores.KeyValue := C_CODIGO_NAO_DESIGNADO;

      if not FServiceAutoSC.UsuarioDesignado > 0 then
         fraPesquisaUsuario.setIdUsuario(FServiceAutoSC.UsuarioDesignado)
      else
         fraPesquisaUsuario.setIdUsuario(C_CODIGO_NAO_DESIGNADO);

      lblTituloDesignacao.Caption := 'Designição de Processo - AUTOSC - ' + FServiceAutoSC.NumeroDoProcesso;
      pnlSelecaoDesignacao.Parent := pnlCamposDesignacao;
      memJustificativa.Text       := '';

      HabilitarEdicaoDoPainel(Self, pnlDesignacao, True);
      memJustificativa.SetFocus;
   end;
end;


procedure TfrmPaineis.btnHistoricoDesignacoesClick(Sender: TObject);
begin
   if not btnHistoricoDesignacoes.Enabled then exit;

   FServiceAutoSC.HistoricoDeDesignacoes;
   HabilitarEdicaoDoPainel(Self, pnlHistoricoDesignacoes, True);

end;

procedure TfrmPaineis.btnExportarClick(Sender: TObject);
begin
   InformationMessage('Em desenvolvimento','Status');
end;

procedure TfrmPaineis.btnFecharHistoricoDesignacaoClick(Sender: TObject);
begin
   HabilitarEdicaoDoPainel(Self, pnlHistoricoDesignacoes, false);
end;

procedure TfrmPaineis.btnFiltrarAutoSCClick(Sender: TObject);
begin
   if AplicarFiltrosAutoSC then
      begin
      FServiceAutoSC.Filtrar(FFiltroAutoSC.getFiltrosAutoSCAsJSON);

      HabilitarEdicaoDoPainel(Self, pnlFiltrosAutoSC, False);
   end;
end;

procedure TfrmPaineis.btnFiltrarClick(Sender: TObject);
begin
   if pgcPaineis.ActivePage = tbsAutoSC then
      FiltrosAutoSC;
end;

procedure TfrmPaineis.btnImprimirClick(Sender: TObject);
begin
   InformationMessage('Em desenvolvimento','Status');
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
   btnHistoricoDesignacoes.Visible := True;
   btnEncerrar.Visible := True;
end;

procedure TfrmPaineis.ConfigurarBotoesDeOperacao;
var
   LHabilitar : Boolean;
begin
   case pgcPaineis.ActivePageIndex of
      C_TIPO_AUTOSC : LHabilitar := FServiceAutoSC.TemRegistros;
   end;

   btnImprimir.Enabled := LHabilitar;
   btnDesignar.Enabled := LHabilitar;
   btnExportar.Enabled := LHabilitar;
   btnEncerrar.Enabled := LHabilitar;
end;

procedure TfrmPaineis.ConfigurarTabSheets;
begin
   tbsControlPc.TabVisible := Seguranca.PodeCONTROLPC;
   if tbsControlPc.TabVisible then
      begin
//      FServiceAutoSC := TSrvAutoSC.create(Fdm.SQLConnection);
//      FFiltroAutoSC := TFiltros.create(C_FILTRO_AUTOSC);
   end;

   tbsSiags.TabVisible := Seguranca.PodeSIAGS;
   if tbsSiags.TabVisible then
      begin
//      FServiceAutoSC := TSrvAutoSC.create(Fdm.SQLConnection);
//      FFiltroAutoSC := TFiltros.create(C_FILTRO_AUTOSC);
   end;

   tbsAutoSC.TabVisible := Seguranca.PodeAUTOSC;
   if tbsAutoSC.TabVisible then
      begin
      FServiceAutoSC := TSrvAutoSC.create(Fdm.SQLConnection);
      FFiltroAutoSC := TFiltros.create(C_TIPO_AUTOSC);
   end;


   if tbsAutoSC.TabVisible then
      pgcPaineis.ActivePage := tbsAutoSC
   else if tbsSiags.TabVisible then
      pgcPaineis.ActivePage := tbsSiags
   else if tbsControlPc.TabVisible then
      pgcPaineis.ActivePage := tbsControlPc;
end;


procedure TfrmPaineis.dbgAutoSCDblClick(Sender: TObject);
begin
   btnDesignarClick(Self);
end;

procedure TfrmPaineis.dbgAutoSCRowChanged(Sender: TObject);
begin
   btnHistoricoDesignacoes.Enabled := FServiceAutoSC.TemDesignacoes;
end;

procedure TfrmPaineis.dbgAutoSCTitleButtonClick(Sender: TObject; AFieldName: string);
begin
   OrdenarGrid(AFieldName);
end;

end.
