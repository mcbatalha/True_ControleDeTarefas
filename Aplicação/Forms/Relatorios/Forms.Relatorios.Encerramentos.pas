unit Forms.Relatorios.Encerramentos;

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

  Services.Relatorios.Encerramento;
type
  TfrmRelatorioEncerramentos = class(TfrmBase)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtDataInicial: TMaskEdit;
    edtDataFinal: TMaskEdit;
    rdbAutoSc: TRadioButton;
    rdbSiags: TRadioButton;
    rdbControlPc: TRadioButton;
    fraPesquisaUsuario: TfraPesquisaUsuario;
    procedure FormCreate(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure rdbAutoScClick(Sender: TObject);
    procedure rdbSiagsClick(Sender: TObject);
    procedure rdbControlPcClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtDataInicialExit(Sender: TObject);
  private
     FService : TSrvRelatorioEncerramentos;

     procedure ConfigurarBotoes;

     const
        C_TITULO_MENSAGENS = 'Relatório de Encerramentos';
  public
    { Public declarations }
  end;

(*
var
  frmRelatorioEncerramentos: TfrmRelatorioEncerramentos;
*)

implementation

{$R *.dfm}

procedure TfrmRelatorioEncerramentos.btnExportarClick(Sender: TObject);
begin
   inherited;
   InformationMessage('Em desenvolvimento !',C_TITULO_MENSAGENS);
end;

procedure TfrmRelatorioEncerramentos.btnImprimirClick(Sender: TObject);
var
   LDataInicial : TDateTime;
   LDataFinal   : TDateTime;
begin
   inherited;

   LDataInicial := Date;
   LDataFinal   := Date;

   if (edtDataInicial.Text <> C_DATA_EM_BRANCO) or (edtDataFinal.Text <> C_DATA_EM_BRANCO) then
      begin
      if not VerificarPeriodoDeDatas(edtDataInicial, edtDataFinal) then exit;

      LDataInicial := StrToDate(edtDataInicial.Text);
      LDataFinal   := StrToDate(edtDataFinal.Text);
   end;

   if rdbAutoSc.Checked then
      FService.RelatorioAutoSc(LDataInicial,
                               LDataFinal,
                               fraPesquisaUsuario.getIdUsuario,
                               fraPesquisaUsuario.getNomeUsuario)
   else if rdbSiags.Checked then
      FService.RelatorioSiags(LDataInicial,
                              LDataFinal,
                              fraPesquisaUsuario.getIdUsuario,
                              fraPesquisaUsuario.getNomeUsuario)
   else if rdbControlPc.Checked then
      FService.RelatorioControlPc(LDataInicial,
                                  LDataFinal,
                                  fraPesquisaUsuario.getIdUsuario,
                                  fraPesquisaUsuario.getNomeUsuario);
end;

procedure TfrmRelatorioEncerramentos.ConfigurarBotoes;
begin
   btnImprimir.Visible := True;
   btnExportar.Visible := True;
end;

procedure TfrmRelatorioEncerramentos.edtDataInicialExit(Sender: TObject);
begin
   inherited;
   if (ActiveControl.tag = 1) or ((Sender as TMaskEdit).Text = C_DATA_EM_BRANCO) then exit;

   VerificarData((Sender as TMaskEdit));
end;

procedure TfrmRelatorioEncerramentos.FormCreate(Sender: TObject);
begin
  inherited;
  ConfigurarBotoes;

  FService := TSrvRelatorioEncerramentos.Create;
end;

procedure TfrmRelatorioEncerramentos.FormDestroy(Sender: TObject);
begin
   inherited;
   FreeAndNil(FService);

end;


procedure TfrmRelatorioEncerramentos.FormShow(Sender: TObject);
begin
   inherited;
   rdbAutoSc.Checked := true;
end;

procedure TfrmRelatorioEncerramentos.rdbAutoScClick(Sender: TObject);
begin
   inherited;
   fraPesquisaUsuario.setDataSet(FService.DataSetUsuarioAutoSc);
   fraPesquisaUsuario.setIdUsuario(0);
end;

procedure TfrmRelatorioEncerramentos.rdbControlPcClick(Sender: TObject);
begin
   inherited;
   fraPesquisaUsuario.setDataSet(FService.DataSetUsuarioControlPc);
   fraPesquisaUsuario.setIdUsuario(0);
end;

procedure TfrmRelatorioEncerramentos.rdbSiagsClick(Sender: TObject);
begin
   inherited;
   fraPesquisaUsuario.setDataSet(FService.DataSetUsuarioSiags);
   fraPesquisaUsuario.setIdUsuario(0);
end;

end.
