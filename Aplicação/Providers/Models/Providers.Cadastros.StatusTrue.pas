unit Providers.Cadastros.StatusTrue;

interface

uses
vcl.Dialogs,  System.SysUtils, System.Classes, Providers.Cadastros, Data.DBXDataSnap, Data.DBXCommon, IPPeerClient, Data.DB, Datasnap.DBClient, Datasnap.DSConnect, Data.SqlExpr;

type
  TdtmCadastroStatusTrue = class(TdtmCadastros)
    cdsCadastroid: TIntegerField;
    cdsCadastroStatus: TStringField;
    cdsCadastroTipo_Prazo: TStringField;
    cdsCadastroPrazo: TIntegerField;
    cdsCadastroEncerra: TStringField;
    cdsCadastroAtivo: TStringField;
    procedure cdsCadastroNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LimparPrazo;
  end;

var
  dtmCadastroStatusTrue: TdtmCadastroStatusTrue;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Libs.Constantes;

{$R *.dfm}

procedure TdtmCadastroStatusTrue.cdsCadastroNewRecord(DataSet: TDataSet);
begin
  inherited;
  NovoId((DataSet as TClientDataSet),'Status_True');
end;

procedure TdtmCadastroStatusTrue.LimparPrazo;
begin
   if cdsCadastro.State in dsEditModes then
      cdsCadastroPrazo.Clear;
end;

end.
