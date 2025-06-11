unit Services.Importacao.Siags;

interface
uses
  Vcl.Forms,
  Vcl.Samples.Gauges,
  Vcl.StdCtrls,

  System.SysUtils,
  System.Classes,
  System.JSON,

  Providers.Seguranca,
  Proxy.Classes,
  Funcoes,
  Libs.Constantes,
  Providers.Importacoes.Siags,
  Forms.Mensagem,
  Libs.TSeguranca;

type

  TSrvImportacaoSiags = class
  private
     Fdm            : TdtmImportacoesSiags;
     FPxyImportacao : TSMSiagsClient;
     FDados         : TJSONArray;
     FTotalDeLinhas : integer;
     FJSonCarregado : Boolean;

     function PosicaoColuna(const AColuna : String): integer;

    const
       C_TITULO_MENSAGENS = 'Importação de Planilha SIAGS';
  public
     constructor Create();
     function Validar(const ASheet : Variant) : Boolean;
     function Analisar(ALblGauge : TLabel; AGauge : TGauge; const ASheet : Variant) : Boolean;
     function DadoDaColuna(const ASheet : Variant; const AColuna : String; const ALinha : integer) : String;
     function ImportarDados : Boolean;

     function getFDados         : TJSONArray;

     property TotalLinhas : integer read FTotalDeLinhas write FTotalDeLinhas;


     destructor Destroy(); override;

  end;

implementation
uses Forms.Importacoes.Siags;

{ TSrvImportacaoSiags }

function TSrvImportacaoSiags.Analisar(ALblGauge : TLabel; AGauge : TGauge; const ASheet : Variant) : Boolean;
var
   i       : integer;
   LDado   : TJSONObject;
   LColuna : String;
   LAux    : String;

begin
   Result := False;
   FDados := TJSONArray.create;
   AGauge.MaxValue := FTotalDeLinhas;

   for I := 2 to FTotalDeLinhas + 1 do
      begin
      LDado := TJSONObject.Create;

      LColuna := 'UF PRESTADOR';
      LDado.AddPair(LColuna, TJSONString.Create(DadoDaColuna(ASheet, LColuna, i)));

      LColuna := 'TIPO AUTORIZACAO';
      LDado.AddPair(LColuna, TJSONString.Create(DadoDaColuna(ASheet, LColuna, i)));

      LColuna := 'AUTORIZACAO';
      LDado.AddPair(LColuna, TJSONString.Create(DadoDaColuna(ASheet, LColuna, i)));

      LColuna := 'TIPO ATENDIMENTO';
      LDado.AddPair(LColuna, TJSONString.Create(DadoDaColuna(ASheet, LColuna, i)));

      LColuna := 'ANEXO OPME';
      LAux    := DadoDaColuna(ASheet, LColuna, i);
      if LAux = '' then
         LAux := C_NAO;
      LDado.AddPair(LColuna, TJSONString.Create(LAux));

      LColuna := 'ANEXO QUIMIO';
      LAux    := DadoDaColuna(ASheet, LColuna, i);
      if LAux = '' then
         LAux := C_NAO;
      LDado.AddPair(LColuna, TJSONString.Create(LAux));

      LColuna := 'ANEXO RADIO';
      LAux    := DadoDaColuna(ASheet, LColuna, i);
      if LAux = '' then
         LAux := C_NAO;
      LDado.AddPair(LColuna, TJSONString.Create(LAux));

      LColuna := 'BENEFICIARIO';
      LDado.AddPair(LColuna, TJSONString.Create(DadoDaColuna(ASheet, LColuna, i)));

      LColuna := 'NOME';
      LDado.AddPair(LColuna, TJSONString.Create(DadoDaColuna(ASheet, LColuna, i)));

      LColuna := 'SITUACAOAUTORIZ';
      LDado.AddPair(LColuna, TJSONString.Create(DadoDaColuna(ASheet, LColuna, i)));

      LColuna := 'ULT ANOTACAO ADM';
      LDado.AddPair(LColuna, TJSONString.Create(DadoDaColuna(ASheet, LColuna, i)));

      LColuna := 'AUDITORIA';
      LDado.AddPair(LColuna, TJSONString.Create(DadoDaColuna(ASheet, LColuna, i)));

      LColuna := 'DIAINCLUSAO';
      LDado.AddPair(LColuna, TJSONNumber.Create(StrToIntDef(DadoDaColuna(ASheet, LColuna, i),0)));

      LColuna := 'DIASCORRIDOSABE';
      LDado.AddPair(LColuna, TJSONNumber.Create(StrToIntDef(DadoDaColuna(ASheet, LColuna, i),0)));

      LColuna := 'DIASUTEISABE';
      LDado.AddPair(LColuna, TJSONNumber.Create(StrToIntDef(DadoDaColuna(ASheet, LColuna, i),0)));

      LColuna := 'DIASPRAZOCAX';
      LDado.AddPair(LColuna, TJSONNumber.Create(StrToIntDef(DadoDaColuna(ASheet, LColuna, i),0)));

      LColuna := 'DATAPRAZOCAX';
      LDado.AddPair(LColuna, TJSONString.Create(DadoDaColuna(ASheet, LColuna, i)));

      LColuna := 'STATUSPZCAX';
      LDado.AddPair(LColuna, TJSONString.Create(DadoDaColuna(ASheet, LColuna, i)));

      LColuna := 'DIASPRAZOANS';
      LDado.AddPair(LColuna, TJSONNumber.Create(StrToIntDef(DadoDaColuna(ASheet, LColuna, i),0)));

      LColuna := 'DATAPRAZOANS';
      LDado.AddPair(LColuna, TJSONString.Create(DadoDaColuna(ASheet, LColuna, i)));

      LColuna := 'STATUSPZANS';
      LDado.AddPair(LColuna, TJSONString.Create(DadoDaColuna(ASheet, LColuna, i)));

      FDados.Add(LDado);
      AGauge.Progress := AGauge.Progress + 1;
      ALblGauge.caption := 'Analisando ' + inttostr(i-1) + ' de ' + inttostr(FTotalDeLinhas);
      Application.ProcessMessages;
   end;

   ALblGauge.caption := 'Analisados ' + inttostr(FTotalDeLinhas) + ' de ' + inttostr(FTotalDeLinhas);

   InformationMessage('Análise finalizada', C_TITULO_MENSAGENS);
   Result          := True;
   FJSonCarregado  := Result;
   AGauge.Progress := 0;

//   Result := Trim(RemoveAspas(FColunas[PosicaoColuna(AColuna)])));
end;

constructor TSrvImportacaoSiags.Create;
begin
   Application.CreateForm(TdtmImportacoesSiags, Fdm);
   FPxyImportacao := TSMSiagsClient.Create(Fdm.SQLConnection.DBXConnection);
end;


function TSrvImportacaoSiags.DadoDaColuna(const ASheet : Variant; const AColuna : String; const ALinha : integer) : String;
var
   LAux : String;
begin
   LAux := ASheet.Cells[ALinha,PosicaoColuna(AColuna)].Value;
   Result := Trim(RemoveAspas(LAux));
end;

destructor TSrvImportacaoSiags.Destroy;
begin
   FreeAndNil(FPxyImportacao);
   FreeAndNil(Fdm);

   if FJSonCarregado then
      FreeAndNil(FDados);

   inherited;
end;

function TSrvImportacaoSiags.getFDados: TJSONArray;
begin
   Result := FDados;
end;

function TSrvImportacaoSiags.ImportarDados: Boolean;
var
   LRetorno  : TJSONObject;
   LImportou : Boolean;
   LMensagem : String;

   LRegistrosProcessados    : integer;
   LRegistrosNovos          : integer;
   LRegistrosAtualizados    : integer;
   LRegistrosNaoAtualizados : integer;

   frmMensagem : TFrmMensagem;
begin

   Application.CreateForm(TFrmMensagem, frmMensagem);
   try
      frmMensagem.btnMensagem.Caption := 'Aguarde, efetivando importação';
      frmMensagem.GaugeVisible(False);
      frmMensagem.Show;
      frmMensagem.Refresh;
      Application.ProcessMessages;
      LRetorno := FPxyImportacao.Importar(FDados, Seguranca.id);
      frmMensagem.Close;

      Result   := LRetorno.Values['importou'].AsType<Boolean>;

      FJSonCarregado := not Result;

      if Result then
         begin
         LRegistrosProcessados    := LRetorno.Values['totalRegistros'].AsType<Integer>;
         LRegistrosNovos          := LRetorno.Values['totalNovos'].AsType<Integer>;
         LRegistrosAtualizados    := LRetorno.Values['totalAtualizados'].AsType<Integer>;
         LRegistrosNaoAtualizados := LRetorno.Values['totalNaoAtualizados'].AsType<Integer>;


         LMensagem := 'Importação de dados finalizada com sucesso !' + chr(13) + chr(13) +
                      ' - Total de registros processados: ' + IntToStr(LRegistrosProcessados) + chr(13) +
                      ' - Total de registros novos: ' + IntToStr(LRegistrosNovos) + chr(13) +
                      ' - Total de registros atualizados: ' + IntToStr(LRegistrosAtualizados) + chr(13) +
                      ' - Total de registros não atualizados: ' + IntToStr(LRegistrosNaoAtualizados);
         InformationMessage(LMensagem ,C_TITULO_MENSAGENS);
      end else
         InformationMessage('Ocorreu um erro na tentativa de gravar os dados.',C_TITULO_MENSAGENS)
   finally
      FreeAndNil(frmMensagem);

   end;
end;

function TSrvImportacaoSiags.PosicaoColuna(const AColuna : String): integer;
var
   LColuna : String;
begin
   LColuna := UpperCase(AColuna);
   Result := 0;
   if LColuna = 'UF PRESTADOR' then
      Result := 2
   else if LColuna = 'TIPO AUTORIZACAO' then
      Result := 4
   else if LColuna = 'AUTORIZACAO' then
      Result := 5
   else if LColuna = 'TIPO ATENDIMENTO' then
      Result := 6
   else if LColuna = 'ANEXO OPME' then
      Result := 7
   else if LColuna = 'ANEXO QUIMIO' then
      Result := 8
   else if LColuna = 'ANEXO RADIO' then
      Result := 9
   else if LColuna = 'BENEFICIARIO' then
      Result := 11
   else if LColuna = 'NOME' then
      Result := 12
   else if LColuna = 'SITUACAOAUTORIZ' then
      Result := 22
   else if LColuna = 'ULT ANOTACAO ADM' then
      Result := 23
   else if LColuna = 'AUDITORIA' then
      Result := 26
   else if LColuna = 'DIAINCLUSAO' then
      Result := 37
   else if LColuna = 'DIASCORRIDOSABE' then
      Result := 40
   else if LColuna = 'DIASUTEISABE' then
      Result := 41
   else if LColuna = 'DIASPRAZOCAX' then
      Result := 48
   else if LColuna = 'DATAPRAZOCAX' then
      Result := 49
   else if LColuna = 'STATUSPZCAX' then
      Result := 56
   else if LColuna = 'DIASPRAZOANS' then
      Result := 58
   else if LColuna = 'DATAPRAZOANS' then
      Result := 59
   else if LColuna = 'STATUSPZANS' then
      Result := 60
   else
      InformationMessage('Coluna não reconhecida "' + LColuna + '"',C_TITULO_MENSAGENS);

end;

function TSrvImportacaoSiags.Validar(const ASheet : Variant) : Boolean;
var
   LMensagem : String;
begin
   Result := True;
   LMensagem := '';

   if (trim(ASheet.Cells[1, PosicaoColuna('UF PRESTADOR')].Value) <> 'UF PRESTADOR') then
      LMensagem := LMensagem + ColunaExcel(PosicaoColuna('UF PRESTADOR'))+' - UF PRESTADOR'+ chr(13);

   if (trim(ASheet.Cells[1, PosicaoColuna('TIPO AUTORIZACAO')].Value) <> 'TIPO AUTORIZACAO') then
      LMensagem := LMensagem + ColunaExcel(PosicaoColuna('TIPO AUTORIZACAO'))+' - TIPO AUTORIZACAO'+ chr(13);

   if (trim(ASheet.Cells[1, PosicaoColuna('AUTORIZACAO')].Value) <> 'AUTORIZACAO') then
      LMensagem := LMensagem + ColunaExcel(PosicaoColuna('AUTORIZACAO'))+' - AUTORIZACAO'+ chr(13);

   if (trim(ASheet.Cells[1, PosicaoColuna('TIPO ATENDIMENTO')].Value) <> 'TIPO ATENDIMENTO') then
      LMensagem := LMensagem + ColunaExcel(PosicaoColuna('TIPO ATENDIMENTO'))+' - TIPO ATENDIMENTO'+ chr(13);

   if (trim(ASheet.Cells[1, PosicaoColuna('ANEXO OPME')].Value) <> 'ANEXO OPME') then
      LMensagem := LMensagem + ColunaExcel(PosicaoColuna('ANEXO OPME'))+' - ANEXO OPME'+ chr(13);

   if (trim(ASheet.Cells[1,PosicaoColuna('ANEXO QUIMIO')].Value) <> 'ANEXO QUIMIO') then
      LMensagem := LMensagem + ColunaExcel(PosicaoColuna('ANEXO QUIMIO'))+' - ANEXO QUIMIO'+ chr(13);

   if (trim(ASheet.Cells[1,PosicaoColuna('ANEXO RADIO')].Value) <> 'ANEXO RADIO') then
      LMensagem := LMensagem + ColunaExcel(PosicaoColuna('ANEXO RADIO'))+' - ANEXO RADIO'+ chr(13);

   if (trim(ASheet.Cells[1,PosicaoColuna('BENEFICIARIO')].Value) <> 'BENEFICIARIO') then
      LMensagem := LMensagem + ColunaExcel(PosicaoColuna('BENEFICIARIO'))+' - BENEFICIARIO'+ chr(13);

   if (trim(ASheet.Cells[1,PosicaoColuna('NOME')].Value) <> 'NOME') then
      LMensagem := LMensagem + ColunaExcel(PosicaoColuna('NOME'))+' - NOME'+ chr(13);

   if (trim(ASheet.Cells[1,PosicaoColuna('SITUACAOAUTORIZ')].Value) <> 'SITUACAOAUTORIZ') then
      LMensagem := LMensagem + ColunaExcel(PosicaoColuna('SITUACAOAUTORIZ'))+' - SITUACAOAUTORIZ'+ chr(13);

   if (trim(ASheet.Cells[1,PosicaoColuna('ULT ANOTACAO ADM')].Value) <> 'ULT ANOTACAO ADM') then
      LMensagem := LMensagem + ColunaExcel(PosicaoColuna('ULT ANOTACAO ADM'))+' - ULT ANOTACAO ADM'+ chr(13);

   if (trim(ASheet.Cells[1,PosicaoColuna('AUDITORIA')].Value) <> 'AUDITORIA') then
      LMensagem := LMensagem + ColunaExcel(PosicaoColuna('AUDITORIA'))+' - AUDITORIA'+ chr(13);

   if (trim(ASheet.Cells[1,PosicaoColuna('DIAINCLUSAO')].Value) <> 'DIAINCLUSAO') then
      LMensagem := LMensagem + ColunaExcel(PosicaoColuna('DIAINCLUSAO'))+' - DIAINCLUSAO'+ chr(13);

   if (trim(ASheet.Cells[1,PosicaoColuna('DIASCORRIDOSABE')].Value) <> 'DIASCORRIDOSABE') then
      LMensagem := LMensagem + ColunaExcel(PosicaoColuna('DIASCORRIDOSABE'))+' - DIASCORRIDOSABE'+ chr(13);

   if (trim(ASheet.Cells[1,PosicaoColuna('DIASUTEISABE')].Value) <> 'DIASUTEISABE') then
      LMensagem := LMensagem + ColunaExcel(PosicaoColuna('DIASUTEISABE'))+' - DIASUTEISABE'+ chr(13);

   if (trim(ASheet.Cells[1,PosicaoColuna('DIASPRAZOCAX')].Value) <> 'DIASPRAZOCAX') then
      LMensagem := LMensagem + ColunaExcel(PosicaoColuna('DIASPRAZOCAX'))+' - DIASPRAZOCAX'+ chr(13);

   if (trim(ASheet.Cells[1,PosicaoColuna('DATAPRAZOCAX')].Value) <> 'DATAPRAZOCAX') then
      LMensagem := LMensagem + ColunaExcel(PosicaoColuna('DATAPRAZOCAX'))+' - DATAPRAZOCAX'+ chr(13);

   if (trim(ASheet.Cells[1,PosicaoColuna('STATUSPZCAX')].Value) <> 'STATUSPZCAX') then
      LMensagem := LMensagem + ColunaExcel(PosicaoColuna('STATUSPZCAX'))+' - STATUSPZCAX'+ chr(13);

   if (trim(ASheet.Cells[1,PosicaoColuna('DIASPRAZOANS')].Value) <> 'DIASPRAZOANS') then
      LMensagem := LMensagem + ColunaExcel(PosicaoColuna('DIASPRAZOANS'))+' - DIASPRAZOANS'+ chr(13);

   if (trim(ASheet.Cells[1,PosicaoColuna('DATAPRAZOANS')].Value) <> 'DATAPRAZOANS') then
      LMensagem := LMensagem + ColunaExcel(PosicaoColuna('DATAPRAZOANS'))+' - DATAPRAZOANS'+ chr(13);

   if (trim(ASheet.Cells[1,PosicaoColuna('STATUSPZANS')].Value) <> 'STATUSPZANS') then
      LMensagem := LMensagem + ColunaExcel(PosicaoColuna('STATUSPZANS'))+' - STATUSPZANS'+ chr(13);

   if LMensagem <> '' then
      begin
      Result := False;

      frmMensagem.close;

      LMensagem := 'A estrutura da planilha foi modificada. Não é possível prosseguir com a importação. ' + chr(13) + chr(13) +
                   'Coluna(s) não localizada(s):' + chr(13) + LMensagem;
      InformationMessage(LMensagem,C_TITULO_MENSAGENS);
   end;
end;

end.
