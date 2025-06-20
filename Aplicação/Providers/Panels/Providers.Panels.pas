unit Providers.Panels;

interface

uses
  System.SysUtils, System.Classes, Providers.Conexao, Data.DBXDataSnap, Data.DBXCommon, IPPeerClient, Data.DB, Datasnap.DBClient, Datasnap.DSConnect, Data.SqlExpr, Proxy.Classes, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, Datasnap.Provider, FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxClass, frxDBSet;

type
  TdtmPainel = class(TdtmConexao)
    mtbPainel: TFDMemTable;
    cdsPainel: TClientDataSet;
    dspPainel: TDataSetProvider;
    mtbHistoricoDesignacoes: TFDMemTable;
    mtbHistoricoDesignacoesJustificativa: TStringField;
    mtbHistoricoDesignacoesData_Hora_Log: TDateTimeField;
    mtbHistoricoDesignacoesNome_Setor: TStringField;
    mtbHistoricoDesignacoesUsuario_Designado: TStringField;
    mtbHistoricoDesignacoesUsuario_Responsavel: TStringField;
    dtsHistoricoDesignacoes: TDataSource;
    mtbObservacoes: TFDMemTable;
    mtbObservacoesData_Hora: TDateTimeField;
    mtbObservacoesNome_Usuario: TStringField;
    dtsObservacoes: TDataSource;
    mtbHistoricoAtualizacoes: TFDMemTable;
    dtsHistoricoAtualizacoes: TDataSource;
    mtbObservacoesObservacao: TStringField;
    frpExtrato: TfrxReport;
    fdbExtrato: TfrxDBDataset;
    fdbDesignacoes: TfrxDBDataset;
    fdbObservacoes: TfrxDBDataset;
    fdbAtualizacoes: TfrxDBDataset;
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
    procedure mtbDesignacoesCalcFields(DataSet: TDataSet);
    procedure mtbDesignacoesData_Hora_FinalGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure mtbDesignacoesSetor_DesignadoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmPainel: TdtmPainel;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Funcoes;

{$R *.dfm}

procedure TdtmPainel.mtbDesignacoesCalcFields(DataSet: TDataSet);
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

procedure TdtmPainel.mtbDesignacoesData_Hora_FinalGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
   inherited;
   if Sender.AsString = '' then
      Text := 'Ainda não redesignado'
   else
      Text := FormatDateTime('dd/mm/yyyy hh:MM:ss',Sender.AsDateTime);
end;

procedure TdtmPainel.mtbDesignacoesSetor_DesignadoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
   inherited;
   if Sender.AsString = '' then
      Text := 'Não designado'
   else
      Text := Sender.AsString;

end;

end.
