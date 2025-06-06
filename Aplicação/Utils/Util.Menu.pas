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
        end;
     end;
   finally
//      LItens.Free;
   end;
end;


end.
