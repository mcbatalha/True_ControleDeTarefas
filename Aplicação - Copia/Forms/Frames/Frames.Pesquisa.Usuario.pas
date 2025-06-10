unit Frames.Pesquisa.Usuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Data.DB, Vcl.DBCtrls;

type
  TfraPesquisaUsuario = class(TFrame)
    dtsUsuarios: TDataSource;
    Label9: TLabel;
    btnPesquisarUsuario: TSpeedButton;
    cmbUsuarios: TDBLookupComboBox;
  private
  public
     function getIdUsuario : integer;
     procedure setIdUsuario(const AIdUsuario : integer);
     procedure setDataSet(const ADataSet : TDataSet);
  end;

implementation

{$R *.dfm}

{ TfraPesquisaUsuario }

function TfraPesquisaUsuario.getIdUsuario: integer;
begin
   Result := cmbUsuarios.KeyValue;
end;

procedure TfraPesquisaUsuario.setDataSet(const ADataSet: TDataSet);
begin
   dtsUsuarios.DataSet := ADataSet;
end;

procedure TfraPesquisaUsuario.setIdUsuario(const AIdUsuario: integer);
begin
   cmbUsuarios.KeyValue := AIdUsuario;
end;

end.
