unit Forms.Seguranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.JSON,  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Forms.Base, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  Services.Seguranca, Libs.Constantes, Funcoes;

type
  TfrmSeguranca = class(TfrmBase)
    pgcSeguranca: TPageControl;
    tbsCadastro: TTabSheet;
    tbsManutencao: TTabSheet;
    pnlCadastros: TPanel;
    pnlPesquisaUsuario: TPanel;
    Label1: TLabel;
    edtLogin: TEdit;
    Label2: TLabel;
    edtNome: TEdit;
    btnPesquisar: TSpeedButton;
    chbMenuCadastros: TCheckBox;
    chbCadastroSetores: TCheckBox;
    chbCadastroUsusarios: TCheckBox;
    pnlManutencao: TPanel;
    chbMenuManutencao: TCheckBox;
    chbSeguranca: TCheckBox;
    btnMarcarTodos: TSpeedButton;
    btnDesmarcarTodos: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure edtLoginExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtLoginEnter(Sender: TObject);
    procedure chbMenuCadastrosClick(Sender: TObject);
    procedure chbMenuManutencaoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure pgcSegurancaChange(Sender: TObject);
    procedure btnMarcarTodosClick(Sender: TObject);
    procedure btnDesmarcarTodosClick(Sender: TObject);

  private

    FService  : TSrvSeguranca;
    FOldValue : String;
    FLogin    : String;

    procedure ConfigurarBotoes;
    procedure ObterDados;
    procedure MarcarItensDeMenu;
    procedure MarcarItensDoGrupo(const AMarcar : Boolean; const AGrupo : Integer = 0 );
    procedure Editar(const AHabilitar : Boolean);

    procedure RealocarBotoesDeMarcacao(const APainel : TPanel);
    procedure MarcarTodos(const AMarcar : Boolean; const APainel : TPanel);



    const
       C_TITULO_MENSAGENS = 'Seguran�a do Sistema';
  public
     procedure SetLogin(const ALogin : String);
    { Public declarations }
  end;

var
  frmSeguranca: TfrmSeguranca;

implementation

{$R *.dfm}

uses Util.Menu, Libs.TSeguranca;

{ TfrmSeguranca }

procedure TfrmSeguranca.btnCancelarClick(Sender: TObject);
begin
  inherited;
  if not QuestionMessage('Deseja descartar as altera��es ? ',C_TITULO_MENSAGENS) then exit;

  LimparTela(Self);
  Editar(False);
end;

procedure TfrmSeguranca.btnConfirmarClick(Sender: TObject);
var
   LItens : TJSonArray;
   i : integer;
begin
   inherited;
   if not QuestionMessage('Deseja gravar as altera��es ?',C_TITULO_MENSAGENS) then exit;

   try
   LItens := TJSonArray.Create;

   if chbMenuCadastros.Checked then
      begin
      LItens.Add(1000);
      if chbCadastroSetores.Checked   then LItens.Add(1001);
      if chbCadastroUsusarios.Checked then LItens.Add(1002);
   end;

   if chbMenuManutencao.Checked then
      begin
      LItens.Add(2000);
      if chbSeguranca.Checked   then LItens.Add(2001);
   end;
   if not FService.Gravar(LItens) then
      begin
      InformationMessage('Ocorreu um erro tentativa de gravar os dados!',C_TITULO_MENSAGENS);
   end else
      begin
      InformationMessage('Dados gravados com sucesso !',C_TITULO_MENSAGENS);
      Editar(False);
      LimparTela(Self);

      i := Seguranca.id;
      if Seguranca.id = FService.getId then
         HabilitarMenusDoUsuario(LItens);
   end;
   finally
//      FreeAndNil(LItens);
   end;
   

end;

procedure TfrmSeguranca.btnDesmarcarTodosClick(Sender: TObject);
begin
  inherited;
  MarcarTodos(False, (btnMarcarTodos.Parent) as TPanel);

end;

procedure TfrmSeguranca.btnMarcarTodosClick(Sender: TObject);
begin
  inherited;
  MarcarTodos(True, (btnMarcarTodos.Parent) as TPanel);
end;

procedure TfrmSeguranca.chbMenuCadastrosClick(Sender: TObject);
var
   LMarcar : Boolean;
begin
   inherited;

   if chbMenuCadastros.Checked then
      LMarcar := True
   else
      begin
      LMarcar := False;
      MarcarItensDoGrupo(False,1000); {chama o procedimento preencher_combo passando o par�metro false (desmarcar as checkbox)}
   end;
   chbCadastroSetores.Enabled   := LMarcar;
   chbCadastroUsusarios.Enabled := LMarcar;
end;

procedure TfrmSeguranca.chbMenuManutencaoClick(Sender: TObject);
var
   LMarcar : Boolean;
begin
   inherited;

   if chbMenuManutencao.Checked then
      LMarcar := True
   else
      begin
      LMarcar := False;
      MarcarItensDoGrupo(False,2000); {chama o procedimento preencher_combo passando o par�metro false (desmarcar as checkbox)}
   end;
   chbSeguranca.Enabled   := LMarcar;
end;

procedure TfrmSeguranca.ConfigurarBotoes;
begin
   btnConfirmar.Visible := True;
   btnCancelar.Visible  := True;
end;

procedure TfrmSeguranca.Editar(const AHabilitar: Boolean);
begin
   pnlPesquisaUsuario.Enabled := not AHabilitar;

   pnlCadastros.Enabled  := AHabilitar;
   pnlManutencao.Enabled := AHabilitar;

   BotoesDeEdicao(AHabilitar);
end;

procedure TfrmSeguranca.edtLoginEnter(Sender: TObject);
begin
   inherited;
   FOldValue := edtLogin.Text;
end;

procedure TfrmSeguranca.edtLoginExit(Sender: TObject);
begin
  inherited;
   if (ActiveControl.Tag = 1) or (edtLogin.Text = '') or (FOldValue = edtLogin.Text) then
      exit;

   if FService.Localizar(edtLogin.Text) then
      begin
      Editar(True);
      ObterDados;
      MarcarItensDeMenu;
   end;

end;

procedure TfrmSeguranca.FormCreate(Sender: TObject);
begin
   inherited;
   FService  := TSrvSeguranca.Create;
   FLogin    := '';
   FOldValue := '';

   RealocarBotoesDeMarcacao(pnlCadastros);;
end;

procedure TfrmSeguranca.FormDestroy(Sender: TObject);
begin
   FreeAndNil(FService);
   inherited;
end;

procedure TfrmSeguranca.FormShow(Sender: TObject);
begin
   inherited;
   ConfigurarBotoes;
   Editar(False);
   MarcarItensDoGrupo(False);

   if FLogin <> '' then
      begin
      edtNome.SetFocus;
      edtLogin.Text := FLogin;
      edtLoginExit(Self);
   end else
      edtLogin.SetFocus;

end;

procedure TfrmSeguranca.MarcarItensDeMenu;
var
   LItens   : TJSONArray;
   LIemMenu : Integer;
   i        : Integer;
begin
   pgcSeguranca.ActivePageIndex := 0;
   LItens := FService.getItens;

   for I := 0 to LItens.Count - 1 do
      begin
      LIemMenu := LItens.Items[i].AsType<Integer>;
      
     case LIemMenu of
        {$Region 'Cadastros'}
        1000 : chbMenuCadastros.Checked     := True;
        1001 : chbCadastroSetores.Checked   := True;
        1002 : chbCadastroUsusarios.Checked := True;
        {$endRegion}

        {$Region 'Manuten��o do SistemaCadastros'}
        2000 : chbMenuManutencao.Checked := True;
        2001 : chbSeguranca.Checked      := True;
        {$endRegion}
     end;
   end;
end;

procedure TfrmSeguranca.MarcarItensDoGrupo(const AMarcar: Boolean; const AGrupo: Integer);
begin
   if (AGrupo = 0) or (AGrupo = 1000) then     // Cadastro ou Todos
      begin
      chbMenuCadastros.Checked     := AMarcar;
      chbCadastroSetores.Checked   := AMarcar;
      chbCadastroUsusarios.Checked := AMarcar;
   end;

   if (AGrupo = 0) or (AGrupo = 2000) then     // Manuten��o ou Todos
      begin                        
      chbMenuManutencao.Checked := AMarcar;
      chbSeguranca.Checked      := AMarcar;
   end;
end;

procedure TfrmSeguranca.MarcarTodos(const AMarcar: Boolean; const APainel: TPanel);
begin
    if APainel = pnlCadastros  then
       MarcarItensDoGrupo(AMarcar, 1000)
    else if APainel = pnlManutencao  then
       MarcarItensDoGrupo(AMarcar, 2000)
end;

procedure TfrmSeguranca.ObterDados;
begin
   edtLogin.Text := FService.getLogin;
   edtNome.Text  := FService.getNome;
end;

procedure TfrmSeguranca.pgcSegurancaChange(Sender: TObject);
begin
  inherited;

  if pgcSeguranca.ActivePage = tbsCadastro then
     RealocarBotoesDeMarcacao(pnlCadastros)
  else if pgcSeguranca.ActivePage = tbsManutencao then
     RealocarBotoesDeMarcacao(pnlManutencao)

end;

procedure TfrmSeguranca.RealocarBotoesDeMarcacao(const APainel: TPanel);
begin
   btnMarcarTodos.Parent    := APainel;
   btnDesmarcarTodos.Parent := APainel;
end;

procedure TfrmSeguranca.SetLogin(const ALogin: String);
begin
   FLogin := ALogin;
end;

end.
