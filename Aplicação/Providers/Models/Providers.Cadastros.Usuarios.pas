unit Providers.Cadastros.Usuarios;

interface

uses
  System.SysUtils, System.Classes, Providers.Cadastros, Data.DBXDataSnap, Data.DBXCommon, IPPeerClient, Data.DB, Datasnap.DBClient, Datasnap.DSConnect, Data.SqlExpr;

type
  TdtmCadastroUsusarios = class(TdtmCadastros)
    cdsCadastroid: TIntegerField;
    cdsCadastroLogin: TStringField;
    cdsCadastroSenha: TStringField;
    cdsCadastroE_Mail: TStringField;
    cdsCadastroTrocar_Senha: TStringField;
    cdsCadastroAtivo: TStringField;
    cdsCadastroNome_Usuario: TStringField;
    cdsCadastroqryUsuariosSetores: TDataSetField;
    cdsUsuarioSetores: TClientDataSet;
    cdsUsuarioSetoresid_Usuario: TIntegerField;
    cdsUsuarioSetoresid_Setor: TIntegerField;
    cdsUsuarioSetoresNome_Setor: TStringField;
    cdsSetores: TClientDataSet;
    cdsSetoresid: TIntegerField;
    cdsSetoresNome_Setor: TStringField;
    cdsCadastroPerfil: TStringField;
    procedure cdsCadastroNewRecord(DataSet: TDataSet);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

(*
var
  dtmCadastroUsusarios: TdtmCadastroUsusarios;
*)


implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdtmCadastroUsusarios.cdsCadastroNewRecord(DataSet: TDataSet);
begin
  inherited;
  NovoId(cdsCadastro, 'Usuarios');
end;

end.
