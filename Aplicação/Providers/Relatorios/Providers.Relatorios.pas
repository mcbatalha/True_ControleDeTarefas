unit Providers.Relatorios;

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
  TdtmRelatorios = class(TdtmConexao)
    frxPDFExport: TfrxPDFExport;
    mtbTitulos: TFDMemTable;
    mtbTitulosmemTipo: TStringField;
    mtbTitulosmemTituloFiltroNumero: TStringField;
    mtbTitulosmemFiltroNumero: TStringField;
    mtbTitulosmemFiltroPeriodo: TStringField;
    mtbTitulosmemFiltroResponsavel: TStringField;
    mtbTitulosmemTituloTipo: TStringField;
    fdbTitulos: TfrxDBDataset;
    mtbUsuariosAutoSc: TFDMemTable;
    mtbUsuariosAutoScid: TIntegerField;
    mtbUsuariosAutoScNome_Usuario: TStringField;
    mtbUsuariosSiags: TFDMemTable;
    mtbUsuariosSiagsid: TIntegerField;
    mtbUsuariosSiagsNome_Usuario: TStringField;
    mtbUsuariosControlPc: TFDMemTable;
    mtbUsuariosControlPcid: TIntegerField;
    mtbUsuariosControlPcNome_Usuario: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
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

(*
var
  dtmRelatorios: TdtmRelatorios;
*)

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdtmRelatorios.DataModuleCreate(Sender: TObject);
begin
   inherited;
   ConnectionProvider.ConfigurarConexao(SQLConnection);

end;

procedure TdtmRelatorios.DataModuleDestroy(Sender: TObject);
begin
   inherited;
   SQLConnection.Connected := False;

end;

procedure TdtmRelatorios.setParameters(const ATipo, ATituloFiltroNumero, AFiltroNumero, AFiltroPeriodo, AFiltroResponsavel, ATituloTipo: String);
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
