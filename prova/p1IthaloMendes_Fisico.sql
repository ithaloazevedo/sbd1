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

CREATE DATABASE IF NOT EXISTS IthaloAzevedo;
USE IthaloAzevedo;

CREATE TABLE requere (
	codigoRequisito VARCHAR(6) NOT NULL,
    codigoDisciplina VARCHAR(6) NOT NULL,
    
    CONSTRAINT requere_FK FOREIGN KEY (codigoRequisito) REFERENCES DISCIPLINA (codigoDisciplina),
    CONSTRAINT requere_Requisito_FK FOREIGN KEY (codigoDisciplina) REFERENCES DISCIPLINA (codigoDisciplina)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE recebe (
	codigoDisciplina VARCHAR(6) NOT NULL,
    idSala INT NOT NULL,

    CONSTRAINT recebe_Disciplina_FK FOREIGN KEY (codigoDisciplina) REFERENCES DISCIPLINA (codigoDisciplina),
    CONSTRAINT recebe_Sala_FK FOREIGN KEY (idSala) REFERENCES SALA (idSala)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE DISCIPLINA (
	codigoDisciplina VARCHAR(6) NOT NULL,
    nome VARCHAR(50),
    periodo CHAR,

    CONSTRAINT DISCIPLINA_PK PRIMARY KEY (codigoDisciplina)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE SALA (
	largura INT,
    comprimento INT,
    area INT NOT NULL,
    cadeirasDisponiveis INT NOT NULL,
    tipo CHAR NOT NULL,
    idSala INT NOT NULL,

    CONSTRAINT SALA_PK PRIMARY KEY (idSala)
) ENGINE = InnoDB AUTO_INCREMENT = 1;