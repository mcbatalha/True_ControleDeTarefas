unit Providers.Importacoes.AutoSc;

interface

uses
  System.SysUtils,
  System.Classes,

  Providers.Importacoes,

  Data.DBXDataSnap,
  Data.DBXCommon,
  Data.DB,

  IPPeerClient,

  Datasnap.DBClient,
  Datasnap.DSConnect,
  Data.SqlExpr;

type
  TdtmImportacoesAutoSC = class(TdtmImportacoes)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmImportacoesAutoSC: TdtmImportacoesAutoSC;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
