unit Services.Importacao.AutoSc;

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
  Providers.Importacoes.AutoSc,
  Forms.Mensagem,
  Libs.TSeguranca;

type

  TSrvImportacaoAutoSc = class
  private
     Fdm            : TdtmImportacoesAutoSC;
     FPxyImportacao : TSMAutoSCClient;
     FDados         : TJSONArray;
     FTotalDeLinhas : integer;
     FJSonCarregado : Boolean;

     function PosicaoColuna(const AColuna : String): integer;

    const
       C_TITULO_MENSAGENS = 'Importação de Planilha AUTOSC';
  public
     constructor Create();
     function Validar(const ASheet : Variant; out AMensagem : String) : Boolean;
     function Analisar(ALblGauge : TLabel; AGauge : TGauge; const ASheet : Variant) : Boolean;
     function DadoDaColuna(const ASheet : Variant; const AColuna : String; const ALinha : integer) : String;
     function ImportarDados : Boolean;

     property TotalLinhas : integer read FTotalDeLinhas write FTotalDeLinhas;

     destructor Destroy(); override;

  end;

implementation
uses Forms.Importacoes.AutoSc;

{ TSrvImportacaoAutoAc }

function TSrvImportacaoAutoSc.Analisar(ALblGauge : TLabel; AGauge : TGauge; const ASheet : Variant) : Boolean;
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

      LColuna := 'AUDITORIA';
      LDado.AddPair(LColuna, TJSONString.Create(DadoDaColuna(ASheet, LColuna, i)));

      LColuna := 'PRAZOCAX';
      LDado.AddPair(LColuna, TJSONString.Create(DadoDaColuna(ASheet, LColuna, i)));

      LColuna := 'PRAZOCAXHJ';
      LDado.AddPair(LColuna, TJSONString.Create(DadoDaColuna(ASheet, LColuna, i)));

      LColuna := 'PROCESSO';
      LDado.AddPair(LColuna, TJSONNumber.Create(DadoDaColuna(ASheet, LColuna, i)));

      LColuna := 'STATUS';
      LDado.AddPair(LColuna, TJSONString.Create(DadoDaColuna(ASheet, LColuna, i)));

      LColuna := 'DATA ABERTURA';
      LDado.AddPair(LColuna, TJSONString.Create(DadoDaColuna(ASheet, LColuna, i)));

      LColuna := 'QTD ARQUIVOS';
      LDado.AddPair(LColuna, TJSONNumber.Create(DadoDaColuna(ASheet, LColuna, i)));

      LColuna := 'UF';
      LDado.AddPair(LColuna, TJSONString.Create(DadoDaColuna(ASheet, LColuna, i)));

      LColuna := 'TIPOPROCESSO';
      LDado.AddPair(LColuna, TJSONString.Create(DadoDaColuna(ASheet, LColuna, i)));

      LColuna := 'TIPOPROCESSOE';
      LAux := DadoDaColuna(ASheet, LColuna, i);
      LAux := copy(LAux, 6, Length(LAux));
      LDado.AddPair(LColuna, TJSONString.Create(LAux));

      LColuna := 'PRAZOANS';
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

constructor TSrvImportacaoAutoSc.Create;
begin
   Application.CreateForm(TdtmImportacoesAutoSC, Fdm);
   FPxyImportacao := TSMAutoSCClient.Create(Fdm.SQLConnection.DBXConnection);
end;


function TSrvImportacaoAutoSc.DadoDaColuna(const ASheet : Variant; const AColuna : String; const ALinha : integer) : String;
var
   LAux : String;
begin
   LAux := ASheet.Cells[ALinha,PosicaoColuna(AColuna)].Value;
   Result := Trim(RemoveAspas(LAux));
end;

destructor TSrvImportacaoAutoSc.Destroy;
begin
   FreeAndNil(FPxyImportacao);
   FreeAndNil(Fdm);

   if FJSonCarregado then
      FreeAndNil(FDados);

   inherited;
end;

function TSrvImportacaoAutoSc.ImportarDados: Boolean;
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

      FJSonCarregado := false;

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

function TSrvImportacaoAutoSc.PosicaoColuna(const AColuna : String): integer;
var
   LColuna : String;
begin
   LColuna := UpperCase(AColuna);
   Result := 0;
   if LColuna = 'AUDITORIA' then
      Result := 1
   else if LColuna = 'PRAZOCAX' then
      Result := 2
   else if LColuna = 'PRAZOCAXHJ' then
      Result := 3
   else if LColuna = 'PROCESSO' then
      Result := 4
   else if LColuna = 'STATUS' then
      Result := 6
   else if LColuna = 'DATA ABERTURA' then
      Result := 12
   else if LColuna = 'QTD ARQUIVOS' then
      Result := 14
   else if LColuna = 'UF' then
      Result := 16
   else if LColuna = 'TIPOPROCESSO' then
      Result := 18
   else if LColuna = 'TIPOPROCESSOE' then
      Result := 19
   else if LColuna = 'PRAZOANS' then
      Result := 51
   else
      InformationMessage('Coluna não reconhecida "' + LColuna + '"',C_TITULO_MENSAGENS);

end;

function TSrvImportacaoAutoSc.Validar(const ASheet : Variant; out AMensagem : String) : Boolean;
begin
   Result := True;
   AMensagem := '';

   if (trim(ASheet.Cells[1, PosicaoColuna('AUDITORIA')].Value) <> 'AUDITORIA') then
      AMensagem := AMensagem + ColunaExcel(PosicaoColuna('AUDITORIA'))+' - AUDITORIA'+ chr(13);

   if (trim(ASheet.Cells[1, 2].Value) <> 'PRAZOCAX') then
      AMensagem := AMensagem + ColunaExcel(PosicaoColuna('PRAZOCAX'))+' - PRAZOCAX'+ chr(13);

   if (trim(ASheet.Cells[1, 3].Value) <> 'PRAZOCAXHJ') then
      AMensagem := AMensagem + ColunaExcel(PosicaoColuna('PRAZOCAXHJ'))+' - PRAZOCAXHJ'+ chr(13);

   if (trim(ASheet.Cells[1, 4].Value) <> 'PROCESSO') then
      AMensagem := AMensagem + ColunaExcel(PosicaoColuna('PROCESSO'))+' - PROCESSO'+ chr(13);

   if (trim(ASheet.Cells[1, 6].Value) <> 'STATUS') then
      AMensagem := AMensagem + ColunaExcel(PosicaoColuna('STATUS'))+' - STATUS'+ chr(13);

   if (trim(ASheet.Cells[1,12].Value) <> 'DATA ABERTURA') then
      AMensagem := AMensagem + ColunaExcel(PosicaoColuna('DATA ABERTURA'))+' - DATA ABERTURA'+ chr(13);

   if (trim(ASheet.Cells[1,14].Value) <> 'QTD ARQUIVOS') then
      AMensagem := AMensagem + ColunaExcel(PosicaoColuna('QTD ARQUIVOS'))+' - QTD ARQUIVOS'+ chr(13);

   if (trim(ASheet.Cells[1,16].Value) <> 'UF') then
      AMensagem := AMensagem + ColunaExcel(PosicaoColuna('UF'))+' - UF'+ chr(13);

   if (trim(ASheet.Cells[1,18].Value) <> 'TIPOPROCESSO') then
      AMensagem := AMensagem + ColunaExcel(PosicaoColuna('TIPOPROCESSO'))+' - TIPOPROCESSO'+ chr(13);

   if (trim(ASheet.Cells[1,19].Value) <> 'TIPOPROCESSOE') then
      AMensagem := AMensagem + ColunaExcel(PosicaoColuna('TIPOPROCESSOE'))+' - TIPOPROCESSOE'+ chr(13);

   if (trim(ASheet.Cells[1,51].Value) <> 'PRAZOANS') then
      AMensagem := AMensagem + ColunaExcel(PosicaoColuna('PRAZOANS'))+' - PRAZOANS'+ chr(13);
   if AMensagem <> '' then
      begin
      Result := False;

      AMensagem := 'A estrutura da planilha foi modificada. Não é possível prosseguir com a importação. ' + chr(13) + chr(13) +
                   'Coluna(s) não localizada(s):' + chr(13) + AMensagem;
   end;
end;

end.
