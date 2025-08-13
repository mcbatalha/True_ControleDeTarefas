unit Forms.Pesquisa;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.Classes,
  System.SysUtils,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.Mask,

  vcl.wwdbigrd,
  vcl.wwdbgrid,

  Data.Db,
  Data.DBXCommon,

  Datasnap.DBClient,

  Proxy.Classes,
  Libs.Constantes;

type
  TfrmPesquisa = class(TForm)
    Panel1: TPanel;
    cmbCampo: TComboBox;
    Panel2: TPanel;
    btnSelecionar: TBitBtn;
    btnRetornar: TBitBtn;
    dtsPesquisa: TDataSource;
    rdgTipo: TRadioGroup;
    btnPesquisa: TSpeedButton;
    edtChave: TMaskEdit;
    chbPesquisarInativos: TCheckBox;
    Label3: TLabel;
    Label1: TLabel;
    dbgPesquisa: TwwDBGrid;
    procedure btnPesquisaClick(Sender: TObject);
    procedure cmbCampoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelecionarClick(Sender: TObject);
    procedure dbgPesquisaDblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chbPesquisarInativosClick(Sender: TObject);
    procedure dbgPesquisaTitleClick(Column: TColumn);
    procedure dbgPesquisaCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure dbgPesquisaCalcTitleAttributes(Sender: TObject;
      AFieldName: string; AFont: TFont; ABrush: TBrush;
      var ATitleAlignment: TAlignment);
    procedure dbgPesquisaCalcTitleImage(Sender: TObject; Field: TField;
      var TitleImageAttributes: TwwTitleImageAttributes);
    procedure dbgPesquisaTitleButtonClick(Sender: TObject; AFieldName: string);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

    FFechar       : Boolean;

    FTipoPesquisa  : Integer;
    FCdsPesquisa   : TClientDataSet;
    FDBXConnection : TDBXConnection;
    FIdSelecionado : Integer;

    procedure TratarCamposUsuario;
    procedure TratarCamposSetor;
    procedure TratarCamposStatusTrue;
    procedure TratarCampos;

    procedure PesquisarUsuarios;
    procedure PesquisarSetores;
    procedure PesquisarStatusTrue;

    procedure ConfigurarPesquisaDeUsuarios;
    procedure ConfigurarPesquisaDeSetores;
    procedure ConfigurarPesquisaDeStatusTrue;
    procedure ConfigurarPesquisa;

    procedure Pesquisar;
    procedure FormatarCampos;
    procedure BotaoSelecionar;

  public
    { Public declarations }

    procedure SetParameter(const ACdsPesquisa : TClientDataSet;
                           const ADBXConnection : TDBXConnection;
                           const ATipoPesquisa : integer);
    function getId : Integer;

  end;


implementation
Uses Funcoes;


{$R *.DFM}


procedure TfrmPesquisa.FormatarCampos;
var
  I: Integer;
begin
   for i := 0 to dtsPesquisa.DataSet.Fields.Count - 1 do
      begin
      if dtsPesquisa.DataSet.Fields[i] is TIntegerField then
         dtsPesquisa.DataSet.Fields[i].Alignment := taCenter
      else if (dtsPesquisa.DataSet.Fields[i] is TNumericField) and ((FTipoPesquisa = 21) or (FTipoPesquisa = 24)) then
         TNumericField(dtsPesquisa.DataSet.Fields[i]).DisplayFormat := '0.00 %'
      else if dtsPesquisa.DataSet.Fields[i] is TNumericField then
         TNumericField(dtsPesquisa.DataSet.Fields[i]).DisplayFormat := '#,##0.00';
   end;

end;



procedure TfrmPesquisa.PesquisarSetores;
var
   LPxyPesquisa : TSMSetoresClient;
begin
   LPxyPesquisa := TSMSetoresClient.Create(FDBXConnection);
   LPxyPesquisa.Pesquisar(cmbCampo.ItemIndex,
                          rdgTipo.ItemIndex,
                          trim(edtChave.Text),
                          chbPesquisarInativos.Checked);
   FreeAndNil(LPxyPesquisa);
end;

procedure TfrmPesquisa.PesquisarStatusTrue;
var
   LPxyPesquisa : TSMStatusTrueClient;
begin
   LPxyPesquisa := TSMStatusTrueClient.Create(FDBXConnection);
   LPxyPesquisa.Pesquisar(cmbCampo.ItemIndex,
                          rdgTipo.ItemIndex,
                          trim(edtChave.Text),
                          chbPesquisarInativos.Checked);
   FreeAndNil(LPxyPesquisa);
end;

procedure TfrmPesquisa.PesquisarUsuarios;
var
   LPxyPesquisa : TSMUsuariosClient;
begin
   LPxyPesquisa := TSMUsuariosClient.Create(FDBXConnection);
   LPxyPesquisa.Pesquisar(cmbCampo.ItemIndex,
                          rdgTipo.ItemIndex,
                          trim(edtChave.Text),
                          chbPesquisarInativos.Checked);
   FreeAndNil(LPxyPesquisa);
end;


procedure TfrmPesquisa.SetParameter(
   const ACdsPesquisa : TClientDataSet;
   const ADBXConnection : TDBXConnection;
   const ATipoPesquisa : integer);
begin
   FCdsPesquisa   := ACdsPesquisa;
   FTipoPesquisa  := ATipoPesquisa;
   FDBXConnection := ADBXConnection;

   dtsPesquisa.DataSet := ACdsPesquisa;
end;

procedure TfrmPesquisa.TratarCampos;
begin
   while dbgPesquisa.FieldCount > 0  do
      begin
      dbgPesquisa.RemoveField(dbgPesquisa.Fields[0].FieldName);
   end;

   dbgPesquisa.TitleLines := 3;
   case FTipoPesquisa of
       C_PESQUISA_USUARIO : TratarCampoSUsuario;
       C_PESQUISA_SETOR   : TratarCamposSetor;
       C_PESQUISA_STATUS  : TratarCamposStatusTrue;
   end;
end;

procedure TfrmPesquisa.TratarCamposSetor;
begin
   dbgPesquisa.TitleLines := 3;
   dbgPesquisa.AddField('Nome_Setor');
   dbgPesquisa.ColumnByName('Nome_Setor').DisplayLabel := 'Nome do Setor';

   dbgPesquisa.AddField('AUTOSC');
   dbgPesquisa.ColumnByName('AUTOSC').DisplayLabel := 'AUTOSC';
   dbgPesquisa.ColumnByName('AUTOSC').GroupName    := 'Área de Atuação';

   dbgPesquisa.AddField('CONTROLPC');
   dbgPesquisa.ColumnByName('CONTROLPC').DisplayLabel := 'CONTROLPC';
   dbgPesquisa.ColumnByName('CONTROLPC').GroupName    := 'Área de Atuação';

   dbgPesquisa.AddField('SIAGS');
   dbgPesquisa.ColumnByName('SIAGS').DisplayLabel := 'SIAGS';
   dbgPesquisa.ColumnByName('SIAGS').GroupName    := 'Área de Atuação';

   FCdsPesquisa.FieldByName('AUTOSC').Alignment    := taCenter;
   FCdsPesquisa.FieldByName('CONTROLPC').Alignment := taCenter;
   FCdsPesquisa.FieldByName('SIAGS').Alignment     := taCenter;

   dbgPesquisa.ColumnByName('AUTOSC').DisplayWidth    := 15;
   dbgPesquisa.ColumnByName('CONTROLPC').DisplayWidth := 15;
   dbgPesquisa.ColumnByName('SIAGS').DisplayWidth     := 15;
end;

procedure TfrmPesquisa.TratarCamposStatusTrue;
begin
   dbgPesquisa.TitleLines := 2;
   dbgPesquisa.AddField('Status');
   dbgPesquisa.ColumnByName('Status').DisplayLabel := 'Nome do Status';

   dbgPesquisa.AddField('Tipo_Prazo');
   dbgPesquisa.ColumnByName('Tipo_Prazo').DisplayLabel := 'Tipo~do Prazo';

   dbgPesquisa.AddField('Prazo');
   dbgPesquisa.ColumnByName('Prazo').DisplayLabel := 'Prazo';

   dbgPesquisa.AddField('Encerra');
   dbgPesquisa.ColumnByName('Encerra').DisplayLabel := 'Encerra';

   FCdsPesquisa.FieldByName('Tipo_Prazo').Alignment := taCenter;
   FCdsPesquisa.FieldByName('Prazo').Alignment      := taCenter;
   FCdsPesquisa.FieldByName('Encerra').Alignment    := taCenter;

   dbgPesquisa.ColumnByName('Tipo_Prazo').DisplayWidth := 30;
   dbgPesquisa.ColumnByName('Prazo').DisplayWidth      := 15;
   dbgPesquisa.ColumnByName('Encerra').DisplayWidth    := 30;
end;

procedure TfrmPesquisa.TratarCamposUsuario;
begin
   dbgPesquisa.AddField('Nome_Usuario');
   dbgPesquisa.ColumnByName('Nome_Usuario').DisplayLabel := 'Nome do Colaborador';
   dbgPesquisa.ColumnByName('Nome_Usuario').DisplayWidth := 50;

   dbgPesquisa.AddField('Login');
   dbgPesquisa.ColumnByName('Login').DisplayLabel := 'Login';
   dbgPesquisa.ColumnByName('Login').DisplayWidth := 20;
end;

(*
procedure TfrmPesquisa.TratarCamposCompras;
begin
   dbgPesquisa.AddField('Compra');
   dbgPesquisa.AddField('Data_Compra');
   dbgPesquisa.AddField('Categoria');
   dbgPesquisa.AddField('Produto');
   dbgPesquisa.AddField('Prazo');
   dbgPesquisa.AddField('Quantidade');
   dbgPesquisa.AddField('Nome_Usuario');

   dbgPesquisa.ColumnByName('Compra').DisplayLabel       := 'Nº da Compra';
   dbgPesquisa.ColumnByName('Data_Compra').DisplayLabel  := 'Data';
   dbgPesquisa.ColumnByName('Categoria').DisplayLabel    := 'Categoria';
   dbgPesquisa.ColumnByName('Produto').DisplayLabel      := 'Descrição';
   dbgPesquisa.ColumnByName('Prazo').DisplayLabel        := 'Prazo~de Entrega';
   dbgPesquisa.ColumnByName('Quantidade').DisplayLabel   := 'Quantidade';
   dbgPesquisa.ColumnByName('Nome_Usuario').DisplayLabel := 'Solicitante';

   dtsPesquisa.DataSet.FieldByName('Compra').Alignment      := taCenter;
   dtsPesquisa.DataSet.FieldByName('Data_Compra').Alignment := taCenter;
   dtsPesquisa.DataSet.FieldByName('Prazo').Alignment       := taCenter;

   (dtsPesquisa.DataSet.FieldByName('Quantidade') as TNumericField).DisplayFormat := '0.00';

   dbgPesquisa.Options := dbgPesquisa.Options - [dgProportionalColResize];

   dbgPesquisa.ColumnByName('Compra').DisplayWidth        := 15;
   dbgPesquisa.ColumnByName('Data_Compra').DisplayWidth   := 15;
   dbgPesquisa.ColumnByName('Categoria').DisplayWidth     := 20;
   dbgPesquisa.ColumnByName('Produto').DisplayWidth       := 50;
   dbgPesquisa.ColumnByName('Prazo').DisplayWidth         := 15;
   dbgPesquisa.ColumnByName('Quantidade').DisplayWidth    := 15;
end;
*)




procedure TfrmPesquisa.cmbCampoClick(Sender: TObject);
begin
   case FTipoPesquisa of
      -1 :;

      else
         begin
         edtChave.EditMask := '';
         rdgTipo.ItemIndex := 2;
         rdgTipo.Enabled := True;
      end;

   end;
end;

procedure TfrmPesquisa.ConfigurarPesquisa;
begin
   case FTipoPesquisa of
      C_PESQUISA_SETOR   : ConfigurarPesquisaDeSetores;
      C_PESQUISA_USUARIO : ConfigurarPesquisaDeUsuarios;
      C_PESQUISA_STATUS  : ConfigurarPesquisaDeStatusTrue;
   end;
end;

procedure TfrmPesquisa.ConfigurarPesquisaDeSetores;
begin
   (Self as TForm).Caption := 'Pesquisa de Setores';
   cmbCampo.Items.Add('Nome do Setor');
   cmbCampo.ItemIndex := 0;
end;

procedure TfrmPesquisa.ConfigurarPesquisaDeStatusTrue;
begin
   (Self as TForm).Caption := 'Pesquisa de Status True';
   cmbCampo.Items.Add('Nome do Status');
   cmbCampo.ItemIndex := 0;
end;

procedure TfrmPesquisa.ConfigurarPesquisaDeUsuarios;
begin
   (Self as TForm).Caption := 'Pesquisa de Usuários';
   cmbCampo.Items.Add('Nome do Usuário');
   cmbCampo.Items.Add('Login');
   cmbCampo.ItemIndex := 0;
end;

procedure TfrmPesquisa.FormShow(Sender: TObject);
begin
   FFechar := False;
   ConfigurarPesquisa;

   Pesquisar;
   TratarCampos;

   if dtsPesquisa.DataSet.RecordCount = 0 then
      btnSelecionar.Enabled := false
   else
      btnSelecionar.Enabled := true;

   cmbCampoClick(self);

   edtChave.SetFocus;
end;

function TfrmPesquisa.getId: Integer;
begin
   Result  := FIdSelecionado;
end;

procedure TfrmPesquisa.btnRetornarClick(Sender: TObject);
begin
   FIdSelecionado := 0;
   FFechar        := true;
end;

procedure TfrmPesquisa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if Not FFechar then Abort;

   edtChave.Text := '';
   cmbCampo.ItemIndex := 0;
end;

procedure TfrmPesquisa.FormCreate(Sender: TObject);
begin
   cmbCampo.Items.Clear;
   FIdSelecionado := 0;
end;

procedure TfrmPesquisa.btnSelecionarClick(Sender: TObject);
begin
   if not btnSelecionar.Enabled then Exit;

   FIdSelecionado := FCdsPesquisa.FieldByName('id').AsInteger;
   FFechar := True;
end;

procedure TfrmPesquisa.dbgPesquisaDblClick(Sender: TObject);
begin
   btnSelecionarClick(Self);
   Close;
   ModalResult := mrOk;
end;

procedure TfrmPesquisa.dbgPesquisaCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);

begin
   if (Field.AsString = C_NAO) then
      AFont.Color := clRed
   else if (Field.AsString = C_SIM) then
      AFont.Color := clBlue
   else
      AFont.Color := clBlack;
end;

procedure TfrmPesquisa.dbgPesquisaCalcTitleAttributes(Sender: TObject;
  AFieldName: string; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
   if AFieldName = 'Ativo' then
      ATitleAlignment := taCenter;
end;

procedure TfrmPesquisa.dbgPesquisaCalcTitleImage(Sender: TObject;
  Field: TField; var TitleImageAttributes: TwwTitleImageAttributes);
var vNomeCampo, vNomeIndice : string;
begin
   vNomeIndice := (dtsPesquisa.DataSet as TClientDataSet).IndexName;
   vNomeCampo := UpperCase(Field.FieldName);

   if (dtsPesquisa.DataSet as TClientDataSet).IndexFieldNames = Field.FieldName then
         TitleImageAttributes.imageIndex:= 0
   else if (Pos('_INV',vNomeIndice) > 0) and (Pos(vNomeCampo ,(dtsPesquisa.DataSet as TClientDataSet).IndexName) > 0) then
         TitleImageAttributes.imageIndex:= 1
   else
      TitleImageAttributes.imageIndex:= -1;

end;

procedure TfrmPesquisa.dbgPesquisaTitleButtonClick(Sender: TObject;
  AFieldName: string);
var
  vIndice: string;
  vExiste: boolean;
begin
   if (dtsPesquisa.DataSet as TClientDataSet).IndexFieldNames = AFieldName then
     begin
     vIndice := AnsiUpperCase(AFieldName+'_INV');

     try
       (dtsPesquisa.DataSet as TClientDataSet).IndexDefs.Find(vIndice);
       vExiste := true;
     except
       vExiste := false;
     end;

     if not vExiste then
       with (dtsPesquisa.DataSet as TClientDataSet).IndexDefs.AddIndexDef do begin
         Name := vIndice;
         Fields := AFieldName;
         Options := [ixDescending];
       end;
      (dtsPesquisa.DataSet as TClientDataSet).IndexName := vIndice;
      end
   else
     (dtsPesquisa.DataSet as TClientDataSet).IndexFieldNames := AFieldName;
end;

procedure TfrmPesquisa.dbgPesquisaTitleClick(Column: TColumn);
begin
   (dtsPesquisa.DataSet as TClientDataSet).IndexFieldNames := Column.FieldName;
end;

procedure TfrmPesquisa.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=chr(13)then              {tecla enter}
      begin
      if edtChave.Focused then
         begin
         btnPesquisaClick(self);
         Exit;
      end;
      perform(wm_nextdlgctl,0,0);  {ativa API do windows para mudar para o próximo campo}
      key:=chr(0);                 {tecla recebe 0}
   end;
end;

procedure TfrmPesquisa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
(*
   Case Key of
      VK_F2  : btnPesquisaClick(self);
      VK_F3  : Btn_Mostrar_TodosClick(self);
      VK_F11 : btnSelecionarClick(self);
      VK_F12 : Btn_RetornarClick(self);
   end;
*)
end;

procedure TfrmPesquisa.BotaoSelecionar;
begin
   btnSelecionar.Enabled := dtsPesquisa.DataSet.RecordCount > 0;
end;

procedure TfrmPesquisa.Pesquisar;
begin
   dtsPesquisa.DataSet.Filtered := False;

   dtsPesquisa.DataSet.close;

   case FTipoPesquisa of
      C_PESQUISA_USUARIO : PesquisarUsuarios;
      C_PESQUISA_SETOR   : PesquisarSetores;
      C_PESQUISA_STATUS  : PesquisarStatusTrue;
   else;
//      PxyPesquisa.Pesquisar(FSql, FClausula);
   end;

   dtsPesquisa.DataSet.Open;

   if dtsPesquisa.DataSet.RecordCount = 0 then
      begin
      if edtChave.Text <> '' then
         InformationMessage('Nenhum registro atende a chave pesquisada !!!','Erro');
      edtChave.setfocus;
   end;

   TratarCampos;
   FormatarCampos;

   BotaoSelecionar;
end;

procedure TfrmPesquisa.chbPesquisarInativosClick(Sender: TObject);
var vQtdColunas : integer;
begin
//   if DMDataSets.CdtsPesquisa.State = dsInactive then exit;

   vQtdColunas := dbgPesquisa.GetColCount;

   if chbPesquisarInativos.Checked then
      begin
      dbgPesquisa.Options := [dgEditing,dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect];

      dbgPesquisa.AddField('Ativo',vQtdColunas,true);
      dbgPesquisa.ColumnByName('Ativo').DisplayWidth := 10;
      FCdsPesquisa.FieldByName('Ativo').Alignment    := taCenter;

      dbgPesquisa.Options := [dgEditing,dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect];
      end
   else
      begin
      dbgPesquisa.RemoveField('Ativo',true);
   end;
   BotaoSelecionar;
   dbgPesquisa.RedrawGrid;
   dbgPesquisa.RefreshDisplay;
end;

procedure TfrmPesquisa.btnPesquisaClick(Sender: TObject);
   function CondigoValido : boolean;
      begin

      Result := true;
      if cmbCampo.ItemIndex = 1 then
         try
            StrToInt(edtChave.Text)
         except
            begin
            Application.MessageBox('Código inválido','Pesquisa', MB_ICONINFORMATION + MB_OK);
            Result := false;
            end;
         end;
   end;
begin
   if edtChave.Text = '' then
      begin
      application.messagebox('Digite a chave para pesquisa !!!','Pesquisa',mb_iconstop+mb_ok);
      edtChave.setfocus;
      exit;
   end;

   Pesquisar;
end;

end.

