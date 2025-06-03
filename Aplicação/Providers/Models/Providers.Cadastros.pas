unit Providers.Cadastros;

interface

uses
  System.SysUtils,
  System.Classes,

  Data.DBXDataSnap,
  Data.DBXCommon,

  IPPeerClient,
  Data.DB,
  Datasnap.DBClient,
  Datasnap.DSConnect,
  Data.SqlExpr,

  Providers.Conexao,
  Proxy.Classes;


type
  TdtmCadastros = class(TdtmConexao)
    cdsCadastro: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  protected
    FPxyMetodosGerais : TSMMetodosGeraisClient;
    procedure NovoId(const ADataSet: TClientDataSet; const ATabela : String);
  public
    function Persistir(const ADataSet: TDataSet) : boolean;
  end;

var
  dtmCadastros: TdtmCadastros;

implementation
Uses Providers.Connection, Funcoes, Midas, MidasLib;

{%CLASSGROUP 'Vcl.Controls.TControl'}



{$R *.dfm}

{ TdtmCadastros }

procedure TdtmCadastros.DataModuleCreate(Sender: TObject);
begin
  inherited;
  ConnectionProvider.ConfigurarConexao(SQLConnection);
  FPxyMetodosGerais := TSMMetodosGeraisClient.Create(SQLConnection.DBXConnection);
end;

procedure TdtmCadastros.DataModuleDestroy(Sender: TObject);
begin
   inherited;
   SQLConnection.Connected := False;
   FreeAndNil(FPxyMetodosGerais);

end;

procedure TdtmCadastros.NovoId(const ADataSet: TClientDataSet; const ATabela: String);
begin
   try
      ADataSet.FieldByName('id').AsInteger := FPxyMetodosGerais.ProximoId(ATabela);
   except
      raise Exception.Create('Erro de Conexão. Será necessário reinicar a conexão');
   end;
end;

function TdtmCadastros.Persistir(const ADataSet: TDataSet): boolean;
begin
   Result := False;

   try
      Result := (ADataSet as TClientDataSet).ApplyUpdates(0) = 0;
   Except
      on E: Exception do
         InformationMessage('Ocorreu um ao tentar gravar os dados: ' + E.ClassName + ': ' + E.Message, 'Controle de Tarefas');
   end;
end;

end.
