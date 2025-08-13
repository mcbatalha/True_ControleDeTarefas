unit Forms.Designacoes.Pendentes;

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
  Vcl.Grids,
  vcl.wwdbigrd,
  vcl.wwdbgrid,
  Vcl.ComCtrls,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.DBCtrls,

  Services.Designacoes.Pendentes.ControlPC,
  Services.Designacoes.Pendentes.Siags,
  Data.DB,

  Funcoes,
  Libs.TSeguranca, Libs.Constantes;


type
  TfrmDesignacoesPendentes = class(TForm)
    pnlForm: TPanel;
    pnlBotoes: TPanel;
    btnResponder: TSpeedButton;
    pnlSair: TPanel;
    btnSair: TSpeedButton;
    pgcPaineis: TPageControl;
    tbsAutoSC: TTabSheet;
    pnlGridAutoSC: TPanel;
    dbgAutoSC: TwwDBGrid;
    pnlTituloAutoSC: TPanel;
    tbsSiags: TTabSheet;
    pnlGridSiags: TPanel;
    dbgSiags: TwwDBGrid;
    pnlTituloSiags: TPanel;
    tbsControlPc: TTabSheet;
    pnlGridControlPc: TPanel;
    dbgControlPc: TwwDBGrid;
    pnlTituloControlPc: TPanel;
    btnFiltrar: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    pnlJustificativaDesignacao: TPanel;
    lblTituloNumero: TLabel;
    Panel19: TPanel;
    Panel20: TPanel;
    btnFechraJustificativa: TBitBtn;
    lblTituloJustificativa: TLabel;
    memJustificativa: TDBMemo;
    TabSheet2: TTabSheet;
    pnlAutorizarDesignacao: TPanel;
    lblTituloSolicitacaoDesignacao: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    btnNegarDesigacao: TBitBtn;
    lblTituloSolicitacaoNumero: TLabel;
    Label3: TLabel;
    edtStatusAtual: TDBEdit;
    edtUsuarioSolicitante: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    edtDataSolicitacao: TDBEdit;
    Label6: TLabel;
    edtUsuarioAtual: TDBEdit;
    edtUsuarioSolicitado: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    edtSetorAtual: TDBEdit;
    edtSetorSolicitado: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    memJustificativaSolicitacao: TDBMemo;
    btnCancelarDesingacao: TBitBtn;
    btnAutorizarDesignacao: TBitBtn;
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnFechraJustificativaClick(Sender: TObject);
    procedure dbgControlPcDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnResponderClick(Sender: TObject);
    procedure btnCancelarDesingacaoClick(Sender: TObject);
    procedure btnAutorizarDesignacaoClick(Sender: TObject);
    procedure btnNegarDesigacaoClick(Sender: TObject);
    procedure pgcPaineisChange(Sender: TObject);
  private
    { Private declarations }
    FServiceControlPc : TSrvDesignacoesPendentesControlPC;
    FServiceSiags     : TSrvDesignacoesPendentesSiags;

    procedure ConfigurarBotoes;
    procedure ExibirJustificativa;
    procedure ConfigurarTabSheets;
    procedure ResponderSolicitacaoAutoSc;
    procedure ResponderSolicitacaoSiags;
    procedure ResponderSolicitacaoControlPc;

    procedure EfetivarRespostaDesignacao(const AAutorizado : Boolean);

  public
    { Public declarations }
  end;

(*
var
  frmDesignacoesPendentes: TfrmDesignacoesPendentes;
*)
implementation

{$R *.dfm}

uses
   Providers.Designacoes.Pendentes.ControlPC,
   Providers.Designacoes.Pendentes.Siags;

procedure TfrmDesignacoesPendentes.btnAutorizarDesignacaoClick(Sender: TObject);
begin
   EfetivarRespostaDesignacao(True);
end;

procedure TfrmDesignacoesPendentes.btnCancelarDesingacaoClick(Sender: TObject);
begin
   HabilitarEdicaoDoPainel(Self, pnlAutorizarDesignacao, False);
end;

procedure TfrmDesignacoesPendentes.btnFechraJustificativaClick(Sender: TObject);
begin
   HabilitarEdicaoDoPainel(Self, pnlJustificativaDesignacao, False);
end;

procedure TfrmDesignacoesPendentes.btnFiltrarClick(Sender: TObject);
begin
   if pgcPaineis.ActivePage = tbsAutoSC then
      //FiltrosAutoSC
   else if pgcPaineis.ActivePage = tbsSiags then
      begin
      FServiceSiags.DesignacoesPendentes;
      btnResponder.Enabled := FServiceSiags.TemDesignacoesPendentes;
   end else if pgcPaineis.ActivePage = tbsControlPc then
      begin
      FServiceControlPc.DesignacoesPendentes;
      btnResponder.Enabled := FServiceControlPc.TemDesignacoesPendentes;
   end;
end;

procedure TfrmDesignacoesPendentes.btnNegarDesigacaoClick(Sender: TObject);
begin
   EfetivarRespostaDesignacao(False);
end;

procedure TfrmDesignacoesPendentes.btnResponderClick(Sender: TObject);
begin
   if pgcPaineis.ActivePage = tbsAutoSC then
      ResponderSolicitacaoAutoSc
   else if pgcPaineis.ActivePage = tbsSiags then
      ResponderSolicitacaoSiags
   else if pgcPaineis.ActivePage = tbsControlPc then
      ResponderSolicitacaoControlPc;

   HabilitarEdicaoDoPainel(self, pnlAutorizarDesignacao, true);
end;

procedure TfrmDesignacoesPendentes.btnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmDesignacoesPendentes.ConfigurarBotoes;
begin
   btnFiltrar.Visible   := True;
   btnResponder.Visible := True;
   btnSair.Visible      := True;

   btnResponder.Enabled := False;
end;

procedure TfrmDesignacoesPendentes.ConfigurarTabSheets;
begin
   tbsAutoSC.TabVisible := Seguranca.PodeAUTOSC;
   if tbsAutoSC.TabVisible then
      begin
//      FServiceAutoSC := TSrvAutoSC.create(Fdm.SQLConnection);
   end;

   tbsSiags.TabVisible := Seguranca.PodeSIAGS;
   if tbsSiags.TabVisible then
      begin
      FServiceSiags := TSrvDesignacoesPendentesSiags.create;
   end;

   tbsControlPc.TabVisible := Seguranca.PodeCONTROLPC;
   if tbsControlPc.TabVisible then
      begin
      FServiceControlPc := TSrvDesignacoesPendentesControlPC.create;
   end;

   if tbsAutoSC.TabVisible then
      pgcPaineis.ActivePage := tbsAutoSC
   else if tbsSiags.TabVisible then
      pgcPaineis.ActivePage := tbsSiags
   else if tbsControlPc.TabVisible then
      pgcPaineis.ActivePage := tbsControlPc;
end;

procedure TfrmDesignacoesPendentes.dbgControlPcDblClick(Sender: TObject);
begin
   ExibirJustificativa;
end;

procedure TfrmDesignacoesPendentes.EfetivarRespostaDesignacao(const AAutorizado: Boolean);
var
   LEfetivou : Boolean;
   LMensagem : String;
begin
   LEfetivou := False;

   if AAutorizado then
      LMensagem := 'Confirma a autorização para a solicitação de designação ?'
   else
      LMensagem := 'Confirma a negativa para a solicitação de designação ?';


   if not QuestionMessage(LMensagem, 'Autorização de Designaçao') then
      Exit;

   if pgcPaineis.ActivePage = tbsAutoSC then
      LMensagem := ''
//      LEfetivou := FServiceControlPc.ResponderSolicitacao(AAutorizado)
   else if pgcPaineis.ActivePage = tbsSiags then
      LEfetivou := FServiceSiags.ResponderSolicitacao(AAutorizado)
   else if pgcPaineis.ActivePage = tbsControlPc then
      LEfetivou := FServiceControlPc.ResponderSolicitacao(AAutorizado);

   if LEfetivou then
      begin
      InformationMessage(C_GRAVADO_COM_SUCESSO,'Autorização de Designaçao');
      HabilitarEdicaoDoPainel(self, pnlAutorizarDesignacao, false)
   end else
      InformationMessage('Ocorreu um erro na tentaiva de gravar os dados !','Autorização de Designaçao');
end;

procedure TfrmDesignacoesPendentes.ExibirJustificativa;
begin
   if pgcPaineis.ActivePage = tbsAutoSC then
      pgcPaineis.ActivePage := tbsAutoSC
   else if pgcPaineis.ActivePage = tbsSiags then
      begin
      lblTituloJustificativa.Caption := 'Justificativa para Solicitação de Designação - SIAGS';
      lblTituloNumero.Caption        := 'Autorização - ' + FServiceSiags.NumeroAutorizacao;
      memJustificativa.DataSource := FServiceSiags.DataSourcePainel;
   end else if pgcPaineis.ActivePage = tbsControlPc then
      begin
      lblTituloJustificativa.Caption := 'Justificativa para Solicitação de Designação - CONTROLPC';
      lblTituloNumero.Caption        := 'Protocolo - ' + FServiceControlPc.NumeroProtocolo;
      memJustificativa.DataSource := FServiceControlPc.DataSourcePainel;
   end;

   HabilitarEdicaoDoPainel(Self, pnlJustificativaDesignacao, True);
end;

procedure TfrmDesignacoesPendentes.FormCreate(Sender: TObject);
begin
//   FServiceControlPc := TSrvDesignacoesPendentesControlPC.Create;
   ConfigurarBotoes;
end;

procedure TfrmDesignacoesPendentes.FormDestroy(Sender: TObject);
begin
   FreeAndNil(FServiceControlPc);
   FreeAndNil(FServiceSiags);
end;

procedure TfrmDesignacoesPendentes.FormShow(Sender: TObject);
begin
   ConfigurarTabSheets;
end;

procedure TfrmDesignacoesPendentes.pgcPaineisChange(Sender: TObject);
begin
   if pgcPaineis.ActivePage = tbsAutoSC then
      //FiltrosAutoSC
   else if pgcPaineis.ActivePage = tbsSiags then
      btnResponder.Enabled := FServiceSiags.TemDesignacoesPendentes
   else if pgcPaineis.ActivePage = tbsControlPc then
      btnResponder.Enabled := FServiceControlPc.TemDesignacoesPendentes;

end;

procedure TfrmDesignacoesPendentes.ResponderSolicitacaoAutoSc;
begin

end;

procedure TfrmDesignacoesPendentes.ResponderSolicitacaoControlPc;
begin
   lblTituloSolicitacaoDesignacao.Caption := 'Solicitação de Designação  - CONTROLPC';
   lblTituloSolicitacaoNumero.Caption     := 'Protocolo - ' + FServiceControlPc.NumeroProtocolo;

   edtUsuarioSolicitante.DataSource := FServiceControlPc.DataSourcePainel;
   edtDataSolicitacao.DataSource    := FServiceControlPc.DataSourcePainel;
   edtUsuarioAtual.DataSource       := FServiceControlPc.DataSourcePainel;
   edtUsuarioSolicitado.DataSource  := FServiceControlPc.DataSourcePainel;
   edtSetorAtual.DataSource         := FServiceControlPc.DataSourcePainel;
   edtSetorSolicitado.DataSource    := FServiceControlPc.DataSourcePainel;
   edtStatusAtual.DataSource        := FServiceControlPc.DataSourcePainel;
   memJustificativa.DataSource      := FServiceControlPc.DataSourcePainel;
end;

procedure TfrmDesignacoesPendentes.ResponderSolicitacaoSiags;
begin
   lblTituloSolicitacaoDesignacao.Caption := 'Solicitação de Designação  - SIAGS';
   lblTituloSolicitacaoNumero.Caption     := 'Autorização - ' + FServiceSiags.NumeroAutorizacao;

   edtUsuarioSolicitante.DataSource := FServiceSiags.DataSourcePainel;
   edtDataSolicitacao.DataSource    := FServiceSiags.DataSourcePainel;
   edtUsuarioAtual.DataSource       := FServiceSiags.DataSourcePainel;
   edtUsuarioSolicitado.DataSource  := FServiceSiags.DataSourcePainel;
   edtSetorAtual.DataSource         := FServiceSiags.DataSourcePainel;
   edtSetorSolicitado.DataSource    := FServiceSiags.DataSourcePainel;
   edtStatusAtual.DataSource        := FServiceSiags.DataSourcePainel;
   memJustificativa.DataSource      := FServiceSiags.DataSourcePainel;
end;

end.
