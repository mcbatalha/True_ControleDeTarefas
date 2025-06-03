unit Utils.TFuncoesJSON;

interface
Uses
   System.JSON,
   Data.DB;

type
   TFuncoesJSON = class

      public
         class function MontarJSON(ADataSet : TDataSet) : TJSONArray;
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

         Result.Add(LObject);
      end;
      ADataSet.Next;
   end;

   if LFechar then
      ADataSet.Close;
end;

end.
