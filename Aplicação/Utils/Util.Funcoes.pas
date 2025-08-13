unit Util.Funcoes;

interface
uses
   System.SysUtils,
   Vcl.Graphics,
   Libs.Constantes;

type
   TCoresPrazo = record
       corDoFundo : TColor;
       corDaFonte : TColor;
   end;
   TFuncoes = class
      class function PrazoStatus(const AData : TDateTime) : String;
      class function PrazoCores(const AData : TDateTime) : TCoresPrazo;
   end;

implementation

{ TFuncoes }

class function TFuncoes.PrazoCores(const AData: TDateTime): TCoresPrazo;
var
  LPrazo : String;
begin
   LPrazo := TFuncoes.PrazoStatus(AData);
   if LPrazo = C_PRAZO_VENCIDO then
      begin
      Result.corDoFundo := clWhite;
      Result.corDaFonte := clRed;
   end else if LPrazo = C_PRAZO_VENCE_HOJE then
      begin
      Result.corDoFundo := clYellow;
      Result.corDaFonte := clBlack;
   end else if LPrazo = C_PRAZO_VENCE_AMANHA then
      begin
      Result.corDoFundo := $00EED7BD;
      Result.corDaFonte := clBlack;
   end else
      begin
      Result.corDoFundo := clWhite;
      Result.corDaFonte := clBlack;
   end;
end;

class function TFuncoes.PrazoStatus(const AData: TDateTime): String;
var
   LData : TDate;
begin
   LData := StrToDate(FormatDateTime('dd/MM/yyyy',AData));

   if  LData <  Date  then
      Result := C_PRAZO_VENCIDO
   else if LData = Date then
      Result := C_PRAZO_VENCE_HOJE
   else if LData = Date + 1then
      Result := C_PRAZO_VENCE_AMANHA
   else
      Result := C_PRAZO_FUTURO;
end;

end.
