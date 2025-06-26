unit Services.Usuarios;

interface
uses
  Vcl.Forms,
  System.SysUtils,
  System.Classes,
  Providers.Cadastros.Usuarios,
  Proxy.Classes,
  Funcoes,
  Libs.Constantes;

type

  TSrvUsuarios = class
  private
     FPxyUsuarios  : TSMUsuariosClient;
     FLogin        : String;


     function TudoPreenchido : Boolean;
     function LocalizarRegistro(const AId : Integer) : Boolean;
     procedure AtualizarListaDeSetores;
     procedure AbrirTabelaDeSetores;

     const
        C_TITULO_MENSAGENS = 'Cadastro de Usuários';

  public
     Fdm : TdtmCadastroUsusarios;

     constructor Create();

     procedure Incluir;
     function Excluir : Boolean;
     function Alterar : Boolean;
     function Cancelar : Boolean;
     function Gravar(const ALimparSenha : Boolean = False): Boolean;
     function Pesquisar : Boolean;

     function TrocarSenha : Boolean;

     procedure AssociarSetor;
     procedure DesassociarSetor;
     procedure ForcarTrocaSenha(const AForcar : Boolean);
     procedure GravarSeguranca;


     destructor Destroy; override;
  end;

implementation

{ TSrvUsuarios }

uses Forms.Pesquisa, Libs.TSeguranca, Forms.Seguranca;

procedure TSrvUsuarios.AbrirTabelaDeSetores;
begin
   Fdm.cdsSetores.Close;
   Fdm.cdsSetores.Open;
end;

function TSrvUsuarios.Alterar: Boolean;
begin
   Result := False;

   if Fdm.cdsCadastroAtivo.AsString <> C_SIM then
      begin
      if not QuestionMessage('Este usuário está inativo. Para realizar altearação é necessário reativá-lo.' + chr(13) + 'Deseja continuar ?',C_TITULO_MENSAGENS ) then
         Exit;
   end;

   Fdm.cdscadastro.edit;
   Fdm.cdscadastroAtivo.AsString := C_SIM;
   Result := true;
end;

procedure TSrvUsuarios.AssociarSetor;
begin
   Fdm.cdsUsuarioSetores.Append;
   Fdm.cdsUsuarioSetoresid_Usuario.AsInteger := Fdm.cdsCadastroid.AsInteger;
   Fdm.cdsUsuarioSetoresid_Setor.AsInteger   := Fdm.cdsSetoresid.AsInteger;
   Fdm.cdsUsuarioSetoresNome_Setor.AsString  := Fdm.cdsSetoresNome_Setor.AsString;
   Fdm.cdsUsuarioSetores.Post;

   Fdm.cdsSetores.Delete;
end;

procedure TSrvUsuarios.AtualizarListaDeSetores;
begin
   Fdm.cdsUsuarioSetores.First;
   Fdm.cdsSetores.DisableControls;
   Fdm.cdsUsuarioSetores.DisableControls;

   try
      while not Fdm.cdsUsuarioSetores.eof do
         begin
         if Fdm.cdsSetores.Locate('id',Fdm.cdsUsuarioSetoresid_Setor.AsInteger,[]) then
            Fdm.cdsSetores.Delete;

         Fdm.cdsUsuarioSetores.Next;
      end;
   finally
      Fdm.cdsSetores.EnableControls;
      Fdm.cdsUsuarioSetores.EnableControls;
   end;
end;

function TSrvUsuarios.Cancelar: Boolean;
begin
   Result := QuestionMessage('Deseja cancelar ?',C_TITULO_MENSAGENS);

   if Result then
      begin
      Fdm.cdscadastro.Cancel;
      Fdm.cdscadastro.Close;

      Fdm.cdsSetores.Close;
   end;
end;

constructor TSrvUsuarios.Create;
begin
   Application.CreateForm(TdtmCadastroUsusarios, Fdm);
   FPxyUSuarios := TSMUsuariosClient.Create(Fdm.SQLConnection.DBXConnection);
   Fdm.SQLConnection.Connected := True;
end;

procedure TSrvUsuarios.DesassociarSetor;
begin
   Fdm.cdsSetores.Append;
   Fdm.cdsSetoresid.AsInteger        := Fdm.cdsUsuarioSetoresid_Setor.AsInteger;
   Fdm.cdsSetoresNome_Setor.AsString := Fdm.cdsUsuarioSetoresNome_Setor.AsString;
   Fdm.cdsSetores.Post;

   Fdm.cdsUsuarioSetores.Delete;
end;

destructor TSrvUsuarios.Destroy;
begin
   Fdm.SQLConnection.Connected := False;
   FreeAndNil(FPxyUsuarios);
   FreeAndNil(Fdm);

   inherited;
end;

function TSrvUsuarios.Excluir: Boolean;
begin
   Result := False;

   if not QuestionMessage('Deseja desativar o usuário ? ',C_TITULO_MENSAGENS) then
      exit;

   Fdm.cdsCadastro.Edit;
   Fdm.cdsCadastroAtivo.AsString := C_NAO;
   Gravar;
   Result := True;
end;

procedure TSrvUsuarios.ForcarTrocaSenha(const AForcar: Boolean);
begin
   if AForcar then
      Fdm.cdsCadastroTrocar_Senha.AsString := C_SIM
   else
      Fdm.cdsCadastroTrocar_Senha.AsString := C_NAO;

end;

function TSrvUsuarios.Gravar(const ALimparSenha : Boolean): Boolean;
begin
   Result := False;

   if not TudoPreenchido then Exit;

   if FPxyUsuarios.JaExiste(Fdm.cdsCadastroid.AsInteger, Fdm.cdsCadastroLogin.AsString) then
      begin
      InformationMessage('Usuário já cadastrado !', C_TITULO_MENSAGENS);
      Result := False;
      Exit;
   end;

   if Fdm.cdsCadastroTrocar_Senha.AsString = C_SIM then
      Fdm.cdsCadastroSenha.Clear;

   Fdm.cdsCadastro.Post;
   if Fdm.Persistir(Fdm.cdsCadastro) then
      begin
      if ALimparSenha then
         FPxyUsuarios.GravarLogLimpesaSenha(Fdm.cdsCadastroid.AsInteger, Seguranca.Id);

(*
      Fdm.cdsCadastro.Close;
      Fdm.cdsSetores.Close;
*)
      Result := True;

      InformationMessage(C_GRAVADO_COM_SUCESSO , C_TITULO_MENSAGENS )
   end;
end;

procedure TSrvUsuarios.GravarSeguranca;
var
   LForm : TfrmSeguranca;
begin
   try
      if not QuestionMessage('Deseja configurar as permissões do usuário agora ? ',C_TITULO_MENSAGENS) then exit;

      Application.CreateForm(TfrmSeguranca, LForm);
      LForm.SetLogin(Fdm.cdsCadastroLogin.AsString);
      LForm.ShowModal;
      FreeAndNil(LForm);
   finally
      Fdm.cdsCadastro.Close;
      Fdm.cdsSetores.Close;
   end;
end;

procedure TSrvUsuarios.Incluir;
begin
   FLogin := '';
   FPxyUsuarios.Incluir;
   Fdm.cdsCadastro.Open;
   Fdm.cdsCadastro.Append;
   Fdm.cdsCadastroPerfil.AsString       := C_PERFIL_USUARIO;
   Fdm.cdsCadastroTrocar_Senha.AsString := C_SIM;

   AbrirTabelaDeSetores;
end;

function TSrvUsuarios.LocalizarRegistro(const AId: Integer): Boolean;
begin
   Result := False;
   Fdm.cdsCadastro.close;

   if AId > 0 then
      begin
      FPxyUsuarios.Localizar(AId);
      Fdm.cdsCadastro.Open;
      Result := not Fdm.cdsCadastro.IsEmpty;

      AbrirTabelaDeSetores;
      AtualizarListaDeSetores;

   end;
end;

function TSrvUsuarios.Pesquisar: Boolean;
var
   LForm : TfrmPesquisa;
begin
   Result := False;
   Application.CreateForm(TfrmPesquisa, LForm);
   LForm.SetParameter(Fdm.cdsPesquisa,
                      Fdm.SQLConnection.DBXConnection,
                      C_PESQUISA_USUARIO);
   LForm.ShowModal;
   Result := LocalizarRegistro(LForm.getId);
   FreeAndNil(LForm);
end;

function TSrvUsuarios.TrocarSenha: Boolean;
begin
   Result := Fdm.cdsCadastroTrocar_Senha.AsString = C_SIM;
end;

function TSrvUsuarios.TudoPreenchido: Boolean;
var
   LMensagem : String;
begin
   Result := True;

   LMensagem := '';

   if Fdm.cdsCadastroNome_Usuario.AsString = '' then
      LMensagem := LMensagem + ' - Nome do usuário; ' + chr(13);
   if Fdm.cdsCadastroLogin.AsString = '' then
      LMensagem := LMensagem + ' - Login do usuário; ' + chr(13);

   if LMensagem <> '' then
      begin
      LMensagem := C_TUDO_PREENCHIDO + LMensagem;
      InformationMessage(LMensagem, C_TITULO_MENSAGENS);
      Result := False;
   end;
end;

end.
