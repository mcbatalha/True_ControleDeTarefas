unit ServerMethods.Cadastro.Usuarios;

interface

uses
  System.SysUtils, System.Classes, System.JSON,
  Datasnap.DSServer,
  Datasnap.DSAuth, Datasnap.DSProviderDataModuleAdapter, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Datasnap.Provider, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSMUsuarios = class(TDSServerModule)
    qryCadastro: TFDQuery;
    dspCadastro: TDataSetProvider;
    qryJaExiste: TFDQuery;
    qryPesquisa: TFDQuery;
    dspPesquisa: TDataSetProvider;
    qryCadastroid: TIntegerField;
    qryCadastroLogin: TStringField;
    qryCadastroSenha: TStringField;
    qryCadastroE_Mail: TStringField;
    qryCadastroTrocar_Senha: TStringField;
    qryCadastroAtivo: TStringField;
    qryCadastroNome_Usuario: TStringField;
    dsCadastro: TDataSource;
    qryUsuariosSetores: TFDQuery;
    qryUsuariosSetoresid_Usuario: TIntegerField;
    qryUsuariosSetoresid_Setor: TIntegerField;
    qryUsuariosSetoresNome_Setor: TStringField;
    qrySetores: TFDQuery;
    dspSetores: TDataSetProvider;
    qrySetoresid: TIntegerField;
    qrySetoresNome_Setor: TStringField;
    qryGravarLogSenha: TFDQuery;
    qryCadastroPerfil: TStringField;
  private
    { Private declarations }
    procedure MontarQueryCadastro(AQuery : TFDQuery);
  public
    { Public declarations }
    procedure Incluir;
    function Localizar(const AId : Integer) : Boolean;
    function JaExiste(const AId : Integer; const ADescricao : String) : Boolean;

    procedure Pesquisar(const ACampo, ATipo : Integer;
                        const AChave : String;
                        const AIncluirInativos : Boolean);

    function LocalizarLogin(const ALogin : String) : TJSONArray;
    procedure GravarLogLimpesaSenha(const AIdUsuario, AIdUsuarioResponsavel : integer);
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Libs.Constantes;

{$R *.dfm}

{ TSMUsuarios }

procedure TSMUsuarios.GravarLogLimpesaSenha(const AIdUsuario, AIdUsuarioResponsavel : integer);
begin
   if AIdUsuarioResponsavel <> 99999 then
      begin
      qryGravarLogSenha.ParamByName('pIdUsuario').AsInteger            := AIdUsuario;
      qryGravarLogSenha.ParamByName('pIdUsuarioResponsavel').AsInteger := AIdUsuarioResponsavel;
      qryGravarLogSenha.ExecSQL;
   end;
end;

procedure TSMUsuarios.Incluir;
begin
   MontarQueryCadastro(qryCadastro);
   qryCadastro.Sql.Add('where 1 = 2');
end;

function TSMUsuarios.JaExiste(const AId: Integer; const ADescricao: String): Boolean;
begin
   Result := False;
   qryJaExiste.close;
   try
      qryJaExiste.ParamByName('pId').AsInteger       := AId;
      qryJaExiste.ParamByName('pDescricao').AsString := ADescricao;
      qryJaExiste.Open;

      Result := not qryJaExiste.IsEmpty;
   finally
      qryJaExiste.close;
   end;
end;

function TSMUsuarios.Localizar(const AId: Integer): Boolean;
begin
   MontarQueryCadastro(qryCadastro);
   qryCadastro.Sql.Add('where id = :pId');
   qryCadastro.ParamByName('pId').AsInteger := AId;
end;

function TSMUsuarios.LocalizarLogin(const ALogin: String): TJSONArray;
var
   LJson : TJSONObject;
   LItens : TJSONArray;
begin
   MontarQueryCadastro(qryCadastro);
   qryCadastro.SQL.Add('where Login = :pLogin');
   qryCadastro.ParamByName('pLogin').AsString := ALogin;

   Result := TJSONArray.Create;
   try
      LJson := TJSONObject.Create;
      qryCadastro.open;
      if qryCadastro.IsEmpty then
         begin
         LJson.AddPair('localizou',TJSONBool.Create(False));
         Result.Add(LJson);
         Exit;
      end;
      LJson.AddPair('localizou',TJSONBool.Create(True));
      LJson.AddPair('id',TJSONNumber.Create(qryCadastroid.AsInteger));
      LJson.AddPair('nome',TJSONString.Create(qryCadastroNome_Usuario.AsString));

      qryPesquisa.Close;
      qryPesquisa.SQL.Clear;
      qryPesquisa.SQL.Add('Select Item_Menu');
      qryPesquisa.SQL.Add('From Seguranca');
      qryPesquisa.SQL.Add('Where id_Usuario = :pIdUsuario');
      qryPesquisa.ParamByName('pIdUsuario').AsInteger := qryCadastroid.AsInteger;
      qryPesquisa.Open;
      LItens := TJSONArray.Create;
      while not qryPesquisa.eof do
         begin
         LItens.Add(qryPesquisa.FieldByName('Item_Menu').AsInteger);
         qryPesquisa.Next;
      end;
      LJson.AddPair('itensMenu',LItens);
      Result.add(LJson);
   finally
      qryPesquisa.Close;
      qryCadastro.Close;
//      FreeAndNil(LJson);
   end;
end;

procedure TSMUsuarios.MontarQueryCadastro(AQuery : TFDQuery);
begin
   AQuery.Close;
   AQuery.Sql.Clear;
   AQuery.Sql.Add('Select id, Nome_Usuario, Login, Senha, E_Mail, Trocar_Senha, Perfil, Ativo');
   AQuery.Sql.Add('From Usuarios');
end;

procedure TSMUsuarios.Pesquisar(
   const ACampo, ATipo : Integer;
   const AChave : String;
   const AIncluirInativos : Boolean);

var
   LChave : String;
   LCampo : String;
begin
   MontarQueryCadastro(qryPesquisa);

   case ACampo of
      0 : LCampo := 'Nome_Usuario';
      1 : LCampo := 'Login';
   end;

   if (AChave = '') then
      qryPesquisa.Sql.Add('where 1 = 2')
   else
      begin
      qryPesquisa.Sql.Add('where 1 = 1');
      case ATipo of
         0 : qryPesquisa.Sql.Add('and ' + LCampo + ' = :pChave');
         else begin
            case ATipo of
                1 : LChave := AChave + '%';
                2 : LChave := '%' + AChave + '%';
                3 : LChave := '%' + AChave;
            end;
             qryPesquisa.Sql.Add('and ' + LCampo + ' Like :pChave');
             qryPesquisa.ParamByName('pChave').AsString := LChave;
         end;
      end;
   end;

   if not AIncluirInativos then
      begin
      qryPesquisa.Sql.Add('and Ativo = :pAtivo');
      qryPesquisa.ParamByName('pAtivo').AsString := C_SIM;
   end;


   qryPesquisa.Sql.Add('Order by Nome_Usuario');

end;

end.

