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
  Services.Importacao.Siags,
  Services.Panels.Siags,
  Services.Importacao.ControlPc,
  Services.Panels.ControlPc,

  Funcoes,

  Datasnap.DBClient,

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
    btnConfirmarDesignacao: TBitBtn;
    btnCancelarDesignacao: TBitBtn;
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
    cmbAuditoriasAutoSc: TDBLookupComboBox;
    cmbPrazosCaixaAutoSc: TDBLookupComboBox;
    cmbPrazosCaixaHojeAutoSc: TDBLookupComboBox;
    cmbTipoProcessoAutoSc: TDBLookupComboBox;
    cmbTipoProcessoEAutoSc: TDBLookupComboBox;
    cmbStatusAutoSc: TDBLookupComboBox;
    edtDataInicio: TMaskEdit;
    edtDataFim: TMaskEdit;
    cmbPrazosAnsAutoSc: TDBLookupComboBox;
    cmbUFAutoSc: TDBLookupComboBox;
    Label9: TLabel;
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
    Panel3: TPanel;
    Panel5: TPanel;
    btnFecharHistoricoDesignacao: TBitBtn;
    dbnHistoricoDesignacoes: TDBNavigator;
    Label15: TLabel;
    edtDataHoraDesignacao: TDBEdit;
    Label16: TLabel;
    edtResponsavelDesignacao: TDBEdit;
    Label17: TLabel;
    edtSetorDesignacao: TDBEdit;
    Label18: TLabel;
    edtUsuarioDesignacao: TDBEdit;
    memJustificativaDesignacao: TDBMemo;
    Label19: TLabel;
    btnEncerrar: TSpeedButton;
    TabSheet4: TTabSheet;
    pnlHistoricoAtualizacoesAutoSc: TPanel;
    lblTituloHistoricoAtualizacoesAUTOSC: TLabel;
    Panel6: TPanel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Panel7: TPanel;
    btnFecharHistoricoAtualizacoes: TBitBtn;
    dbnHistoricoAtualizacoes: TDBNavigator;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    btnHistoricoAtualizacoes: TSpeedButton;
    DBEdit9: TDBEdit;
    Label25: TLabel;
    DBEdit10: TDBEdit;
    Label26: TLabel;
    lblTituloHistoricoDesignacoes: TLabel;
    TabSheet5: TTabSheet;
    pnlEncerramento: TPanel;
    lblTituloEncerramento: TLabel;
    Panel8: TPanel;
    Panel9: TPanel;
    btnConfirmaEncerramento: TBitBtn;
    btnCancelaEncerramento: TBitBtn;
    Panel11: TPanel;
    Label28: TLabel;
    memJustificativaEncerramento: TMemo;
    TabSheet6: TTabSheet;
    pnlObservacoesProcesso: TPanel;
    lblTituloObservacoesProcesso: TLabel;
    Panel10: TPanel;
    Panel12: TPanel;
    Label27: TLabel;
    dbnObservacoes: TDBNavigator;
    btnIncluirObservacao: TSpeedButton;
    btnGravarObservacao: TSpeedButton;
    btnCancelarObservacao: TSpeedButton;
    memObservacao: TDBMemo;
    Label20: TLabel;
    edtDataHoraObservacao: TDBEdit;
    edtUsuarioObservacao: TDBEdit;
    Label29: TLabel;
    btnFecharObservacao: TBitBtn;
    btnObservacoes: TSpeedButton;
    pnlGridSiags: TPanel;
    dbgSiags: TwwDBGrid;
    pnlTituloSiags: TPanel;
    TabSheet7: TTabSheet;
    pnlFiltrosSiags: TPanel;
    Label30: TLabel;
    pnlCamposFiltroSiags: TPanel;
    Panel14: TPanel;
    btnFiltrarSiags: TBitBtn;
    btnCancelarFiltroSiags: TBitBtn;
    Panel15: TPanel;
    Label31: TLabel;
    Label32: TLabel;
    Label39: TLabel;
    Label41: TLabel;
    cmbAuditoriasSiags: TDBLookupComboBox;
    cmbPrazosCaixaSiags: TDBLookupComboBox;
    cmbPrazosANSSiags: TDBLookupComboBox;
    cmbUFSiags: TDBLookupComboBox;
    cmbAutorizacoesSiags: TDBLookupComboBox;
    Label33: TLabel;
    Label42: TLabel;
    cmbAtendimentosSiags: TDBLookupComboBox;
    Label43: TLabel;
    cmbSituacoesSiags: TDBLookupComboBox;
    cmbUltimasAnotacoesSiags: TDBLookupComboBox;
    Label44: TLabel;
    TabSheet8: TTabSheet;
    pnlHistoricoAtualizacoesSiags: TPanel;
    lblTituloHistoricoAtualizacoesSiags: TLabel;
    Panel13: TPanel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label40: TLabel;
    Label45: TLabel;
    Panel16: TPanel;
    btnFecharHistoricoSiags: TBitBtn;
    DBNavigator1: TDBNavigator;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    Label46: TLabel;
    Label47: TLabel;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    Label48: TLabel;
    DBEdit15: TDBEdit;
    Label49: TLabel;
    DBEdit16: TDBEdit;
    Label50: TLabel;
    Label51: TLabel;
    DBEdit17: TDBEdit;
    Label52: TLabel;
    Label54: TLabel;
    DBEdit19: TDBEdit;
    Label53: TLabel;
    DBEdit18: TDBEdit;
    Label55: TLabel;
    Label56: TLabel;
    DBEdit20: TDBEdit;
    Label57: TLabel;
    DBEdit21: TDBEdit;
    Label58: TLabel;
    DBEdit22: TDBEdit;
    Label59: TLabel;
    Label60: TLabel;
    DBEdit23: TDBEdit;
    pnlGridControlPc: TPanel;
    dbgControlPc: TwwDBGrid;
    pnlTituloControlPc: TPanel;
    TabSheet9: TTabSheet;
    pnlFiltrosControlPc: TPanel;
    Label34: TLabel;
    pnlCamposFiltroControlPc: TPanel;
    Panel18: TPanel;
    btnFiltrarControlPc: TBitBtn;
    btnCancelarFiltroControlPc: TBitBtn;
    pnlCampos: TPanel;
    Label62: TLabel;
    Label63: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label69: TLabel;
    Label71: TLabel;
    cmbPrazos: TDBLookupComboBox;
    cmbTecnicos: TDBLookupComboBox;
    cmbTiposStatusControlPc: TDBLookupComboBox;
    edtDataAbertura: TMaskEdit;
    cmbTiposCliente: TDBLookupComboBox;
    Label61: TLabel;
    cmbTipoReclame: TComboBox;
    cmbTipoNip: TComboBox;
    Label64: TLabel;
    edtDataFechamento: TMaskEdit;
    Label65: TLabel;
    edtDataTransferencia: TMaskEdit;
    Label70: TLabel;
    edtPrevisaoSolucao: TMaskEdit;
    TabSheet10: TTabSheet;
    pnlHistoricoAtualizacoesControlPc: TPanel;
    lblTituloHistoricoAtualizacoesControlPc: TLabel;
    Panel19: TPanel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Panel20: TPanel;
    btnFechraHistoricoControlPc: TBitBtn;
    dbnControlPc: TDBNavigator;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit38: TDBEdit;
    DBEdit39: TDBEdit;
    DBEdit40: TDBEdit;
    pnlSelecaoDesignacao: TPanel;
    Label8: TLabel;
    fraPesquisaUsuario: TfraPesquisaUsuario;
    cmbSetores: TDBLookupComboBox;
    TabSheet11: TTabSheet;
    pnlExibirConteudo: TPanel;
    lblTituloExibicaoConteudo: TLabel;
    Panel17: TPanel;
    Panel21: TPanel;
    btnFecharExibicaoConteudo: TBitBtn;
    memExibirConteudo: TMemo;
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
    procedure btnCancelarDesignacaoClick(Sender: TObject);
    procedure btnConfirmarDesignacaoClick(Sender: TObject);
    procedure dbgAutoSCDblClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure btnHistoricoDesignacoesClick(Sender: TObject);
    procedure dbgAutoSCRowChanged(Sender: TObject);
    procedure btnFecharHistoricoDesignacaoClick(Sender: TObject);
    procedure btnHistoricoAtualizacoesClick(Sender: TObject);
    procedure btnFecharHistoricoAtualizacoesClick(Sender: TObject);
    procedure btnObservacoesClick(Sender: TObject);
    procedure btnIncluirObservacaoClick(Sender: TObject);
    procedure btnFecharObservacaoClick(Sender: TObject);
    procedure btnGravarObservacaoClick(Sender: TObject);
    procedure btnCancelarObservacaoClick(Sender: TObject);
    procedure btnCancelarFiltroSiagsClick(Sender: TObject);
    procedure btnFiltrarSiagsClick(Sender: TObject);
    procedure dbgSiagsRowChanged(Sender: TObject);
    procedure btnFecharHistoricoSiagsClick(Sender: TObject);
    procedure dbgSiagsTitleButtonClick(Sender: TObject; AFieldName: string);
    procedure btnConfirmaEncerramentoClick(Sender: TObject);
    procedure btnEncerrarClick(Sender: TObject);
    procedure btnCancelaEncerramentoClick(Sender: TObject);
    procedure dbgControlPcTitleButtonClick(Sender: TObject; AFieldName: string);
    procedure dbgControlPcRowChanged(Sender: TObject);
    procedure btnFiltrarControlPcClick(Sender: TObject);
    procedure btnCancelarFiltroControlPcClick(Sender: TObject);
    procedure edtDataAberturaExit(Sender: TObject);
    procedure dbgControlPcDblClick(Sender: TObject);
    procedure btnFecharExibicaoConteudoClick(Sender: TObject);
  private
    FServiceAutoSC : TSrvAutoSC;
    FFiltroAutoSC  : TFiltros;

    FServiceSiags : TSrvSiags;
    FFiltroSiags  : TFiltros;

    FServiceControlPc : TSrvControlPc;
    FFiltroControlPc  : TFiltros;

    Fdm            : TdtmPaineisConexao;

    procedure DesignarAutoSc;
    procedure DesignarSiags;
    procedure DesignarControlPc;
    procedure ConfigurarObservacoes;
    procedure ConfigurarHistoricoDeDesignacao;
    procedure ConfigurarTabSheets;
    procedure ConfigurarBotoes;
    procedure ConfigurarBotoesDeOperacao;
    procedure FiltrosAutoSC;
    procedure FiltrosSiags;
    procedure FiltrosControlPc;
    function AplicarFiltrosAutoSC : Boolean;
    function AplicarFiltrosSiags : Boolean;
    function AplicarFiltrosControlPc : Boolean;
    procedure OrdenarGrid(const ADataSet : TDataSet; const AFieldName : String);
    procedure BotoesObservacao(const AHabilitar : Boolean);
    procedure AtualizarPainel(const AAtualizar : Boolean = True);

    procedure ConfigurarDataSourcesControlPc;

  public
    { Public declarations }

    procedure BotoesDeEdicao(const AHabilitar : Boolean);
  end;

var
  frmPaineis: TfrmPaineis;

implementation

{$R *.dfm}

uses
   Providers.Importacoes,
   Providers.Panels.AutoSC,
   Providers.Panels.Siags,
   Providers.Panels.ControlPc,
   Libs.Constantes;

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

    LFiltro.idTipoAuditoria        := cmbAuditoriasAutoSc.KeyValue;
    LFiltro.idTipoPrazoCaixa       := cmbPrazosCaixaAutoSc.KeyValue;
    LFiltro.idTipoPrazoCaixaHoje   := cmbPrazosCaixaHojeAutoSc.KeyValue;
    LFiltro.idTipoProcesso         := cmbTipoProcessoAutoSc.KeyValue;
    LFiltro.idTipoProcessoE        := cmbTipoProcessoEAutoSc.KeyValue;
    LFiltro.idTipoPrazoANS         := cmbPrazosAnsAutoSc.KeyValue;
    LFiltro.UF                     := cmbUFAutoSc.KeyValue;
    LFiltro.idTipoStatus           := cmbStatusAutoSc.KeyValue;
    LFiltro.idSetorDesignado       := cmbSetores.KeyValue;
    LFiltro.idUsuarioDesignado     := fraPesquisaUsuario.getIdUsuario;

    FFiltroAutoSC.setFiltrosAutoSC(LFiltro);
    Result := True;
end;

function TfrmPaineis.AplicarFiltrosControlPc: Boolean;
var
   LFiltro : TFiltrosControlPc;
begin
    Result := False;

    LFiltro.idTipoStatus  := cmbTiposStatusControlPc.KeyValue;
    LFiltro.idTipoPrazo   := cmbPrazos.KeyValue;
    LFiltro.idTecnico     := cmbTecnicos.KeyValue;
    LFiltro.idTipoCliente := cmbTiposCliente.KeyValue;
    LFiltro.tipoReclame   := cmbTipoReclame.Text;
    LFiltro.tipoNip       := cmbTipoNip.Text;

    if edtDataAbertura.Text <> C_DATA_EM_BRANCO then
       begin
       LFiltro.usaDataAbertura := True;
       LFiltro.dataAbertura    := StrToDate(edtDataAbertura.Text)
    end else
       LFiltro.usaDataAbertura := False;

    if edtDataFechamento.Text <> C_DATA_EM_BRANCO then
       begin
       LFiltro.usaDataFechamento := True;
       LFiltro.dataFechamento    := StrToDate(edtDataFechamento.Text)
    end else
       LFiltro.usaDataFechamento := False;


    if edtDataTransferencia.Text <> C_DATA_EM_BRANCO then
       begin
       LFiltro.usaDataTransferencia := True;
       LFiltro.dataTransferencia    := StrToDate(edtDataTransferencia.Text)
    end else
       LFiltro.usaDataTransferencia := False;


    if edtPrevisaoSolucao.Text <> C_DATA_EM_BRANCO then
       begin
       LFiltro.usaPrevisaoSolucao := True;
       LFiltro.PrevisaoSolucao    := StrToDate(edtPrevisaoSolucao.Text)
    end else
       LFiltro.usaPrevisaoSolucao := False;

    LFiltro.idSetorDesignado   := cmbSetores.KeyValue;
    LFiltro.idUsuarioDesignado := fraPesquisaUsuario.getIdUsuario;

    FFiltroControlPc.setFiltrosControlPc(LFiltro);
    Result := True;
end;

function TfrmPaineis.AplicarFiltrosSiags: Boolean;
var
   LFiltro : TFiltrosSiags;
begin
    Result := False;

    LFiltro.idTipoAuditoria        := cmbAuditoriasSiags.KeyValue;
    LFiltro.UF                     := cmbUFSiags.KeyValue;


    LFiltro.idTipoAutorizacao         := cmbAutorizacoesSiags.KeyValue;
    LFiltro.idTipoAtendimento         := cmbAtendimentosSiags.KeyValue;
    LFiltro.idTipoSituacaoAutorizacao := cmbSituacoesSiags.KeyValue;
    LFiltro.idTipoUltimaAnotacao      := cmbUltimasAnotacoesSiags.KeyValue;
    LFiltro.idTipoPrazoCaixa          := cmbPrazosCaixaSiags.KeyValue;
    LFiltro.idTipoPrazoANS            := cmbPrazosAnsSiags.KeyValue;
    LFiltro.idSetorDesignado          := cmbSetores.KeyValue;
    LFiltro.idUsuarioDesignado        := fraPesquisaUsuario.getIdUsuario;

    FFiltroSiags.setFiltrosSiags(LFiltro);
    Result := True;
end;

procedure TfrmPaineis.AtualizarPainel(const AAtualizar: Boolean);
begin
   if not AAtualizar then exit;

   if pgcPaineis.ActivePage = tbsAutoSC then
      dbgAutoSCRowChanged(Self)
   else if pgcPaineis.ActivePage = tbsSiags then
      dbgSiagsRowChanged(Self)
   else if pgcPaineis.ActivePage = tbsControlPc then
      dbgControlPcRowChanged(Self)
end;

procedure TfrmPaineis.btnFecharHistoricoSiagsClick(Sender: TObject);
begin
   HabilitarEdicaoDoPainel(Self, pnlHistoricoAtualizacoesSiags, false);
end;

procedure TfrmPaineis.btnFiltrarControlPcClick(Sender: TObject);
begin
   if AplicarFiltrosControlPc then
      begin
      FServiceControlPc.Filtrar(FFiltroControlPc.getFiltrosControlPcAsJSON);

      HabilitarEdicaoDoPainel(Self, pnlFiltrosControlPc, False);
   end;
end;

procedure TfrmPaineis.BotoesDeEdicao(const AHabilitar: Boolean);
begin
   btnDesignar.Enabled := not AHabilitar;
   btnExportar.Enabled := not AHabilitar;
   btnExportar.Enabled := not AHabilitar;
   btnImprimir.Enabled := not AHabilitar;
   btnSair.Enabled     := not AHabilitar;
end;

procedure TfrmPaineis.BotoesObservacao(const AHabilitar: Boolean);
begin
   dbnObservacoes.Enabled        := not AHabilitar;
   btnIncluirObservacao.Enabled  := not AHabilitar;
   memObservacao.ReadOnly        := not AHabilitar;
   btnFecharObservacao.Enabled   := not AHabilitar;

   btnGravarObservacao.Enabled   := AHabilitar;
   btnCancelarObservacao.Enabled := AHabilitar;

   if memObservacao.ReadOnly then
      memObservacao.Color := clBtnFace
   else
      memObservacao.Color := clWhite;
end;

procedure TfrmPaineis.FiltrosAutoSC;
var
   LFiltro : TFiltrosAutoSc;
begin
   pnlSelecaoDesignacao.Parent := pnlCamposFiltroAutoSc;
   fraPesquisaUsuario.setDataSet(FServiceAutoSC.DataSetPesquisaDeUsuario);

   LFiltro := FFiltroAutoSC.getFiltrosAutoSCAsRecord;

   cmbAuditoriasAutoSc.KeyValue      := LFiltro.idTipoAuditoria;
   cmbPrazosCaixaAutoSc.KeyValue     := LFiltro.idTipoPrazoCaixa;
   cmbPrazosCaixaHojeAutoSc.KeyValue := LFiltro.idTipoPrazoCaixaHoje;
   cmbPrazosAnsAutoSc.KeyValue       := LFiltro.idTipoPrazoANS;
   cmbUFAutoSc.KeyValue              := LFiltro.UF;
   cmbTipoProcessoAutoSc.KeyValue    := LFiltro.idTipoProcesso;
   cmbTipoProcessoEAutoSc.KeyValue   := LFiltro.idTipoProcessoE;
   cmbStatusAutoSc.KeyValue          := LFiltro.idTipoStatus;
   cmbSetores.KeyValue               := LFiltro.idSetorDesignado;
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

procedure TfrmPaineis.FiltrosControlPc;
var
   LFiltro : TFiltrosControlPc;
begin




   pnlSelecaoDesignacao.Parent := pnlCamposFiltroControlPc;
   fraPesquisaUsuario.setDataSet(FServiceControlPc.DataSetPesquisaDeUsuario);

   LFiltro := FFiltroControlPc.getFiltrosControlPcAsRecord;

   cmbTiposStatusControlPc.KeyValue := LFiltro.idTipoStatus;
   cmbPrazos.KeyValue               := LFiltro.idTipoPrazo;
   cmbTecnicos.KeyValue             := LFiltro.idTecnico;
   cmbTiposCliente.KeyValue         := LFiltro.idTipoCliente;
   cmbTipoReclame.ItemIndex         := cmbTipoReclame.Items.IndexOf(LFiltro.tipoReclame);
   cmbTipoNip.ItemIndex             := cmbTipoNip.Items.IndexOf(LFiltro.tipoNip);
   cmbSetores.KeyValue              := LFiltro.idSetorDesignado;
   fraPesquisaUsuario.setIdUsuario(LFiltro.idUsuarioDesignado);

   if LFiltro.usaDataAbertura then
      edtDataAbertura.Text := DateToStr(LFiltro.dataAbertura)
   else
      edtDataAbertura.Text := '';

   if LFiltro.usaDataFechamento then
      edtDataFechamento.Text := DateToStr(LFiltro.dataFechamento)
   else
      edtDataFechamento.Text := '';

   if LFiltro.usaDataTransferencia then
      edtDataTransferencia.Text := DateToStr(LFiltro.dataTransferencia)
   else
      edtDataTransferencia.Text := '';

   if LFiltro.usaPrevisaoSolucao then
      edtPrevisaoSolucao.Text := DateToStr(LFiltro.PrevisaoSolucao)
   else
      edtPrevisaoSolucao.Text := '';

   HabilitarEdicaoDoPainel(Self, pnlFiltrosControlPc, True);
//   ConfigurarDataSourcesControlPc;

end;

procedure TfrmPaineis.FiltrosSiags;
var
   LFiltro : TFiltrosSiags;
begin
   pnlSelecaoDesignacao.Parent := pnlCamposFiltroSiags;
   fraPesquisaUsuario.setDataSet(FServiceSiags.DataSetPesquisaDeUsuario);

   LFiltro := FFiltroSiags.getFiltrosSiagsAsRecord;

   cmbAuditoriasSiags.KeyValue       := LFiltro.idTipoAuditoria;
   cmbUFSiags.KeyValue               := LFiltro.UF;
   cmbAutorizacoesSiags.KeyValue     := LFiltro.idTipoAutorizacao;
   cmbAtendimentosSiags.KeyValue     := LFiltro.idTipoAtendimento;
   cmbSituacoesSiags.KeyValue        := LFiltro.idTipoSituacaoAutorizacao;
   cmbUltimasAnotacoesSiags.KeyValue := LFiltro.idTipoUltimaAnotacao;
   cmbPrazosCaixaSiags.KeyValue      := LFiltro.idTipoPrazoCaixa;
   cmbPrazosAnsSiags.KeyValue        := LFiltro.idTipoPrazoANS;
   cmbSetores.KeyValue               := LFiltro.idSetorDesignado;

   fraPesquisaUsuario.setIdUsuario(LFiltro.idUsuarioDesignado);

   HabilitarEdicaoDoPainel(Self, pnlFiltrosSiags, True);
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

   FreeAndNil(FFiltroSiags);
   FreeAndNil(FServiceSiags);

   FreeAndNil(FFiltroControlPc);
   FreeAndNil(FServiceControlPc);

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

procedure TfrmPaineis.OrdenarGrid(const ADataSet : TDataSet; const AFieldName : String);
var
   LIndice: string;
   LExiste: boolean;
begin
   if (ADataSet as TClientDataSet).IndexFieldNames = AFieldName then
     begin
     LIndice := AnsiUpperCase(AFieldName+'_INV');

     try
       (ADataSet as TClientDataSet).IndexDefs.Find(LIndice);
       LExiste := true;
     except
       LExiste := false;
     end;

     if not LExiste then
       with (ADataSet as TClientDataSet).IndexDefs.AddIndexDef do begin
         Name := LIndice;
         Fields := AFieldName;
         Options := [ixDescending];
       end;
      (ADataSet as TClientDataSet).IndexName := LIndice;
      end
   else
     (ADataSet as TClientDataSet).IndexFieldNames := AFieldName;
end;

procedure TfrmPaineis.btnCancelaEncerramentoClick(Sender: TObject);
begin
   memJustificativaEncerramento.Text := '';
   HabilitarEdicaoDoPainel(Self, pnlEncerramento, False);
end;

procedure TfrmPaineis.btnCancelarDesignacaoClick(Sender: TObject);
begin
   HabilitarEdicaoDoPainel(Self, pnlDesignacao, False);
   memJustificativa.Text := '';
end;

procedure TfrmPaineis.btnCancelarFiltroAutoSCClick(Sender: TObject);
begin
   HabilitarEdicaoDoPainel(Self, pnlFiltrosAutoSC, False);
end;

procedure TfrmPaineis.btnCancelarFiltroControlPcClick(Sender: TObject);
begin
   HabilitarEdicaoDoPainel(Self, pnlFiltrosControlPc, False);
end;

procedure TfrmPaineis.btnCancelarFiltroSiagsClick(Sender: TObject);
begin
   HabilitarEdicaoDoPainel(Self, pnlFiltrosSiags, False);
end;

procedure TfrmPaineis.btnCancelarObservacaoClick(Sender: TObject);
begin
   if pgcPaineis.ActivePage = tbsAutoSC then
      FServiceAutoSC.CancelarObservacao
   else if pgcPaineis.ActivePage = tbsSiags then
      FServiceSiags.CancelarObservacao
   else if pgcPaineis.ActivePage = tbsControlPc then
      FServiceControlPc.CancelarObservacao;

   BotoesObservacao(False);
end;

procedure TfrmPaineis.btnConfirmaEncerramentoClick(Sender: TObject);
begin
   if pgcPaineis.ActivePage = tbsAutoSC then
      FServiceAutoSC.Encerrar(memJustificativaEncerramento.Text)
   else if pgcPaineis.ActivePage = tbsSiags then
      FServiceSiags.Encerrar(memJustificativaEncerramento.Text)
   else if pgcPaineis.ActivePage = tbsControlPc then
      FServiceControlPc.Encerrar(memJustificativaEncerramento.Text);

   memJustificativaEncerramento.Text := '';
   HabilitarEdicaoDoPainel(Self, pnlEncerramento, False);
end;

procedure TfrmPaineis.btnConfirmarDesignacaoClick(Sender: TObject);
var
   LDesignou : Boolean;
begin

   if pgcPaineis.ActivePage = tbsAutoSC then
      begin
      LDesignou := FServiceAutoSC.Designar(memJustificativa.Text,
                                           cmbSetores.KeyValue,
                                           fraPesquisaUsuario.getIdUsuario);
   end else if pgcPaineis.ActivePage = tbsSiags then
      begin
      LDesignou := FServiceSiags.Designar(memJustificativa.Text,
                                          cmbSetores.KeyValue,
                                          fraPesquisaUsuario.getIdUsuario);
   end else if pgcPaineis.ActivePage = tbsControlPc then
      begin
      LDesignou := FServiceControlPc.Designar(memJustificativa.Text,
                                     cmbSetores.KeyValue,
                                     fraPesquisaUsuario.getIdUsuario);
   end;

   if LDesignou then
      begin
      AtualizarPainel;
      HabilitarEdicaoDoPainel(Self, pnlDesignacao, False);
   end;

end;

procedure TfrmPaineis.btnDesignarClick(Sender: TObject);
begin
   if not btnDesignar.Enabled then Exit;

   if pgcPaineis.ActivePage = tbsAutoSC then
      DesignarAutoSc
   else if pgcPaineis.ActivePage = tbsSiags  then
      DesignarSiags
   else if pgcPaineis.ActivePage = tbsControlPc  then
      DesignarControlPc
end;


procedure TfrmPaineis.btnHistoricoAtualizacoesClick(Sender: TObject);
var
   LProcesso : String;
begin
   if not btnHistoricoAtualizacoes.Enabled then exit;

   if pgcPaineis.ActivePage = tbsAutoSC then
      begin
      LProcesso := FServiceAutoSC.HistoricoDeAtualizacoes;
      lblTituloHistoricoAtualizacoesAUTOSC.Caption := 'Atualizações do Processo - AUTOSC - ' + LProcesso;
      HabilitarEdicaoDoPainel(Self, pnlHistoricoAtualizacoesAutoSc, True);
   end else if pgcPaineis.ActivePage = tbsSiags then
      begin
      LProcesso := FServiceSiags.HistoricoDeAtualizacoes;
      lblTituloHistoricoAtualizacoesSiags.Caption := 'Atualizações do Processo - SIAGS - ' + LProcesso;
      HabilitarEdicaoDoPainel(Self, pnlHistoricoAtualizacoesSiags, True);
   end else if pgcPaineis.ActivePage = tbsControlPc then
      begin
      LProcesso := FServiceControlPc.HistoricoDeAtualizacoes;
      lblTituloHistoricoAtualizacoesControlPc.Caption := 'Atualizações do Processo - ControlPc - ' + LProcesso;
      HabilitarEdicaoDoPainel(Self, pnlHistoricoAtualizacoesControlPc, True);
   end;
end;

procedure TfrmPaineis.btnHistoricoDesignacoesClick(Sender: TObject);
begin
   if not btnHistoricoDesignacoes.Enabled then exit;

   ConfigurarHistoricoDeDesignacao;
   HabilitarEdicaoDoPainel(Self, pnlHistoricoDesignacoes, True);
end;

procedure TfrmPaineis.btnEncerrarClick(Sender: TObject);
begin
   if pgcPaineis.ActivePage = tbsAutoSC then
      lblTituloEncerramento.Caption := 'Encerramento de Processo - AUTOSC - ' + FServiceAutoSC.NumeroDoProcesso
   else if pgcPaineis.ActivePage = tbsSiags then
      lblTituloEncerramento.Caption := 'Encerramento de Autorização - SIAGS - ' + FServiceSiags.NumeroDaAutorizacao
   else if pgcPaineis.ActivePage = tbsControlPc then
      lblTituloEncerramento.Caption := 'Encerramento de Autorização - CONTROLPC - ' + FServiceControlPc.NumeroDoProtocolo;

   memJustificativaEncerramento.Text := '';
   HabilitarEdicaoDoPainel(Self, pnlEncerramento, True);
   memJustificativaEncerramento.SetFocus;
end;

procedure TfrmPaineis.btnExportarClick(Sender: TObject);
begin
   InformationMessage('Em desenvolvimento','Status');
end;

procedure TfrmPaineis.btnFecharExibicaoConteudoClick(Sender: TObject);
begin
   HabilitarEdicaoDoPainel(Self, pnlExibirConteudo, false);
end;

procedure TfrmPaineis.btnFecharHistoricoAtualizacoesClick(Sender: TObject);
begin
   HabilitarEdicaoDoPainel(Self, pnlHistoricoAtualizacoesAutoSc, false);
end;

procedure TfrmPaineis.btnFecharHistoricoDesignacaoClick(Sender: TObject);
begin
   HabilitarEdicaoDoPainel(Self, pnlHistoricoDesignacoes, false);
end;

procedure TfrmPaineis.btnFecharObservacaoClick(Sender: TObject);
begin
   HabilitarEdicaoDoPainel(Self, pnlObservacoesProcesso, false);
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
      FiltrosAutoSC
   else if pgcPaineis.ActivePage = tbsSiags then
      FiltrosSiags
   else if pgcPaineis.ActivePage = tbsControlPc then
      FiltrosControlPc
end;

procedure TfrmPaineis.btnFiltrarSiagsClick(Sender: TObject);
begin
   if AplicarFiltrosSiags then
      begin
      FServiceSiags.Filtrar(FFiltroSiags.getFiltrosSiagsAsJSON);

      HabilitarEdicaoDoPainel(Self, pnlFiltrosSiags, False);
   end;
end;

procedure TfrmPaineis.btnGravarObservacaoClick(Sender: TObject);
var
   LGravouObs : Boolean;
begin
   if pgcPaineis.ActivePage = tbsAutoSC then
      LGravouObs := FServiceAutoSC.GravarObservacao(memObservacao.Text)
   else if pgcPaineis.ActivePage = tbsSiags then
      LGravouObs := FServiceSiags.GravarObservacao(memObservacao.Text)
   else if pgcPaineis.ActivePage = tbsControlPc then
      LGravouObs := FServiceControlPc.GravarObservacao(memObservacao.Text);

   if LGravouObs then
      begin
      AtualizarPainel;
      BotoesObservacao(False);
   end;
end;

procedure TfrmPaineis.btnImprimirClick(Sender: TObject);
begin
   InformationMessage('Em desenvolvimento','Status');
end;

procedure TfrmPaineis.btnIncluirObservacaoClick(Sender: TObject);
begin
   if pgcPaineis.ActivePage = tbsAutoSC then
      FServiceAutoSC.IncluirObservacao
   else if pgcPaineis.ActivePage = tbsSiags then
      FServiceSiags.IncluirObservacao
   else if pgcPaineis.ActivePage = tbsControlPc then
      FServiceControlPc.IncluirObservacao;

   BotoesObservacao(True);
   HabilitarEdicaoDoPainel(self, pnlObservacoesProcesso, True);
end;

procedure TfrmPaineis.btnObservacoesClick(Sender: TObject);
begin
   BotoesObservacao(False);
   ConfigurarObservacoes;
   if pgcPaineis.ActivePage = tbsAutoSC then
      FServiceAutoSC.ObservacoesDoProcesso
   else if pgcPaineis.ActivePage = tbsSiags then
      FServiceSiags.ObservacoesDaAutorizacao
   else if pgcPaineis.ActivePage = tbsControlPc then
      FServiceControlPc.ObservacoesDaAutorizacao;

   HabilitarEdicaoDoPainel(Self, pnlObservacoesProcesso, True);
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
   btnEncerrar.Visible := True;

   btnHistoricoDesignacoes.Visible  := True;
   btnHistoricoAtualizacoes.Visible := True;
   btnObservacoes.Visible           := True;

   btnHistoricoDesignacoes.Enabled  := False;
   btnHistoricoAtualizacoes.Enabled := False;
   btnObservacoes.Enabled           := False;
   btnEncerrar.Enabled              := False;
   btnExportar.Enabled              := False;
   btnImprimir.Enabled              := False;
   btnDesignar.Enabled              := False;
end;

procedure TfrmPaineis.ConfigurarBotoesDeOperacao;
var
   LHabilitar : Boolean;
begin
   LHabilitar := False;

   case pgcPaineis.ActivePageIndex of
      C_CODIGO_AUTOSC    : LHabilitar := FServiceAutoSC.TemRegistros;
      C_CODIGO_SIAGS     : LHabilitar := FServiceSiags.TemRegistros;
      C_CODIGO_CONTROLPC : LHabilitar := FServiceControlPc.TemRegistros;
   end;

   btnImprimir.Enabled := LHabilitar;
   btnDesignar.Enabled := LHabilitar;
   btnExportar.Enabled := LHabilitar;
   btnEncerrar.Enabled := LHabilitar;
end;

procedure TfrmPaineis.ConfigurarDataSourcesControlPc;
begin
   cmbTiposStatusControlPc.ListSource := FServiceControlPc.DataSourceTipoStatus;
   cmbPrazos.ListSource               := FServiceControlPc.DataSourceTiposPrazo;
   cmbTecnicos.ListSource             := FServiceControlPc.DataSourceTecnicos;
   cmbTiposCliente.ListSource         := FServiceControlPc.DataSourceTiposCliente;
   dbgControlPc.DataSource            := FServiceControlPc.DataSourcePainel;
end;

procedure TfrmPaineis.ConfigurarHistoricoDeDesignacao;
begin
   case pgcPaineis.ActivePageIndex of
      C_CODIGO_AUTOSC : begin
          dbnHistoricoDesignacoes.DataSource    := FServiceAutoSC.DataSourceDesignacao;
          edtDataHoraDesignacao.DataSource      := FServiceAutoSC.DataSourceDesignacao;
          edtResponsavelDesignacao.DataSource   := FServiceAutoSC.DataSourceDesignacao;
          edtSetorDesignacao.DataSource         := FServiceAutoSC.DataSourceDesignacao;
          edtUsuarioDesignacao.DataSource       := FServiceAutoSC.DataSourceDesignacao;
          memJustificativaDesignacao.DataSource := FServiceAutoSC.DataSourceDesignacao;

          lblTituloHistoricoDesignacoes.Caption := 'Designações do Processo - AUTOSC - ' + FServiceAutoSC.HistoricoDeDesignacoes;
      end;

      C_CODIGO_SIAGS : begin
          dbnHistoricoDesignacoes.DataSource    := FServiceSiags.DataSourceDesignacao;
          edtDataHoraDesignacao.DataSource      := FServiceSiags.DataSourceDesignacao;
          edtResponsavelDesignacao.DataSource   := FServiceSiags.DataSourceDesignacao;
          edtSetorDesignacao.DataSource         := FServiceSiags.DataSourceDesignacao;
          edtUsuarioDesignacao.DataSource       := FServiceSiags.DataSourceDesignacao;
          memJustificativaDesignacao.DataSource := FServiceSiags.DataSourceDesignacao;

          lblTituloHistoricoDesignacoes.Caption := 'Designações da Autorização - SIAGS - ' + FServiceSiags.HistoricoDeDesignacoes;
      end;

      C_CODIGO_CONTROLPC : begin
          dbnHistoricoDesignacoes.DataSource    := FServiceControlPc.DataSourceDesignacao;
          edtDataHoraDesignacao.DataSource      := FServiceControlPc.DataSourceDesignacao;
          edtResponsavelDesignacao.DataSource   := FServiceControlPc.DataSourceDesignacao;
          edtSetorDesignacao.DataSource         := FServiceControlPc.DataSourceDesignacao;
          edtUsuarioDesignacao.DataSource       := FServiceControlPc.DataSourceDesignacao;
          memJustificativaDesignacao.DataSource := FServiceControlPc.DataSourceDesignacao;

          lblTituloHistoricoDesignacoes.Caption := 'Designações da Autorização - CONTROLPC - ' + FServiceControlPc.HistoricoDeDesignacoes;
      end;
   end;
end;

procedure TfrmPaineis.ConfigurarObservacoes;
begin
   case pgcPaineis.ActivePageIndex of
      C_CODIGO_AUTOSC : begin
         edtDataHoraObservacao.DataSource := FServiceAutoSC.DataSourceObservacao;
         edtUsuarioObservacao.DataSource  := FServiceAutoSC.DataSourceObservacao;
         memObservacao.DataSource         := FServiceAutoSC.DataSourceObservacao;
         dbnObservacoes.DataSource        := FServiceAutoSC.DataSourceObservacao;

         lblTituloObservacoesProcesso.Caption := 'Observações do Processo - AUTOSC - ' +FServiceAutoSC.NumeroDoProcesso;
      end;

      C_CODIGO_SIAGS : begin
         edtDataHoraObservacao.DataSource := FServiceSiags.DataSourceObservacao;
         edtUsuarioObservacao.DataSource  := FServiceSiags.DataSourceObservacao;
         memObservacao.DataSource         := FServiceSiags.DataSourceObservacao;
         dbnObservacoes.DataSource        := FServiceSiags.DataSourceObservacao;

         lblTituloObservacoesProcesso.Caption := 'Observações da Autorização - SIAGS - ' +FServiceSiags.NumeroDaAutorizacao;
      end;

      C_CODIGO_CONTROLPC : begin
         edtDataHoraObservacao.DataSource := FServiceControlPc.DataSourceObservacao;
         edtUsuarioObservacao.DataSource  := FServiceControlPc.DataSourceObservacao;
         memObservacao.DataSource         := FServiceControlPc.DataSourceObservacao;
         dbnObservacoes.DataSource        := FServiceControlPc.DataSourceObservacao;

         lblTituloObservacoesProcesso.Caption := 'Observações da Autorização - CONTROLPC - ' +FServiceControlPc.NumeroDoProtocolo;
      end;
   end;
end;

procedure TfrmPaineis.ConfigurarTabSheets;
begin
   tbsAutoSC.TabVisible := Seguranca.PodeAUTOSC;
   if tbsAutoSC.TabVisible then
      begin
      FServiceAutoSC := TSrvAutoSC.create(Fdm.SQLConnection);
      FFiltroAutoSC := TFiltros.create(C_CODIGO_AUTOSC);
   end;

   tbsSiags.TabVisible := Seguranca.PodeSIAGS;
   if tbsSiags.TabVisible then
      begin
      FServiceSiags := TSrvSiags.create(Fdm.SQLConnection);
      FFiltroSiags := TFiltros.create(C_CODIGO_SIAGS);
   end;

   tbsControlPc.TabVisible := Seguranca.PodeCONTROLPC;
   if tbsControlPc.TabVisible then
      begin
      FServiceControlPc := TSrvControlPc.create(Fdm.SQLConnection);
      FFiltroControlPc := TFiltros.create(C_CODIGO_CONTROLPC);

      ConfigurarDataSourcesControlPc;
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
   btnHistoricoDesignacoes.Enabled  := FServiceAutoSC.TemDesignacoes;
   btnHistoricoAtualizacoes.Enabled := FServiceAutoSC.TemAtualizacoes;
   btnImprimir.Enabled              := FServiceAutoSC.TemRegistros;
   btnExportar.Enabled              := FServiceAutoSC.TemRegistros;
   btnObservacoes.Enabled           := FServiceAutoSC.TemRegistros;
   btnDesignar.Enabled              := FServiceAutoSC.TemRegistros;
   btnEncerrar.Enabled              := FServiceAutoSC.TemRegistros;
end;

procedure TfrmPaineis.dbgAutoSCTitleButtonClick(Sender: TObject; AFieldName: string);
begin
   OrdenarGrid(dbgAutoSC.DataSource.DataSet,AFieldName);
end;

procedure TfrmPaineis.dbgControlPcDblClick(Sender: TObject);
var
  LColuna : Integer;
  LLinha  : Integer;
  LPoint  : TGridCoord;
  LCampo  : String;

begin
   LPoint := dbgControlPc.MouseCoord(Mouse.CursorPos.X - dbgControlPc.ClientOrigin.X,
                                     Mouse.CursorPos.Y - dbgControlPc.ClientOrigin.Y);

   LCampo := '';
   if (LPoint.X > 0) and (LPoint.X <= dbgControlPc.GetColCount) then
      LCampo := dbgControlPc.Columns[LPoint.X - 1].FieldName;

   if (LCampo = 'Tipo_Classificacao') or (LCampo = 'Solicitacao_Cliente') then
      begin
      memExibirConteudo.Text := FServiceControlPc.Conteudo(LCampo);
      lblTituloExibicaoConteudo.Caption := dbgControlPc.Columns[LPoint.X-1].DisplayLabel;

      HabilitarEdicaoDoPainel(Self, pnlExibirConteudo, memExibirConteudo.Text <> '');
   end else
      btnDesignarClick(Self);
end;

procedure TfrmPaineis.dbgControlPcRowChanged(Sender: TObject);
begin
   btnHistoricoDesignacoes.Enabled  := FServiceControlPc.TemDesignacoes;
   btnHistoricoAtualizacoes.Enabled := FServiceControlPc.TemAtualizacoes;
   btnImprimir.Enabled              := FServiceControlPc.TemRegistros;
   btnExportar.Enabled              := FServiceControlPc.TemRegistros;
   btnObservacoes.Enabled           := FServiceControlPc.TemRegistros;
   btnDesignar.Enabled              := FServiceControlPc.TemRegistros;
   btnEncerrar.Enabled              := FServiceControlPc.TemRegistros;
end;

procedure TfrmPaineis.dbgControlPcTitleButtonClick(Sender: TObject; AFieldName: string);
begin
   OrdenarGrid(dbgControlPc.DataSource.DataSet, AFieldName);
end;

procedure TfrmPaineis.dbgSiagsRowChanged(Sender: TObject);
begin
   btnHistoricoDesignacoes.Enabled  := FServiceSiags.TemDesignacoes;
   btnHistoricoAtualizacoes.Enabled := FServiceSiags.TemAtualizacoes;
   btnImprimir.Enabled              := FServiceSiags.TemRegistros;
   btnExportar.Enabled              := FServiceSiags.TemRegistros;
   btnObservacoes.Enabled           := FServiceSiags.TemRegistros;
   btnDesignar.Enabled              := FServiceSiags.TemRegistros;
   btnEncerrar.Enabled              := FServiceSiags.TemRegistros;
end;

procedure TfrmPaineis.dbgSiagsTitleButtonClick(Sender: TObject; AFieldName: string);
begin
   OrdenarGrid(dbgSiags.DataSource.DataSet, AFieldName);
end;

procedure TfrmPaineis.DesignarAutoSc;
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

   memJustificativa.Text := '';
   HabilitarEdicaoDoPainel(Self, pnlDesignacao, True);
   memJustificativa.SetFocus;
end;

procedure TfrmPaineis.DesignarControlPc;
begin
   FServiceControlPc.DesignacaoExcluirTodos;

   if not FServiceControlPc.SetorDesignado > 0 then
      cmbSetores.KeyValue := FServiceControlPc.SetorDesignado
   else
      cmbSetores.KeyValue := C_CODIGO_NAO_DESIGNADO;

   if not FServiceControlPc.UsuarioDesignado > 0 then
      fraPesquisaUsuario.setIdUsuario(FServiceControlPc.UsuarioDesignado)
   else
      fraPesquisaUsuario.setIdUsuario(C_CODIGO_NAO_DESIGNADO);

   lblTituloDesignacao.Caption := 'Designição de Protocolo - CONTROLPC - ' + FServiceControlPc.NumeroDoProtocolo;
   pnlSelecaoDesignacao.Parent := pnlCamposDesignacao;
   memJustificativa.Text       := '';

   HabilitarEdicaoDoPainel(Self, pnlDesignacao, True);
   memJustificativa.SetFocus;
end;

procedure TfrmPaineis.DesignarSiags;
begin
   FServiceSiags.DesignacaoExcluirTodos;

   if not FServiceSiags.SetorDesignado > 0 then
      cmbSetores.KeyValue := FServiceSiags.SetorDesignado
   else
      cmbSetores.KeyValue := C_CODIGO_NAO_DESIGNADO;

   if not FServiceSiags.UsuarioDesignado > 0 then
      fraPesquisaUsuario.setIdUsuario(FServiceSiags.UsuarioDesignado)
   else
      fraPesquisaUsuario.setIdUsuario(C_CODIGO_NAO_DESIGNADO);

   lblTituloDesignacao.Caption := 'Designição de Autorização - Siags - ' + FServiceSiags.NumeroDaAutorizacao;
   pnlSelecaoDesignacao.Parent := pnlCamposDesignacao;
   memJustificativa.Text       := '';

   HabilitarEdicaoDoPainel(Self, pnlDesignacao, True);
   memJustificativa.SetFocus;
end;

procedure TfrmPaineis.edtDataAberturaExit(Sender: TObject);
begin
   if (ActiveControl.Tag = 1) or ((Sender as TMaskEdit).Text = C_DATA_EM_BRANCO) then exit;

   VerificarData((Sender as TMaskEdit));

end;

end.
