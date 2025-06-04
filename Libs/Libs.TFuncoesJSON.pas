unit Libs.TFuncoesJSON;

interface
Uses
   System.JSON,
   System.SysUtils,
   Data.DB,
   Funcoes;

type
   TFuncoesJSON = class

      public
         class function MontarJSON(ADataSet : TDataSet) : TJSONArray;
         class function PopularTabela(ADataSet : TDataSet;
                        const AJSONArray : TJSONArray;
                        const ATodosTodas : String = '') :  TJSONArray;
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

   for I := 0 to AJSONArray.Count - 1  do
       begin
       LObjeto := AJSONArray.Items[I] as TJSONObject;

       ADataSet.Append;
       for J := 0 to LObjeto.Count - 1 do
          begin
          LRotulo := LObjeto.Pairs[J].JsonString.Value;
          if ADataSet.FieldByName(LRotulo) is TIntegerField then
             ADataSet.FieldByName(LRotulo).AsInteger := LObjeto.GetValue<Integer>(LRotulo)
          else if ADataSet.FieldByName(LRotulo) is TStringField then
             ADataSet.FieldByName(LRotulo).AsString := LObjeto.GetValue<String>(LRotulo)
          else if ADataSet.FieldByName(LRotulo) is TFloatField then
             ADataSet.FieldByName(LRotulo).AsFloat := StrToFloatDef(LObjeto.GetValue<String>(LRotulo),0)
          else if ADataSet.FieldByName(LRotulo) is TDateTimeField then
             begin
             LDate := LObjeto.GetValue<String>(LRotulo);

             if VerificarData(LDate) then
                ADataSet.FieldByName(LRotulo).AsDateTime := StrToDate(LDate);
          end;
       end;
       ADataSet.Post;
   end;
end;

end.
