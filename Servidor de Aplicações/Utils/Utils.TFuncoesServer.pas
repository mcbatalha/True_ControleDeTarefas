unit Utils.TFuncoesServer;

interface

uses
   System.SysUtils,
   FireDAC.Comp.Client,
   ServerMethods.Container;


type TFuncoesServer = class

    public
       class procedure RegistrarImportacao(const ATipo : String;
                                           const ADataHora : TDateTime;
                                           const AIdUsuario,
                                                 AQtdRegistros,
                                                 AQtdRegistrosNovos,
                                                 AQtdRegistrosAtualizados : Integer);

       class function EstadoParaSigla(const ANomeEstado: string): string;

end;


implementation
uses Funcoes;

{ TFuncoesServer }

class function TFuncoesServer.EstadoParaSigla(const ANomeEstado: string): string;
var
   LNome: string;
begin
   LNome := UpperCase(RemoverAcentos(Trim(ANomeEstado)));

   if LNome = 'ACRE' then Result := 'AC'
   else if LNome = 'ALAGOAS' then Result := 'AL'
   else if LNome = 'AMAPA' then Result := 'AP'
   else if LNome = 'AMAZONAS' then Result := 'AM'
   else if LNome = 'BAHIA' then Result := 'BA'
   else if LNome = 'CEARA' then Result := 'CE'
   else if LNome = 'DISTRITO FEDERAL' then Result := 'DF'
   else if LNome = 'ESPIRITO SANTO' then Result := 'ES'
   else if LNome = 'GOIAS' then Result := 'GO'
   else if LNome = 'MARANHAO' then Result := 'MA'
   else if LNome = 'MATO GROSSO' then Result := 'MT'
   else if LNome = 'MATO GROSSO DO SUL' then Result := 'MS'
   else if LNome = 'MINAS GERAIS' then Result := 'MG'
   else if LNome = 'PARA' then Result := 'PA'
   else if LNome = 'PARAIBA' then Result := 'PB'
   else if LNome = 'PARANA' then Result := 'PR'
   else if LNome = 'PERNAMBUCO' then Result := 'PE'
   else if LNome = 'PIAUI' then Result := 'PI'
   else if LNome = 'RIO DE JANEIRO' then Result := 'RJ'
   else if LNome = 'RIO GRANDE DO NORTE' then Result := 'RN'
   else if LNome = 'RIO GRANDE DO SUL' then Result := 'RS'
   else if LNome = 'RONDONIA' then Result := 'RO'
   else if LNome = 'RORAIMA' then Result := 'RR'
   else if LNome = 'SANTA CATARINA' then Result := 'SC'
   else if LNome = 'SAO PAULO' then Result := 'SP'
   else if LNome = 'SERGIPE' then Result := 'SE'
   else if LNome = 'TOCANTINS' then Result := 'TO'
   else
      Result := '';
end;


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
