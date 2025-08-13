unit Forms.Resumos.QuadroResumo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Forms.Base, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Services.Resumos.QuadroResumo, Vcl.Grids, vcl.wwdbigrd, vcl.wwdbgrid;

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
    lblSiagsVencidosTrue: TLabel;
    lblSiagsVencidosAns: TLabel;
    Panel2: TPanel;
    Label5: TLabel;
    Panel3: TPanel;
    Shape10: TShape;
    Shape9: TShape;
    Label7: TLabel;
    Label8: TLabel;
    Shape7: TShape;
    Shape8: TShape;
    Shape12: TShape;
    Shape11: TShape;
    Label6: TLabel;
    lblAutoScVencidosTrue: TLabel;
    lblAutoScVencidosAns: TLabel;
    lblTotalAutoSc: TLabel;
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
    lblControlPcVencidosTrue: TLabel;
    lblControlPcVencidosAns: TLabel;
    lblTotalControlPc: TLabel;
    pnlTotaisVencidos: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    dbgAutoScVencidos: TwwDBGrid;
    dbgControPcVencidos: TwwDBGrid;
    dbgSiagsVencidos: TwwDBGrid;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
  lblSiagsVencidosTrue.Caption     := FService.SiagsVencidosTrue;
  lblSiagsVencidosAns.Caption      := FService.SiagsVencidosAns;

  lblTotalAutoSc.Caption           := FService.TotalAutoSc;
  lblAutoScVencidosTrue.Caption    := FService.AutoScVencidosTrue;
  lblAutoScVencidosAns.Caption     := FService.AutoScVencidosAns;

  lblTotalControlPc.Caption        := FService.TotalControlPc;
  lblControlPcVencidosTrue.Caption := FService.ControlPcVencidosTrue;
  lblControlPcVencidosAns.Caption  := FService.ControlPcVencidosAns;
end;

procedure TfrmQuadroResumo.FormCreate(Sender: TObject);
begin
  inherited;

  lblTotalSiags.Caption     := '0';
  lblTotalAutoSc.Caption    := '0';
  lblTotalControlPc.Caption := '0';

  lblSiagsVencidosTrue.Caption     := '0';
  lblAutoScVencidosTrue.Caption    := '0';
  lblControlPcVencidosTrue.Caption := '0';

  lblSiagsVencidosAns.Caption      := '0';
  lblAutoScVencidosAns.Caption     := '0';
  lblControlPcVencidosAns.Caption  := '0';

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
