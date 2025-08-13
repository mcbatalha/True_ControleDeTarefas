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
    chbCadastroUsuarios: TCheckBox;
    pnlManutencao: TPanel;
    chbMenuManutencao: TCheckBox;
    chbSeguranca: TCheckBox;
    btnMarcarTodos: TSpeedButton;
    btnDesmarcarTodos: TSpeedButton;
    tbsImportacoes: TTabSheet;
    pnlImportacaoPlanihas: TPanel;
    chbMenuImportacoes: TCheckBox;
    chbImportacaoAutoSC: TCheckBox;
    chbImportacaoSiags: TCheckBox;
    chbImportacaoControlPc: TCheckBox;
    tbsPaineis: TTabSheet;
    pnlPaineis: TPanel;
    chbMenuPaineis: TCheckBox;
    chbPaineisAcompanhamento: TCheckBox;
    tbsRelatorios: TTabSheet;
    pnlRelatorios: TPanel;
    chbMenuRelatorios: TCheckBox;
    chbRelatorioDesignacoes: TCheckBox;
    chbRelatorioEncerramentos: TCheckBox;
    chbQuadroResumo: TCheckBox;
    chbCadastroStatusTrue: TCheckBox;
    tbsExportacaoDados: TTabSheet;
    pnlExportacoes: TPanel;
    chbMenuExportacoes: TCheckBox;
    chbExportacaoAutoSc: TCheckBox;
    chbExportacaoSiags: TCheckBox;
    chbExportacaoControlPc: TCheckBox;
    chbExportacaoSetores: TCheckBox;
    chbExportacaoUsuarios: TCheckBox;
    chbPaineisDesigancoesPendentes: TCheckBox;
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
    procedure chbMenuImportacoesClick(Sender: TObject);
    procedure chbMenuPaineisClick(Sender: TObject);
    procedure chbMenuRelatoriosClick(Sender: TObject);
    procedure chbMenuExportacoesClick(Sender: TObject);

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
       C_TITULO_MENSAGENS = 'Segurança do Sistema';
  public
     procedure SetLogin(const ALogin : String);
    { Public declarations }
  end;

(*
var
  frmSeguranca: TfrmSeguranca;
*)

implementation

{$R *.dfm}

uses Util.Menu, Libs.TSeguranca;

{ TfrmSeguranca }

procedure TfrmSeguranca.btnCancelarClick(Sender: TObject);
begin
  inherited;
  if not QuestionMessage('Deseja descartar as alterações ? ',C_TITULO_MENSAGENS) then exit;

  LimparTela(Self);
  Editar(False);
end;

procedure TfrmSeguranca.btnConfirmarClick(Sender: TObject);
var
   LItens : TJSonArray;
   i : integer;
begin
   inherited;
   if not QuestionMessage('Deseja gravar as alterações ?',C_TITULO_MENSAGENS) then exit;

   try
   LItens := TJSonArray.Create;

   if chbMenuCadastros.Checked then
      begin
      LItens.Add(1000);
      if chbCadastroSetores.Checked    then LItens.Add(1001);
      if chbCadastroUsuarios.Checked   then LItens.Add(1002);
      if chbCadastroStatusTrue.Checked then LItens.Add(1003);
   end;

   if chbMenuManutencao.Checked then
      begin
      LItens.Add(2000);
      if chbSeguranca.Checked   then LItens.Add(2001);
   end;

   if chbMenuImportacoes.Checked then
      begin
      LItens.Add(3000);
      if chbImportacaoAutoSC.Checked    then LItens.Add(3001);
      if chbImportacaoSiags.Checked     then LItens.Add(3002);
      if chbImportacaoControlPc.Checked then LItens.Add(3003);
   end;

   if chbMenuPaineis.Checked then
      begin
      LItens.Add(4000);
      if chbPaineisAcompanhamento.Checked then LItens.Add(4001);
      if chbQuadroResumo.Checked then LItens.Add(4002);
      if chbPaineisDesigancoesPendentes.Checked then LItens.Add(4003);
   end;

   if chbMenuRelatorios.Checked then
      begin
      LItens.Add(5000);
      if chbRelatorioDesignacoes.Checked then LItens.Add(5001);
      if chbRelatorioEncerramentos.Checked then LItens.Add(5002);
   end;

   if chbMenuExportacoes.Checked then
      begin
      LItens.Add(6000);
      if chbExportacaoAutoSc.Checked then LItens.Add(6001);
      if chbExportacaoSiags.Checked then LItens.Add(6002);
      if chbExportacaoControlPc.Checked then LItens.Add(6003);
      if chbExportacaoSetores.Checked then LItens.Add(6004);
      if chbExportacaoUsuarios.Checked then LItens.Add(6005);
   end;


   if not FService.Gravar(LItens) then
      begin
      InformationMessage('Ocorreu um erro tentativa de gravar os dados!',C_TITULO_MENSAGENS);
   end else
      begin
      InformationMessage(C_GRAVADO_COM_SUCESSO,C_TITULO_MENSAGENS);
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
      MarcarItensDoGrupo(False,1000); {chama o procedimento preencher_combo passando o parâmetro false (desmarcar as checkbox)}
   end;
   chbCadastroSetores.Enabled    := LMarcar;
   chbCadastroUsuarios.Enabled   := LMarcar;
   chbCadastroStatusTrue.Enabled := LMarcar;
end;

procedure TfrmSeguranca.chbMenuExportacoesClick(Sender: TObject);
var
   LMarcar : Boolean;
begin
  inherited;

   if chbMenuExportacoes.Checked then
      LMarcar := True
   else
      begin
      LMarcar := False;
      MarcarItensDoGrupo(False,6000); {chama o procedimento preencher_combo passando o parâmetro false (desmarcar as checkbox)}
   end;
   chbExportacaoAutoSC.Enabled    := LMarcar;
   chbExportacaoSiags.Enabled     := LMarcar;
   chbExportacaoControlPc.Enabled := LMarcar;
   chbExportacaoSetores.Enabled   := LMarcar;
   chbExportacaoUsuarios.Enabled  := LMarcar;
end;

procedure TfrmSeguranca.chbMenuImportacoesClick(Sender: TObject);
var
   LMarcar : Boolean;
begin
  inherited;

   if chbMenuImportacoes.Checked then
      LMarcar := True
   else
      begin
      LMarcar := False;
      MarcarItensDoGrupo(False,3000); {chama o procedimento preencher_combo passando o parâmetro false (desmarcar as checkbox)}
   end;
   chbImportacaoAutoSC.Enabled    := LMarcar;
   chbImportacaoSiags.Enabled     := LMarcar;
   chbImportacaoControlPc.Enabled := LMarcar;
end;

procedure TfrmSeguranca.chbMenuRelatoriosClick(Sender: TObject);
var
   LMarcar : Boolean;
begin
  inherited;

   if chbMenuRelatorios.Checked then
      LMarcar := True
   else
      begin
      LMarcar := False;
      MarcarItensDoGrupo(False,5000); {chama o procedimento preencher_combo passando o parâmetro false (desmarcar as checkbox)}
   end;
   chbRelatorioDesignacoes.Enabled   := LMarcar;
   chbRelatorioEncerramentos.Enabled := LMarcar;
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
      MarcarItensDoGrupo(False,2000); {chama o procedimento preencher_combo passando o parâmetro false (desmarcar as checkbox)}
   end;
   chbSeguranca.Enabled   := LMarcar;
end;

procedure TfrmSeguranca.chbMenuPaineisClick(Sender: TObject);
var
   LMarcar : Boolean;
begin
  inherited;

   if chbMenuPaineis.Checked then
      LMarcar := True
   else
      begin
      LMarcar := False;
      MarcarItensDoGrupo(False,4000); {chama o procedimento preencher_combo passando o parâmetro false (desmarcar as checkbox)}
   end;
   chbPaineisAcompanhamento.Enabled       := LMarcar;
   chbPaineisDesigancoesPendentes.Enabled := LMarcar;
   chbQuadroResumo.Enabled                := LMarcar;
end;

procedure TfrmSeguranca.ConfigurarBotoes;
begin
   btnConfirmar.Visible := True;
   btnCancelar.Visible  := True;
end;

procedure TfrmSeguranca.Editar(const AHabilitar: Boolean);
begin
   pnlPesquisaUsuario.Enabled := not AHabilitar;

   pnlCadastros.Enabled          := AHabilitar;
   pnlManutencao.Enabled         := AHabilitar;
   pnlImportacaoPlanihas.Enabled := AHabilitar;
   pnlPaineis.Enabled            := AHabilitar;
   pnlRelatorios.Enabled         := AHabilitar;

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
   MarcarItensDoGrupo(True);
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
        1000 : chbMenuCadastros.Checked      := True;
        1001 : chbCadastroSetores.Checked    := True;
        1002 : chbCadastroUsuarios.Checked   := True;
        1003 : chbCadastroStatusTrue.Checked := True;
        {$endRegion}

        {$Region 'Manutenção do Sistema'}
        2000 : chbMenuManutencao.Checked := True;
        2001 : chbSeguranca.Checked      := True;
        {$endRegion}

        {$Region 'Importações de Planilhas'}
        3000 : chbMenuImportacoes.Checked     := True;
        3001 : chbImportacaoAutoSC.Checked    := True;
        3002 : chbImportacaoSiags.Checked     := True;
        3003 : chbImportacaoControlPc.Checked := True;
        {$endRegion}

        {$Region 'Paineis'}
        4000 : chbMenuPaineis.Checked                 := True;
        4001 : chbPaineisAcompanhamento.Checked       := True;
        4002 : chbQuadroResumo.Checked                := True;
        4003 : chbPaineisDesigancoesPendentes.Checked := True;
        {$endRegion}

        {$Region 'Relatorios'}
        5000 : chbMenuRelatorios.Checked         := True;
        5001 : chbRelatorioDesignacoes.Checked   := True;
        5002 : chbRelatorioEncerramentos.Checked := True;
        {$endRegion}

        {$Region 'Exporações'}
        6000 : chbMenuExportacoes.Checked     := True;
        6001 : chbExportacaoAutoSc.Checked    := True;
        6002 : chbExportacaoSiags.Checked     := True;
        6003 : chbExportacaoControlPc.Checked := True;
        6004 : chbExportacaoSetores.Checked   := True;
        6005 : chbExportacaoUsuarios.Checked  := True;
        {$endRegion}
  end;
   end;
end;

procedure TfrmSeguranca.MarcarItensDoGrupo(const AMarcar: Boolean; const AGrupo: Integer);
begin
   if (AGrupo = 0) or (AGrupo = 1000) then     // Cadastro ou Todos
      begin
      chbMenuCadastros.Checked      := AMarcar;
      chbCadastroSetores.Checked    := AMarcar;
      chbCadastroUsuarios.Checked   := AMarcar;
      chbCadastroStatusTrue.Checked := AMarcar;
   end;

   if (AGrupo = 0) or (AGrupo = 2000) then     // Manutenção ou Todos
      begin                        
      chbMenuManutencao.Checked := AMarcar;
      chbSeguranca.Checked      := AMarcar;
   end;

   if (AGrupo = 0) or (AGrupo = 3000) then     // Importação de Planilhas ou Todos
      begin
      chbMenuImportacoes.Checked     := AMarcar;
      chbImportacaoAutoSC.Checked    := AMarcar;
      chbImportacaoSiags.Checked     := AMarcar;
      chbImportacaoControlPc.Checked := AMarcar;
   end;

   if (AGrupo = 0) or (AGrupo = 4000) then     // Paineis
      begin
      chbMenuPaineis.Checked                 := AMarcar;
      chbPaineisAcompanhamento.Checked       := AMarcar;
      chbQuadroResumo.Checked                := AMarcar;
      chbPaineisDesigancoesPendentes.Checked := AMarcar;
   end;

   if (AGrupo = 0) or (AGrupo = 5000) then     // Relatorios
      begin
      chbMenuRelatorios.Checked         := AMarcar;
      chbRelatorioDesignacoes.Checked   := AMarcar;
      chbRelatorioEncerramentos.Checked := AMarcar;
   end;

   if (AGrupo = 0) or (AGrupo = 6000) then     // Relatorios
      begin
      chbMenuExportacoes.Checked     := AMarcar;
      chbExportacaoAutoSc.Checked    := AMarcar;
      chbExportacaoSiags.Checked     := AMarcar;
      chbExportacaoControlPc.Checked := AMarcar;
      chbExportacaoSetores.Checked   := AMarcar;
      chbExportacaoUsuarios.Checked  := AMarcar;
   end;
end;

procedure TfrmSeguranca.MarcarTodos(const AMarcar: Boolean; const APainel: TPanel);
begin
    if APainel = pnlCadastros  then
       MarcarItensDoGrupo(AMarcar, 1000)
    else if APainel = pnlManutencao  then
       MarcarItensDoGrupo(AMarcar, 2000)
    else if APainel = pnlImportacaoPlanihas  then
       MarcarItensDoGrupo(AMarcar, 3000)
    else if APainel = pnlPaineis  then
       MarcarItensDoGrupo(AMarcar, 4000)
    else if APainel = pnlRelatorios  then
       MarcarItensDoGrupo(AMarcar, 5000)
    else if APainel = pnlExportacoes then
       MarcarItensDoGrupo(AMarcar, 6000)
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
  else if pgcSeguranca.ActivePage = tbsImportacoes then
     RealocarBotoesDeMarcacao(pnlImportacaoPlanihas)
  else if pgcSeguranca.ActivePage = tbsPaineis then
     RealocarBotoesDeMarcacao(pnlPaineis)
  else if pgcSeguranca.ActivePage = tbsRelatorios then
     RealocarBotoesDeMarcacao(pnlRelatorios)
  else if pgcSeguranca.ActivePage = tbsExportacaoDados then
     RealocarBotoesDeMarcacao(pnlExportacoes)

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
