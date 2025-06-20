unit Providers.Relatorios.Encerramentos;

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
  TdtmRelatoriosEncerramento = class(TdtmRelatorios)
    mtbEncerramentos: TFDMemTable;
    frpEncerramentos: TfrxReport;
    fdbEncerramentos: TfrxDBDataset;
    mtbEncerramentosNumero: TStringField;
    mtbEncerramentosData_Hora_Importacao: TDateTimeField;
    mtbEncerramentosData_Hora_Encerramento: TDateTimeField;
    mtbEncerramentosJustificativa_Encerramento: TStringField;
    mtbEncerramentosNome_Usuario: TStringField;
    mtbEncerramentosDias: TIntegerField;
    mtbEncerramentosHoras: TIntegerField;
    mtbEncerramentosMinutos: TIntegerField;
    mtbEncerramentosccTempo: TStringField;
    procedure mtbEncerramentosCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmRelatoriosEncerramento: TdtmRelatoriosEncerramento;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Funcoes;

{$R *.dfm}

procedure TdtmRelatoriosEncerramento.mtbEncerramentosCalcFields(DataSet: TDataSet);
var
   LTempo : string;
begin
   inherited;

   LTempo := '';
   if mtbEncerramentosDias.AsInteger > 0 then
      LTempo := mtbEncerramentosDias.AsString + ' dias - ';

   LTempo := LTempo + InttoStrZero(mtbEncerramentosHoras.AsInteger,2) + 'h ' + InttoStrZero(mtbEncerramentosMinutos.AsInteger,2) + 'min';

   mtbEncerramentosccTempo.Value := LTempo;
end;

end.
