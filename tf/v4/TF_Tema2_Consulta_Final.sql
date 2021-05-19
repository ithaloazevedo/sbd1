-- --------  << Farmacia do Posto de Saude  >>  ----------
--
--                    SCRIPT DE CONSULTA
--
-- Data Criacao ...........: 04/05/2021
-- Autor(es) ..............: Ithalo Azevedo
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF_Tema2
--
-- Ultimas Alteracoes
--             05/05/2021  => Adicionando uma view e duas consultas
--             13/05/2021  => Adicionando uma view e duas consultas
--
-- PROJETO => 01 Base de Dados
--         => 24 Tabelas
--         => 04 Consultas
-- 		   => 02 Views
--         => 03 perfis de usuario
--
-- ---------------------------------------------------------

USE TF_Tema2;

-- Consulta das receitas, pacientes e medicos geradas por consultas feitas dentro 
-- de um intervalo de tempo especificado para identificar qual medico que consultou 
-- qual paciente para o qual a receita foi gerada.
SELECT R.idReceita, R.dtPrescricao, M.crm, M.ufMedico, M.nomeMedico, P.numeroSus, P.nomePaciente  FROM RECEITA AS R

		INNER JOIN MEDICO AS M ON M.crm = R.crm AND M.ufMedico = R.ufMedico
        INNER JOIN PACIENTE AS P ON P.numeroSUS = R.numeroSUS
        WHERE DATE(dtPrescricao) > '2021-03-29' AND DATE(dtPrescricao) < '2021-04-20'
        ORDER BY dtPrescricao;

-- Consulta dos atendimentos realizados por funcionarios em uma data especifica para
-- identificar quais funcionarios realizaram atendimentos, os produtos entregues e 
-- sua quantidade.
SELECT A.idAtendimento, A.dtRetirada, F.nomeFuncionario, P.nomeProduto, P.tipoProduto, 
        D.qtdEntregue FROM ATENDIMENTO AS A 

        INNER JOIN FUNCIONARIO AS F ON F.cpfFuncionario = A.cpfFuncionario
        INNER JOIN despacha AS D ON D.idAtendimento = A.idAtendimento
        INNER JOIN PRODUTO AS P ON P.codigoProduto = D.codigoProduto
        WHERE DATE(dtRetirada) > '2021-04-01' AND DATE(dtRetirada) < '2021-05-01'
        ORDER BY dtRetirada;

-- Consulta dos produtos, pedidos externos e notas para gestao de produtos da farmacia.
CREATE OR REPLACE VIEW CONTROLE_FARMACIA
    (codigoProduto, nomeProduto, tipoProduto, idPedidoExt, situacao, idNota, dtEntrega)
AS

SELECT P.codigoProduto, P.nomeProduto, P.tipoProduto, E.idPedidoExt, E.situacao, N.idNota, N.dtEntrega FROM envolve AS v

		INNER JOIN PRODUTO AS P ON P.codigoProduto = v.codigoProduto
        INNER JOIN PEDIDOEXTERNO AS E ON E.idPedidoExt = v.idPedidoExt
        INNER JOIN NOTA AS N ON N.idPedidoExt = E.idPedidoExt
        
        WHERE qtdDisponivel > 10 
        ORDER BY qtdDisponivel;

SELECT *
FROM CONTROLE_FARMACIA;

-- Consulta dos pedidos internos, formulario associados e produtos entregues que visa 
-- identificar determinadas quantidades de medicamentos pegos da farmacia para uso 
-- interno do posto.
CREATE OR REPLACE VIEW CONTROLE_INTERNO 
    (codigoProduto, nomeProduto, tipoProduto, idPedidoInt, dtEntrega, idFormulario, setorDestino, dtPedido)
AS 

SELECT P.codigoProduto, P.nomeProduto, P.tipoProduto, I.idPedidoInt, 
I.dtEntrega, F.idFormulario, F.setorDestino, dtPedido FROM expede AS e 
        INNER JOIN PRODUTO AS P ON P.codigoProduto = e.codigoProduto
        INNER JOIN PEDIDOINTERNO AS I ON I.idPedidoInt = e.idPedidoInt
        INNER JOIN FORMULARIO AS F ON F.idFormulario = I.idFormulario

        WHERE qtdEntregue > 20
        ORDER BY qtdEntregue;

SELECT *
FROM CONTROLE_INTERNO;