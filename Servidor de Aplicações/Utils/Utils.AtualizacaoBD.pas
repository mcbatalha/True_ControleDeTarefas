unit Utils.AtualizacaoBD;

interface

uses
  System.SysUtils,
  VCL.Dialogs,
  FireDAC.Comp.Client, uTFuncoesServer, ServerMethods.Container, uTTransacao;

var
   FAtualizou   : Boolean;
   FVersaoAtual : Integer;

   function TabelaDeVersaoExite : boolean;
   procedure CriarTabelaDeVersao;
   function VersaoAtual : integer;
   procedure AtualizarVersao;
   procedure AtualizarBD;
   procedure Atualizacao002;
   procedure Atualizacao003;
   procedure Atualizacao004;
   procedure Atualizacao005;
   procedure Atualizacao006;

implementation

uses Funcoes, Libs.Constantes;


function TabelaDeVersaoExite : boolean;
var LQuery : TFDQuery;
begin
   try
      LQuery := TFDQuery.Create(nil);
      LQuery.Connection := ServerContainer.FDConnection;
      LQuery.sql.add('IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES ');
      LQuery.sql.add('           WHERE TABLE_TYPE = ' + QuotedStr('BASE TABLE'));
      LQuery.sql.add('                 AND TABLE_NAME = ' + QuotedStr('Versao_BD') + ')');
      LQuery.sql.add('   SELECT 1 AS res ELSE SELECT 0 AS res;');
      LQuery.open;  {abre a Qy_Tabelas}
      Result := LQuery.FieldByName('res').AsInteger = 1;
      LQuery.Close;
   finally
       FreeAndNil(LQuery);
   end;

end;


procedure CriarTabelaDeVersao;
var LQuery : TFDQuery;
begin
   try
      LQuery := TFDQuery.Create(nil);
      LQuery.Connection := ServerContainer.FDConnection;
      LQuery.sql.add('Create Table Versao_BD (Versao_Atual int)');
      LQuery.ExecSQL;

      LQuery.sql.Clear;
      LQuery.sql.add('Insert into Versao_BD (Versao_Atual) Values (1)');
      LQuery.ExecSQL;
   finally
       FreeAndNil(LQuery);
   end;
end;


procedure AtualizarVersao;
var LQuery : TFDQuery;
begin
   try
      LQuery := TFDQuery.Create(nil);
      LQuery.Connection := ServerContainer.FDConnection;
      LQuery.sql.add('Update Versao_BD');
      LQuery.sql.add('Set Versao_Atual = Versao_Atual + 1 ');
      LQuery.ExecSQL;
   finally
       FreeAndNil(LQuery);
   end;
end;


function VersaoAtual : integer;
var LQuery : TFDQuery;
begin
   try
      LQuery := TFDQuery.Create(nil);
      LQuery.Connection := ServerContainer.FDConnection;
      LQuery.sql.add('Select Versao_Atual from Versao_BD');
      LQuery.Open;
      Result := LQuery.FieldByName('Versao_Atual').AsInteger;
      LQuery.Close;
   finally
       FreeAndNil(LQuery);
   end;
end;

procedure AtualizarBD;
begin
   FAtualizou := False;

   if not TabelaDeVersaoExite then
      begin
      CriarTabelaDeVersao;
      FVersaoAtual := 1;
   end else
      FVersaoAtual := VersaoAtual;

   if FVersaoAtual = 1 then Atualizacao002;
   if FVersaoAtual = 2 then Atualizacao003;
   if FVersaoAtual = 3 then Atualizacao004;
   if FVersaoAtual = 4 then Atualizacao005;
   if FVersaoAtual = 5 then Atualizacao006;
end;


procedure Atualizacao006;
var LQuery : TFDQuery;
begin
   FAtualizou := False;
   try
      try
         TTransacao.IniciarTransacao(ServerContainer.FDConnection);
         LQuery := TFDQuery.Create(nil);
         LQuery.Connection := ServerContainer.FDConnection;

         LQuery.SQL.Clear;
         LQuery.SQL.Add('CREATE TABLE Tipos_Auditoria ');
         LQuery.SQL.Add('(id int identity(1,1), Tipo_Auditoria varchar(15), ');
         LQuery.SQL.Add(' CONSTRAINT PK_Tipos_Auditoria PRIMARY KEY (id)) ');
         LQuery.ExecSQL;
         //========================================================================

         LQuery.SQL.Clear;
         LQuery.SQL.Add('CREATE TABLE Tipos_Processo ');
         LQuery.SQL.Add('(id int identity(1,1), Tipo_Processo varchar(50), ');
         LQuery.SQL.Add(' CONSTRAINT PK_Tipos_Processo PRIMARY KEY (id)) ');
         LQuery.ExecSQL;
         //========================================================================

         LQuery.SQL.Clear;
         LQuery.SQL.Add('CREATE TABLE Tipos_Processo_E ');
         LQuery.SQL.Add('(id int identity(1,1), Tipo_Processo_E varchar(20), ');
         LQuery.SQL.Add(' CONSTRAINT PK_Tipos_Processo_E PRIMARY KEY (id)) ');
         LQuery.ExecSQL;
         //========================================================================

         LQuery.SQL.Clear;
         LQuery.SQL.Add('CREATE TABLE Tipos_Prazo ');
         LQuery.SQL.Add('(id int identity(1,1), Tipo_Prazo_Caixa varchar(15), ');
         LQuery.SQL.Add(' CONSTRAINT PK_Tipos_Prazo PRIMARY KEY (id)');
         LQuery.SQL.Add(')');
         LQuery.ExecSQL;
         //========================================================================

         LQuery.SQL.Clear;
         LQuery.SQL.Add('CREATE TABLE Tipos_Prazo_Hoje ');
         LQuery.SQL.Add('(id int identity(1,1), Tipo_Prazo_Caixa_Hoje varchar(15), ');
         LQuery.SQL.Add(' CONSTRAINT PK_Tipos_Prazo_Hoje PRIMARY KEY (id)');
         LQuery.SQL.Add(')');
         LQuery.ExecSQL;
         //========================================================================

         LQuery.SQL.Clear;
         LQuery.SQL.Add('CREATE TABLE Tipos_Status ');
         LQuery.SQL.Add('(id int identity(1,1), Tipo_Status varchar(15), ');
         LQuery.SQL.Add(' CONSTRAINT PK_Tipos_Status PRIMARY KEY (id)');
         LQuery.SQL.Add(')');
         LQuery.ExecSQL;
         //========================================================================

         LQuery.SQL.Clear;
         LQuery.SQL.Add('CREATE TABLE AutoSC ');
         LQuery.SQL.Add('(id Bigint Identity(1,1), Numero_Processo Bigint, id_Tipo_Auditoria int, id_Tipo_Prazo_Caixa int, ');
         LQuery.SQL.Add(' id_Tipo_Prazo_Caixa_Hoje int, id_Tipo_Status int, id_Tipo_Processo int, ');
         LQuery.SQL.Add(' Data_Status smalldatetime, Qtd_Arquivos int, UF varchar(2), ');
         LQuery.SQL.Add(' id_Tipo_Processo_E int, id_Tipo_Prazo_ANS int, ');
         LQuery.SQL.Add(' Data_Hora_Importacao smalldatetime, id_Usuario_Importacao int, ');
         LQuery.SQL.Add(' id_Setor_Designado int, id_Usuario_Desiginado int,');

         LQuery.SQL.Add(' CONSTRAINT PK_AutoSc PRIMARY KEY (id), ');
         LQuery.SQL.Add(' CONSTRAINT IX_AutoSC UNIQUE NONCLUSTERED (Numero_Processo), ');

         LQuery.SQL.Add(' CONSTRAINT FK_AutoSC_Tipos_Auditoria FOREIGN KEY (id_Tipo_Auditoria) ');
         LQuery.SQL.Add(' REFERENCES Tipos_Auditoria (id) ');
         LQuery.SQL.Add(' ON DELETE CASCADE ');
         LQuery.SQL.Add(' ON UPDATE CASCADE, ');

         LQuery.SQL.Add(' CONSTRAINT FK_AutoSC_Tipos_Prazo_Caixa FOREIGN KEY (id_Tipo_Prazo_Caixa) ');
         LQuery.SQL.Add(' REFERENCES Tipos_Prazo (id) ');
         LQuery.SQL.Add(' ON DELETE CASCADE ');
         LQuery.SQL.Add(' ON UPDATE CASCADE, ');

         LQuery.SQL.Add(' CONSTRAINT FK_AutoSC_Tipos_Prazo_Caixa_Hoje FOREIGN KEY (id_Tipo_Prazo_Caixa_Hoje) ');
         LQuery.SQL.Add(' REFERENCES Tipos_Prazo_Hoje (id) ');
         LQuery.SQL.Add(' ON DELETE CASCADE ');
         LQuery.SQL.Add(' ON UPDATE CASCADE, ');

         LQuery.SQL.Add(' CONSTRAINT FK_AutoSC_Tipos_Status FOREIGN KEY (id_Tipo_Status) ');
         LQuery.SQL.Add(' REFERENCES Tipos_Status (id) ');
         LQuery.SQL.Add(' ON DELETE CASCADE ');
         LQuery.SQL.Add(' ON UPDATE CASCADE, ');

         LQuery.SQL.Add(' CONSTRAINT FK_AutoSC_Tipos_Processo FOREIGN KEY (id_Tipo_Processo) ');
         LQuery.SQL.Add(' REFERENCES Tipos_Processo (id) ');
         LQuery.SQL.Add(' ON DELETE CASCADE ');
         LQuery.SQL.Add(' ON UPDATE CASCADE, ');

         LQuery.SQL.Add(' CONSTRAINT FK_AutoSC_Tipos_Processo_E FOREIGN KEY (id_Tipo_Processo_E) ');
         LQuery.SQL.Add(' REFERENCES Tipos_Processo_E (id) ');
         LQuery.SQL.Add(' ON DELETE CASCADE ');
         LQuery.SQL.Add(' ON UPDATE CASCADE, ');

         LQuery.SQL.Add(' CONSTRAINT FK_AutoSC_Tipos_Prazo_Ans FOREIGN KEY (id_Tipo_Prazo_Ans) ');
         LQuery.SQL.Add(' REFERENCES Tipos_Prazo (id), ');

         LQuery.SQL.Add(' CONSTRAINT FK_AutoSC_Usuarios_Importacao FOREIGN KEY (id_Usuario_Importacao) ');
         LQuery.SQL.Add(' REFERENCES Usuarios (id) ');
         LQuery.SQL.Add(' ON DELETE CASCADE ');
         LQuery.SQL.Add(' ON UPDATE CASCADE, ');

         LQuery.SQL.Add(' CONSTRAINT FK_AutoSC_Setores FOREIGN KEY (id_Setor_Designado) ');
         LQuery.SQL.Add(' REFERENCES Setores (id) ');
         LQuery.SQL.Add(' ON DELETE CASCADE ');
         LQuery.SQL.Add(' ON UPDATE CASCADE, ');

         LQuery.SQL.Add(' CONSTRAINT FK_AutoSC_Usuarios FOREIGN KEY (id_Usuario_Desiginado) ');
         LQuery.SQL.Add(' REFERENCES Usuarios (id) ');
         LQuery.SQL.Add(')');
         LQuery.ExecSQL;
         //========================================================================

         LQuery.SQL.Clear;
         LQuery.SQL.Add('CREATE TABLE AutoSc_Log ');
         LQuery.SQL.Add('(id Bigint Identity(1,1), id_AutoSC bigint, id_Setor_Designado int, id_Usuario_Designado int, ');
         LQuery.SQL.Add(' id_Usuario_Responsavel int, Justificativa varchar(100), ');

         LQuery.SQL.Add(' CONSTRAINT PK_AutoSc_Log PRIMARY KEY (id), ');

         LQuery.SQL.Add(' CONSTRAINT FK_AutoSc_Log_AutoSc FOREIGN KEY (id_AutoSC) ');
         LQuery.SQL.Add(' REFERENCES AutoSc (id) ');
         LQuery.SQL.Add(' ON DELETE CASCADE ');
         LQuery.SQL.Add(' ON UPDATE CASCADE, ');

         LQuery.SQL.Add(' CONSTRAINT FK_AutoSc_Log_Setores FOREIGN KEY (id_Setor_Designado) ');
         LQuery.SQL.Add(' REFERENCES Setores (id), ');

         LQuery.SQL.Add(' CONSTRAINT FK_AutoSc_Log_Usuario_Designado FOREIGN KEY (id_Usuario_Designado) ');
         LQuery.SQL.Add(' REFERENCES Usuarios (id), ');

         LQuery.SQL.Add(' CONSTRAINT FK_AutoSc_Log_Usuario_Responsavel FOREIGN KEY (id_Usuario_Responsavel) ');
         LQuery.SQL.Add(' REFERENCES Usuarios (id) ');
         LQuery.SQL.Add(')');
         LQuery.ExecSQL;
         //========================================================================

         LQuery.SQL.Clear;
         LQuery.SQL.Add('CREATE TABLE AutoSc_Historico ');
         LQuery.SQL.Add('(id Bigint Identity(1,1), id_AutoSC bigint, id_Tipo_Prazo_Caixa int, ');
         LQuery.SQL.Add(' id_Tipo_Prazo_Caixa_Hoje int, id_Tipo_Status int, Data_Status smalldatetime, ');
         LQuery.SQL.Add(' id_Usuario_Responsavel int, ');

         LQuery.SQL.Add(' CONSTRAINT PK_AutoSc_Historico PRIMARY KEY (id), ');

         LQuery.SQL.Add(' CONSTRAINT FK_AutoSc_Historico_AutoSc FOREIGN KEY (id_AutoSC) ');
         LQuery.SQL.Add(' REFERENCES AutoSc (id) ');
         LQuery.SQL.Add(' ON DELETE CASCADE ');
         LQuery.SQL.Add(' ON UPDATE CASCADE, ');

         LQuery.SQL.Add(' CONSTRAINT FK_AutoSc_Historico_Tipos_Prazo_Caixa FOREIGN KEY (id_Tipo_Prazo_Caixa) ');
         LQuery.SQL.Add(' REFERENCES Tipos_Prazo (id), ');

         LQuery.SQL.Add(' CONSTRAINT FK_AutoSc_Historico_Tipos_Prazo_Caixa_Hoje FOREIGN KEY (id_Tipo_Prazo_Caixa_Hoje) ');
         LQuery.SQL.Add(' REFERENCES Tipos_Prazo (id), ');

         LQuery.SQL.Add(' CONSTRAINT FK_AutoSc_Historico_Tipos_Status FOREIGN KEY (id_Tipo_Status) ');
         LQuery.SQL.Add(' REFERENCES Tipos_Status (id), ');

         LQuery.SQL.Add(' CONSTRAINT FK_AutoSc_Historico_Usuarios_Responsavel FOREIGN KEY (id_Usuario_Responsavel) ');
         LQuery.SQL.Add(' REFERENCES Usuarios (id) ');
         LQuery.SQL.Add(')');
         LQuery.ExecSQL;
         //========================================================================

         AtualizarVersao;
         TTransacao.ComitarTransacao(ServerContainer.FDConnection);
         FAtualizou := True;
         Inc(FVersaoAtual);
      except
         on E: Exception do
            begin
            TTransacao.CancelarTransacao(ServerContainer.FDConnection);
            ShowMessage('Erro ao processar a atualização ' + IntToStrZero(VersaoAtual +1,3) + chr(13) + E.Message );
         end;
      end;
   finally
      LQuery.Close;
      FreeAndNil(LQuery);
   end;
end;

procedure Atualizacao005;
var LQuery : TFDQuery;
begin
   FAtualizou := False;
   try
      try
         TTransacao.IniciarTransacao(ServerContainer.FDConnection);
         LQuery := TFDQuery.Create(nil);
         LQuery.Connection := ServerContainer.FDConnection;

         LQuery.SQL.Clear;
         LQuery.SQL.Add('ALTER TABLE Setores');
         LQuery.SQL.Add('ADD SIAGS varchar(3) Default(' +QuotedStr(C_NAO)+ '), ');
         LQuery.SQL.Add('    CONTROLPC varchar(3) Default(' +QuotedStr(C_NAO)+ '), ');
         LQuery.SQL.Add('    AUTOSC varchar(3) Default(' +QuotedStr(C_NAO)+ ') ');

         LQuery.ExecSQL;

         AtualizarVersao;
         TTransacao.ComitarTransacao(ServerContainer.FDConnection);
         FAtualizou := True;
         Inc(FVersaoAtual);
      except
         on E: Exception do
            begin
            TTransacao.CancelarTransacao(ServerContainer.FDConnection);
            ShowMessage('Erro ao processar a atualização ' + IntToStrZero(VersaoAtual +1,3) + chr(13) + E.Message );
         end;
      end;
   finally
      LQuery.Close;
      FreeAndNil(LQuery);
   end;
end;

procedure Atualizacao004;
var LQuery : TFDQuery;
begin
   FAtualizou := False;
   try
      try
         TTransacao.IniciarTransacao(ServerContainer.FDConnection);
         LQuery := TFDQuery.Create(nil);
         LQuery.Connection := ServerContainer.FDConnection;

         LQuery.SQL.Clear;
         LQuery.SQL.Add('ALTER TABLE Usuarios');
         LQuery.SQL.Add('ADD Perfil varchar(20)  ');
         LQuery.ExecSQL;

         AtualizarVersao;
         TTransacao.ComitarTransacao(ServerContainer.FDConnection);
         FAtualizou := True;
         Inc(FVersaoAtual);
      except
         on E: Exception do
            begin
            TTransacao.CancelarTransacao(ServerContainer.FDConnection);
            ShowMessage('Erro ao processar a atualização ' + IntToStrZero(VersaoAtual +1,3) + chr(13) + E.Message );
         end;
      end;
   finally
      LQuery.Close;
      FreeAndNil(LQuery);
   end;
end;

procedure Atualizacao003;
var LQuery : TFDQuery;
begin
   FAtualizou := False;
   try
      try
         TTransacao.IniciarTransacao(ServerContainer.FDConnection);
         LQuery := TFDQuery.Create(nil);
         LQuery.Connection := ServerContainer.FDConnection;

         LQuery.SQL.Clear;
         LQuery.SQL.Add('CREATE TABLE Log_Senha ');
         LQuery.SQL.Add('(id int identity(1,1), id_Usuario int, id_Usuario_Responsavel int, Data_Hora smalldatetime, ');
         LQuery.SQL.Add(' CONSTRAINT PK_Log_Senha PRIMARY KEY (id), ');
         LQuery.SQL.Add(' CONSTRAINT FK_Log_Senha_Usuario FOREIGN KEY (id_Usuario) ');
         LQuery.SQL.Add('            REFERENCES Usuarios (id) ');
         LQuery.SQL.Add('            ON DELETE CASCADE ');
         LQuery.SQL.Add('            ON UPDATE CASCADE, ');
         LQuery.SQL.Add(' CONSTRAINT FK_Log_Senha_Usuario_Responsavel FOREIGN KEY (id_Usuario_Responsavel) ');
         LQuery.SQL.Add('            REFERENCES Usuarios (id)) ');

         LQuery.ExecSQL;

         AtualizarVersao;
         TTransacao.ComitarTransacao(ServerContainer.FDConnection);
         FAtualizou := True;
         Inc(FVersaoAtual);
      except
         on E: Exception do
            begin
            TTransacao.CancelarTransacao(ServerContainer.FDConnection);
            ShowMessage('Erro ao processar a atualização ' + IntToStrZero(VersaoAtual +1,3) + chr(13) + E.Message );
         end;
      end;
   finally
      LQuery.Close;
      FreeAndNil(LQuery);
   end;
end;

procedure Atualizacao002;
var LQuery : TFDQuery;
begin
   FAtualizou := False;
   try
      try
         TTransacao.IniciarTransacao(ServerContainer.FDConnection);
         LQuery := TFDQuery.Create(nil);
         LQuery.Connection := ServerContainer.FDConnection;

         LQuery.SQL.Clear;
         LQuery.SQL.Add('CREATE TABLE Seguranca ');
         LQuery.SQL.Add('(id_Usuario int, Item_Menu int, ');
         LQuery.SQL.Add(' CONSTRAINT PK_Seguranca PRIMARY KEY (id_Usuario, Item_Menu), ');
         LQuery.SQL.Add(' CONSTRAINT FK_Seguranca_Usuario FOREIGN KEY (id_Usuario) ');
         LQuery.SQL.Add('            REFERENCES Usuarios (id) ');
         LQuery.SQL.Add('            ON DELETE CASCADE ');
         LQuery.SQL.Add('            ON UPDATE CASCADE) ');

         LQuery.ExecSQL;

         AtualizarVersao;
         TTransacao.ComitarTransacao(ServerContainer.FDConnection);
         FAtualizou := True;
         Inc(FVersaoAtual);
      except
         TTransacao.CancelarTransacao(ServerContainer.FDConnection);
         ShowMessage('Erro ao processar a atualização ' + IntToStrZero(VersaoAtual +1,3));
      end;
   finally
      LQuery.Close;
      FreeAndNil(LQuery);
   end;
end;

end.

