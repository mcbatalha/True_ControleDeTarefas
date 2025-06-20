unit Forms.Relatorios.Designacoes;

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
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Mask,

  Forms.Base,

  Funcoes,

  Frames.Pesquisa.Usuario,
  Libs.Constantes,
  Libs.TFuncoesJSON,

  Services.Relatorios.Designacoes;
type
  TfrmRelatorioDesignacoes = class(TfrmBase)
    Label1: TLabel;
    edtDataInicial: TMaskEdit;
    edtDataFinal: TMaskEdit;
    Label2: TLabel;
    rdbAutoSc: TRadioButton;
    rdbSiags: TRadioButton;
    rdbControlPc: TRadioButton;
    Label3: TLabel;
    lblTipo: TLabel;
    edtNumero: TEdit;
    fraPesquisaUsuario: TfraPesquisaUsuario;
    procedure FormCreate(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure rdbAutoScClick(Sender: TObject);
    procedure rdbSiagsClick(Sender: TObject);
    procedure rdbControlPcClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtDataInicialExit(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
     FService : TSrvRelatorioDesignacoes;

     procedure ConfigurarBotoes;
     procedure PosicionarCampoNumero;

     const
        C_TITULO_MENSAGENS = 'Relatório de Designações';
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TfrmListagemDesignacoes }

procedure TfrmRelatorioDesignacoes.btnExportarClick(Sender: TObject);
begin
  inherited;
  InformationMessage('Em desenvolvimento !',C_TITULO_MENSAGENS);
end;

procedure TfrmRelatorioDesignacoes.btnImprimirClick(Sender: TObject);
var
   LUsaDatas    : Boolean;
   LDataInicial : TDateTime;
   LDataFinal   : TDateTime;
begin
   inherited;

   LUsaDatas    := False;
   LDataInicial := Date;
   LDataFinal   := Date;

   if (edtDataInicial.Text <> C_DATA_EM_BRANCO) or (edtDataFinal.Text <> C_DATA_EM_BRANCO) then
      begin
      if not VerificarPeriodoDeDatas(edtDataInicial, edtDataFinal) then exit;

      LUsaDatas    := True;
      LDataInicial := StrToDate(edtDataInicial.Text);
      LDataFinal   := StrToDate(edtDataFinal.Text);
   end;

   if rdbAutoSc.Checked then
      FService.RelatorioAutoSc(edtNumero.Text,
                               LUsaDatas,
                               LDataInicial,
                               LDataFinal,
                               fraPesquisaUsuario.getIdUsuario,
                               fraPesquisaUsuario.getNomeUsuario)
   else if rdbSiags.Checked then
      FService.RelatorioSiags(edtNumero.Text,
                              LUsaDatas,
                              LDataInicial,
                              LDataFinal,
                              fraPesquisaUsuario.getIdUsuario,
                              fraPesquisaUsuario.getNomeUsuario)
   else if rdbControlPc.Checked then
      FService.RelatorioControlPc(edtNumero.Text,
                                  LUsaDatas,
                                  LDataInicial,
                                  LDataFinal,
                                  fraPesquisaUsuario.getIdUsuario,
                                  fraPesquisaUsuario.getNomeUsuario);
end;

procedure TfrmRelatorioDesignacoes.ConfigurarBotoes;
begin
   btnImprimir.Visible := True;
   btnExportar.Visible := True;
end;

procedure TfrmRelatorioDesignacoes.edtDataInicialExit(Sender: TObject);
begin
   inherited;
   if (ActiveControl.tag = 1) or ((Sender as TMaskEdit).Text = C_DATA_EM_BRANCO) then exit;

   VerificarData((Sender as TMaskEdit));
end;

procedure TfrmRelatorioDesignacoes.FormCreate(Sender: TObject);
begin
  inherited;
  ConfigurarBotoes;

  FService := TSrvRelatorioDesignacoes.Create;
end;

procedure TfrmRelatorioDesignacoes.FormDestroy(Sender: TObject);
begin
   inherited;
   FreeAndNil(FService);
end;

procedure TfrmRelatorioDesignacoes.FormShow(Sender: TObject);
begin
   inherited;
   rdbAutoSc.Checked := true;
end;


procedure TfrmRelatorioDesignacoes.PosicionarCampoNumero;
begin
  edtNumero.Left  := lblTipo.Left + lblTipo.Width + 10;
  if edtNumero.CanFocus then
     edtNumero.SetFocus;
end;

procedure TfrmRelatorioDesignacoes.rdbAutoScClick(Sender: TObject);
begin
  inherited;
  lblTipo.Caption := 'Nº do Processo:';
  fraPesquisaUsuario.setDataSet(FService.DataSetUsuarioAutoSc);
  fraPesquisaUsuario.setIdUsuario(0);

  PosicionarCampoNumero;
end;

procedure TfrmRelatorioDesignacoes.rdbControlPcClick(Sender: TObject);
begin
  inherited;
  lblTipo.Caption := 'Nº do Protocolo:';
  fraPesquisaUsuario.setDataSet(FService.DataSetUsuarioControlPc);

  PosicionarCampoNumero;
end;

procedure TfrmRelatorioDesignacoes.rdbSiagsClick(Sender: TObject);
begin
  inherited;
  lblTipo.Caption := 'Nº da Autorização:';

  fraPesquisaUsuario.setDataSet(FService.DataSetUsuarioSiags);
  PosicionarCampoNumero;
end;

end.
