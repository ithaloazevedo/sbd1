-- --------  << Farmacia do Posto de Saude  >>  ----------
--
--                    SCRIPT DE REMOCAO (DDL)
--
-- Data Criacao ...........: 03/05/2021
-- Autor(es) ..............: Ithalo
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF2
--
-- Ultimas Alteracoes
--          => Adicionando instrucoes de remocao para as 14 novas tabelas criadas
--
-- PROJETO => 01 Base de Dados
--         => 24 Tabelas
--         => 04 Consultas
-- 		   => 02 Views
--         => 03 perfis de usuario
--
-- ---------------------------------------------------------

-- BASE DE DADOS
USE TF2;

-- TABELAS
DROP TABLE expede;
DROP TABLE compreende;
DROP TABLE preenche;
DROP TABLE abrange;
DROP TABLE emite;
DROP TABLE envolve;
DROP TABLE faz;
DROP TABLE PEDIDOINTERNO;
DROP TABLE FORMULARIO;
DROP TABLE telefoneFornecedor;
DROP TABLE FORNECEDOR;
DROP TABLE NOTA;
DROP TABLE PEDIDOEXTERNO;
DROP TABLE despacha;
DROP TABLE contem;
DROP TABLE ATENDIMENTO;
DROP TABLE PRODUTO;
DROP TABLE LAUDO;
DROP TABLE RECEITAESPECIAL;
DROP TABLE RECEITA;
DROP TABLE FARMACEUTICO;
DROP TABLE FUNCIONARIO;
DROP TABLE PACIENTE;
DROP TABLE MEDICO;

-- USUARIOS
DROP USER funcionario;
DROP USER farmaceutico;
DROP USER diretor;

-- VIEWS
DROP VIEW CONTROLE_FARMACIA;
DROP VIEW CONTROLE_INTERNO;
