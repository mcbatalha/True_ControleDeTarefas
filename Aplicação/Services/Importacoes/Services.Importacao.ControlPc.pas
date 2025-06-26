unit Services.Importacao.ControlPc;

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
  Providers.Importacoes.ControlPc,
  Forms.Mensagem,
  Libs.TSeguranca;

type

  TSrvImportacaoControlPc = class
  private
     Fdm            : TdtmImportacoesControlPc;
     FPxyImportacao : TSMControlPcClient;
     FDados         : TJSONArray;
     FTotalDeLinhas : integer;
     FJSonCarregado : Boolean;

     function PosicaoColuna(const AColuna : String): integer;

    const
       C_TITULO_MENSAGENS = 'Importa��o de Planilha ControlPc';
  public
     constructor Create();
     function Validar(const ASheet : Variant; out AMensagem : String) : Boolean;
     function Analisar(ALblGauge : TLabel; AGauge : TGauge; const ASheet : Variant) : Boolean;
     function DadoDaColuna(const ASheet : Variant; const AColuna : String; const ALinha : integer) : String;
     function ImportarDados : Boolean;

     function getFDados         : TJSONArray;

     property TotalLinhas : integer read FTotalDeLinhas write FTotalDeLinhas;


     destructor Destroy(); override;

  end;

implementation
uses Forms.Importacoes.ControlPc;

{ TSrvImportacaoControlPc }

function TSrvImportacaoControlPc.Analisar(ALblGauge : TLabel; AGauge : TGauge; const ASheet : Variant) : Boolean;
var
   i       : integer;
   LDado   : TJSONObject;
   LColuna : String;
   LAux    : String;

begin
   Result := False;
   FDados := TJSONArray.create;
   AGauge.MaxValue := FTotalDeLinhas;

   for I := 4 to FTotalDeLinhas + 1 do
      begin
      LDado := TJSONObject.Create;

      LColuna := 'PROTOCOLO';
      LDado.AddPair(LColuna, TJSONString.Create(DadoDaColuna(ASheet, LColuna, i)));

      LColuna := 'STATUS';
      LDado.AddPair(LColuna, TJSONString.Create(DadoDaColuna(ASheet, LColuna, i)));

      LColuna := 'DT. ABERTURA';
      LDado.AddPair(LColuna, TJSONString.Create(DadoDaColuna(ASheet, LColuna, i)));

      LColuna := 'DT. TRANSFER�NCIA';
      LDado.AddPair(LColuna, TJSONString.Create(DadoDaColuna(ASheet, LColuna, i)));

      LColuna := 'DT. FECHAMENTO';
      LDado.AddPair(LColuna, TJSONString.Create(DadoDaColuna(ASheet, LColuna, i)));

      LColuna := 'PREVIS�O SOLU��O';
      LDado.AddPair(LColuna, TJSONString.Create(DadoDaColuna(ASheet, LColuna, i)));

      LColuna := 'PRAZO';
      LDado.AddPair(LColuna, TJSONString.Create(DadoDaColuna(ASheet, LColuna, i)));

      LColuna := 'T�CNICO';
      LAux    := DadoDaColuna(ASheet, LColuna, i);
      if copy(LAux,1,7) = 'TRUE - ' then
         LAux := copy(LAux,8,100);
      LDado.AddPair(LColuna, LAux);

      LColuna := 'TIPO CLIENTE';
      LDado.AddPair(LColuna, TJSONString.Create(DadoDaColuna(ASheet, LColuna, i)));

      LColuna := 'CLASSIFICA��O';
      LDado.AddPair(LColuna, TJSONString.Create(DadoDaColuna(ASheet, LColuna, i)));

      LColuna := 'SOLICITA��O DO CLIENTE';
      LDado.AddPair(LColuna, TJSONString.Create(DadoDaColuna(ASheet, LColuna, i)));

      LColuna := 'TIPO RECLAME';
      LAux    := DadoDaColuna(ASheet, LColuna, i);
      if LAux = '' then
         LAux := C_NAO;
      LDado.AddPair(LColuna, TJSONString.Create(LAux));

      LColuna := 'TIPO NIP/JUDICIAL';
      LAux    := DadoDaColuna(ASheet, LColuna, i);
      if LAux = '' then
         LAux := C_NAO;
      LDado.AddPair(LColuna, TJSONString.Create(LAux));

      FDados.Add(LDado);
      AGauge.Progress := AGauge.Progress + 1;
      ALblGauge.caption := 'Analisando ' + inttostr(i-1) + ' de ' + inttostr(FTotalDeLinhas);
      Application.ProcessMessages;
   end;

   ALblGauge.caption := 'Analisados ' + inttostr(FTotalDeLinhas) + ' de ' + inttostr(FTotalDeLinhas);

   InformationMessage('An�lise finalizada', C_TITULO_MENSAGENS);
   Result          := True;
   FJSonCarregado  := Result;
   AGauge.Progress := 0;

//   Result := Trim(RemoveAspas(FColunas[PosicaoColuna(AColuna)])));
end;

constructor TSrvImportacaoControlPc.Create;
begin
   Application.CreateForm(TdtmImportacoesControlPc, Fdm);
   FPxyImportacao := TSMControlPcClient.Create(Fdm.SQLConnection.DBXConnection);
end;


function TSrvImportacaoControlPc.DadoDaColuna(const ASheet : Variant; const AColuna : String; const ALinha : integer) : String;
var
   LAux : String;
begin
   LAux := ASheet.Cells[ALinha,PosicaoColuna(AColuna)].Value;
   Result := Trim(RemoveAspas(LAux));
end;

destructor TSrvImportacaoControlPc.Destroy;
begin
   FreeAndNil(FPxyImportacao);
   FreeAndNil(Fdm);

   if FJSonCarregado then
      FreeAndNil(FDados);

   inherited;
end;

function TSrvImportacaoControlPc.getFDados: TJSONArray;
begin
   Result := FDados;
end;

function TSrvImportacaoControlPc.ImportarDados: Boolean;
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
      frmMensagem.btnMensagem.Caption := 'Aguarde, efetivando importa��o';
      frmMensagem.GaugeVisible(False);
      frmMensagem.Show;
      frmMensagem.Refresh;
      Application.ProcessMessages;
      LRetorno := FPxyImportacao.Importar(FDados, Seguranca.id);
      frmMensagem.Close;

      Result   := LRetorno.Values['importou'].AsType<Boolean>;

      FJSonCarregado := False;

      if Result then
         begin
         LRegistrosProcessados    := LRetorno.Values['totalRegistros'].AsType<Integer>;
         LRegistrosNovos          := LRetorno.Values['totalNovos'].AsType<Integer>;
         LRegistrosAtualizados    := LRetorno.Values['totalAtualizados'].AsType<Integer>;
         LRegistrosNaoAtualizados := LRetorno.Values['totalNaoAtualizados'].AsType<Integer>;


         LMensagem := 'Importa��o de dados finalizada com sucesso !' + chr(13) + chr(13) +
                      ' - Total de registros processados: ' + IntToStr(LRegistrosProcessados) + chr(13) +
                      ' - Total de registros novos: ' + IntToStr(LRegistrosNovos) + chr(13) +
                      ' - Total de registros atualizados: ' + IntToStr(LRegistrosAtualizados) + chr(13) +
                      ' - Total de registros n�o atualizados: ' + IntToStr(LRegistrosNaoAtualizados);
         InformationMessage(LMensagem ,C_TITULO_MENSAGENS);
      end else
         InformationMessage('Ocorreu um erro na tentativa de gravar os dados.',C_TITULO_MENSAGENS)
   finally
      FreeAndNil(frmMensagem);

   end;
end;

function TSrvImportacaoControlPc.PosicaoColuna(const AColuna : String): integer;
var
   LColuna : String;
begin

   LColuna := UpperCase(AColuna);
   Result := 0;
   if LColuna = 'PROTOCOLO' then
      Result := 1
   else if LColuna = 'STATUS' then
      Result := 2
   else if LColuna = 'DT. ABERTURA' then
      Result := 4
   else if LColuna = 'DT. TRANSFER�NCIA' then
      Result := 6
   else if LColuna = 'DT. FECHAMENTO' then
      Result := 7
   else if LColuna = 'PREVIS�O SOLU��O' then
      Result := 8
   else if LColuna = 'PRAZO' then
      Result := 9
   else if LColuna = 'T�CNICO' then
      Result := 10
   else if LColuna = 'TIPO CLIENTE' then
      Result := 15
   else if LColuna = 'CLASSIFICA��O' then
      Result := 20
   else if LColuna = 'SOLICITA��O DO CLIENTE' then
      Result := 21
   else if LColuna = 'TIPO RECLAME' then
      Result := 23
   else if LColuna = 'TIPO NIP/JUDICIAL' then
      Result := 26
   else
      InformationMessage('Coluna n�o reconhecida "' + LColuna + '"',C_TITULO_MENSAGENS);

end;

function TSrvImportacaoControlPc.Validar(const ASheet : Variant; out AMensagem : String) : Boolean;
begin
   Result := True;
   AMensagem := '';

   if (trim(ASheet.Cells[3, PosicaoColuna('PROTOCOLO')].Value) <> 'PROTOCOLO') then
      begin
      InformationMessage(ASheet.Cells[3, PosicaoColuna('PROTOCOLO')].Value,'');
      AMensagem := AMensagem + ColunaExcel(PosicaoColuna('PROTOCOLO'))+' - PROTOCOLO'+ chr(13);
   end;

   if (trim(ASheet.Cells[3, PosicaoColuna('STATUS')].Value) <> 'STATUS') then
      AMensagem := AMensagem + ColunaExcel(PosicaoColuna('STATUS'))+' - STATUS'+ chr(13);

   if (trim(ASheet.Cells[3, PosicaoColuna('DT. ABERTURA')].Value) <> 'DT. ABERTURA') then
      AMensagem := AMensagem + ColunaExcel(PosicaoColuna('DT. ABERTURA'))+' - DT. ABERTURA'+ chr(13);

   if (trim(ASheet.Cells[3, PosicaoColuna('DT. TRANSFER�NCIA')].Value) <> 'DT. TRANSFER�NCIA') then
      AMensagem := AMensagem + ColunaExcel(PosicaoColuna('DT. TRANSFER�NCIA'))+' - DT. TRANSFER�NCIA'+ chr(13);

   if (trim(ASheet.Cells[3, PosicaoColuna('DT. FECHAMENTO')].Value) <> 'DT. FECHAMENTO') then
      AMensagem := AMensagem + ColunaExcel(PosicaoColuna('DT. FECHAMENTO'))+' - DT. FECHAMENTO'+ chr(13);

   if (trim(ASheet.Cells[3, PosicaoColuna('PREVIS�O SOLU��O')].Value) <> 'PREVIS�O SOLU��O') then
      AMensagem := AMensagem + ColunaExcel(PosicaoColuna('PREVIS�O SOLU��O'))+' - PREVIS�O SOLU��O'+ chr(13);

   if (trim(ASheet.Cells[3, PosicaoColuna('PRAZO')].Value) <> 'PRAZO') then
      AMensagem := AMensagem + ColunaExcel(PosicaoColuna('PRAZO'))+' - PRAZO'+ chr(13);

   if (trim(ASheet.Cells[3, PosicaoColuna('T�CNICO')].Value) <> 'T�CNICO') then
      AMensagem := AMensagem + ColunaExcel(PosicaoColuna('T�CNICO'))+' - T�CNICO'+ chr(13);

   if (trim(ASheet.Cells[3, PosicaoColuna('TIPO CLIENTE')].Value) <> 'TIPO CLIENTE') then
      AMensagem := AMensagem + ColunaExcel(PosicaoColuna('TIPO CLIENTE'))+' - TIPO CLIENTE'+ chr(13);

   if (trim(ASheet.Cells[3, PosicaoColuna('CLASSIFICA��O')].Value) <> 'CLASSIFICA��O') then
      AMensagem := AMensagem + ColunaExcel(PosicaoColuna('CLASSIFICA��O'))+' - CLASSIFICA��O'+ chr(13);

   if (trim(ASheet.Cells[3, PosicaoColuna('SOLICITA��O DO CLIENTE')].Value) <> 'SOLICITA��O DO CLIENTE') then
      AMensagem := AMensagem + ColunaExcel(PosicaoColuna('SOLICITA��O DO CLIENTE'))+' - SOLICITA��O DO CLIENTE'+ chr(13);

   if (trim(ASheet.Cells[3, PosicaoColuna('TIPO RECLAME')].Value) <> 'TIPO RECLAME') then
      AMensagem := AMensagem + ColunaExcel(PosicaoColuna('TIPO RECLAME'))+' - TIPO RECLAME'+ chr(13);

   if (trim(ASheet.Cells[3, PosicaoColuna('TIPO NIP/JUDICIAL')].Value) <> 'TIPO NIP/JUDICIAL') then
      AMensagem := AMensagem + ColunaExcel(PosicaoColuna('TIPO NIP/JUDICIAL'))+' - TIPO NIP/JUDICIAL'+ chr(13);

   if AMensagem <> '' then
      begin
      Result := False;

      AMensagem := 'A estrutura da planilha foi modificada. N�o � poss�vel prosseguir com a importa��o. ' + chr(13) + chr(13) +
                   'Coluna(s) n�o localizada(s):' + chr(13) + AMensagem;
   end;
end;

end.
