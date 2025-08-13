unit Frames.Pesquisa.Usuario;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Data.DB, Vcl.DBCtrls;

type
  TfraPesquisaUsuario = class(TFrame)
    dtsUsuarios: TDataSource;
    Label9: TLabel;
    btnPesquisarUsuario: TSpeedButton;
    cmbUsuarios: TDBLookupComboBox;
  private
  public
     function getIdUsuario   : integer;
     function getNomeUsuario : string;
     procedure setIdUsuario(const AIdUsuario : integer; const ADesignacao : Boolean = False);
     procedure setDataSet(const ADataSet : TDataSet);
  end;

implementation
uses
  Libs.TSeguranca, Libs.Constantes;


{$R *.dfm}

{ TfraPesquisaUsuario }

function TfraPesquisaUsuario.getIdUsuario: integer;
begin
   Result := cmbUsuarios.KeyValue;
end;

function TfraPesquisaUsuario.getNomeUsuario: string;
begin
   Result := cmbUsuarios.Text;
end;

procedure TfraPesquisaUsuario.setDataSet(const ADataSet: TDataSet);
begin
   dtsUsuarios.DataSet := ADataSet;
end;

procedure TfraPesquisaUsuario.setIdUsuario(const AIdUsuario: integer; const ADesignacao : Boolean = False);
begin
   cmbUsuarios.KeyValue := AIdUsuario;

   cmbUsuarios.ReadOnly        := (Seguranca.Perfil = C_PERFIL_USUARIO) and (not ADesignacao);
   btnPesquisarUsuario.Enabled := not cmbUsuarios.ReadOnly;

   if cmbUsuarios.ReadOnly then
      cmbUsuarios.Color := clBtnFace
   else
      cmbUsuarios.Color := clWindow;
end;

end.
