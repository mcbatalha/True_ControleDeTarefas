unit Libs.TFuncoesJSON;

interface
Uses
   System.JSON,
   System.SysUtils,
   System.Classes,

   Data.DB,
   Funcoes;

type
   TFuncoesJSON = class
  private

      public
         class function MontarJSON(ADataSet : TDataSet) : TJSONArray;
         class function PopularTabela(
                        ADataSet : TDataSet;
                        const AJSONArray : TJSONArray;
                        const ATodosTodas : String = '') :  TJSONArray; overload;

         class function PopularTabela(
                        ADataSet : TDataSet;
                        const AStringList : TStringList;
                        const ATodosTodas : String = '') :  TJSONArray; overload;

         class function UF : TJSONArray;
   end;


implementation

{ TFuncoesJSON }

class function TFuncoesJSON.MontarJSON(ADataSet: TDataSet): TJSONArray;
var
   LObject : TJSONObject;
   LFechar : Boolean;
   I       : Integer;
begin
   Result := TJSONArray.Create;

   LFechar := ADataSet.State = dsInactive;
   if LFechar then
      ADataSet.Open;

   ADataSet.First;
   while not ADataSet.Eof do
      begin
      LObject := TJSONObject.Create;

      for I := 0 to ADataSet.FieldCount -1 do
         begin
         if (ADataSet.Fields[i] is TNumericField) or (ADataSet.Fields[i] is TAutoIncField)  then
            LObject.AddPair(ADataSet.Fields[i].FieldName, TJSONNumber.Create(ADataSet.Fields[i].AsInteger))
         else if (ADataSet.Fields[i] is TFloatField) then
            LObject.AddPair(ADataSet.Fields[i].FieldName, TJSONNumber.Create(ADataSet.Fields[i].AsFloat))
         else if (ADataSet.Fields[i] is TStringField) or (ADataSet.Fields[i] is TDateTimeField) then
            LObject.AddPair(ADataSet.Fields[i].FieldName, TJSONString.Create(ADataSet.Fields[i].AsString));
      end;
      Result.Add(LObject);
      ADataSet.Next;
   end;

   if LFechar then
      ADataSet.Close;
end;

class function TFuncoesJSON.PopularTabela(
   ADataSet: TDataSet;
   const AJSONArray : TJSONArray;
   const ATodosTodas : String = ''): TJSONArray;
var
   LObjeto : TJSONObject;
   I       : Integer;
   J       : Integer;

   LRotulo : String;
   LDate   : String;
begin
   if ADataSet.State = dsInactive then
      ADataSet.open;

   ADataSet.DisableControls;
   try
      for I := 0 to AJSONArray.Count - 1  do
          begin
          LObjeto := AJSONArray.Items[I] as TJSONObject;

          ADataSet.Append;
          for J := 0 to LObjeto.Count - 1 do
             begin
             LRotulo := LObjeto.Pairs[J].JsonString.Value;
             if Assigned(ADataSet.FindField(LRotulo)) then
                begin
                if ADataSet.FieldByName(LRotulo) is TIntegerField then
                   ADataSet.FieldByName(LRotulo).AsInteger := LObjeto.GetValue<Integer>(LRotulo)
                else if ADataSet.FieldByName(LRotulo) is TLargeintField then
                   ADataSet.FieldByName(LRotulo).AsInteger := LObjeto.GetValue<Integer>(LRotulo)
                else if ADataSet.FieldByName(LRotulo) is TStringField then
                   ADataSet.FieldByName(LRotulo).AsString := LObjeto.GetValue<String>(LRotulo)
                else if ADataSet.FieldByName(LRotulo) is TFloatField then
                   ADataSet.FieldByName(LRotulo).AsFloat := StrToFloatDef(LObjeto.GetValue<String>(LRotulo),0)
                else if ADataSet.FieldByName(LRotulo) is TDateTimeField then
                   begin
                   LDate := LObjeto.GetValue<String>(LRotulo);

                   if Length(LDate) = 10 then
                      begin
                      if VerificarData(LDate) then
                         ADataSet.FieldByName(LRotulo).AsDateTime := StrToDate(LDate);
                   end else if Length(LDate) = 19 then
                      begin
                      if VerificarDataHora(LDate) then
                         ADataSet.FieldByName(LRotulo).AsDateTime := StrToDateTime(LDate);
                   end
                end;
             end;
          end;
          ADataSet.Post;
      end;
   finally
      ADataSet.First;
      ADataSet.EnableControls;
   end;
end;



class function TFuncoesJSON.PopularTabela(ADataSet: TDataSet; const AStringList: TStringList; const ATodosTodas: String): TJSONArray;
var
   I: Integer;
begin
   if ADataSet.State = dsInactive then
      ADataSet.Open;

   for I := 0 to AStringList.Count -1 do
      begin
      ADataSet.Append;
      ADataSet.Fields[0].Value := AStringList[I];
      ADataSet.Post;
   end;

   FreeAndNil(AStringList);
end;

class function TFuncoesJSON.UF: TJSONArray;
var
   LObjeto : TJSONObject;
begin
   Result := TJSONArray.Create;

   LObjeto.Create;
   LObjeto.AddPair('sigla','AC');
   LObjeto.AddPair('sigla','AL');
   LObjeto.AddPair('sigla','AM');
   LObjeto.AddPair('sigla','AP');
   LObjeto.AddPair('sigla','BA');
   LObjeto.AddPair('sigla','CE');
   LObjeto.AddPair('sigla','DF');
   LObjeto.AddPair('sigla','ES');
   LObjeto.AddPair('sigla','GO');
   LObjeto.AddPair('sigla','MA');
   LObjeto.AddPair('sigla','MG');
   LObjeto.AddPair('sigla','MS');
   LObjeto.AddPair('sigla','MT');
   LObjeto.AddPair('sigla','PA');
   LObjeto.AddPair('sigla','PB');
   LObjeto.AddPair('sigla','PE');
   LObjeto.AddPair('sigla','PI');
   LObjeto.AddPair('sigla','PR');
   LObjeto.AddPair('sigla','RJ');
   LObjeto.AddPair('sigla','RN');
   LObjeto.AddPair('sigla','RO');
   LObjeto.AddPair('sigla','RR');
   LObjeto.AddPair('sigla','RS');
   LObjeto.AddPair('sigla','SC');
   LObjeto.AddPair('sigla','SE');
   LObjeto.AddPair('sigla','SP');
   LObjeto.AddPair('sigla','TO');

   Result.Add(LObjeto);

end;

end.
