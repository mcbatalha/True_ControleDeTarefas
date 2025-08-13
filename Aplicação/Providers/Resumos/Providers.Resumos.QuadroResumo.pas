unit Providers.Resumos.QuadroResumo;

interface

uses
  System.SysUtils, System.Classes, Providers.Conexao, Data.DBXDataSnap, Data.DBXCommon, IPPeerClient, Data.DB, Datasnap.DBClient, Datasnap.DSConnect, Data.SqlExpr, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Providers.Base;

type
  TdtmQuadroResumo = class(TdtmBase)
    mtbQuadroResumo: TFDMemTable;
    mtbQuadroResumoQtd_Siags: TIntegerField;
    mtbQuadroResumoQtd_Siags_Vencidos_True: TIntegerField;
    mtbQuadroResumoQtd_Siags_Vencidos_Ans: TIntegerField;
    mtbQuadroResumoQtd_AutoSc: TIntegerField;
    mtbQuadroResumoQtd_AutoSc_Vencidos_True: TIntegerField;
    mtbQuadroResumoQtd_AutoSc_Vencidos_Ans: TIntegerField;
    mtbQuadroResumoQtd_ControlPc: TIntegerField;
    mtbQuadroResumoQtd_ControlPc_Vencidos_True: TIntegerField;
    mtbSiagsVencidos: TFDMemTable;
    mtbAutoScVencidos: TFDMemTable;
    mtbControlPcVencidos: TFDMemTable;
    mtbSiagsVencidosNome_Setor: TStringField;
    mtbSiagsVencidosQtd_Vencido: TIntegerField;
    mtbSiagsVencidosQtd_VenceHoje: TIntegerField;
    mtbAutoScVencidosNome_Setor: TStringField;
    mtbAutoScVencidosQtd_Vencido: TIntegerField;
    mtbAutoScVencidosQtd_VenceHoje: TIntegerField;
    mtbControlPcVencidosNome_Setor: TStringField;
    mtbControlPcVencidosQtd_Vencido: TIntegerField;
    mtbControlPcVencidosQtd_VenceHoje: TIntegerField;
    dtsSiagsVencidos: TDataSource;
    dtsAutoScVencidos: TDataSource;
    dtsControlPcVencidos: TDataSource;
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

end.
