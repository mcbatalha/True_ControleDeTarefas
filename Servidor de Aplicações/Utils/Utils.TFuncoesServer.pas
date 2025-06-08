unit Utils.TFuncoesServer;

interface

uses System.SysUtils, FireDAC.Comp.Client, ServerMethods.Container;


type TFuncoesServer = class
    class procedure RegistrarImportacao(const ATipo : String;
                                        const ADataHora : TDateTime;
                                        const AIdUsuario,
                                              AQtdRegistros,
                                              AQtdRegistrosNovos,
                                              AQtdRegistrosAtualizados : Integer);

end;


implementation

{ TFuncoesServer }

class procedure TFuncoesServer.RegistrarImportacao(
    const ATipo:
    String; const ADataHora: TDateTime;
    const AIdUsuario, AQtdRegistros, AQtdRegistrosNovos, AQtdRegistrosAtualizados: Integer);
var LQuery : TFDQuery;
begin
   try
      try
         LQuery := TFDQuery.Create(nil);
         LQuery.Connection := ServerContainer.FDConnection;

         LQuery.SQL.Clear;
         LQuery.SQL.Add('INSERT INTO Historico_Importacoes');
         LQuery.SQL.Add('   (id_Usuario, Tipo, Data_Hora, ');
         LQuery.SQL.Add('     Qtd_Registros, Qtd_Registros_Novos, Qtd_Registros_Atualizados)   ');
         LQuery.SQL.Add('Values ');
         LQuery.SQL.Add('   (:pIdUsuario, :pTipo, :pDataHora, ');
         LQuery.SQL.Add('    :pQtd_Registros, :pQtd_Registros_Novos, :pQtd_Registros_Atualizados)');


         LQuery.ParamByName('pIdUsuario').AsInteger                 := AIdUsuario;
         LQuery.ParamByName('pTipo').AsString                       := ATipo;
         LQuery.ParamByName('pDataHora').AsDateTime                 := ADataHora;
         LQuery.ParamByName('pQtd_Registros').AsInteger             := AQtdRegistros;
         LQuery.ParamByName('pQtd_Registros_Novos').AsInteger        := AQtdRegistrosNovos;
         LQuery.ParamByName('pQtd_Registros_Atualizados').AsInteger := AQtdRegistrosAtualizados;
         LQuery.ExecSQL;
      except
         raise;
      end;
   finally
      FreeAndNil(LQuery);
   end;

end;

end.
