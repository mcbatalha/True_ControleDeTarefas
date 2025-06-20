unit Util.Menu;


interface

uses
   System.JSON,
   Vcl.Menus,
   Libs.TSeguranca,
   Forms.Principal;

   procedure DesabilitarMenus;
   procedure HabilitarMenusDoUsuario(const AItensDeMenu : TJSONArray);


implementation


procedure DesabilitarMenus;
var
   i : integer;
begin
   for i:= 0 to frmPrincipal.ComponentCount - 1  do
      begin
      if (frmPrincipal.Components[i] is TMenuItem) then
         begin
         if (frmPrincipal.Components[i] as TMenuItem).Tag <> 1 then
           (frmPrincipal.Components[i] as TMenuItem).Visible := False;
      end;
   end;
end;



procedure HabilitarMenusDoUsuario(const AItensDeMenu : TJSONArray);
var
   LIemMenu : Integer;
   i        : Integer;
begin
   DesabilitarMenus;
   try
     for i := 0 to AItensDeMenu.Count - 1 do
        begin
        LIemMenu := AItensDeMenu.Items[i].AsType<Integer>;

        case LIemMenu of
           {$Region 'Cadastros'}
           1000 : frmPrincipal.mngCadastros.Visible := True;
           1001 : frmPrincipal.mniCadastroSetores.Visible := True;
           1002 : frmPrincipal.mniCadastroUsuarios.Visible := True;
           {$endRegion}

           {$Region 'Manutencao'}
           2000 : frmPrincipal.mngManutencaoSistema.Visible := True;
           2001 : frmPrincipal.mniSeguranca.Visible         := True;
           {$endRegion}

           {$Region 'Importação de Planilhas'}
           3000 : frmPrincipal.mngImportaoPlanilhas.Visible   := True;
           3001 : frmPrincipal.mniImportacaoAutoSC.Visible    := True;
           3002 : frmPrincipal.mniImportacaoSiags.Visible     := True;
           3003 : frmPrincipal.mniImportacaoControlPc.Visible := True;
           {$endRegion}

           {$Region 'Paineis'}
           4000 : frmPrincipal.mngPaineis.Visible              := True;
           4001 : frmPrincipal.mniPainelAcompanhamento.Visible := True;
           {$endRegion}

           {$Region 'Listagens'}
           5000 : frmPrincipal.mngRelatorios.Visible           := True;
           5001 : frmPrincipal.mniRelatorioDesignacoes.Visible := True;
           5002 : frmPrincipal.mniRelatorioEncerramentos.Visible := True;
           {$endRegion}
        end;
     end;
   finally
//      LItens.Free;
   end;
end;


end.
