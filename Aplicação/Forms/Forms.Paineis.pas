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
  Vcl.Menus,

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
  Util.Funcoes,

  Providers.Panels.Conexao,

  Frames.Pesquisa.Usuario;

(*
  IdBaseComponent,
  IdComponent,
  IdCustomTCPServer,
  IdMappedPortTCP,
  IdMappedTelnet;
*)
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
    pnlOpcoesFiltrosAutoSc: TPanel;
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
    btnAlterarStatusTrue: TSpeedButton;
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
    pnlMudancaStatus: TPanel;
    lblTituloEncerramento: TLabel;
    pndDadosMudancaStatus: TPanel;
    btnBotoesMudancaStatus: TPanel;
    btnConfirmaMudancaStatus: TBitBtn;
    btnCancelaMudancaStatus: TBitBtn;
    Panel11: TPanel;
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
    pnlOpcoesFiltrosSiags: TPanel;
    Label32: TLabel;
    Label39: TLabel;
    cmbAutorizacoesSiags: TDBLookupComboBox;
    Label33: TLabel;
    Label42: TLabel;
    cmbAtendimentosSiags: TDBLookupComboBox;
    TabSheet8: TTabSheet;
    pnlHistoricoAtualizacoesSiags: TPanel;
    lblTituloHistoricoAtualizacoesSiags: TLabel;
    Panel13: TPanel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label40: TLabel;
    Panel16: TPanel;
    btnFecharHistoricoSiags: TBitBtn;
    DBNavigator1: TDBNavigator;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit17: TDBEdit;
    Label52: TLabel;
    Label54: TLabel;
    DBEdit19: TDBEdit;
    pnlGridControlPc: TPanel;
    dbgControlPc: TwwDBGrid;
    pnlTituloControlPc: TPanel;
    TabSheet9: TTabSheet;
    pnlFiltrosControlPc: TPanel;
    Label34: TLabel;
    pnlCamposFiltroControlPc: TPanel;
    pnlBotoesFiltrosControlPc: TPanel;
    btnFiltrarControlPc: TBitBtn;
    btnCancelarFiltroControlPc: TBitBtn;
    pnlOpcoesFiltrosControlPc: TPanel;
    Label63: TLabel;
    Label67: TLabel;
    Label69: TLabel;
    Label71: TLabel;
    cmbTecnicos: TDBLookupComboBox;
    edtDataAbertura: TMaskEdit;
    cmbTiposCliente: TDBLookupComboBox;
    Label61: TLabel;
    cmbTipoReclame: TComboBox;
    cmbTipoNip: TComboBox;
    Label70: TLabel;
    edtPrevisaoSolucao: TMaskEdit;
    TabSheet10: TTabSheet;
    pnlHistoricoAtualizacoesControlPc: TPanel;
    lblTituloHistoricoAtualizacoesControlPc: TLabel;
    Panel19: TPanel;
    Label72: TLabel;
    Label73: TLabel;
    Label75: TLabel;
    Label78: TLabel;
    Panel20: TPanel;
    btnFechraHistoricoControlPc: TBitBtn;
    dbnControlPc: TDBNavigator;
    dbeDataHoraHistoricoControlPc: TDBEdit;
    dbeResponsavelHistoricoControlPc: TDBEdit;
    dbeTecnicoHistoricoControlPc: TDBEdit;
    dbeTipoClienteHistoricoControlPc: TDBEdit;
    Label68: TLabel;
    edtNumeroProcesso: TEdit;
    edtNumeroAutorizacao: TEdit;
    Label79: TLabel;
    Label80: TLabel;
    edtNumeroProtocolo: TEdit;
    btnExtrato: TSpeedButton;
    edtDataPrazoCaixaSiags: TMaskEdit;
    edtDataPrazoAnsSiags: TMaskEdit;
    ltbDesignacoesSelecionadas: TListBox;
    lblDesignacoesSelecionadas: TLabel;
    btnExcluirDesignacaoSelecionada: TSpeedButton;
    Label41: TLabel;
    edtStausAtual: TEdit;
    pnlJustificativa: TPanel;
    Label28: TLabel;
    memJustificativaEncerramento: TMemo;
    Label43: TLabel;
    dbeStatusTrueHistoricoControlPc: TDBEdit;
    TabSheet11: TTabSheet;
    TabSheet12: TTabSheet;
    pnlStatusTrue: TPanel;
    Label31: TLabel;
    cmbStatusTrue: TDBLookupComboBox;
    Label44: TLabel;
    Label62: TLabel;
    pnlSelecaoDesignacao: TPanel;
    Label8: TLabel;
    fraPesquisaUsuario: TfraPesquisaUsuario;
    cmbSetores: TDBLookupComboBox;
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
    procedure btnConfirmaMudancaStatusClick(Sender: TObject);
    procedure btnAlterarStatusTrueClick(Sender: TObject);
    procedure btnCancelaMudancaStatusClick(Sender: TObject);
    procedure dbgControlPcTitleButtonClick(Sender: TObject; AFieldName: string);
    procedure dbgControlPcRowChanged(Sender: TObject);
    procedure btnFiltrarControlPcClick(Sender: TObject);
    procedure btnCancelarFiltroControlPcClick(Sender: TObject);
    procedure edtDataAberturaExit(Sender: TObject);
    procedure btnFechraHistoricoControlPcClick(Sender: TObject);
    procedure memObservacaoKeyPress(Sender: TObject; var Key: Char);
    procedure btnExtratoClick(Sender: TObject);
    procedure cmbSetoresClick(Sender: TObject);
    procedure cmbSetoresEnter(Sender: TObject);
    procedure btnExcluirDesignacaoSelecionadaClick(Sender: TObject);
    procedure dbgControlPcFieldChanged(Sender: TObject; Field: TField);
    procedure ltbDesignacoesSelecionadasExit(Sender: TObject);
    procedure dbgControlPcCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure dbgSiagsFieldChanged(Sender: TObject; Field: TField);
    procedure dbgSiagsCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
  private
    FOldValue      : String;
    FDesignando    : Boolean;

    FServiceAutoSC : TSrvAutoSC;
    FFiltroAutoSC  : TFiltros;

    FServiceSiags  : TSrvSiags;
    FFiltroSiags   : TFiltros;

    FServiceControlPc : TSrvControlPc;
    FFiltroControlPc  : TFiltros;

    Fdm               : TdtmPaineisConexao;

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

    procedure FiltrarUsuariosDoSetor;

    procedure FecharPainelDesignacao;

  public
    { Public declarations }

    procedure BotoesDeEdicao(const AHabilitar : Boolean);
  end;

(*
var
  frmPaineis: TfrmPaineis;
*)

implementation

{$R *.dfm}

uses
(*
   Providers.Importacoes,
   Providers.Panels.AutoSC,
   Providers.Panels.Siags,
   Providers.Panels.ControlPc,
*)
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

    LFiltro.numeroDoProcesso       := edtNumeroProcesso.Text;
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

    LFiltro.numeroDoProtocolo := edtNumeroProtocolo.Text;
    LFiltro.idTecnico         := cmbTecnicos.KeyValue;
    LFiltro.idTipoCliente     := cmbTiposCliente.KeyValue;
    LFiltro.idStatusTrue      := cmbStatusTrue.KeyValue;
    LFiltro.tipoReclame       := cmbTipoReclame.Text;
    LFiltro.tipoNip           := cmbTipoNip.Text;


    if edtDataAbertura.Text <> C_DATA_EM_BRANCO then
       begin
       LFiltro.usaDataAbertura := True;
       LFiltro.dataAbertura    := StrToDate(edtDataAbertura.Text)
    end else
       LFiltro.usaDataAbertura := False;

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

    LFiltro.numeroDaAutorizacao       := edtNumeroAutorizacao.Text;
    LFiltro.idTipoAutorizacao         := cmbAutorizacoesSiags.KeyValue;
    LFiltro.idTipoAtendimento         := cmbAtendimentosSiags.KeyValue;
    LFiltro.idStatusTrue              := cmbStatusTrue.KeyValue;

    if edtDataPrazoCaixaSiags.Text <> C_DATA_EM_BRANCO then
       LFiltro.dataPrazoCaixa         := edtDataPrazoCaixaSiags.Text;

    if edtDataPrazoAnsSiags.Text <> C_DATA_EM_BRANCO then
       LFiltro.dataPrazoAns           := edtDataPrazoAnsSiags.Text;

    LFiltro.idSetorDesignado          := cmbSetores.KeyValue;
    LFiltro.idUsuarioDesignado        := fraPesquisaUsuario.getIdUsuario;

    FFiltroSiags.setFiltrosSiags(LFiltro);
    Result := True;
end;

procedure TfrmPaineis.AtualizarPainel(const AAtualizar: Boolean);
begin
   if not AAtualizar then exit;

   if pgcPaineis.ActivePage = tbsAutoSC then
      ShowMessage('Implementar')
   else if pgcPaineis.ActivePage = tbsSiags then
      begin
      FServiceSiags.AtualizarRegistrosPosDesignacao(ltbDesignacoesSelecionadas,
                                                        fraPesquisaUsuario.getIdUsuario,
                                                        cmbSetores.KeyValue,
                                                        fraPesquisaUsuario.getNomeUsuario,
                                                        cmbSetores.Text);
      dbgSiagsRowChanged(Self);
   end else if pgcPaineis.ActivePage = tbsControlPc then
      begin
      FServiceControlPc.AtualizarRegistrosPosDesignacao(ltbDesignacoesSelecionadas,
                                                        fraPesquisaUsuario.getIdUsuario,
                                                        cmbSetores.KeyValue,
                                                        fraPesquisaUsuario.getNomeUsuario,
                                                        cmbSetores.Text);
      dbgControlPcRowChanged(Self);
   end;

   ltbDesignacoesSelecionadas.Items.Clear;
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
   btnExtrato.Enabled  := not AHabilitar;
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

procedure TfrmPaineis.FecharPainelDesignacao;
begin
   HabilitarEdicaoDoPainel(Self, pnlDesignacao, False);
   memJustificativa.Text := '';

   if pgcPaineis.ActivePage = tbsAutoSC then
      FServiceAutoSC.DesignacaoIncluirTodos
   else if pgcPaineis.ActivePage = tbsSiags then
      FServiceSiags.DesignacaoIncluirTodos
   else if pgcPaineis.ActivePage = tbsControlPc then
      FServiceControlPc.DesignacaoIncluirTodos;
end;

procedure TfrmPaineis.FiltrarUsuariosDoSetor;
begin
   if pgcPaineis.ActivePage = tbsAutoSC then
      Showmessage('Implementar')
   else if pgcPaineis.ActivePage = tbsSiags then
      begin
      if (cmbSetores.KeyValue = C_CODIGO_NAO_DESIGNADO) or (cmbSetores.KeyValue = 0)  then
         fraPesquisaUsuario.setDataSet(FServiceSiags.DataSetPesquisaDeUsuario)
      else
         begin
         FServiceSiags.UsuariosDoSetor(cmbSetores.KeyValue);
         fraPesquisaUsuario.setDataSet(FServiceSiags.DataSetUsuariosDoSetor);
         fraPesquisaUsuario.setIdUsuario(C_CODIGO_NAO_DESIGNADO, FDesignando);
      end;
   end else if pgcPaineis.ActivePage = tbsControlPc then
      begin
      if (cmbSetores.KeyValue = C_CODIGO_NAO_DESIGNADO) or (cmbSetores.KeyValue = 0)  then
         fraPesquisaUsuario.setDataSet(FServiceControlPc.DataSetPesquisaDeUsuario)
      else
         begin
         FServiceControlPc.UsuariosDoSetor(cmbSetores.KeyValue);
         fraPesquisaUsuario.setDataSet(FServiceControlPc.DataSetUsuariosDoSetor);
         fraPesquisaUsuario.setIdUsuario(C_CODIGO_NAO_DESIGNADO, FDesignando);
      end;
   end;
end;

procedure TfrmPaineis.FiltrosAutoSC;
var
   LFiltro : TFiltrosAutoSc;
begin
   InformationMessage('Em manutenção','AutoSc');
   Exit;

   pnlSelecaoDesignacao.Parent := pnlCamposFiltroAutoSc;
   pnlStatusTrue.Parent        := pnlCamposFiltroAutoSc;


   cmbStatusTrue.ListSource := FServiceAutoSC.DataSourceStatusTrue;
   cmbSetores.ListSource    := FServiceAutoSC.DataSourceSetores;

   pnlStatusTrue.TabOrder        := 1;
   pnlSelecaoDesignacao.TabOrder := 2;

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
   pnlStatusTrue.Parent        := pnlCamposFiltroControlPc;

   pnlStatusTrue.TabOrder        := 1;
   pnlSelecaoDesignacao.TabOrder := 2;

   cmbStatusTrue.ListSource := FServiceControlPc.DataSourceStatusTrue;
   cmbSetores.ListSource    := FServiceControlPc.DataSourceSetores;

   fraPesquisaUsuario.setDataSet(FServiceControlPc.DataSetPesquisaDeUsuario);

   LFiltro := FFiltroControlPc.getFiltrosControlPcAsRecord;

   cmbTecnicos.KeyValue             := LFiltro.idTecnico;
   cmbTiposCliente.KeyValue         := LFiltro.idTipoCliente;
   cmbTipoReclame.ItemIndex         := cmbTipoReclame.Items.IndexOf(LFiltro.tipoReclame);
   cmbTipoNip.ItemIndex             := cmbTipoNip.Items.IndexOf(LFiltro.tipoNip);
   cmbStatusTrue.KeyValue           := LFiltro.idStatusTrue;

   if Seguranca.Perfil = C_PERFIL_USUARIO then
      begin
      LFiltro.idUsuarioDesignado := Seguranca.id;
   end;

   fraPesquisaUsuario.setIdUsuario(LFiltro.idUsuarioDesignado);

   cmbSetores.KeyValue := LFiltro.idSetorDesignado;

   if LFiltro.usaDataAbertura then
      edtDataAbertura.Text := DateToStr(LFiltro.dataAbertura)
   else
      edtDataAbertura.Text := '';

   if LFiltro.usaPrevisaoSolucao then
      edtPrevisaoSolucao.Text := DateToStr(LFiltro.PrevisaoSolucao)
   else
      edtPrevisaoSolucao.Text := '';

   HabilitarEdicaoDoPainel(Self, pnlFiltrosControlPc, True);
end;

procedure TfrmPaineis.FiltrosSiags;
var
   LFiltro : TFiltrosSiags;
begin
   pnlSelecaoDesignacao.Parent := pnlCamposFiltroSiags;
   pnlStatusTrue.Parent        := pnlCamposFiltroSiags;

   pnlStatusTrue.TabOrder        := 1;
   pnlSelecaoDesignacao.TabOrder := 2;

   cmbStatusTrue.ListSource := FServiceSiags.DataSourceStatusTrue;
   cmbSetores.ListSource    := FServiceSiags.DataSourceSetores;

   fraPesquisaUsuario.setDataSet(FServiceSiags.DataSetPesquisaDeUsuario);

   LFiltro := FFiltroSiags.getFiltrosSiagsAsRecord;

   cmbAutorizacoesSiags.KeyValue     := LFiltro.idTipoAutorizacao;
   cmbAtendimentosSiags.KeyValue     := LFiltro.idTipoAtendimento;
   edtDataPrazoCaixaSiags.Text       := LFiltro.dataPrazoCaixa;
   edtDataPrazoAnsSiags.Text         := LFiltro.dataPrazoAns;
   cmbStatusTrue.KeyValue            := LFiltro.idStatusTrue;
   cmbSetores.KeyValue               := LFiltro.idSetorDesignado;

   if Seguranca.Perfil = C_PERFIL_USUARIO then
      begin
      LFiltro.idUsuarioDesignado := Seguranca.id;
   end;

   fraPesquisaUsuario.setIdUsuario(LFiltro.idUsuarioDesignado);

   cmbSetores.KeyValue := LFiltro.idSetorDesignado;

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
   FDesignando := False;

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

   if tbsAutoSC.TabVisible then
      pgcPaineis.ActivePage := tbsAutoSC
   else if tbsSiags.TabVisible then
      pgcPaineis.ActivePage := tbsSiags
   else if tbsControlPc.TabVisible then
      pgcPaineis.ActivePage := tbsControlPc;
end;

procedure TfrmPaineis.ltbDesignacoesSelecionadasExit(Sender: TObject);
begin
   ltbDesignacoesSelecionadas.ItemIndex := -1;

end;

procedure TfrmPaineis.memObservacaoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key <> #8) and (Length(memObservacao.Text) >= 500) then
    Key := #0;
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

procedure TfrmPaineis.btnExcluirDesignacaoSelecionadaClick(Sender: TObject);
begin
   if not ltbDesignacoesSelecionadas.Focused then exit;

   ltbDesignacoesSelecionadas.Items.Delete(ltbDesignacoesSelecionadas.ItemIndex);

end;

procedure TfrmPaineis.btnCancelaMudancaStatusClick(Sender: TObject);
begin
   memJustificativaEncerramento.Text := '';
   HabilitarEdicaoDoPainel(Self, pnlMudancaStatus, False);

   if pgcPaineis.ActivePage = tbsAutoSC then
      ShowMessage('Implementar')
   else if pgcPaineis.ActivePage = tbsSiags then
      FServiceSiags.StatusTrueIncluirTodos
   else if pgcPaineis.ActivePage = tbsControlPc then
      FServiceControlPc.StatusTrueIncluirTodos;
end;

procedure TfrmPaineis.btnCancelarDesignacaoClick(Sender: TObject);
begin
   FecharPainelDesignacao;

   FDesignando := False;
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

procedure TfrmPaineis.btnConfirmaMudancaStatusClick(Sender: TObject);
begin
   if pgcPaineis.ActivePage = tbsAutoSC then
      FServiceAutoSC.AlterarStatusTrue(cmbStatusTrue.KeyValue, memJustificativaEncerramento.Text)
   else if pgcPaineis.ActivePage = tbsSiags then
      FServiceSiags.AlterarStatusTrue(cmbStatusTrue.KeyValue, memJustificativaEncerramento.Text)
   else if pgcPaineis.ActivePage = tbsControlPc then
      FServiceControlPc.AlterarStatusTrue(cmbStatusTrue.KeyValue, memJustificativaEncerramento.Text);

   memJustificativaEncerramento.Text := '';
   HabilitarEdicaoDoPainel(Self, pnlMudancaStatus, False);
end;

procedure TfrmPaineis.btnConfirmarDesignacaoClick(Sender: TObject);
var
   LDesignou : Boolean;
   LDesignacoes  : TStringList;
begin
   try
      LDesignacoes  := TStringList.Create;
      LDesignacoes.Assign(ltbDesignacoesSelecionadas.Items);

      if pgcPaineis.ActivePage = tbsAutoSC then
         begin
         ShowMessage('Implementar');
      end else if pgcPaineis.ActivePage = tbsSiags then
         begin
         if (cmbSetores.KeyValue = FServiceSiags.idSetorDesignado) and
            (fraPesquisaUsuario.getIdUsuario = FServiceSiags.idUsuarioDesignado) then
         begin
            InformationMessage('Não houve alteração de usuário ou setor. A justificativa não será registrada','Designação');
            Exit;
         end;

         LDesignou := FServiceSiags.Designar(LDesignacoes,
                                             memJustificativa.Text,
                                             cmbSetores.KeyValue,
                                             fraPesquisaUsuario.getIdUsuario);

      end else if pgcPaineis.ActivePage = tbsControlPc then
         begin
         if (cmbSetores.KeyValue = FServiceControlPc.idSetorDesignado) and
            (fraPesquisaUsuario.getIdUsuario = FServiceControlPc.idUsuarioDesignado) then
         begin
            InformationMessage('Não houve alteração de usuário ou setor. A justificativa não será registrada','Designação');
            Exit;
         end;

         LDesignou := FServiceControlPc.Designar(LDesignacoes,
                                                 memJustificativa.Text,
                                                 cmbSetores.KeyValue,
                                                 fraPesquisaUsuario.getIdUsuario);
      end;

      if LDesignou then
         begin
         AtualizarPainel;
         FecharPainelDesignacao;
         InformationMessage(C_GRAVADO_COM_SUCESSO,'Designação');
      end;

   finally
      FreeAndNil(LDesignacoes);
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
      DesignarControlPc;

   FDesignando := True;
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
      lblTituloHistoricoAtualizacoesSiags.Caption := 'Atualizações do Autorizações - SIAGS - ' + LProcesso;
      HabilitarEdicaoDoPainel(Self, pnlHistoricoAtualizacoesSiags, True);
   end else if pgcPaineis.ActivePage = tbsControlPc then
      begin
      LProcesso := FServiceControlPc.HistoricoDeAtualizacoes;
      lblTituloHistoricoAtualizacoesControlPc.Caption := 'Atualizações do Protocolos - CONTROLPC - ' + LProcesso;
      HabilitarEdicaoDoPainel(Self, pnlHistoricoAtualizacoesControlPc, True);
   end;
end;

procedure TfrmPaineis.btnHistoricoDesignacoesClick(Sender: TObject);
begin
   if not btnHistoricoDesignacoes.Enabled then exit;

   ConfigurarHistoricoDeDesignacao;
   HabilitarEdicaoDoPainel(Self, pnlHistoricoDesignacoes, True);
end;

procedure TfrmPaineis.btnAlterarStatusTrueClick(Sender: TObject);
begin
   if pgcPaineis.ActivePage = tbsAutoSC then
      begin
      ShowMessage('Implementar');
   end else if pgcPaineis.ActivePage = tbsSiags then
      begin
      lblTituloEncerramento.Caption := 'Alteração de Status True - SIAGS';
      edtStausAtual.Text            := FServiceSiags.StatusAtual;
      cmbStatusTrue.ListSource      := FServiceSiags.DataSourceStatusTrue;
      cmbStatusTrue.KeyValue        := -1;
      FServiceSiags.StatusTrueExcluirTodos;
   end else if pgcPaineis.ActivePage = tbsControlPc then
      begin
      lblTituloEncerramento.Caption := 'Alteração de Status True - CONTROLPC';
      edtStausAtual.Text            := FServiceControlPc.StatusAtual;
      cmbStatusTrue.ListSource      := FServiceControlPc.DataSourceStatusTrue;
      cmbStatusTrue.KeyValue        := -1;
      FServiceControlPc.StatusTrueExcluirTodos;
   end;

   memJustificativaEncerramento.Text := '';

   pnlStatusTrue.Parent := pndDadosMudancaStatus;
   pnlStatusTrue.TabOrder := 1;


   HabilitarEdicaoDoPainel(Self, pnlMudancaStatus, True);
   memJustificativaEncerramento.SetFocus;
end;

procedure TfrmPaineis.btnExportarClick(Sender: TObject);
begin
   InformationMessage('Em desenvolvimento','Status');
end;

procedure TfrmPaineis.btnExtratoClick(Sender: TObject);
var
   LFiltroAutoSC    : TFiltros;
   LFiltroSiags     : TFiltros;
   LFiltroControlPc : TFiltros;
   LNumero          : String;
begin
   if pgcPaineis.ActivePage = tbsAutoSC then
      begin
      LNumero := FServiceAutoSC.NumeroDoProcesso;

      FServiceAutoSC.DesabilitarControles;
      LFiltroAutoSC := TFiltros.Create(C_CODIGO_AUTOSC);
      LFiltroAutoSC.setFiltrosAutoSC(FFiltroAutoSC.getFiltrosAutoSCAsRecord);
      FServiceAutoSC.ImprimirExtrato(FServiceAutoSC.NumeroDoProcesso, False);
      FFiltroAutoSC.setFiltrosAutoSC(LFiltroAutoSC.getFiltrosAutoSCAsRecord);
      FreeAndNil(LFiltroAutoSC);

      btnFiltrarAutoSCClick(Self);
      FServiceAutoSC.PosicionarRegistro(LNumero);
      FServiceAutoSC.HabilitarControles;
   end else if pgcPaineis.ActivePage = tbsSiags then
      begin
      LNumero := FServiceSiags.NumeroDaAutorizacao;

      FServiceSiags.DesabilitarControles;
      LFiltroSiags := TFiltros.Create(C_CODIGO_SIAGS);
      LFiltroSiags.setFiltrosSiags(FFiltroSiags.getFiltrosSiagsAsRecord);
      FServiceSiags.ImprimirExtrato(FServiceSiags.NumeroDaAutorizacao, False);
      FFiltroSiags.setFiltrosSiags(LFiltroSiags.getFiltrosSiagsAsRecord);
      FreeAndNil(LFiltroSiags);

      btnFiltrarSiagsClick(Self);
      FServiceSiags.PosicionarRegistro(LNumero);
      FServiceSiags.HabilitarControles;
   end else if pgcPaineis.ActivePage = tbsControlPc then
      begin
      LNumero := FServiceControlPc.NumeroDoProtocolo;

      FServiceControlPc.DesabilitarControles;
      LFiltroControlPc := TFiltros.Create(C_CODIGO_CONTROLPC);
      LFiltroControlPc.setFiltrosControlPc(FFiltroControlPc.getFiltrosControlPcAsRecord);
      FServiceControlPc.ImprimirExtrato(FServiceControlPc.NumeroDoProtocolo, False);
      FFiltroControlPc.setFiltrosControlPc(LFiltroControlPc.getFiltrosControlPcAsRecord);
      FreeAndNil(LFiltroControlPc);

      btnFiltrarControlPcClick(Self);
      FServiceControlPc.PosicionarRegistro(LNumero);
      FServiceControlPc.HabilitarControles;
   end;
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

procedure TfrmPaineis.btnFechraHistoricoControlPcClick(Sender: TObject);
begin
   HabilitarEdicaoDoPainel(Self, pnlHistoricoAtualizacoesControlPc, false);
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
      FServiceControlPc.ObservacoesDoProtocolo;

   HabilitarEdicaoDoPainel(Self, pnlObservacoesProcesso, True);
end;

procedure TfrmPaineis.btnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmPaineis.cmbSetoresClick(Sender: TObject);
begin
   if cmbSetores.Text <> FOldValue then
      FiltrarUsuariosDoSetor;
end;

procedure TfrmPaineis.cmbSetoresEnter(Sender: TObject);
begin
   FOldValue := cmbSetores.Text;
end;

procedure TfrmPaineis.ConfigurarBotoes;
begin
   btnFiltrar.Visible           := True;
   btnExportar.Visible          := True;
   btnImprimir.Visible          := True;
   btnDesignar.Visible          := True;
   btnExtrato.Visible           := True;
   btnAlterarStatusTrue.Visible := True;

   btnHistoricoDesignacoes.Visible  := True;
   btnHistoricoAtualizacoes.Visible := True;
   btnObservacoes.Visible           := True;

   btnHistoricoDesignacoes.Enabled  := False;
   btnHistoricoAtualizacoes.Enabled := False;
   btnObservacoes.Enabled           := False;
   btnAlterarStatusTrue.Enabled     := False;
   btnExportar.Enabled              := False;
   btnImprimir.Enabled              := False;
   btnDesignar.Enabled              := False;
   btnExtrato.Enabled               := False;
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
   btnExtrato.Enabled  := LHabilitar;
   btnAlterarStatusTrue.Enabled := LHabilitar;
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

          lblTituloHistoricoDesignacoes.Caption := 'Designações do Protocolo - CONTROLPC - ' + FServiceControlPc.HistoricoDeDesignacoes;
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

         lblTituloObservacoesProcesso.Caption := 'Observações da Protocolo - CONTROLPC - ' +FServiceControlPc.NumeroDoProtocolo;
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
   end;
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
   btnAlterarStatusTrue.Enabled     := FServiceAutoSC.TemRegistros;
   btnExtrato.Enabled               := FServiceAutoSC.TemRegistros;
end;

procedure TfrmPaineis.dbgAutoSCTitleButtonClick(Sender: TObject; AFieldName: string);
begin
   OrdenarGrid(dbgAutoSC.DataSource.DataSet,AFieldName);
end;

procedure TfrmPaineis.dbgControlPcCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
var
   LCores : TCoresPrazo;
begin
   LCores := FServiceControlPc.PrazoCores;

   AFont.Color :=  LCores.corDaFonte;
   ABrush.Color := LCores.corDoFundo;
end;

procedure TfrmPaineis.dbgControlPcFieldChanged(Sender: TObject; Field: TField);
begin
   if (Field.FieldName = 'Selecionado') then
      FServiceControlPc.GravarSelecao;
end;

procedure TfrmPaineis.dbgControlPcRowChanged(Sender: TObject);
begin
   btnHistoricoDesignacoes.Enabled  := FServiceControlPc.TemDesignacoes;
   btnHistoricoAtualizacoes.Enabled := FServiceControlPc.TemAtualizacoes;
   btnImprimir.Enabled              := FServiceControlPc.TemRegistros;
   btnExportar.Enabled              := FServiceControlPc.TemRegistros;
   btnObservacoes.Enabled           := FServiceControlPc.TemRegistros;
   btnDesignar.Enabled              := FServiceControlPc.TemRegistros;
   btnAlterarStatusTrue.Enabled     := FServiceControlPc.TemRegistros;
   btnExtrato.Enabled               := FServiceControlPc.TemRegistros;
end;

procedure TfrmPaineis.dbgControlPcTitleButtonClick(Sender: TObject; AFieldName: string);
begin
   OrdenarGrid(dbgControlPc.DataSource.DataSet, AFieldName);
end;

procedure TfrmPaineis.dbgSiagsCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
var
   LCores : TCoresPrazo;
begin
   LCores := FServiceSiags.PrazoCores;

   AFont.Color :=  LCores.corDaFonte;
   ABrush.Color := LCores.corDoFundo;
end;

procedure TfrmPaineis.dbgSiagsFieldChanged(Sender: TObject; Field: TField);
begin
   if (Field.FieldName = 'Selecionado') then
      FServiceSiags.GravarSelecao;
end;

procedure TfrmPaineis.dbgSiagsRowChanged(Sender: TObject);
begin
   btnHistoricoDesignacoes.Enabled  := FServiceSiags.TemDesignacoes;
   btnHistoricoAtualizacoes.Enabled := FServiceSiags.TemAtualizacoes;
   btnImprimir.Enabled              := FServiceSiags.TemRegistros;
   btnExportar.Enabled              := FServiceSiags.TemRegistros;
   btnObservacoes.Enabled           := FServiceSiags.TemRegistros;
   btnDesignar.Enabled              := FServiceSiags.TemRegistros;
   btnAlterarStatusTrue.Enabled     := FServiceSiags.TemRegistros;
   btnExtrato.Enabled               := FServiceSiags.TemRegistros;
end;

procedure TfrmPaineis.dbgSiagsTitleButtonClick(Sender: TObject; AFieldName: string);
begin
   OrdenarGrid(dbgSiags.DataSource.DataSet, AFieldName);
end;

procedure TfrmPaineis.DesignarAutoSc;
begin
   FServiceAutoSC.DesignacaoExcluirTodos;

   if not FServiceAutoSC.idSetorDesignado > 0 then
      cmbSetores.KeyValue := FServiceAutoSC.idSetorDesignado
   else
      cmbSetores.KeyValue := C_CODIGO_NAO_DESIGNADO;

   if not FServiceAutoSC.idUsuarioDesignado > 0 then
      fraPesquisaUsuario.setIdUsuario(FServiceAutoSC.idUsuarioDesignado)
   else
      fraPesquisaUsuario.setIdUsuario(C_CODIGO_NAO_DESIGNADO);

   lblTituloDesignacao.Caption := 'Designição de Processo - AUTOSC';
   pnlSelecaoDesignacao.Parent := pnlCamposDesignacao;
   memJustificativa.Text       := '';

   memJustificativa.Text := '';
   HabilitarEdicaoDoPainel(Self, pnlDesignacao, True);
   memJustificativa.SetFocus;
end;

procedure TfrmPaineis.DesignarControlPc;
begin
   if not FServiceControlPc.Selecionados(ltbDesignacoesSelecionadas) then exit;

   FServiceControlPc.DesignacaoExcluirTodos;

   cmbSetores.ListSource := FServiceControlPc.DataSourceSetores;

   if FServiceControlPc.idSetorDesignado > 0 then
      cmbSetores.KeyValue := FServiceControlPc.idSetorDesignado
   else
      cmbSetores.KeyValue := C_CODIGO_NAO_DESIGNADO;

   FiltrarUsuariosDoSetor;

   if FServiceControlPc.idUsuarioDesignado > 0 then
      fraPesquisaUsuario.setIdUsuario(FServiceControlPc.idUsuarioDesignado, True)
   else
      fraPesquisaUsuario.setIdUsuario(C_CODIGO_NAO_DESIGNADO, True);

   lblDesignacoesSelecionadas.Caption := 'Protocolos';
   lblTituloDesignacao.Caption        := 'Designição de Protocolo - CONTROLPC ';
   pnlSelecaoDesignacao.Parent        := pnlCamposDesignacao;
   memJustificativa.Text              := '';

   HabilitarEdicaoDoPainel(Self, pnlDesignacao, True);
   memJustificativa.SetFocus;
end;

procedure TfrmPaineis.DesignarSiags;
begin
   if not FServiceSiags.Selecionados(ltbDesignacoesSelecionadas) then exit;

   FServiceSiags.DesignacaoExcluirTodos;

   cmbSetores.ListSource := FServiceSiags.DataSourceSetores;

   if FServiceSiags.idSetorDesignado > 0 then
      cmbSetores.KeyValue := FServiceSiags.idSetorDesignado
   else
      cmbSetores.KeyValue := C_CODIGO_NAO_DESIGNADO;

   FiltrarUsuariosDoSetor;

   if FServiceSiags.idUsuarioDesignado > 0 then
      fraPesquisaUsuario.setIdUsuario(FServiceSiags.idUsuarioDesignado, True)
   else
      fraPesquisaUsuario.setIdUsuario(C_CODIGO_NAO_DESIGNADO, True);

   lblDesignacoesSelecionadas.Caption := 'Autorizações';
   lblTituloDesignacao.Caption        := 'Designição de Autorizações - SIAGS';
   pnlSelecaoDesignacao.Parent        := pnlCamposDesignacao;
   memJustificativa.Text              := '';

   HabilitarEdicaoDoPainel(Self, pnlDesignacao, True);
   memJustificativa.SetFocus;
end;

procedure TfrmPaineis.edtDataAberturaExit(Sender: TObject);
begin
   if (ActiveControl.Tag = 1) or ((Sender as TMaskEdit).Text = C_DATA_EM_BRANCO) then exit;

   VerificarData((Sender as TMaskEdit));

end;

end.
