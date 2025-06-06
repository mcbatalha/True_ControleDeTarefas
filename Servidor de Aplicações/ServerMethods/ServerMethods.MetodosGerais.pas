unit ServerMethods.MetodosGerais;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Json,
  Datasnap.DSServer,
  Datasnap.DSAuth,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uTTransacao, Libs.TFuncoesJSON;

type
{$METHODINFO ON}
  TSMMetodosGerais = class(TDataModule)
    qryAux: TFDQuery;
  private
  public
    function ProximoId(const ATabela: String): Integer;
    function ItensDoMenu(const AIdUsuario: Integer): TJSONArray;
    function Login(const ALogin, ASenha : String): TJSONObject;
    function AlterarSenha(const AIdUsuario : integer; ASenha : String): Boolean;
    function GravarSeguranca(const AIdUsuario : integer; AItensMenu : TJSONArray) : Boolean;

  end;
{$METHODINFO OFF}

implementation


{$R *.dfm}


uses System.StrUtils,
     uTFuncoesServer, ServerMethods.Container, Funcoes, Libs.Constantes;

function TSMMetodosGerais.AlterarSenha(const AIdUsuario: integer; ASenha: String): Boolean;
var
   LNovaSenha : String;
begin
   Result := False;
   LNovaSenha := GerarHashMd5(AIdUsuario.ToString + ASenha);
   try
      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add('Update Usuarios');
      qryAux.Sql.Add('Set Senha = :pSenha,');
      qryAux.Sql.Add('    Trocar_Senha = :pNao');
      qryAux.Sql.Add('where id = :pId');
      qryAux.ParamByName('pSenha').AsString := LNovaSenha;
      qryAux.ParamByName('pNao').AsString   := C_NAO;
      qryAux.ParamByName('pId').AsInteger   := AIdUsuario;
      qryAux.ExecSQL;

      Result := True;
   except
   end;

end;

function TSMMetodosGerais.GravarSeguranca(const AIdUsuario: integer; AItensMenu: TJSONArray): Boolean;
var
   i : Integer;
   LItemMenu : Integer;
begin
   Result := False;
   try
      try
         TTransacao.IniciarTransacao(ServerContainer.FDConnection);

         qryAux.Close;
         qryAux.Sql.Clear;
         qryAux.Sql.Add('Delete from Seguranca');
         qryAux.Sql.Add('Where id_Usuario = :pIdUsuario');
         qryAux.ParamByName('pIdUsuario').AsInteger := AIdUsuario;
         qryAux.ExecSQL;


         qryAux.Close;
         qryAux.Sql.Clear;
         qryAux.Sql.Add('Insert into Seguranca (id_Usuario, Item_Menu)');
         qryAux.Sql.Add('values(:pIdUsuario, :pItemMenu)');

         for i := 0 to AItensMenu.Count - 1 do
            begin
            LItemMenu := AItensMenu.Items[i].AsType<Integer>;
            qryAux.ParamByName('pIdUsuario').AsInteger := AIdUsuario;
            qryAux.ParamByName('pItemMenu').AsInteger  := LItemMenu;
            qryAux.ExecSQL;
         end;

         TTransacao.ComitarTransacao(ServerContainer.FDConnection);
         Result := True;
      except
         TTransacao.CancelarTransacao(ServerContainer.FDConnection);
      end;

   finally

   end;
end;

function TSMMetodosGerais.ItensDoMenu(const AIdUsuario: Integer): TJSONArray;
begin
   Result := TJSONArray.Create;
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add('Select Item_Menu ');
   qryAux.Sql.Add('From Seguranca ');
   qryAux.Sql.Add('Where id_Usuario = :pId');
   qryAux.ParamByName('pId').AsInteger := AIdUsuario;
   try
      qryAux.Open;
      while not qryAux.eof do
         begin
         Result.Add(qryAux.FieldByName('Item_Menu').AsInteger);
         qryAux.Next;
      end;
   finally
      qryAux.Close;
   end;
end;

function TSMMetodosGerais.Login(const ALogin, ASenha: String) : TJSONObject;
var
   LSenhaCadastrada : String;
   LSenhaCalculada  : String;
begin
   Result := TJSONObject.Create;;
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add('Select id, Nome_Usuario, Senha, E_Mail, Trocar_Senha, Perfil, Ativo, ');
   qryAux.Sql.Add('       isnull((Select 1 ');
   qryAux.Sql.Add('               From Usuarios_Setores us ');
   qryAux.Sql.Add('                    Inner Join Setores st on st.id = us.id_Setor ');
   qryAux.Sql.Add('               where st.AUTOSC = ' + QuotedStr('Sim') + '),0) as AutoSC, ');

   qryAux.Sql.Add('       isnull((Select 1 ');
   qryAux.Sql.Add('               From Usuarios_Setores us ');
   qryAux.Sql.Add('                    Inner Join Setores st on st.id = us.id_Setor ');
   qryAux.Sql.Add('               where st.SIAGS = ' + QuotedStr('Sim') + '),0) as SIAGS, ');

   qryAux.Sql.Add('       isnull((Select 1 ');
   qryAux.Sql.Add('               From Usuarios_Setores us ');
   qryAux.Sql.Add('                    Inner Join Setores st on st.id = us.id_Setor ');
   qryAux.Sql.Add('               where st.CONTROLPC = ' + QuotedStr('Sim') + '),0) as CONTROLPC ');

   qryAux.Sql.Add('From Usuarios ');
   qryAux.Sql.Add('Where Login = :pLogin');
   qryAux.ParamByName('pLogin').AsString := ALogin;
   qryAux.Open;
   try
      if qryAux.IsEmpty then
         begin
         Result.AddPair('autorizado',TJSONBool.Create(False));
         Result.AddPair('mensagem',TJSONString.Create('Usuário ou senha inválidos!'));
         Exit;
      end;

      LSenhaCadastrada := EnDecryptString(qryAux.fieldbyname('Senha').asstring, 256);
      LSenhaCalculada := GerarHashMd5(qryAux.FieldByName('id').AsInteger.ToString + ASenha);

      if ((LSenhaCadastrada <> ASenha) and (LSenhaCalculada <> qryAux.FieldByName('Senha').AsString)) then
         begin
         Result.AddPair('autorizado',TJSONBool.Create(False));
         Result.AddPair('mensagem',TJSONString.Create('Usuário ou senha inválidos!'));
         Exit;
      end else if qryAux.FieldByName('Ativo').AsString <> C_SIM then
         begin
         Result.AddPair('autorizado',TJSONBool.Create(False));
         Result.AddPair('mensagem',TJSONString.Create('Usuário desativado!'));
         Exit;
      end;

      Result.AddPair('autorizado',TJSONBool.Create(True));
      Result.AddPair('id',TJSONNumber.Create(qryAux.FieldByName('id').AsInteger));
      Result.AddPair('nome',TJSONString.Create(qryAux.FieldByName('Nome_Usuario').AsString));

      Result.AddPair('trocarSenha',TJSONBool.Create(qryAux.FieldByName('Trocar_Senha').AsString = C_SIM));
      Result.AddPair('perfil',TJSONString.Create(qryAux.FieldByName('Perfil').AsString));

      Result.AddPair('autosc',TJSONBool.Create(qryAux.FieldByName('AUTOSC').AsInteger = 1));
      Result.AddPair('siags',TJSONBool.Create(qryAux.FieldByName('SIAGS').AsInteger = 1));
      Result.AddPair('controlpc',TJSONBool.Create(qryAux.FieldByName('CONTROLPC').AsInteger = 1));
   finally
      qryAux.Close;
   end;
end;

function TSMMetodosGerais.ProximoId(const ATabela: String): Integer;
begin
   Result := TFuncoes.ProximoId(ATabela);
end;


end.

