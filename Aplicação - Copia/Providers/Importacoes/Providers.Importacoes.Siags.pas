unit Providers.Importacoes.Siags;

interface

uses
  System.SysUtils, System.Classes, Providers.Importacoes, Data.DBXDataSnap, Data.DBXCommon, IPPeerClient, Data.DB, Datasnap.DBClient, Datasnap.DSConnect, Data.SqlExpr;

type
  TdtmImportacoesSiags = class(TdtmImportacoes)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmImportacoesSiags: TdtmImportacoesSiags;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
