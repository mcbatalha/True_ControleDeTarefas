unit Services.StatusTrue;

interface
uses
  Vcl.Forms,
  System.SysUtils,
  System.Classes,
  Providers.Cadastros.StatusTrue,
  Proxy.Classes,
  Funcoes,
  Libs.Constantes;

type

  TSrvStatusTrue= class
  private
     FPxyStatusTrue : TSMStatusTrueClient;
     Fdm            : TdtmCadastroStatusTrue;


     function TudoPreenchido : Boolean;
     function LocalizarRegistro(const AId : Integer) : Boolean;

     const
        C_TITULO_MENSAGENS = 'Cadastro de Status True';

  public

     constructor Create();

     procedure Incluir;
     function Excluir : Boolean;
     function Alterar : Boolean;
     function Cancelar : Boolean;
     function Gravar: Boolean;
     function Pesquisar : Boolean;

     procedure LimparPrazo(const ALimpar : Boolean);


     destructor Destroy; override;
  end;

implementation

{ TSrvStatusTrue }

uses Forms.Pesquisa;

function TSrvStatusTrue.Alterar: Boolean;
begin
   Result := False;

   if Fdm.cdsCadastroAtivo.AsString <> C_SIM then
      begin
      if not QuestionMessage('Este status está inativo. Para realizar altearação é necessário reativá-lo.' + chr(13) + 'Deseja continuar ?',C_TITULO_MENSAGENS ) then
         Exit;
   end;

   Fdm.cdscadastro.edit;
   Fdm.cdscadastroAtivo.AsString := C_SIM;
   Result := true;
end;

function TSrvStatusTrue.Cancelar: Boolean;
begin
   Result := QuestionMessage('Deseja cancelar ?',C_TITULO_MENSAGENS);

   if Result then
      begin
      Fdm.cdscadastro.Cancel;
      Fdm.cdscadastro.Close;
   end;
end;

constructor TSrvStatusTrue.Create;
begin
   inherited;
   Application.CreateForm(TdtmCadastroStatusTrue, Fdm);
   FPxyStatusTrue:= TSMStatusTrueClient.Create(Fdm.SQLConnection.DBXConnection);
   Fdm.SQLConnection.Connected := True;
end;

destructor TSrvStatusTrue.Destroy;
begin
   Fdm.SQLConnection.Connected := False;
   FreeAndNil(FPxyStatusTrue);
   FreeAndNil(Fdm);

   inherited;
end;

function TSrvStatusTrue.Excluir: Boolean;
begin
   Result := False;

   if not QuestionMessage('Deseja desativar o status ? ',C_TITULO_MENSAGENS) then
      exit;

   Fdm.cdsCadastro.Edit;
   Fdm.cdsCadastroAtivo.AsString := C_NAO;
   Gravar;
   Result := True;
end;

function TSrvStatusTrue.Gravar: Boolean;
begin
   Result := False;

   if not TudoPreenchido then Exit;

   if FPxyStatusTrue.JaExiste(Fdm.cdsCadastroid.AsInteger, Fdm.cdsCadastroStatus.AsString) then
      begin
      InformationMessage('Status já cadastrado !', C_TITULO_MENSAGENS);
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

procedure TSrvStatusTrue.Incluir;
begin
   FPxyStatusTrue.Incluir;
   Fdm.cdsCadastro.Open;
   Fdm.cdsCadastro.Append;
   Fdm.cdsCadastroTipo_Prazo.AsString := C_TIPO_PRAZO_NAO_CONTA;
   Fdm.cdsCadastroEncerra.AsString    := C_NAO;
   Fdm.cdsCadastroAutoSc.AsString     := C_NAO;
   Fdm.cdsCadastroSiags.AsString      := C_NAO;
   Fdm.cdsCadastroControlPC.AsString  := C_NAO;
   Fdm.cdsCadastroAtivo.AsString      := C_SIM;
end;

procedure TSrvStatusTrue.LimparPrazo(const ALimpar: Boolean);
begin
   if (ALimpar) then
      Fdm.LimparPrazo;
end;

function TSrvStatusTrue.LocalizarRegistro(const AId: Integer): Boolean;
begin
   Result := False;
   Fdm.cdsCadastro.close;

   if AId > 0 then
      begin
      FPxyStatusTrue.Localizar(AId);
      Fdm.cdsCadastro.Open;
      Result := not Fdm.cdsCadastro.IsEmpty;
   end;
end;

function TSrvStatusTrue.Pesquisar: Boolean;
var
   LForm : TfrmPesquisa;
begin
   Result := False;
   Application.CreateForm(TfrmPesquisa, LForm);
   LForm.SetParameter(Fdm.cdsPesquisa,
                      Fdm.SQLConnection.DBXConnection,
                      C_PESQUISA_STATUS);
   LForm.ShowModal;
   Result := LocalizarRegistro(LForm.getId);
   FreeAndNil(LForm);
end;

function TSrvStatusTrue.TudoPreenchido: Boolean;
var
   LMensagem : String;
begin
   Result := True;

   LMensagem := '';

   if Fdm.cdsCadastroStatus.AsString = '' then
      LMensagem := LMensagem + ' - Nome do Status';

   if (Fdm.cdsCadastroTipo_Prazo.AsString <> C_TIPO_PRAZO_NAO_CONTA) and (Fdm.cdsCadastroPrazo.AsString = '') then
      LMensagem := LMensagem + ' - Prazo';

   if LMensagem <> '' then
      begin
      LMensagem := C_TUDO_PREENCHIDO + LMensagem;
      Result := False;
      InformationMessage(LMensagem, C_TITULO_MENSAGENS);
   end else if (Fdm.cdsCadastroCONTROLPC.AsString = C_NAO) and
               (Fdm.cdsCadastroAUTOSC.AsString = C_NAO) and
               (Fdm.cdsCadastroSIAGS.AsString = C_NAO) then
      begin
      LMensagem := 'É necessário definir ao menos uma área de aplicação para o status.';
      Result := False;
      InformationMessage(LMensagem, C_TITULO_MENSAGENS);
   end;

end;

end.
