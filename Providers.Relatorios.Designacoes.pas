unit Providers.Relatorios.Designacoes;

interface

uses
  System.SysUtils,
  System.Classes,

  Providers.Connection,
  Providers.Conexao,

  Data.DBXDataSnap,
  Data.DBXCommon,
  Data.SqlExpr,

  IPPeerClient,

  Data.DB,

  Datasnap.DBClient,
  Datasnap.DSConnect,

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
  frxExportPDF;

type
  TdtmRelatoriosDesinacoes = class(TdtmConexao)
    mtbUsuariosAutoSc: TFDMemTable;
    mtbUsuariosAutoScid: TIntegerField;
    mtbUsuariosAutoScNome_Usuario: TStringField;
    mtbUsuariosSiags: TFDMemTable;
    mtbUsuariosControlPc: TFDMemTable;
    mtbUsuariosSiagsid: TIntegerField;
    mtbUsuariosSiagsNome_Usuario: TStringField;
    mtbUsuariosControlPcid: TIntegerField;
    mtbUsuariosControlPcNome_Usuario: TStringField;
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
    frpDesignacoes: TfrxReport;
    fdbDesignacoes: TfrxDBDataset;
    mtbDesignacoesccTempo: TStringField;
    frxPDFExport: TfrxPDFExport;
    mtbTitulos: TFDMemTable;
    mtbTitulosmemTipo: TStringField;
    mtbTitulosmemTituloFiltroNumero: TStringField;
    mtbTitulosmemFiltroNumero: TStringField;
    mtbTitulosmemFiltroPeriodo: TStringField;
    mtbTitulosmemFiltroResponsavel: TStringField;
    mtbTitulosmemTituloTipo: TStringField;
    fdbTitulos: TfrxDBDataset;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure mtbDesignacoesCalcFields(DataSet: TDataSet);
    procedure mtbDesignacoesUsuario_DesignadoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure mtbDesignacoesData_Hora_FinalGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  private
     FTipo,
     FTituloFiltroNumero,
     FFiltroNumero,
     FFiltroPeriodo,
     FFiltroResponsavel,
     FTituloTipo: String;

  public

    procedure setParameters(const ATipo,
                                  ATituloFiltroNumero,
                                  AFiltroNumero,
                                  AFiltroPeriodo,
                                  AFiltroResponsavel,
                                  ATituloTipo: String);
  end;

var
  dtmRelatoriosDesinacoes: TdtmRelatoriosDesinacoes;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Funcoes;

{$R *.dfm}

procedure TdtmRelatoriosDesinacoes.DataModuleCreate(Sender: TObject);
begin
   inherited;
   ConnectionProvider.ConfigurarConexao(SQLConnection);

end;

procedure TdtmRelatoriosDesinacoes.DataModuleDestroy(Sender: TObject);
begin
   inherited;
   SQLConnection.Connected := False;

end;

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

procedure TdtmRelatoriosDesinacoes.setParameters(const ATipo, ATituloFiltroNumero, AFiltroNumero, AFiltroPeriodo, AFiltroResponsavel, ATituloTipo: String);
begin
   mtbTitulos.close;
   mtbTitulos.Open;
   mtbTitulos.Append;
   mtbTitulosmemTipo.AsString               := ATipo;
   mtbTitulosmemTituloFiltroNumero.AsString := ATituloFiltroNumero;
   mtbTitulosmemFiltroNumero.AsString       := AFiltroNumero;
   mtbTitulosmemFiltroPeriodo.AsString      := AFiltroPeriodo;
   mtbTitulosmemFiltroResponsavel.AsString  := AFiltroResponsavel;
   mtbTitulosmemTituloTipo.AsString         := ATituloTipo;
   mtbTitulos.Post;
end;

end.
