unit Libs.TSeguranca;

interface
type
  TItemsDeSeguranca = class
  private
     FItem: integer;
     procedure SetItem(const AItem: integer);
  published
     property Item : integer read FItem write SetItem;
  end;



  TSeguranca = class
  private
    FId            : integer;
    FLogin         : String;
    FNome          : String;
    FSenha         : String;
    FEMail         : String;
    FMensagem      : String;
    FPerfil        : String;
    FUltimoAcesso  : String;
    FTrocarSenha   : Boolean;
    FLoginOl       : Boolean;
    FPodeAUTOSC    : Boolean;
    FPodeSIAGS     : Boolean;
    FPodeCONTROLPC : Boolean;

  published
       property Id           : integer read FId write FId;
       property Login        : String read FLogin write FLogin;
       property Nome         : String read FNome write FNome;
       property Senha        : String read FSenha write FSenha;
       property EMail        : String read FEMail write FEMail;
       property Mensagem     : String read FMensagem write FMensagem;
       property Perfil       : string read FPerfil write FPerfil;
       property UltimoAcesso : String read FUltimoAcesso write FUltimoAcesso;
       property TrocarSenha  : Boolean read FTrocarSenha write FTrocarSenha;
       property LoginOl      : Boolean read FLoginOl write FLoginOl;

       // Tipos de processo
       property PodeAUTOSC   : Boolean read FPodeAUTOSC write FPodeAUTOSC;
       property PodeSIAGS    : Boolean read FPodeSIAGS write FPodeSIAGS;
       property PodeCONTROLPC: Boolean read FPodeCONTROLPC write FPodeCONTROLPC;

  public
     constructor create();
     destructor destroy();
end;


Var
  Seguranca : TSeguranca;


implementation

{ TSeguranca }

{ TSeguranca }

constructor TSeguranca.create;
begin
   FId := 0;
end;

destructor TSeguranca.destroy;
begin

end;

{ TItemsDeSeguranca }

procedure TItemsDeSeguranca.SetItem(const AItem: integer);
begin
   FItem := AItem;
end;


initialization
  Seguranca := TSeguranca.Create;

finalization
  Seguranca.Free;

end.
