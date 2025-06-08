unit Libs.Constantes;

interface


const
// Host de Conex�o
   C_HOST_CONEXAO = '3.208.245.248';

// Geral
   C_SIM               = 'Sim';
   C_NAO               = 'N�o';
   C_TODAS             = 'Todas';
   C_TODOS             = 'Todos';
   C_CPF_EM_BRANCO     = '   .   .   -  ';
   C_CNPJ_EM_BRANCO    = '  .   .   /    -  ';
   C_DATA_EM_BRANCO    = '  /  /    ';
   C_PERIODO_EM_BRANCO = '  /    ';
   C_PESSOA_FISICA     = 'Pessoa F�sica';
   C_PESSOA_JURIDICA   = 'Pessoa Jur�dica';
   C_ENTER             = chr(13);

   C_COR_DE_FUNDO      = $00E1E1E1;

// Mensagens

   C_TUDO_PREENCHIDO     = 'Os seguintes campos devem ser preenchidos:' + chr(13) + chr(13);
   C_GRAVADO_COM_SUCESSO = 'Dados Gravados com sucesso!';

// Tipo de Sa�da dos Relat�rios
   C_TIPO_RELATORIO_EXCEL    = 0;
   C_TIPO_RELATORIO_IMPRESSO = 1;


// Excel
    C_EXCEL_HORIZONTAL_ESQUERDA     = -4131;
    C_EXCEL_HORIZONTAL_CENTRALIZADO = -4108;
    C_EXCEL_HORIZONTAL_DIREITA      = -4152;

    C_EXCEL_VERTICAL_TOP    = -4160;
    C_EXCEL_VERTICAL_CENTER = -4108;
    C_EXCEL_VERTICAL_BOTTON = -4107;


// Tipos de pesquisa
   C_PESQUISA_USUARIO = 1;
   C_PESQUISA_SETOR   = 2;

// Ambientes
   C_AMBIENTE_HOMOLOGACAO     = 'Homologa��o';
   C_AMBIENTE_DESENVOLVIMENTO = 'Desenvolvimento';
   C_AMBIENTE_PRODUCAO        = 'Produ��o';

// Perfis
   C_PERFIL_USUARIO    = 'Usuario';
   C_PERFIL_SUPERVISOR = 'Supervisor';
   C_PERFIL_GERENTE    = 'Gerente';

// Situa��o dos processo
   C_PROCESSO_NAO_DESIGNADO = 'N�o designado';
   C_CODIGO_NAO_DESIGNADO   = 999999;

// Tipos de Processo
   C_CODIGO_AUTOSC    = 0;
   C_CODIGO_SIAGS     = 1;
   C_CODIGO_CONTROLPC = 2;

   C_TIPO_AUTOSC    = 'AUTOSC';
   C_TIPO_SIAGS     = 'SIAGS';
   C_TIPO_CONTROLPC = 'CONTROLPC';

   implementation



end.
