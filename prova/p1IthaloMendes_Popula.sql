-- --------     << Prova 01 >>     ------------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 06/04/2021
-- Autor(es) ..............: Ithalo Luiz de Azevedo Mendes
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: IthaloAzevedo
--
-- PROJETO => 07 Base de Dados
--         => 11 Tabelas
--
-- -----------------------------------------------------------------

USE IthaloAzevedo;

INSERT INTO DISCIPLINA VALUES
    ('FGA001', 'Sistema de Banco de Dados 1', 'V'),
    ('XYZ145', 'Calculo 3', 'M'),
    ('UNB655', 'Trabalho de Conclusão de Curso 1', 'N');

INSERT INTO SALA VALUES
    (10, 10, 100, 60, 'C', 32),
    (15, 10, 150, 72, 'C', 04),
    (10, 5, 50, 20, 'L', 51);
INSERT INTO requere VALUES
    ('FGA001', 'XYZ145'),

INSERT INTO recebe VALUES
    ('FGA0011', 04),
