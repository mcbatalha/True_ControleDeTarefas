unit Services.Exportacoes;

interface

uses
  Vcl.Forms,
  Vcl.Samples.Gauges,
  Vcl.StdCtrls,
  Vcl.Dialogs,

  System.SysUtils,
  System.Classes,
  System.JSON,

  Providers.Seguranca,
  Proxy.Classes,
  Funcoes,
  Libs.Constantes,
  Providers.Conexao,
  Forms.Mensagem,
  Libs.TSeguranca;

type

  TSrvExportacoes = class
  private
     Fdm          : TdtmConexao;
     FFrmMensagem : TFrmMensagem;
     FNomeArquivo : String;

     procedure ExportarAutSc;
     procedure ExportarSigas;
     procedure ExportarControlPC;
     procedure ExportarSetores;
     procedure ExportarUsuarios;

     procedure ExportarDados(const AJSONArray : TJSONArray);

  public
     constructor Create();
     procedure Exportar(const ATipo : Integer);

     destructor Destroy(); override;
  end;

implementation

{ TSrvExportacoes }

constructor TSrvExportacoes.Create;
begin
   Application.CreateForm(TdtmConexao, Fdm);
   Fdm.SQLConnection.Connected := True;

   FFrmMensagem := TFrmMensagem.Create(nil);
end;

destructor TSrvExportacoes.Destroy;
begin
   Fdm.SQLConnection.Connected := False;
   FreeAndNil(Fdm);
   FreeAndNil(FFrmMensagem);

   inherited;
end;

procedure TSrvExportacoes.Exportar(const ATipo: Integer);
var
   LSaveDialog : TSaveDialog;
   LFileName   : String;

begin

   case ATipo of
      C_TIPO_EXPORTACAO_AUTOSC    : LFileName := C_ARQUIVO_EXPORTACAO_AUTOSC;
      C_TIPO_EXPORTACAO_SIAGS     : LFileName := C_ARQUIVO_EXPORTACAO_SIAGS;
      C_TIPO_EXPORTACAO_CONTROLPC : LFileName := C_ARQUIVO_EXPORTACAO_CONTROLPC;
      C_TIPO_EXPORTACAO_SETORES   : LFileName := C_ARQUIVO_EXPORTACAO_SETORES;
      C_TIPO_EXPORTACAO_USUARIOS  : LFileName := C_ARQUIVO_EXPORTACAO_USUARIOS;
   end;

   try
      LSaveDialog := TSaveDialog.Create(nil);
      LSaveDialog.FileName := LFileName;
      if not LSaveDialog.Execute then exit;

      FNomeArquivo := LSaveDialog.FileName;

      FFrmMensagem.btnMensagem.Caption := 'Aguarde, filtrando dados';
      FFrmMensagem.Show;
      Application.ProcessMessages;

      case ATipo of
         C_TIPO_EXPORTACAO_AUTOSC    : ExportarAutSc;
         C_TIPO_EXPORTACAO_SIAGS     : ExportarSigas;
         C_TIPO_EXPORTACAO_CONTROLPC : ExportarControlPC;
         C_TIPO_EXPORTACAO_SETORES   : ExportarSetores;
         C_TIPO_EXPORTACAO_USUARIOS  : ExportarUsuarios;
      end;
   finally
      FreeAndNil(LSaveDialog);
   end;
end;

procedure TSrvExportacoes.ExportarAutSc;
begin

end;

procedure TSrvExportacoes.ExportarControlPC;
var
   LService : TSMControlPcClient;
begin
   try
      LService := TSMControlPcClient.Create(FDM.SQLConnection.DBXConnection);
      ExportarDados(LService.ProtocolosAtivos);
   finally
      FreeAndNil(LService);
   end;
end;

procedure TSrvExportacoes.ExportarDados(const AJSONArray : TJSONArray);
var
   LObjeto : TJSONObject;
   LPair   : TJSONPair;
   I       : Integer;

   LRotulo : String;
   LLinha  : String;
   LArquivo : TextFile;

begin
   try
      I := AJSONArray.Count;

      FFrmMensagem.btnMensagem.Caption := 'Exportando dados !';
      FFrmMensagem.Inicializar(I);

      AssignFile(LArquivo, FNomeArquivo);
      Rewrite(LArquivo);

      LLinha := '';
      LObjeto := AJSONArray.Items[0] as TJSONObject;
      for I := 0 to LObjeto.Count - 1 do
         begin
         if LLinha <> '' then
            LLinha := LLinha + ';';
         LRotulo := LObjeto.Pairs[I].JsonString.Value;
         LLinha := LLinha + LRotulo;
      end;

      Writeln(LArquivo, LLinha);

      FFrmMensagem.Atualizar;
      for I := 0 to AJSONArray.Count - 1  do
          begin
          LObjeto := AJSONArray.Items[I] as TJSONObject;
          LLinha := '';
          for LPair in LObjeto do
             begin
             if LLinha <> '' then
                LLinha := LLinha + ';';
             LLinha := LLinha + LPair.JsonValue.ToString;
          end;
          FFrmMensagem.Atualizar;
          Writeln(LArquivo, LLinha);
      end;

      CloseFile(LArquivo);
      InformationMessage('Exportação finalizada', 'Exportação de Dados');

   finally
      FFrmMensagem.Close;
   end;
end;

procedure TSrvExportacoes.ExportarSetores;
var
   LService : TSMSetoresClient;
begin
   try
      LService := TSMSetoresClient.Create(FDM.SQLConnection.DBXConnection);
      ExportarDados(LService.Setores);
   finally
      FreeAndNil(LService);
   end;
end;

procedure TSrvExportacoes.ExportarSigas;
var
   LService : TSMSiagsClient;
begin
   try
      LService := TSMSiagsClient.Create(FDM.SQLConnection.DBXConnection);
      ExportarDados(LService.AutorizacoesAtivas);
   finally
      FreeAndNil(LService);
   end;
end;

procedure TSrvExportacoes.ExportarUsuarios;
var
   LService : TSMUsuariosClient;
begin
   try
      LService := TSMUsuariosClient.Create(FDM.SQLConnection.DBXConnection);
      ExportarDados(LService.Usuarios);
   finally
      FreeAndNil(LService);
   end;
end;

end.
