unit Providers.Relatorios.Designacoes;

interface

uses
  System.SysUtils,
  System.Classes,

  Providers.Relatorios,

  Data.DBXDataSnap,
  Data.DBXCommon,
  Data.DB,
  Data.SqlExpr,

  IPPeerClient,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,


  frxClass,
  frxDBSet,
  frxExportBaseDialog,
  frxExportPDF,

  Datasnap.DBClient,
  Datasnap.DSConnect;

type
  TdtmRelatoriosDesinacoes = class(TdtmRelatorios)
    mtbDesignacoes: TFDMemTable;
    mtbDesignacoesid: TLargeintField;
    mtbDesignacoesUsuario_Designado: TStringField;
    mtbDesignacoesSetor_Designado: TStringField;
    mtbDesignacoesUsuario_Responsavel: TStringField;
    mtbDesignacoesJustificativa: TStringField;
    mtbDesignacoesNumero: TStringField;
    mtbDesignacoesData_Hora_Inicial: TDateTimeField;
    mtbDesignacoesData_Hora_Final: TDateTimeField;
    mtbDesignacoesDias: TIntegerField;
    mtbDesignacoesHoras: TIntegerField;
    mtbDesignacoesMinutos: TIntegerField;
    mtbDesignacoesccTempo: TStringField;
    frpDesignacoes: TfrxReport;
    fdbDesignacoes: TfrxDBDataset;
    procedure mtbDesignacoesUsuario_DesignadoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure mtbDesignacoesCalcFields(DataSet: TDataSet);
    procedure mtbDesignacoesData_Hora_FinalGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

(*
var
  dtmRelatoriosDesinacoes: TdtmRelatoriosDesinacoes;
*)

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Funcoes;

{$R *.dfm}

procedure TdtmRelatoriosDesinacoes.mtbDesignacoesCalcFields(DataSet: TDataSet);
var
   LTempo : string;
begin
   inherited;

   LTempo := '';
   if mtbDesignacoesDias.AsInteger > 0 then
      LTempo := mtbDesignacoesDias.AsString + ' dias - ';

   LTempo := LTempo + InttoStrZero(mtbDesignacoesHoras.AsInteger,2) + 'h ' + InttoStrZero(mtbDesignacoesMinutos.AsInteger,2) + 'min';

   mtbDesignacoesccTempo.Value := LTempo;
end;

procedure TdtmRelatoriosDesinacoes.mtbDesignacoesData_Hora_FinalGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
   inherited;
   if Sender.AsString = '' then
      Text := 'Ainda não redesignado'
   else
      Text := FormatDateTime('dd/mm/yyyy hh:MM:ss',Sender.AsDateTime);
end;

procedure TdtmRelatoriosDesinacoes.mtbDesignacoesUsuario_DesignadoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
   inherited;
   if Sender.AsString = '' then
      Text := 'Não designado'
   else
      Text := Sender.AsString;

end;

end.
