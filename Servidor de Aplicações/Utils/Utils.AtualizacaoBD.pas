unit Utils.AtualizacaoBD;

interface

uses
  System.SysUtils,
  VCL.Dialogs,
  FireDAC.Comp.Client,

  Libs.TFuncoesServer,
  Libs.TTransacao,

  ServerMethods.Container;

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
   procedure Atualizacao007;
   procedure Atualizacao008;
   procedure Atualizacao009;
   procedure Atualizacao010;
   procedure Atualizacao011;

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

   if FVersaoAtual =  1 then Atualizacao002;
   if FVersaoAtual =  2 then Atualizacao003;
   if FVersaoAtual =  3 then Atualizacao004;
   if FVersaoAtual =  4 then Atualizacao005;
   if FVersaoAtual =  5 then Atualizacao006;
   if FVersaoAtual =  6 then Atualizacao007;
   if FVersaoAtual =  7 then Atualizacao008;
   if FVersaoAtual =  8 then Atualizacao009;
   if FVersaoAtual =  9 then Atualizacao010;
   if FVersaoAtual = 10 then Atualizacao011;
end;


procedure Atualizacao011;
var LQuery : TFDQuery;
begin
   FAtualizou := False;
   try
      try
         TTransacao.IniciarTransacao(ServerContainer.FDConnection);
         LQuery := TFDQuery.Create(nil);
         LQuery.Connection := ServerContainer.FDConnection;

         LQuery.SQL.Clear;
         LQuery.SQL.Add('CREATE TABLE Tecnicos ');
         LQuery.SQL.Add('(id int identity(1,1), Nome_Tecnico varchar(50), ');
         LQuery.SQL.Add(' CONSTRAINT PK_Tecnicos PRIMARY KEY (id), ');
         LQuery.SQL.Add(' CONSTRAINT IK_Tecnicos UNIQUE NONCLUSTERED (Nome_Tecnico))');
         LQuery.ExecSQL;

         LQuery.SQL.Clear;
         LQuery.SQL.Add('CREATE TABLE Tipos_Cliente ');
         LQuery.SQL.Add('(id int identity(1,1), Tipo_Cliente varchar(50), ');
         LQuery.SQL.Add(' CONSTRAINT PK_Tipos_Cliente PRIMARY KEY (id), ');
         LQuery.SQL.Add(' CONSTRAINT IK_Tipos_Cliente UNIQUE NONCLUSTERED (Tipo_Cliente))');
         LQuery.ExecSQL;

         LQuery.SQL.Clear;
         LQuery.SQL.Add('CREATE TABLE Tipos_Classificacao ');
         LQuery.SQL.Add('(id int identity(1,1), ');
         LQuery.SQL.Add(' Tipo_Classificacao varchar(350), ');
         LQuery.SQL.Add(' CONSTRAINT PK_Tipos_Classificacao PRIMARY KEY (id), ');
         LQuery.SQL.Add(' CONSTRAINT IK_Tipos_Classificacao UNIQUE NONCLUSTERED (Tipo_Classificacao))');
         LQuery.ExecSQL;

         LQuery.SQL.Clear;
         LQuery.SQL.Add('CREATE TABLE ControlPc ');
         LQuery.SQL.Add('(id bigint identity(1,1), Protocolo varchar(50), id_Tipo_Status int, ');
         LQuery.SQL.Add(' Data_Abertura smalldatetime, Data_Transferencia smalldatetime, ');
         LQuery.SQL.Add(' Data_Fechamento smalldatetime, Previsao_Solucao smalldatetime, ');
         LQuery.SQL.Add(' id_Tipo_Prazo int, id_Tecnico int, id_Tipo_Cliente int, id_Tipo_Classificacao int, ');
         LQuery.SQL.Add(' Solicitacao_Cliente varchar(500), Tipo_Reclame varchar(3), Tipo_Nip varchar(3), ');
         LQuery.SQL.Add(' Data_Hora_Importacao smalldatetime, ');
         LQuery.SQL.Add(' id_Usuario_Importacao int, id_Setor_Designado int, ');
         LQuery.SQL.Add(' id_Usuario_Designado int, id_Responsavel_Designacao int, ');
         LQuery.SQL.Add(' Data_Hora_Designacao smalldatetime, Justificativa_Designacao varchar(100), ');
         LQuery.SQL.Add(' Data_Hora_Encerramento smalldatetime, id_Usuario_Encerramento int, ');
         LQuery.SQL.Add(' Justificativa_Encerramento varchar(100), ');
         LQuery.SQL.Add(' CONSTRAINT PK_CONTROLPC PRIMARY KEY (id), ');
         LQuery.SQL.Add(' CONSTRAINT IK_CONTROLPC UNIQUE NONCLUSTERED (Protocolo), ');

         LQuery.SQL.Add(' CONSTRAINT FK_ControlPc_Tipos_Status FOREIGN KEY (id_Tipo_Status) ');
         LQuery.SQL.Add(' REFERENCES Tipos_Status (id) ');
         LQuery.SQL.Add(' ON DELETE CASCADE ');
         LQuery.SQL.Add(' ON UPDATE CASCADE, ');

         LQuery.SQL.Add(' CONSTRAINT FK_ControlPc_Tipos_Prazo FOREIGN KEY (id_Tipo_Prazo) ');
         LQuery.SQL.Add(' REFERENCES Tipos_Prazo (id) ');
         LQuery.SQL.Add(' ON DELETE CASCADE ');
         LQuery.SQL.Add(' ON UPDATE CASCADE, ');

         LQuery.SQL.Add(' CONSTRAINT FK_ControlPc_Tecnicos FOREIGN KEY (id_Tecnico) ');
         LQuery.SQL.Add(' REFERENCES Tecnicos (id) ');
         LQuery.SQL.Add(' ON DELETE CASCADE ');
         LQuery.SQL.Add(' ON UPDATE CASCADE, ');

         LQuery.SQL.Add(' CONSTRAINT FK_ControlPc_Tipos_Cliente FOREIGN KEY (id_Tipo_Cliente) ');
         LQuery.SQL.Add(' REFERENCES Tipos_Cliente (id) ');
         LQuery.SQL.Add(' ON DELETE CASCADE ');
         LQuery.SQL.Add(' ON UPDATE CASCADE, ');

         LQuery.SQL.Add(' CONSTRAINT FK_ControlPc_Tipos_Classificacao FOREIGN KEY (id_Tipo_Classificacao) ');
         LQuery.SQL.Add(' REFERENCES Tipos_Classificacao (id) ');
         LQuery.SQL.Add(' ON DELETE CASCADE ');
         LQuery.SQL.Add(' ON UPDATE CASCADE, ');

         LQuery.SQL.Add(' CONSTRAINT FK_ControlPc_Usuarios_Importacao FOREIGN KEY (id_Usuario_Importacao) ');
         LQuery.SQL.Add(' REFERENCES Usuarios (id) ');
         LQuery.SQL.Add(' ON DELETE CASCADE ');
         LQuery.SQL.Add(' ON UPDATE CASCADE, ');

         LQuery.SQL.Add(' CONSTRAINT FK_ControlPc_Setores FOREIGN KEY (id_Setor_Designado) ');
         LQuery.SQL.Add(' REFERENCES Setores (id) ');
         LQuery.SQL.Add(' ON DELETE CASCADE ');
         LQuery.SQL.Add(' ON UPDATE CASCADE, ');

         LQuery.SQL.Add(' CONSTRAINT FK_ControlPc_Usuarios FOREIGN KEY (id_Usuario_Designado) ');
         LQuery.SQL.Add(' REFERENCES Usuarios (id), ');

         LQuery.SQL.Add(' CONSTRAINT FK_ControlPc_Usuarios_Designador FOREIGN KEY (id_Responsavel_Designacao) ');
         LQuery.SQL.Add(' REFERENCES Usuarios (id), ');

         LQuery.SQL.Add(' CONSTRAINT FK_ControlPc_Usuarios_Encerramento FOREIGN KEY (id_Usuario_Encerramento) ');
         LQuery.SQL.Add(' REFERENCES Usuarios (id)) ');
         LQuery.ExecSQL;

         LQuery.SQL.Clear;
         LQuery.SQL.Add('CREATE TABLE ControlPc_Historico ');
         LQuery.SQL.Add('(id Bigint Identity(1,1), id_ControlPc bigint, id_Tipo_Status int, ');
         LQuery.SQL.Add(' id_Tipo_Prazo int, id_Tecnico int, id_Tipo_Cliente int,  ');
         LQuery.SQL.Add(' id_Tipo_Classifiacao int, ');
         LQuery.SQL.Add(' id_Usuario_Responsavel int, Data_Hora_Historico smalldatetime, ');
         LQuery.SQL.Add(' CONSTRAINT PK_ControlPc_Historico PRIMARY KEY (id), ');

         LQuery.SQL.Add(' CONSTRAINT FK_ControlPc_Historico_ControlPc FOREIGN KEY (id_ControlPc) ');
         LQuery.SQL.Add(' REFERENCES ControlPc (id) ');
         LQuery.SQL.Add(' ON DELETE CASCADE ');
         LQuery.SQL.Add(' ON UPDATE CASCADE, ');

         LQuery.SQL.Add(' CONSTRAINT FK_ControlPc_Historico_Tipos_Status FOREIGN KEY (id_Tipo_Status) ');
         LQuery.SQL.Add(' REFERENCES Tipos_Status (id), ');

         LQuery.SQL.Add(' CONSTRAINT FK_ControlPc_Historico_Tipos_Cliente FOREIGN KEY (id_Tipo_Cliente) ');
         LQuery.SQL.Add(' REFERENCES Tipos_Cliente (id), ');

         LQuery.SQL.Add(' CONSTRAINT FK_ControlPc_Historico_Tipos_Prazo FOREIGN KEY (id_Tipo_Prazo) ');
         LQuery.SQL.Add(' REFERENCES Tipos_Prazo (id), ');

         LQuery.SQL.Add(' CONSTRAINT FK_ControlPc_Historico_Tecnicos FOREIGN KEY (id_Tecnico) ');
         LQuery.SQL.Add(' REFERENCES Tecnicos (id), ');

         LQuery.SQL.Add(' CONSTRAINT FK_ControlPc_Historico_Tipos_Classificacao FOREIGN KEY (id_Tipo_Classifiacao) ');
         LQuery.SQL.Add(' REFERENCES Tipos_Classificacao (id), ');

         LQuery.SQL.Add(' CONSTRAINT FK_ControlPc_Historico_Usuarios_Responsavel FOREIGN KEY (id_Usuario_Responsavel) ');
         LQuery.SQL.Add(' REFERENCES Usuarios (id)) ');
         LQuery.ExecSQL;

         LQuery.SQL.Clear;
         LQuery.SQL.Add('CREATE TABLE ControlPc_Log ');
         LQuery.SQL.Add('(id Bigint Identity(1,1), id_ControlPc bigint, id_Setor_Designado int, ');
         LQuery.SQL.Add(' id_Usuario_Designado int, id_Usuario_Responsavel int, ');
         LQuery.SQL.Add(' Justificativa varchar(100), Data_Hora_Log smalldatetime, ');
         LQuery.SQL.Add(' CONSTRAINT PK_ControlPc_Log PRIMARY KEY (id), ');

         LQuery.SQL.Add(' CONSTRAINT FK_ControlPc_Log_ControlPc FOREIGN KEY (id_ControlPc) ');
         LQuery.SQL.Add(' REFERENCES ControlPc (id) ');
         LQuery.SQL.Add(' ON DELETE CASCADE ');
         LQuery.SQL.Add(' ON UPDATE CASCADE, ');

         LQuery.SQL.Add(' CONSTRAINT FK_ControlPc_Log_Setores FOREIGN KEY (id_Setor_Designado) ');
         LQuery.SQL.Add(' REFERENCES Setores (id), ');

         LQuery.SQL.Add(' CONSTRAINT FK_ControlPc_Log_Usuario_Designado FOREIGN KEY (id_Usuario_Designado) ');
         LQuery.SQL.Add(' REFERENCES Usuarios (id), ');

         LQuery.SQL.Add(' CONSTRAINT FK_ControlPc_Log_Usuario_Responsavel FOREIGN KEY (id_Usuario_Responsavel) ');
         LQuery.SQL.Add(' REFERENCES Usuarios (id)) ');
         LQuery.ExecSQL;

         LQuery.SQL.Clear;
         LQuery.SQL.Add('CREATE TABLE ControlPc_Observacoes ');
         LQuery.SQL.Add('(id int identity(1,1), id_ControlPc bigint, id_Usuario int, ');
         LQuery.SQL.Add(' Data_Hora smalldatetime, Observacao varchar(500), ');
         LQuery.SQL.Add(' CONSTRAINT PK_ControlPc_Observacoes PRIMARY KEY (id), ');

         LQuery.SQL.Add(' CONSTRAINT FK_ControlPc_Observacoes_ControlPc FOREIGN KEY (id_ControlPc) ');
         LQuery.SQL.Add(' REFERENCES ControlPc (id) ');
         LQuery.SQL.Add(' ON DELETE CASCADE ');
         LQuery.SQL.Add(' ON UPDATE CASCADE, ');

         LQuery.SQL.Add(' CONSTRAINT FK_ControlPc_Observacoes_Usuarios FOREIGN KEY (id_Usuario) ');
         LQuery.SQL.Add(' REFERENCES Usuarios (id))');
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

procedure Atualizacao010;
var LQuery : TFDQuery;
begin
   FAtualizou := False;
   try
      try
         TTransacao.IniciarTransacao(ServerContainer.FDConnection);
         LQuery := TFDQuery.Create(nil);
         LQuery.Connection := ServerContainer.FDConnection;

         LQuery.SQL.Clear;
         LQuery.SQL.Add('CREATE TABLE Tipos_Autorizacao ');
         LQuery.SQL.Add('(id int identity(1,1), Tipo_Autorizacao varchar(50), ');
         LQuery.SQL.Add(' CONSTRAINT PK_Tipos_Autorizacao PRIMARY KEY (id)) ');
         LQuery.ExecSQL;

         LQuery.SQL.Clear;
         LQuery.SQL.Add('CREATE TABLE Tipos_Atendimento ');
         LQuery.SQL.Add('(id int identity(1,1), Tipo_Atendimento varchar(30), ');
         LQuery.SQL.Add(' CONSTRAINT PK_Tipos_Atendimento PRIMARY KEY (id)) ');
         LQuery.ExecSQL;

         LQuery.SQL.Clear;
         LQuery.SQL.Add('CREATE TABLE Tipos_Situacao_Autorizacao ');
         LQuery.SQL.Add('(id int identity(1,1), Tipo_Situacao_Autorizacao varchar(30), ');
         LQuery.SQL.Add('CONSTRAINT PK_Tipos_Situacao_Autorizacao PRIMARY KEY (id)) ');
         LQuery.ExecSQL;

         LQuery.SQL.Clear;
         LQuery.SQL.Add('CREATE TABLE Tipos_Ultima_Anotacao ');
         LQuery.SQL.Add('(id int identity(1,1), Tipo_Ultima_Anotacao varchar(30), ');
         LQuery.SQL.Add(' CONSTRAINT PK_Tipos_Ultima_Anotacao PRIMARY KEY (id)) ');
         LQuery.ExecSQL;

         LQuery.SQL.Clear;
         LQuery.SQL.Add('CREATE TABLE Beneficiarios ');
         LQuery.SQL.Add('(id int identity(1,1), Numero_Beneficiario varchar(15), ');
         LQuery.SQL.Add(' Nome_Beneficiario varchar(100), ');
         LQuery.SQL.Add(' CONSTRAINT PK_Beneficiarios PRIMARY KEY (id)) ');
         LQuery.ExecSQL;

         LQuery.SQL.Clear;
         LQuery.SQL.Add('CREATE TABLE Siags ');
         LQuery.SQL.Add('(id Bigint Identity(1,1), UF varchar(2), id_Tipo_Autorizacao int, ');
         LQuery.SQL.Add(' Numero_Autorizacao Bigint, id_Tipo_Atendimento int, Anexo_Opme varchar(3),  ');
         LQuery.SQL.Add(' Anexo_Quimio varchar(3), Anexo_Radio varchar(3), id_Beneficiario int, ');
         LQuery.SQL.Add(' id_Tipo_Situacao_Autorizacao int, id_Tipo_Ultima_Anotacao int, ');
         LQuery.SQL.Add(' id_Tipo_Auditoria int, Dia_Inclusao int, Dias_Corridos_Base int, ');
         LQuery.SQL.Add(' Dias_Uteis_Base int, Dias_Prazo_Caixa int, Data_Prazo_Caixa smalldatetime, ');
         LQuery.SQL.Add(' id_Tipo_Prazo_Caixa int, Dias_Prazo_ANS int, Data_Prazo_ANS smalldatetime, ');
         LQuery.SQL.Add(' id_Tipo_Prazo_ANS int, Data_Hora_Importacao smalldatetime, ');
         LQuery.SQL.Add(' id_Usuario_Importacao int, id_Setor_Designado int, ');
         LQuery.SQL.Add(' id_Usuario_Designado int, id_Responsavel_Designacao int, ');
         LQuery.SQL.Add(' Data_Hora_Designacao smalldatetime, Justificativa_Designacao varchar(100), ');
         LQuery.SQL.Add(' Data_Hora_Encerramento smalldatetime, id_Usuario_Encerramento int, ');
         LQuery.SQL.Add(' Justificativa_Encerramento varchar(100), ');
         LQuery.SQL.Add(' CONSTRAINT PK_Siags PRIMARY KEY (id), ');

         LQuery.SQL.Add(' CONSTRAINT FK_Siags_Tipos_Autorizacao FOREIGN KEY (id_Tipo_Autorizacao) ');
         LQuery.SQL.Add(' REFERENCES Tipos_Autorizacao (id) ');
         LQuery.SQL.Add(' ON DELETE CASCADE ');
         LQuery.SQL.Add(' ON UPDATE CASCADE, ');

         LQuery.SQL.Add(' CONSTRAINT FK_Siags_Tipos_Atendimento FOREIGN KEY (id_Tipo_Atendimento) ');
         LQuery.SQL.Add(' REFERENCES Tipos_Atendimento (id) ');
         LQuery.SQL.Add(' ON DELETE CASCADE ');
         LQuery.SQL.Add(' ON UPDATE CASCADE, ');

         LQuery.SQL.Add(' CONSTRAINT FK_Siags_Tipos_Situacao_Autorizacao FOREIGN KEY (id_Tipo_Situacao_Autorizacao) ');
         LQuery.SQL.Add(' REFERENCES Tipos_Situacao_Autorizacao (id) ');
         LQuery.SQL.Add(' ON DELETE CASCADE ');
         LQuery.SQL.Add(' ON UPDATE CASCADE, ');

         LQuery.SQL.Add(' CONSTRAINT FK_Siags_Tipos_Ultima_Anotacao FOREIGN KEY (id_Tipo_Ultima_Anotacao) ');
         LQuery.SQL.Add(' REFERENCES Tipos_Ultima_Anotacao (id) ');
         LQuery.SQL.Add(' ON DELETE CASCADE ');
         LQuery.SQL.Add(' ON UPDATE CASCADE, ');

         LQuery.SQL.Add(' CONSTRAINT FK_Siags_Beneficiarios FOREIGN KEY (id_Beneficiario) ');
         LQuery.SQL.Add(' REFERENCES Beneficiarios (id) ');
         LQuery.SQL.Add(' ON DELETE CASCADE ');
         LQuery.SQL.Add(' ON UPDATE CASCADE, ');

         LQuery.SQL.Add(' CONSTRAINT FK_Siags_Tipos_Auditoria FOREIGN KEY (id_Tipo_Auditoria) ');
         LQuery.SQL.Add(' REFERENCES Tipos_Auditoria (id) ');
         LQuery.SQL.Add(' ON DELETE CASCADE ');
         LQuery.SQL.Add(' ON UPDATE CASCADE, ');

         LQuery.SQL.Add(' CONSTRAINT FK_Siags_Tipos_Prazo_Caixa FOREIGN KEY (id_Tipo_Prazo_Caixa) ');
         LQuery.SQL.Add(' REFERENCES Tipos_Prazo (id) ');
         LQuery.SQL.Add(' ON DELETE CASCADE ');
         LQuery.SQL.Add(' ON UPDATE CASCADE, ');

         LQuery.SQL.Add(' CONSTRAINT FK_Siags_Tipos_Prazo_Ans FOREIGN KEY (id_Tipo_Prazo_Ans) ');
         LQuery.SQL.Add(' REFERENCES Tipos_Prazo (id), ');

         LQuery.SQL.Add(' CONSTRAINT FK_Siags_Usuarios_Importacao FOREIGN KEY (id_Usuario_Importacao) ');
         LQuery.SQL.Add(' REFERENCES Usuarios (id) ');
         LQuery.SQL.Add(' ON DELETE CASCADE ');
         LQuery.SQL.Add(' ON UPDATE CASCADE, ');

         LQuery.SQL.Add(' CONSTRAINT FK_Siags_Setores FOREIGN KEY (id_Setor_Designado) ');
         LQuery.SQL.Add(' REFERENCES Setores (id) ');
         LQuery.SQL.Add(' ON DELETE CASCADE ');
         LQuery.SQL.Add(' ON UPDATE CASCADE, ');

         LQuery.SQL.Add(' CONSTRAINT FK_Siags_Usuarios FOREIGN KEY (id_Usuario_Designado) ');
         LQuery.SQL.Add(' REFERENCES Usuarios (id), ');

         LQuery.SQL.Add(' CONSTRAINT FK_Siags_Usuarios_Designador FOREIGN KEY (id_Responsavel_Designacao) ');
         LQuery.SQL.Add(' REFERENCES Usuarios (id), ');

         LQuery.SQL.Add(' CONSTRAINT FK_Siags_Usuarios_Encerramento FOREIGN KEY (id_Usuario_Encerramento) ');
         LQuery.SQL.Add(' REFERENCES Usuarios (id)) ');
         LQuery.ExecSQL;

         LQuery.SQL.Clear;
         LQuery.SQL.Add('CREATE TABLE Siags_Historico ');
         LQuery.SQL.Add('(id Bigint Identity(1,1), id_Siags bigint, id_Tipo_Autorizacao int, ');
         LQuery.SQL.Add(' id_Tipo_Atendimento int, Anexo_Opme varchar(3), Anexo_Quimio varchar(3), ');
         LQuery.SQL.Add(' Anexo_Radio varchar(3), id_Tipo_Situacao_Autorizacao int, ');
         LQuery.SQL.Add(' id_Tipo_Ultima_Anotacao int, id_Tipo_Auditoria int, Dias_Corridos_Base int, ');
         LQuery.SQL.Add(' Dias_Uteis_Base int, Dias_Prazo_Caixa int, id_Tipo_Prazo_Caixa int, ');
         LQuery.SQL.Add(' Dias_Prazo_ANS int, id_Tipo_Prazo_ANS int, ');
         LQuery.SQL.Add(' id_Usuario_Responsavel int, Data_Hora_Historico smalldatetime, ');
         LQuery.SQL.Add(' CONSTRAINT PK_Siags_Historico PRIMARY KEY (id), ');

         LQuery.SQL.Add(' CONSTRAINT FK_Siags_Historico_Siags FOREIGN KEY (id_Siags) ');
         LQuery.SQL.Add(' REFERENCES Siags (id) ');
         LQuery.SQL.Add(' ON DELETE CASCADE ');
         LQuery.SQL.Add(' ON UPDATE CASCADE, ');

         LQuery.SQL.Add(' CONSTRAINT FK_Siags_Historico_Tipos_Autorizacao FOREIGN KEY (id_Tipo_Autorizacao) ');
         LQuery.SQL.Add(' REFERENCES Tipos_Autorizacao (id), ');

         LQuery.SQL.Add(' CONSTRAINT FK_Siags_Historico_Tipos_Atendimento FOREIGN KEY (id_Tipo_Atendimento) ');
         LQuery.SQL.Add(' REFERENCES Tipos_Atendimento (id), ');

         LQuery.SQL.Add(' CONSTRAINT FK_Siags_Historico_Tipos_Situacao_Autorizacao FOREIGN KEY (id_Tipo_Situacao_Autorizacao) ');
         LQuery.SQL.Add(' REFERENCES Tipos_Situacao_Autorizacao (id), ');

         LQuery.SQL.Add(' CONSTRAINT FK_Siags_Historico_Tipos_Ultima_Anotacao FOREIGN KEY (id_Tipo_Ultima_Anotacao) ');
         LQuery.SQL.Add(' REFERENCES Tipos_Ultima_Anotacao (id), ');

         LQuery.SQL.Add(' CONSTRAINT FK_Siags_Historico_Tipos_Auditoria FOREIGN KEY (id_Tipo_Auditoria) ');
         LQuery.SQL.Add(' REFERENCES Tipos_Auditoria (id), ');

         LQuery.SQL.Add(' CONSTRAINT FK_Siags_Historico_Tipos_Prazo_Caixa FOREIGN KEY (id_Tipo_Prazo_Caixa) ');
         LQuery.SQL.Add(' REFERENCES Tipos_Prazo (id), ');

         LQuery.SQL.Add(' CONSTRAINT FK_Siags_Historico_Tipos_Prazo_ANS FOREIGN KEY (id_Tipo_Prazo_ANS) ');
         LQuery.SQL.Add(' REFERENCES Tipos_Prazo (id), ');

         LQuery.SQL.Add(' CONSTRAINT FK_Siags_Historico_Usuarios_Responsavel FOREIGN KEY (id_Usuario_Responsavel) ');
         LQuery.SQL.Add(' REFERENCES Usuarios (id)) ');
         LQuery.ExecSQL;

         LQuery.SQL.Clear;
         LQuery.SQL.Add('CREATE TABLE Siags_Log ');
         LQuery.SQL.Add('(id Bigint Identity(1,1), id_Siags bigint, id_Setor_Designado int, ');
         LQuery.SQL.Add(' id_Usuario_Designado int, id_Usuario_Responsavel int, ');
         LQuery.SQL.Add(' Justificativa varchar(100), Data_Hora_Log smalldatetime, ');
         LQuery.SQL.Add(' CONSTRAINT PK_Siags_Log PRIMARY KEY (id), ');

         LQuery.SQL.Add(' CONSTRAINT FK_Siags_Log_Siags FOREIGN KEY (id_Siags) ');
         LQuery.SQL.Add(' REFERENCES Siags (id) ');
         LQuery.SQL.Add(' ON DELETE CASCADE ');
         LQuery.SQL.Add(' ON UPDATE CASCADE, ');

         LQuery.SQL.Add(' CONSTRAINT FK_Siags_Log_Setores FOREIGN KEY (id_Setor_Designado) ');
         LQuery.SQL.Add(' REFERENCES Setores (id), ');

         LQuery.SQL.Add(' CONSTRAINT FK_Siags_Log_Usuario_Designado FOREIGN KEY (id_Usuario_Designado) ');
         LQuery.SQL.Add(' REFERENCES Usuarios (id), ');

         LQuery.SQL.Add(' CONSTRAINT FK_Siags_Log_Usuario_Responsavel FOREIGN KEY (id_Usuario_Responsavel) ');
         LQuery.SQL.Add(' REFERENCES Usuarios (id)) ');
         LQuery.ExecSQL;

         LQuery.SQL.Clear;
         LQuery.SQL.Add('CREATE TABLE Siags_Observacoes ');
         LQuery.SQL.Add('(id int identity(1,1), id_Siags bigint, id_Usuario int, ');
         LQuery.SQL.Add(' Data_Hora smalldatetime, Observacao varchar(500), ');
         LQuery.SQL.Add(' CONSTRAINT PK_Siags_Observacoes PRIMARY KEY (id), ');

         LQuery.SQL.Add(' CONSTRAINT FK_Siags_Observacoes_Siags FOREIGN KEY (id_Siags) ');
         LQuery.SQL.Add(' REFERENCES Siags (id) ');
         LQuery.SQL.Add(' ON DELETE CASCADE ');
         LQuery.SQL.Add(' ON UPDATE CASCADE, ');

         LQuery.SQL.Add(' CONSTRAINT FK_Siags_Observacoes_Usuarios FOREIGN KEY (id_Usuario) ');
         LQuery.SQL.Add(' REFERENCES Usuarios (id))');
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


procedure Atualizacao009;
var LQuery : TFDQuery;
begin
   FAtualizou := False;
   try
      try
         TTransacao.IniciarTransacao(ServerContainer.FDConnection);
         LQuery := TFDQuery.Create(nil);
         LQuery.Connection := ServerContainer.FDConnection;

         LQuery.SQL.Clear;
         LQuery.SQL.Add('CREATE TABLE AutoSC_Observacoes');
         LQuery.SQL.Add('(id int identity(1,1), id_AutoSC bigint, id_Usuario int, ');
         LQuery.SQL.Add(' Data_Hora smalldatetime, Observacao varchar(500), ');
         LQuery.SQL.Add('    CONSTRAINT PK_AutoSC_Observacoes PRIMARY KEY (id), ');

         LQuery.SQL.Add('    CONSTRAINT FK_AutoSC_Observacoes_AutoSC FOREIGN KEY (id_AutoSC) ');
         LQuery.SQL.Add('               REFERENCES AutoSC (id) ');
         LQuery.SQL.Add('               ON DELETE CASCADE ');
         LQuery.SQL.Add('               ON UPDATE CASCADE, ');

         LQuery.SQL.Add('    CONSTRAINT FK_AutoSC_Observacoes_Usuarios FOREIGN KEY (id_Usuario) ');
         LQuery.SQL.Add('               REFERENCES Usuarios (id)) ');
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


procedure Atualizacao008;
var LQuery : TFDQuery;
begin
   FAtualizou := False;
   try
      try
         TTransacao.IniciarTransacao(ServerContainer.FDConnection);
         LQuery := TFDQuery.Create(nil);
         LQuery.Connection := ServerContainer.FDConnection;

         LQuery.SQL.Clear;
         LQuery.SQL.Add('CREATE TABLE Historico_Importacoes');
         LQuery.SQL.Add('(id int identity(1,1), id_Usuario int, Tipo varchar(15), ');
         LQuery.SQL.Add(' Data_Hora smalldatetime, Qtd_Registros int, Qtd_Registros_Novos int, ');
         LQuery.SQL.Add(' Qtd_Registros_Atualizados int,');
         LQuery.SQL.Add('    CONSTRAINT PK_Historico_Importacoes PRIMARY KEY (id), ');

         LQuery.SQL.Add('    CONSTRAINT FK_Historico_Importacoes_Usuarios FOREIGN KEY (id_Usuario) ');
         LQuery.SQL.Add('               REFERENCES Usuarios (id) ');
         LQuery.SQL.Add('               ON DELETE CASCADE ');
         LQuery.SQL.Add('               ON UPDATE CASCADE) ');
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


procedure Atualizacao007;
var LQuery : TFDQuery;
begin
   FAtualizou := False;
   try
      try
         TTransacao.IniciarTransacao(ServerContainer.FDConnection);
         LQuery := TFDQuery.Create(nil);
         LQuery.Connection := ServerContainer.FDConnection;

         LQuery.SQL.Clear;
         LQuery.SQL.Add('ALTER TABLE AutoSC');
         LQuery.SQL.Add('ADD Data_Hora_Encerramento smalldatetime, ');
         LQuery.SQL.Add('    id_Usuario_Encerramento int,');
         LQuery.SQL.Add('    id_Responsavel_Designacao int,');
         LQuery.SQL.Add('    Data_Hora_Designacao smalldatetime, ');
         LQuery.SQL.Add('    Justificativa_Encerramento varchar(100), ');
         LQuery.SQL.Add('    Justificativa_Designacao varchar(100), ');
         LQuery.SQL.Add('    CONSTRAINT FK_AutoSC_Usuarios_Designador FOREIGN KEY (id_Responsavel_Designacao) ');
         LQuery.SQL.Add('               REFERENCES Usuarios (id),');
         LQuery.SQL.Add('    CONSTRAINT FK_AutoSC_Usuarios_Encerramento FOREIGN KEY (id_Usuario_Encerramento) ');
         LQuery.SQL.Add('               REFERENCES Usuarios (id)');

         LQuery.SQL.Clear;
         LQuery.SQL.Add('ALTER TABLE AutoSc_Historico');
         LQuery.SQL.Add('ADD Data_Hora_Historico smalldatetime');
         LQuery.ExecSQL;

         LQuery.SQL.Clear;
         LQuery.SQL.Add('ALTER TABLE AutoSc_Log');
         LQuery.SQL.Add('ADD Data_Hora_Log smalldatetime');
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
         LQuery.SQL.Add(' AUTOSC int default(0), SIAGS int default(0), CONTROLPC int default(0),');
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
         LQuery.SQL.Add('(id int identity(1,1), Tipo_Prazo_Caixa varchar(30), ');
         LQuery.SQL.Add(' AUTOSC int default(0), SIAGS int default(0), CONTROLPC int default(0),');
         LQuery.SQL.Add(' CONSTRAINT PK_Tipos_Prazo PRIMARY KEY (id)');
         LQuery.SQL.Add(')');
         LQuery.ExecSQL;
         //========================================================================

         LQuery.SQL.Clear;
         LQuery.SQL.Add('CREATE TABLE Tipos_Prazo_Hoje ');
         LQuery.SQL.Add('(id int identity(1,1), Tipo_Prazo_Caixa_Hoje varchar(30), ');
         LQuery.SQL.Add(' AUTOSC int default(0), SIAGS int default(0), CONTROLPC int default(0),');
         LQuery.SQL.Add(' CONSTRAINT PK_Tipos_Prazo_Hoje PRIMARY KEY (id)');
         LQuery.SQL.Add(')');
         LQuery.ExecSQL;
         //========================================================================

         LQuery.SQL.Clear;
         LQuery.SQL.Add('CREATE TABLE Tipos_Status ');
         LQuery.SQL.Add('(id int identity(1,1), Tipo_Status varchar(30), ');
         LQuery.SQL.Add(' AUTOSC int default(0), SIAGS int default(0), CONTROLPC int default(0),');
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
         LQuery.SQL.Add(' id_Setor_Designado int, id_Usuario_Designado int,');

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

         LQuery.SQL.Add(' CONSTRAINT FK_AutoSC_Usuarios FOREIGN KEY (id_Usuario_Designado) ');
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
         LQuery.SQL.Add(' id_Tipo_Prazo_Caixa_Hoje int, id_Tipo_Prazo_ANS int, ');
         LQuery.SQL.Add(' id_Tipo_Status int, Data_Status smalldatetime, ');
         LQuery.SQL.Add(' id_Usuario_Responsavel int, ');

         LQuery.SQL.Add(' CONSTRAINT PK_AutoSc_Historico PRIMARY KEY (id), ');

         LQuery.SQL.Add(' CONSTRAINT FK_AutoSc_Historico_AutoSc FOREIGN KEY (id_AutoSC) ');
         LQuery.SQL.Add(' REFERENCES AutoSc (id) ');
         LQuery.SQL.Add(' ON DELETE CASCADE ');
         LQuery.SQL.Add(' ON UPDATE CASCADE, ');

         LQuery.SQL.Add(' CONSTRAINT FK_AutoSc_Historico_Tipos_Prazo_Caixa FOREIGN KEY (id_Tipo_Prazo_Caixa) ');
         LQuery.SQL.Add(' REFERENCES Tipos_Prazo (id), ');

         LQuery.SQL.Add(' CONSTRAINT FK_AutoSc_Historico_Tipos_Prazo_ANS FOREIGN KEY (id_Tipo_Prazo_ANS) ');
         LQuery.SQL.Add(' REFERENCES Tipos_Prazo (id), ');

         LQuery.SQL.Add(' CONSTRAINT FK_AutoSc_Historico_Tipos_Prazo_Caixa_Hoje FOREIGN KEY (id_Tipo_Prazo_Caixa_Hoje) ');
         LQuery.SQL.Add(' REFERENCES Tipos_Prazo_Hoje (id), ');

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

