unit Providers.Resumos.QuadroResumo;

interface

uses
  System.SysUtils, System.Classes, Providers.Conexao, Data.DBXDataSnap, Data.DBXCommon, IPPeerClient, Data.DB, Datasnap.DBClient, Datasnap.DSConnect, Data.SqlExpr, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Providers.Base;

type
  TdtmQuadroResumo = class(TdtmBase)
    mtbQuadroResumo: TFDMemTable;
    mtbSiagsVencidos: TFDMemTable;
    mtbAutoScVencidos: TFDMemTable;
    mtbControlPcVencidos: TFDMemTable;
    mtbAutoScVencidosNome_Setor: TStringField;
    mtbAutoScVencidosQtd_Vencido: TIntegerField;
    mtbAutoScVencidosQtd_VenceHoje: TIntegerField;
    dtsSiagsVencidos: TDataSource;
    dtsAutoScVencidos: TDataSource;
    dtsControlPcVencidos: TDataSource;
    mtbQuadroResumoQtd_Siags: TIntegerField;
    mtbQuadroResumoQtd_Siags_Vencidos: TIntegerField;
    mtbQuadroResumoQtd_Siags_Vence_Hoje: TIntegerField;
    mtbQuadroResumoQtd_Siags_Vence_Amanha: TIntegerField;
    mtbQuadroResumoQtd_Siags_Com_Prazo: TIntegerField;
    mtbQuadroResumoQtd_ControlPc: TIntegerField;
    mtbQuadroResumoQtd_ControlPc_Vencidos: TIntegerField;
    mtbQuadroResumoQtd_ControlPc_Vence_Hoje: TIntegerField;
    mtbQuadroResumoQtd_ControlPc_Vence_Amanha: TIntegerField;
    mtbQuadroResumoQtd_ControlPc_Com_Prazo: TIntegerField;
    mtbSiagsVencidosNome_Setor: TStringField;
    mtbSiagsVencidosQtd_Vencido: TIntegerField;
    mtbSiagsVencidosQtd_VenceHoje: TIntegerField;
    mtbSiagsVencidosQtd_VenceAmanha: TIntegerField;
    mtbControlPcVencidosNome_Setor: TStringField;
    mtbControlPcVencidosQtd_Vencido: TIntegerField;
    mtbControlPcVencidosQtd_VenceHoje: TIntegerField;
    mtbControlPcVencidosQtd_VenceAmanha: TIntegerField;
    mtbTitulos: TFDMemTable;
    dtsTitulos: TDataSource;
    mtbTitulosSetor: TStringField;
    mtbTitulosVencido: TStringField;
    mtbTitulosVence_Hoje: TStringField;
    mtbTitulosVence_Amanha: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure mtbSiagsVencidosNome_SetorGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

(*
var
  dtmQuadroResumo: TdtmQuadroResumo;
*)

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdtmQuadroResumo.DataModuleCreate(Sender: TObject);
begin
  inherited;
   mtbTitulos.Open;
   mtbTitulos.Append;
   mtbTitulosSetor.AsString := 'Setor';
   mtbTitulosVencido.AsString := 'Vencido';
   mtbTitulosVence_Hoje.AsString := 'Vence Hoje';
   mtbTitulosVence_Amanha.AsString := 'Vence Amanhã';
   mtbTitulos.Post;


end;

procedure TdtmQuadroResumo.DataModuleDestroy(Sender: TObject);
begin
   mtbTitulos.Open;

  inherited;

end;

procedure TdtmQuadroResumo.mtbSiagsVencidosNome_SetorGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  inherited;
   if Sender.AsString = '' then
      Text := 'Não Designado'
   else
      Text := Sender.AsString;
end;

end.
