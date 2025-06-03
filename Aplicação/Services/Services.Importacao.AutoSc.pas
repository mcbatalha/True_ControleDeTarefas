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

  TSrvImportacaoAutoAc = class
  private
     Fdm            : TdtmImportacoesAutoSC;
     FPxyImportacao : TSMImportacaoAutoSCClient;
     FDados         : TJSONArray;
     FTotalDeLinhas : integer;


     function PosicaoColuna(const AColuna : String): integer;

    const
       C_TITULO_MENSAGENS = 'Importação de Planilha AUTOSC';
  public
     constructor Create();
     function Validar(const ASheet : Variant) : Boolean;
     function Analisar(ALblGauge : TLabel; AGauge : TGauge; const ASheet : Variant) : Boolean;
     function DadoDaColuna(const ASheet : Variant; const AColuna : String; const ALinha : integer) : String;

     function ImportarDados : Boolean;

     property TotalLinhas : integer read FTotalDeLinhas write FTotalDeLinhas;

     destructor Destroy(); override;

  end;

implementation
uses Forms.Importacoes.AutoSc;

{ TSrvImportacaoAutoAc }

function TSrvImportacaoAutoAc.Analisar(ALblGauge : TLabel; AGauge : TGauge; const ASheet : Variant) : Boolean;
var
   i       : integer;
   LDado   : TJSONObject;
   LColuna : String;
   LAux    : String;

   j : integer;

begin
   Result := False;
   FDados := TJSONArray.create;
   AGauge.MaxValue := FTotalDeLinhas;

   j := 1;
   for I := 2 to FTotalDeLinhas + 1 do
      begin

      if i = 2 then
         begin
         LAux    := DadoDaColuna(ASheet, 'PROCESSO',i);
         InformationMessage(LAux,C_TITULO_MENSAGENS);
      end else if i = FTotalDeLinhas then
         begin
         LAux    := DadoDaColuna(ASheet, 'PROCESSO',i);
         InformationMessage(LAux,C_TITULO_MENSAGENS);
      end;

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

      LAux    := DadoDaColuna(ASheet, 'PROCESSO',i);

      FDados.Add(LDado);
      AGauge.Progress := AGauge.Progress + 1;
      ALblGauge.caption := 'Analisando ' + inttostr(i) + ' de ' + inttostr(FTotalDeLinhas);
      Application.ProcessMessages;

      inc(j);
   end;

   InformationMessage(LAux,C_TITULO_MENSAGENS);

   InformationMessage('Análise finalizada', C_TITULO_MENSAGENS);
   Result          := True;
   AGauge.Progress := 0;

//   Result := Trim(RemoveAspas(FColunas[PosicaoColuna(AColuna)])));
end;

constructor TSrvImportacaoAutoAc.Create;
begin
   Application.CreateForm(TdtmImportacoesAutoSC, Fdm);
   FPxyImportacao := TSMImportacaoAutoSCClient.Create(Fdm.SQLConnection.DBXConnection);
end;


function TSrvImportacaoAutoAc.DadoDaColuna(const ASheet : Variant; const AColuna : String; const ALinha : integer) : String;
var
   LAux : String;
begin
   LAux := ASheet.Cells[ALinha,PosicaoColuna(AColuna)].Value;
   Result := Trim(RemoveAspas(LAux));
end;

destructor TSrvImportacaoAutoAc.Destroy;
begin
   FreeAndNil(FPxyImportacao);
   FreeAndNil(Fdm);

   inherited;
end;

function TSrvImportacaoAutoAc.ImportarDados: Boolean;
var
   LRetorno  : TJSONObject;
   LImportou : Boolean;
   LMensagem : String;

   LRegistrosProcessados    : integer;
   LRegistrosNovos          : integer;
   LRegistrosAtualizados    : integer;
   LRegistrosNaoAtualizados : integer;
begin

   frmMensagem.btnMensagem.Caption := 'Aguarde, efetivando importação';
   frmMensagem.Refresh;
   Application.ProcessMessages;
   LRetorno := FPxyImportacao.Importar(FDados, Seguranca.id);
   frmMensagem.Close;

   Result   := LRetorno.Values['importou'].AsType<Boolean>;

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
end;

function TSrvImportacaoAutoAc.PosicaoColuna(const AColuna : String): integer;
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

function TSrvImportacaoAutoAc.Validar(const ASheet : Variant) : Boolean;
var
   LMensagem : String;
begin
   Result := True;
   LMensagem := '';

   if (trim(ASheet.Cells[1, PosicaoColuna('AUDITORIA')].Value) <> 'AUDITORIA') then
      LMensagem := LMensagem + ColunaExcel(PosicaoColuna('AUDITORIA'))+' - AUDITORIA'+ chr(13);

   if (trim(ASheet.Cells[1, 2].Value) <> 'PRAZOCAX') then
      LMensagem := LMensagem + ColunaExcel(PosicaoColuna('PRAZOCAX'))+' - PRAZOCAX'+ chr(13);

   if (trim(ASheet.Cells[1, 3].Value) <> 'PRAZOCAXHJ') then
      LMensagem := LMensagem + ColunaExcel(PosicaoColuna('PRAZOCAXHJ'))+' - PRAZOCAXHJ'+ chr(13);

   if (trim(ASheet.Cells[1, 4].Value) <> 'PROCESSO') then
      LMensagem := LMensagem + ColunaExcel(PosicaoColuna('PROCESSO'))+' - PROCESSO'+ chr(13);

   if (trim(ASheet.Cells[1, 6].Value) <> 'STATUS') then
      LMensagem := LMensagem + ColunaExcel(PosicaoColuna('STATUS'))+' - STATUS'+ chr(13);

   if (trim(ASheet.Cells[1,12].Value) <> 'DATA ABERTURA') then
      LMensagem := LMensagem + ColunaExcel(PosicaoColuna('DATA ABERTURA'))+' - DATA ABERTURA'+ chr(13);

   if (trim(ASheet.Cells[1,14].Value) <> 'QTD ARQUIVOS') then
      LMensagem := LMensagem + ColunaExcel(PosicaoColuna('QTD ARQUIVOS'))+' - QTD ARQUIVOS'+ chr(13);

   if (trim(ASheet.Cells[1,16].Value) <> 'UF') then
      LMensagem := LMensagem + ColunaExcel(PosicaoColuna('UF'))+' - UF'+ chr(13);

   if (trim(ASheet.Cells[1,18].Value) <> 'TIPOPROCESSO') then
      LMensagem := LMensagem + ColunaExcel(PosicaoColuna('TIPOPROCESSO'))+' - TIPOPROCESSO'+ chr(13);

   if (trim(ASheet.Cells[1,19].Value) <> 'TIPOPROCESSOE') then
      LMensagem := LMensagem + ColunaExcel(PosicaoColuna('TIPOPROCESSOE'))+' - TIPOPROCESSOE'+ chr(13);

   if (trim(ASheet.Cells[1,51].Value) <> 'PRAZOANS') then
      LMensagem := LMensagem + ColunaExcel(PosicaoColuna('PRAZOANS'))+' - PRAZOANS'+ chr(13);
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
