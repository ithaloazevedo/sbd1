-- --------  << farmaciaPostoSaude >>  ----------
--
--                    SCRIPT DE REMOCAO (DDL)
--
-- Data Criacao ...........: 30/04/2021
-- Autor(es) ..............: Igor Paiva, Ithalo Mendes, Kleidson Correa e Lucas Santos
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF2_2B_lucassantos
--
-- Ultimas Alteracoes
--   05/05/2021 => Remocao de nova tabela FARMACEUTICO
--              => Remocao de nova tabela REQUISICAO
--              => Remocao de nova tabela arrecada
--              => Mudanca nome da tabela MEDICO para PRESCRITOR
--   07/05/2021 => Remocao de nova tabela requisita
--   11/05/2021 => Remocao da nova visao V_PRESCRITOR_RECEITA
--
-- PROJETO => 01 Base de Dados
--         => 19 Tabelas
--         => 02 Visoes
--         => 03 Usuarios
--
-- ---------------------------------------------------------

-- SELECIONAR A BASE DE DADOS
USE TF2_2B_lucassantos;

-- REMOCOES USUARIOS
DROP USER 'administrador';
DROP USER 'balconista';
DROP USER 'farmaceutico';

-- REMOCAO DAS VIEWS
DROP VIEW V_PEDIDOS_SETOR;
DROP VIEW V_PRESCRITOR_RECEITA;

-- REMOCOES TABELAS
DROP TABLE recebe;
DROP TABLE solicita;
DROP TABLE consome;
DROP TABLE contem;
DROP TABLE PEDIDO_PRODUTO;
DROP TABLE item;
DROP TABLE RECEITA_INSUMO;
DROP TABLE arrecada;
DROP TABLE requisita;
DROP TABLE REQUISICAO;
DROP TABLE PRODUTO;
DROP TABLE NOTIFICACAO;
DROP TABLE MEDICAMENTO;
DROP TABLE RECEITA;
DROP TABLE PRESCRITOR;
DROP TABLE ATENDIMENTO;
DROP TABLE PACIENTE;
DROP TABLE FARMACEUTICO;
DROP TABLE FUNCIONARIO;
