unit Forms.Listagens.Designacoes;

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

  Services.Listagens.Designacoes;
type
  TfrmListagemDesignacoes = class(TfrmBase)
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
     FService : TSrvListagensDesignacoes;

     procedure ConfigurarBotoes;
     procedure PosicionarCampoNumero;

     const
        C_TITULO_MENSAGENS = 'Listagem de Designações';
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TfrmListagemDesignacoes }

procedure TfrmListagemDesignacoes.btnExportarClick(Sender: TObject);
begin
  inherited;
  InformationMessage('Em desenvolvimento !',C_TITULO_MENSAGENS);
end;

procedure TfrmListagemDesignacoes.btnImprimirClick(Sender: TObject);
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
      FService.ListagemAutoSc(edtNumero.Text,
                              LUsaDatas,
                              LDataInicial,
                              LDataFinal,
                              fraPesquisaUsuario.getIdUsuario,
                              fraPesquisaUsuario.getNomeUsuario)
   else if rdbSiags.Checked then
      FService.ListagemSiags(edtNumero.Text,
                             LUsaDatas,
                             LDataInicial,
                             LDataFinal,
                             fraPesquisaUsuario.getIdUsuario,
                             fraPesquisaUsuario.getNomeUsuario)
   else if rdbSiags.Checked then
      FService.ListagemControlPc(edtNumero.Text,
                                 LUsaDatas,
                                 LDataInicial,
                                 LDataFinal,
                                 fraPesquisaUsuario.getIdUsuario,
                                 fraPesquisaUsuario.getNomeUsuario);
end;

procedure TfrmListagemDesignacoes.ConfigurarBotoes;
begin
   btnImprimir.Visible := True;
   btnExportar.Visible := True;
end;

procedure TfrmListagemDesignacoes.edtDataInicialExit(Sender: TObject);
begin
   inherited;
   if (ActiveControl.tag = 1) or ((Sender as TMaskEdit).Text = C_DATA_EM_BRANCO) then exit;

   VerificarData((Sender as TMaskEdit));
end;

procedure TfrmListagemDesignacoes.FormCreate(Sender: TObject);
begin
  inherited;
  ConfigurarBotoes;

  FService := TSrvListagensDesignacoes.Create;
end;

procedure TfrmListagemDesignacoes.FormDestroy(Sender: TObject);
begin
   inherited;
   FreeAndNil(FService);
end;

procedure TfrmListagemDesignacoes.FormShow(Sender: TObject);
begin
   inherited;
   rdbAutoSc.Checked := true;
end;


procedure TfrmListagemDesignacoes.PosicionarCampoNumero;
begin
  edtNumero.Left  := lblTipo.Left + lblTipo.Width + 10;
  if edtNumero.CanFocus then
     edtNumero.SetFocus;
end;

procedure TfrmListagemDesignacoes.rdbAutoScClick(Sender: TObject);
begin
  inherited;
  lblTipo.Caption := 'Nº do Processo:';
  fraPesquisaUsuario.setDataSet(FService.DataSetUsuarioAutoSc);
  fraPesquisaUsuario.setIdUsuario(0);

  PosicionarCampoNumero;
end;

procedure TfrmListagemDesignacoes.rdbControlPcClick(Sender: TObject);
begin
  inherited;
  lblTipo.Caption := 'Nº do Protocolo:';
  fraPesquisaUsuario.setDataSet(FService.DataSetUsuarioControlPc);

  PosicionarCampoNumero;
end;

procedure TfrmListagemDesignacoes.rdbSiagsClick(Sender: TObject);
begin
  inherited;
  lblTipo.Caption := 'Nº da Autorização:';

  fraPesquisaUsuario.setDataSet(FService.DataSetUsuarioSiags);
  PosicionarCampoNumero;
end;

end.
