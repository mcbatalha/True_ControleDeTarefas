unit ServerMethods.Cadastro.StatusTrue;

interface

uses
  System.SysUtils,
  System.Classes,

  Datasnap.DSServer,
  Datasnap.DSAuth,
  Datasnap.DSProviderDataModuleAdapter,
  Datasnap.Provider,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,

  Data.DB;

type
  TSMStatusTrue = class(TDSServerModule)
    qryCadastro: TFDQuery;
    dspCadastro: TDataSetProvider;
    qryJaExiste: TFDQuery;
    qryPesquisa: TFDQuery;
    dspPesquisa: TDataSetProvider;
    qryCadastroid: TIntegerField;
    qryCadastroStatus: TStringField;
    qryCadastroTipo_Prazo: TStringField;
    qryCadastroPrazo: TIntegerField;
    qryCadastroEncerra: TStringField;
    qryCadastroAtivo: TStringField;
  private
    procedure MontarQueryCadastro(AQuery : TFDQuery);
  public
    { Public declarations }

    procedure Incluir;
    function Localizar(const AId : Integer) : Boolean;
    function JaExiste(const AId : Integer; const ADescricao : String) : Boolean;

    procedure Pesquisar(const ACampo, ATipo : Integer;
                        const AChave : String;
                        const AIncluirInativos : Boolean);
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses ServerMethods.Container, Libs.Constantes;

{$R *.dfm}

{ TDSServerModule1 }

procedure TSMStatusTrue.Incluir;
begin
   MontarQueryCadastro(qryCadastro);
   qryCadastro.Sql.Add('where 1 = 2');
end;

function TSMStatusTrue.JaExiste(const AId: Integer; const ADescricao: String): Boolean;
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

function TSMStatusTrue.Localizar(const AId: Integer): Boolean;
begin
   MontarQueryCadastro(qryCadastro);
   qryCadastro.Sql.Add('where id = :pId');
   qryCadastro.ParamByName('pId').AsInteger := AId;
end;

procedure TSMStatusTrue.MontarQueryCadastro(AQuery: TFDQuery);
begin
   AQuery.Close;
   AQuery.Sql.Clear;
   AQuery.Sql.Add('Select id, Status, Tipo_Prazo, Prazo, Encerra, Ativo');
   AQuery.Sql.Add('From Status_True');
end;

procedure TSMStatusTrue.Pesquisar(const ACampo, ATipo: Integer; const AChave: String; const AIncluirInativos: Boolean);
var
   LChave : String;
   LCampo : String;
begin
   MontarQueryCadastro(qryPesquisa);

   case ACampo of
      0 : LCampo := 'Status';
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


   qryPesquisa.Sql.Add('Order by Status');
end;

end.

