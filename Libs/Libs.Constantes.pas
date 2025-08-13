unit Libs.Constantes;

interface
Uses Vcl.Graphics;

const
// Host de Conexão
   C_HOST_CONEXAO = '3.208.245.248';

// Geral
   C_SIM               = 'Sim';
   C_NAO               = 'Não';
   C_TODAS             = 'Todas';
   C_TODOS             = 'Todos';
   C_CPF_EM_BRANCO     = '   .   .   -  ';
   C_CNPJ_EM_BRANCO    = '  .   .   /    -  ';
   C_DATA_EM_BRANCO    = '  /  /    ';
   C_PERIODO_EM_BRANCO = '  /    ';
   C_PESSOA_FISICA     = 'Pessoa Física';
   C_PESSOA_JURIDICA   = 'Pessoa Jurídica';
   C_ENTER             = chr(13);

   C_COR_DE_FUNDO      = $00E1E1E1;

// Mensagens

   C_TUDO_PREENCHIDO     = 'Os seguintes campos devem ser preenchidos:' + chr(13) + chr(13);
   C_GRAVADO_COM_SUCESSO = 'Dados gravados com sucesso!';

// Tipo de Saída dos Relatórios
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
   C_PESQUISA_STATUS  = 3;

// Ambientes
   C_AMBIENTE_HOMOLOGACAO     = 'Homologação';
   C_AMBIENTE_DESENVOLVIMENTO = 'Desenvolvimento';
   C_AMBIENTE_PRODUCAO        = 'Produção';

// Perfis
   C_PERFIL_USUARIO    = 'Usuario';
   C_PERFIL_SUPERVISOR = 'Supervisor';
   C_PERFIL_GERENTE    = 'Gerente';

// Situação dos processo
   C_DESCRICAO_NAO_DESIGNADO = 'Não designado';
   C_CODIGO_NAO_DESIGNADO    = 999999;

// Tipos de Processo
   C_CODIGO_AUTOSC    = 0;
   C_CODIGO_SIAGS     = 1;
   C_CODIGO_CONTROLPC = 2;

   C_TIPO_AUTOSC    = 'AUTOSC';
   C_TIPO_SIAGS     = 'SIAGS';
   C_TIPO_CONTROLPC = 'CONTROLPC';


// Tipos de pesquisa
   C_TIPO_PRAZO_NAO_CONTA = 'Não Conta';
   C_TIPO_PRAZO_DIAS      = 'Dias';
   C_TIPO_PRAZO_HORAS     = 'Horas';

// Tipos de Exportacao
   C_TIPO_EXPORTACAO_AUTOSC    = 0;
   C_TIPO_EXPORTACAO_SIAGS     = 1;
   C_TIPO_EXPORTACAO_CONTROLPC = 2;
   C_TIPO_EXPORTACAO_SETORES   = 3;
   C_TIPO_EXPORTACAO_USUARIOS  = 4;

   C_ARQUIVO_EXPORTACAO_AUTOSC    = 'AutoSC_Ativos.csv';
   C_ARQUIVO_EXPORTACAO_SIAGS     = 'Siags_Ativos.csv';
   C_ARQUIVO_EXPORTACAO_CONTROLPC = 'ControlPc_Ativos.csv';
   C_ARQUIVO_EXPORTACAO_SETORES   = 'Setores.csv';
   C_ARQUIVO_EXPORTACAO_USUARIOS  = 'Usuarios.csv';

// Prazos
   C_PRAZO_VENCIDO      = 'Vencido';
   C_PRAZO_VENCE_HOJE   = 'Hoje';
   C_PRAZO_VENCE_AMANHA = 'Amanhã';
   C_PRAZO_FUTURO       = 'Futuro';



implementation



end.
