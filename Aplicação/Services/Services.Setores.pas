unit Services.Setores;

interface

uses
  Vcl.Forms,
  System.SysUtils,
  System.Classes,
  Providers.Cadastros.Setores,
  Proxy.Classes,
  Funcoes,
  Libs.Constantes;

type

  TSrvSetores = class
  private
     FPxySetores : TSMSetoresClient;
     Fdm : TdtmCadastroSetores;


     function TudoPreenchido : Boolean;
     function LocalizarRegistro(const AId : Integer) : Boolean;

     const
        C_TITULO_MENSAGENS = 'Cadastro de Setores';

  public

     constructor Create();

     procedure Incluir;
     function Excluir : Boolean;
     function Alterar : Boolean;
     function Cancelar : Boolean;
     function Gravar: Boolean;
     function Pesquisar : Boolean;


     destructor Destroy; override;
  end;

implementation

{ TSrvSetores }

uses Forms.Pesquisa;

function TSrvSetores.Alterar : Boolean;
begin
   Result := False;

   if Fdm.cdsCadastroAtivo.AsString <> C_SIM then
      begin
      if not QuestionMessage('Este setor está inativo. Para realizar altearação é necessário reativá-lo.' + chr(13) + 'Deseja continuar ?',C_TITULO_MENSAGENS ) then
         Exit;
   end;

   Fdm.cdscadastro.edit;
   Fdm.cdscadastroAtivo.AsString := C_SIM;
   Result := true;
end;

function TSrvSetores.Cancelar: Boolean;
begin
   Result := QuestionMessage('Deseja cancelar ?',C_TITULO_MENSAGENS);

   if Result then
      begin
      Fdm.cdscadastro.Cancel;
      Fdm.cdscadastro.Close;
   end;
end;

constructor TSrvSetores.Create();
begin
   inherited;
   Application.CreateForm(TdtmCadastroSetores, Fdm);
   FPxySetores := TSMSetoresClient.Create(Fdm.SQLConnection.DBXConnection);
   Fdm.SQLConnection.Connected := True;
end;


destructor TSrvSetores.Destroy;
begin
   Fdm.SQLConnection.Connected := False;
   FreeAndNil(FPxySetores);
   FreeAndNil(Fdm);

   inherited;
end;


function TSrvSetores.Excluir: Boolean;
begin
   Result := False;

   if not QuestionMessage('Deseja desativar o setor ? ',C_TITULO_MENSAGENS) then
      exit;

   Fdm.cdsCadastro.Edit;
   Fdm.cdsCadastroAtivo.AsString := C_NAO;
   Gravar;
   Result := True;
end;

function TSrvSetores.Gravar: Boolean;
begin
   Result := False;

   if not TudoPreenchido then Exit;

   if FPxySetores.JaExiste(Fdm.cdsCadastroid.AsInteger, Fdm.cdsCadastroNome_Setor.AsString) then
      begin
      InformationMessage('Setor já cadastrado !', C_TITULO_MENSAGENS);
      Result := False;
      Exit;
   end;

   Fdm.cdsCadastro.Post;

   if Fdm.Persistir(Fdm.cdsCadastro) then
      begin
      Fdm.cdsCadastro.Close;
      Result := True;

      InformationMessage(C_GRAVADO_COM_SUCESSO , C_TITULO_MENSAGENS )
   end;
end;

procedure TSrvSetores.Incluir;
begin
   FPxySetores.Incluir;
   Fdm.cdsCadastro.Open;
   Fdm.cdsCadastro.Append;
   Fdm.cdsCadastroAUTOSC.AsString    := C_NAO;
   Fdm.cdsCadastroSIAGS.AsString     := C_NAO;
   Fdm.cdsCadastroCONTROLPC.AsString := C_NAO;
end;

function TSrvSetores.LocalizarRegistro(const AId: Integer) : Boolean;
begin
   Result := False;
   Fdm.cdsCadastro.close;

   if AId > 0 then
      begin
      FPxySetores.Localizar(AId);
      Fdm.cdsCadastro.Open;
      Result := not Fdm.cdsCadastro.IsEmpty;
   end;
end;

function TSrvSetores.Pesquisar : Boolean;
var
   LForm : TfrmPesquisa;
begin
   Result := False;
   Application.CreateForm(TfrmPesquisa, LForm);
   LForm.SetParameter(Fdm.cdsPesquisa,
                      Fdm.SQLConnection.DBXConnection,
                      C_PESQUISA_SETOR);
   LForm.ShowModal;
   Result := LocalizarRegistro(LForm.getId);
   FreeAndNil(LForm);
end;

function TSrvSetores.TudoPreenchido: Boolean;
var
   LMensagem : String;
begin
   Result := True;

   LMensagem := '';

   if Fdm.cdsCadastroNome_Setor.AsString = '' then
      LMensagem := LMensagem + ' - Nome do Setor ';

   if LMensagem <> '' then
      begin
      LMensagem := C_TUDO_PREENCHIDO + LMensagem;
      Result := False;
      InformationMessage(LMensagem, C_TITULO_MENSAGENS);
   end else if (Fdm.cdsCadastroCONTROLPC.AsString = C_NAO) and
               (Fdm.cdsCadastroAUTOSC.AsString = C_NAO) and
               (Fdm.cdsCadastroSIAGS.AsString = C_NAO) then
      begin
      LMensagem := 'É necessário definir ao menos uma área de atuação par ao setor.';
      Result := False;
      InformationMessage(LMensagem, C_TITULO_MENSAGENS);
   end;


end;

end.
