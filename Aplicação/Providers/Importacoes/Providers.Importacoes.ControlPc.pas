unit Providers.Importacoes.ControlPc;

interface

uses
  System.SysUtils, System.Classes, Providers.Importacoes, Data.DBXDataSnap, Data.DBXCommon, IPPeerClient, Data.DB, Datasnap.DBClient, Datasnap.DSConnect, Data.SqlExpr;

type
  TdtmImportacoesControlPc = class(TdtmImportacoes)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmImportacoesControlPc: TdtmImportacoesControlPc;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
