unit ServerMethods.Cadastro.Setores;

interface

uses
  System.SysUtils,
  System.Classes,

  Datasnap.DSServer,
  Datasnap.DSAuth,
  Datasnap.DSProviderDataModuleAdapter,

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

  Data.DB,
  Datasnap.Provider,

  Libs.Constantes;

type
  TSMSetores = class(TDSServerModule)
    qryCadastro: TFDQuery;
    dspCadastro: TDataSetProvider;
    qryCadastroid: TIntegerField;
    qryCadastroNome_Setor: TStringField;
    qryJaExiste: TFDQuery;
    qryPesquisa: TFDQuery;
    dspPesquisa: TDataSetProvider;
    qryCadastroAtivo: TStringField;
    qryCadastroSIAGS: TStringField;
    qryCadastroCONTROLPC: TStringField;
    qryCadastroAUTOSC: TStringField;
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
  end;

implementation
uses ServerMethods.Container;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TSMSetores }

function TSMSetores.JaExiste(const AId: Integer; const ADescricao: String): Boolean;
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

function TSMSetores.Localizar(const AId: Integer) : Boolean;
begin
   MontarQueryCadastro(qryCadastro);
   qryCadastro.Sql.Add('where id = :pId');
   qryCadastro.ParamByName('pId').AsInteger := AId;
end;


procedure TSMSetores.Incluir;
begin
   MontarQueryCadastro(qryCadastro);
   qryCadastro.Sql.Add('where 1 = 2');
end;

procedure TSMSetores.MontarQueryCadastro(AQuery : TFDQuery);
begin
   AQuery.Close;
   AQuery.Sql.Clear;
   AQuery.Sql.Add('Select id, Nome_Setor, SIAGS, CONTROLPC, AUTOSC, Ativo');
   AQuery.Sql.Add('From Setores');
end;

procedure TSMSetores.Pesquisar(
   const ACampo, ATipo : Integer;
   const AChave : String;
   const AIncluirInativos : Boolean);
var
   LChave : String;
   LCampo : String;
begin
   MontarQueryCadastro(qryPesquisa);

   case ACampo of
      0 : LCampo := 'Nome_Setor';
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


   qryPesquisa.Sql.Add('Order by Nome_Setor');
end;

end.

