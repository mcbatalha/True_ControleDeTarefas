unit Util.Menu;


interface

uses
   System.JSON,
   Vcl.Menus,
   Vcl.Buttons,
   Libs.TSeguranca,
   Forms.Principal,
   System.Generics.Collections;

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

      if (frmPrincipal.Components[i] is TSpeedButton) then
         begin
         if (frmPrincipal.Components[i] as TSpeedButton).Tag <> 1 then
           (frmPrincipal.Components[i] as TSpeedButton).Visible := False;
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
           1000 : frmPrincipal.mngCadastros.Visible          := True;
           1001 : frmPrincipal.mniCadastroSetores.Visible    := True;
           1002 : frmPrincipal.mniCadastroUsuarios.Visible   := True;
           1003 : frmPrincipal.mniCadastroStatusTrue.Visible := True;
           {$endRegion}

           {$Region 'Manutencao'}
           2000 : frmPrincipal.mngManutencaoSistema.Visible := True;
           2001 : frmPrincipal.mniSeguranca.Visible         := True;
           {$endRegion}

           {$Region 'Importação de Planilhas'}
           3000 : frmPrincipal.mngImportaoPlanilhas.Visible   := True;
           3001 : frmPrincipal.mniImportacaoAutoSC.Visible    := Seguranca.PodeAUTOSC;
           3002 : frmPrincipal.mniImportacaoSiags.Visible     := Seguranca.PodeSIAGS;
           3003 : frmPrincipal.mniImportacaoControlPc.Visible := Seguranca.PodeCONTROLPC;
           {$endRegion}

           {$Region 'Paineis'}
           4000 : frmPrincipal.mngPaineis.Visible                    := True;
           4001 : frmPrincipal.mniPainelAcompanhamento.Visible       := True;
           4002 : frmPrincipal.mniQuadroResumo.Visible               := True;
           4003 : frmPrincipal.mniPainelDesigancoesPendentes.Visible := True;
           {$endRegion}

           {$Region 'Listagens'}
           5000 : frmPrincipal.mngRelatorios.Visible           := True;
           5001 : frmPrincipal.mniRelatorioDesignacoes.Visible := True;
           5002 : frmPrincipal.mniRelatorioEncerramentos.Visible := True;
           {$endRegion}

           {$Region 'Exportação de Dados'}
           6000 : frmPrincipal.mngExportacaoDados.Visible     := True;
           6001 : frmPrincipal.mniExportacaoAutoSc.Visible    := Seguranca.PodeAUTOSC;
           6002 : frmPrincipal.mniExportacaoSiags.Visible     := Seguranca.PodeSIAGS;
           6003 : frmPrincipal.mniExportacaoControlPc.Visible := Seguranca.PodeCONTROLPC;
           6004 : frmPrincipal.mniExportacaoSetores.Visible   := True;
           6005 : frmPrincipal.mniExportacaoUsuarios.Visible  := True;
           {$endRegion}

        end;
     end;
   finally
     frmPrincipal.btnQuadroResumo.Visible         := frmPrincipal.mniQuadroResumo.Visible;
     frmPrincipal.btnDesignacoesPendentes.Visible := frmPrincipal.mniPainelDesigancoesPendentes.Visible;
     frmPrincipal.btnPainelAcompanhamento.Visible := frmPrincipal.mniPainelAcompanhamento.Visible;
     frmPrincipal.btnImportacaoControlPc.Visible  := frmPrincipal.mniImportacaoControlPc.Visible;
     frmPrincipal.btnImportacaoSiags.Visible      := frmPrincipal.mniImportacaoSiags.Visible;
     frmPrincipal.btnImportacaoAutoSc.Visible     := frmPrincipal.mniImportacaoAutoSC.Visible;
//      LItens.Free;
   end;
end;


end.
