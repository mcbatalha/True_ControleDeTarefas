unit Providers.Cadastros.Setores;

interface

uses
  System.SysUtils,
  System.Classes,

  Data.DBXDataSnap,
  Data.DBXCommon,
  Data.DB,

  IPPeerClient,

  Datasnap.DBClient,
  Datasnap.DSConnect,
  Data.SqlExpr,

  Providers.Cadastros;

type
  TdtmCadastroSetores = class(TdtmCadastros)
    cdsCadastroid: TIntegerField;
    cdsCadastroNome_Setor: TStringField;
    cdsCadastroAtivo: TStringField;
    cdsCadastroSIAGS: TStringField;
    cdsCadastroCONTROLPC: TStringField;
    cdsCadastroAUTOSC: TStringField;
    procedure cdsCadastroNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

(*
var
  dtmCadastroSetores: TdtmCadastroSetores;
*)

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Providers.Conexao;


{$R *.dfm}

procedure TdtmCadastroSetores.cdsCadastroNewRecord(DataSet: TDataSet);
begin
  inherited;
  NovoId((DataSet as TClientDataSet),'Setores');
end;

end.
