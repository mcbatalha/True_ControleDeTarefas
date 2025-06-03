unit Providers.Importacoes;

interface

uses
  System.SysUtils, System.Classes, Providers.Base, Data.DBXDataSnap, Data.DBXCommon, IPPeerClient, Data.DB, Datasnap.DBClient, Datasnap.DSConnect, Data.SqlExpr;

type
  TdtmImportacoes = class(TdtmBase)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmImportacoes: TdtmImportacoes;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
