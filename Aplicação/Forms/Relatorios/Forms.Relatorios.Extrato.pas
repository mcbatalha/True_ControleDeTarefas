unit Forms.Relatorios.Extrato;

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

  Services.Panels.AutoSC,
  Services.Panels.Siags,
  Services.Panels.ControlPc,

  Funcoes,

  Datasnap.DBClient,

  Libs.TFiltros,
  Libs.TSeguranca,
  Providers.Panels.Conexao, Forms.Base;

type
  TfrmRelatorioExtrato = class(TfrmBase)
    Label3: TLabel;
    lblTipo: TLabel;
    rdbAutoSc: TRadioButton;
    rdbSiags: TRadioButton;
    rdbControlPc: TRadioButton;
    edtNumero: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure ConfigurarBotoes;
    procedure FormDestroy(Sender: TObject);
    procedure rdbAutoScClick(Sender: TObject);
    procedure rdbSiagsClick(Sender: TObject);
    procedure rdbControlPcClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
     FServiceAutoSC : TSrvAutoSC;
     FFiltroAutoSC  : TFiltros;

     FServiceSiags : TSrvSiags;
     FFiltroSiags  : TFiltros;

     FServiceControlPc : TSrvControlPc;
     FFiltroControlPc  : TFiltros;

     Fdm            : TdtmPaineisConexao;

     procedure PosicionarCampoNumero;

  public
    { Public declarations }
  end;

var
  frmRelatorioExtrato: TfrmRelatorioExtrato;

implementation

{$R *.dfm}

uses Libs.Constantes;

procedure TfrmRelatorioExtrato.btnImprimirClick(Sender: TObject);
begin
   inherited;

   if rdbAutoSc.Checked then
      FServiceAutoSC.ImprimirExtrato(edtNumero.Text, True)
   else if rdbSiags.Checked then
      FServiceSiags.ImprimirExtrato(edtNumero.Text, True)
   else if rdbControlPc.Checked then
      FServiceControlPc.ImprimirExtrato(edtNumero.Text, True);
end;

procedure TfrmRelatorioExtrato.ConfigurarBotoes;
begin
   btnImprimir.Visible := True;
end;

procedure TfrmRelatorioExtrato.FormCreate(Sender: TObject);
begin
   inherited;
   ConfigurarBotoes;

   Application.CreateForm(TdtmPaineisConexao, Fdm);

   FServiceAutoSC    := TSrvAutoSC.create(Fdm.SQLConnection);
   FServiceSiags     := TSrvSiags.create(Fdm.SQLConnection);
   FServiceControlPc := TSrvControlPc.create(Fdm.SQLConnection);

   FFiltroSiags      := TFiltros.create(C_CODIGO_SIAGS);
   FFiltroControlPc  := TFiltros.create(C_CODIGO_CONTROLPC);
end;

procedure TfrmRelatorioExtrato.FormDestroy(Sender: TObject);
begin
   FreeAndNil(FFiltroAutoSC);
   FreeAndNil(FServiceAutoSC);

   FreeAndNil(FFiltroSiags);
   FreeAndNil(FServiceSiags);

   FreeAndNil(FFiltroControlPc);
   FreeAndNil(FServiceControlPc);

   FreeAndNil(Fdm);

   inherited;
end;

procedure TfrmRelatorioExtrato.FormShow(Sender: TObject);
begin
   inherited;
   rdbAutoSc.Checked := True;
end;

procedure TfrmRelatorioExtrato.PosicionarCampoNumero;
begin
  edtNumero.Left  := lblTipo.Left + lblTipo.Width + 10;
  if edtNumero.CanFocus then
     edtNumero.SetFocus;
end;

procedure TfrmRelatorioExtrato.rdbAutoScClick(Sender: TObject);
begin
  inherited;
  lblTipo.Caption := 'Nº do Processo:';

  PosicionarCampoNumero;

end;

procedure TfrmRelatorioExtrato.rdbControlPcClick(Sender: TObject);
begin
  inherited;
  lblTipo.Caption := 'Nº do Protocolo:';

  PosicionarCampoNumero;
end;

procedure TfrmRelatorioExtrato.rdbSiagsClick(Sender: TObject);
begin
  inherited;
  lblTipo.Caption := 'Nº da Autorização:';

  PosicionarCampoNumero;

end;

end.
