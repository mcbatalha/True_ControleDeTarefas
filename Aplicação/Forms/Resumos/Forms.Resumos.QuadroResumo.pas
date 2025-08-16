unit Forms.Resumos.QuadroResumo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Forms.Base, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Services.Resumos.QuadroResumo, Vcl.Grids, vcl.wwdbigrd, vcl.wwdbgrid, Data.Db, Util.Funcoes;

type
  TfrmQuadroResumo = class(TfrmBase)
    Panel6: TPanel;
    pnlQuadroResumo: TPanel;
    pnlTotaisSiags: TPanel;
    Label1: TLabel;
    Panel1: TPanel;
    Shape4: TShape;
    Shape3: TShape;
    Shape1: TShape;
    Shape2: TShape;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Shape5: TShape;
    Shape6: TShape;
    lblTotalSiags: TLabel;
    lblSiagsVencidos: TLabel;
    lblSiagsVenceHoje: TLabel;
    Panel4: TPanel;
    Label9: TLabel;
    Panel5: TPanel;
    Shape18: TShape;
    Shape17: TShape;
    Shape14: TShape;
    Shape13: TShape;
    Shape15: TShape;
    Shape16: TShape;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    lblControlPcVencidos: TLabel;
    lblControlPcVenceHoje: TLabel;
    lblTotalControlPc: TLabel;
    pnlTotaisVencidos: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    dbgControPcVencidos: TwwDBGrid;
    Shape7: TShape;
    Label5: TLabel;
    lblSiagsVenceAmanha: TLabel;
    Shape8: TShape;
    Shape9: TShape;
    Label7: TLabel;
    Shape10: TShape;
    lblSiagsComPrazo: TLabel;
    Shape11: TShape;
    Shape12: TShape;
    Label6: TLabel;
    lblControlPcVenceAmanha: TLabel;
    Shape19: TShape;
    Shape20: TShape;
    Label15: TLabel;
    lblControlPcComPrazo: TLabel;
    wwDBGrid1: TwwDBGrid;
    dbgSiagsVencidos: TwwDBGrid;
    wwDBGrid2: TwwDBGrid;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgSiagsVencidosCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure dbgControPcVencidosCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
  private
    { Private declarations }
    FService : TSrvResumos;

    procedure AtualizarQuantidades;
  public
    { Public declarations }
  end;

(*
var
  frmQuadroResumo: TfrmQuadroResumo;
*)

implementation

{$R *.dfm}

uses Providers.Resumos.QuadroResumo;



procedure TfrmQuadroResumo.AtualizarQuantidades;
begin

  lblTotalSiags.Caption            := FService.TotalSiags;
  lblSiagsVencidos.Caption         := FService.SiagsVencidos;
  lblSiagsVenceHoje.Caption        := FService.SiagsVenceHoje;
  lblSiagsVenceAmanha.Caption      := FService.SiagsVenceAmanha;
  lblSiagsComPrazo.Caption         := FService.SiagsComPrazo;

  lblTotalControlPc.Caption        := FService.TotalControlPc;
  lblControlPcVencidos.Caption     := FService.ControlPcVencidos;
  lblControlPcVenceHoje.Caption    := FService.ControlPcVenceHoje;
  lblControlPcVenceAmanha.Caption  := FService.ControlPcVenceAmanha;
  lblControlPcComPrazo.Caption     := FService.ControlPcComPrazo;
end;

procedure TfrmQuadroResumo.dbgControPcVencidosCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
var
   LPrazoCores : TCoresPrazo;
begin
  inherited;
    inherited;
    if Field.FieldName = 'Nome_Setor' then
       begin
       if FService.ControlPcNaoDesignado then
          AFont.Color := clred;
    end else if Field.FieldName = 'Qtd_Vencido' then
       begin
       LPrazoCores  := TFuncoes.PrazoCores(Date-1);
       ABrush.Color := LPrazoCores.corDoFundo;
       AFont.Color  := LPrazoCores.corDaFonte;
    end else if Field.FieldName = 'Qtd_VenceHoje' then
       begin
       LPrazoCores  := TFuncoes.PrazoCores(Date);
       ABrush.Color := LPrazoCores.corDoFundo;
       AFont.Color  := LPrazoCores.corDaFonte;
    end else if Field.FieldName = 'Qtd_VenceAmanha' then
       begin
       LPrazoCores  := TFuncoes.PrazoCores(Date+1);
       ABrush.Color := LPrazoCores.corDoFundo;
       AFont.Color  := LPrazoCores.corDaFonte;
    end;

end;

procedure TfrmQuadroResumo.dbgSiagsVencidosCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
var
   LPrazoCores : TCoresPrazo;
begin
    inherited;
    if Field.FieldName = 'Nome_Setor' then
       begin
       if FService.SiagsNaoDesignado then
          AFont.Color := clred;
    end else if Field.FieldName = 'Qtd_Vencido' then
       begin
       LPrazoCores  := TFuncoes.PrazoCores(Date-1);
       ABrush.Color := LPrazoCores.corDoFundo;
       AFont.Color  := LPrazoCores.corDaFonte;
    end else if Field.FieldName = 'Qtd_VenceHoje' then
       begin
       LPrazoCores  := TFuncoes.PrazoCores(Date);
       ABrush.Color := LPrazoCores.corDoFundo;
       AFont.Color  := LPrazoCores.corDaFonte;
    end else if Field.FieldName = 'Qtd_VenceAmanha' then
       begin
       LPrazoCores  := TFuncoes.PrazoCores(Date+1);
       ABrush.Color := LPrazoCores.corDoFundo;
       AFont.Color  := LPrazoCores.corDaFonte;
    end;
end;

procedure TfrmQuadroResumo.FormCreate(Sender: TObject);
begin
  inherited;

(*
  lblTotalAutoSc.Caption    := '0';
  lblAutoScVencidosTrue.Caption    := '0';
  lblAutoScVencidosAns.Caption     := '0';
*)

  lblTotalSiags.Caption           := '0';
  lblSiagsVencidos.Caption        := '0';
  lblSiagsVenceHoje.Caption       := '0';
  lblSiagsVenceAmanha.Caption     := '0';
  lblSiagsComPrazo.Caption        := '0';

  lblTotalControlPc.Caption       := '0';
  lblControlPcVencidos.Caption    := '0';
  lblControlPcVenceHoje.Caption   := '0';
  lblControlPcVenceAmanha.Caption := '0';
  lblControlPcComPrazo.Caption    := '0';

  FService := TSrvResumos.Create;
end;

procedure TfrmQuadroResumo.FormDestroy(Sender: TObject);
begin
   FreeAndNil(FService);
   inherited;
end;

procedure TfrmQuadroResumo.FormShow(Sender: TObject);
begin
   inherited;
   if FService.QuadroResumo then
      AtualizarQuantidades
   else
      Close;

end;

end.
