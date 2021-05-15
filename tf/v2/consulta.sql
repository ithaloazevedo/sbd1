-- --------  << farmaciaPostoSaude >>  ----------
--
--                    SCRIPT DE CONSULTA (DDL e DML)
--
-- Data Criacao ...........: 07/05/2021
-- Autor(es) ..............: Igor Paiva, Ithalo Mendes, Kleidson Correa e Lucas Santos
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF2_2B_lucassantos
--
-- Ultimas Alteracoes
--   11/05/2021 => inserção da view V_PRESCRITOR_RECEITA
--
-- PROJETO => 01 Base de Dados
--         => 19 Tabelas
--         => 02 Visoes
--         => 03 Usuarios
--
-- ---------------------------------------------------------

-- SELECIONAR A BASE DE DADOS
USE TF2_2B_lucassantos;

-- RECUPERAR OS ENVOLVIDOS (FUNCIONARIO E PACIENTE) EM ATENDIMENTOS DE UMA DETERMINADA DATA
SELECT
    A.dataAtendimento AS 'Data atendimento',
    F.nome AS 'Nome funcionário',
    F.cpf AS 'CPF Funcionário',
    P.nomeCompleto AS 'Nome paciente',
    P.registroGeral  AS 'RG paciente',
    P.orgaoEmissor  AS 'Orgão emissor do RG do paciente'
	FROM ATENDIMENTO A
    INNER JOIN FUNCIONARIO F ON F.cpf = A.cpf
    INNER JOIN PACIENTE P ON P.numeroSus = A.numeroSus
    WHERE A.dataAtendimento = '2018-11-10'
    ORDER BY A.dataAtendimento;

-- RECUPERAR TODOS OS MEDICAMENTOS SOLICITADOS POR UM PACIENTE
SELECT
    A.dataAtendimento AS 'Data atendimento',
    P.nomeCompleto AS 'Nome paciente',
    P.registroGeral  AS 'RG paciente',
    P.orgaoEmissor  AS 'Orgão emissor do RG do paciente',
	M.nome AS 'Nome medicamento',
    M.principioAtivo AS 'Principio ativo',
    M.miligramas AS 'Miligramas'
    FROM ATENDIMENTO A
    INNER JOIN PACIENTE P ON P.numeroSus = A.numeroSus
    INNER JOIN RECEITA R ON R.idAtendimento = A.idAtendimento
    INNER JOIN contem ON contem.idReceita = R.idReceita
    INNER JOIN MEDICAMENTO M ON M.idMedicamento = contem.idMedicamento
    WHERE P.numeroSus = 7728984
    ORDER BY A.dataAtendimento;

-- VIEW QUE ARMAZENA TODOS OS PEDIDOS DE UM SETOR COM A QTD RECEBIDA E A SOLICITADA
CREATE VIEW V_PEDIDOS_SETOR  AS
    SELECT
        PP.dataPedido AS 'Data',
        PP.setor AS 'Setor',
        PP.solicitante AS 'Solicitante',
        P.codigo AS 'Código do produto',
        P.tipo AS 'Tipo do produto',
        P.nome AS 'Nome do produto',
        solicita.quantidadeSolicitada AS 'Quantidade solicitada',
        recebe.quantidadeRecebida AS 'Quantidade recebida'
        FROM PEDIDO_PRODUTO PP
        INNER JOIN solicita ON solicita.idPedido = PP.idPedido
        INNER JOIN PRODUTO P ON P.codigo = solicita.codigo
        INNER JOIN recebe ON recebe.idPedido = PP.idPedido
        WHERE PP.setor = 'Enfermagem' 
        GROUP BY P.codigo
        ORDER BY PP.dataPedido, P.nome;

-- VIEW QUE LISTA DADOS REFERENTE AOS MEDICAMENTOS QUE FORAM FORAM RECEITADOS E O PRESCRITOR
CREATE VIEW V_PRESCRITOR_RECEITA AS
    SELECT
        P.nome AS 'Nome do prescritor',
        P.siglaConselho AS 'Sigla do conselho do prescritor',
        P.numeroConselho AS 'Número do conselho do prescritor',
        P.unidadeFederativa AS 'UF do conselho do prescritor',
        M.nome AS 'Nome do medicamento',
        M.miligramas AS 'Miligramas do medicamento',
        M.tipo AS 'Tipo do medicamento',
        R.dataEmissao AS 'Data de emissão da receita',
        R.validade AS 'Validade da receita',
        C.quantidade AS 'Quantidade receitada'
        FROM PRESCRITOR P
        INNER JOIN RECEITA R ON R.idPrescritor = P.idPrescritor
        INNER JOIN contem C ON C.idReceita = R.idReceita
        INNER JOIN MEDICAMENTO M ON M.idMedicamento = C.idMedicamento
        ORDER BY R.dataEmissao, P.nome;
