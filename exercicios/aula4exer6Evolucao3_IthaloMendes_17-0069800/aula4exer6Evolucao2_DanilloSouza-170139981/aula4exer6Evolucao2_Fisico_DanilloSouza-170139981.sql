-- --------      aula4exer6Evolucao4      ------------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ........... 15/03/2021
-- Autor(es) .............. Danillo Goncalves de Souza
-- Banco de Dados ......... MySQL
-- Banco de Dados(nome) ... aula4exer6Evolucao2
--
--
-- PROJETO = 01 Base de Dados
--         = 09 Tabelas
-- -----------------------------------------------------------------
 
CREATE DATABASE IF NOT EXISTS aula4exer6Evolucao4;
USE aula4exer6Evolucao4;
 
CREATE TABLE CATEGORIA (
    idCategoria INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    tipoCategoria VARCHAR(30) NOT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1;
 
CREATE TABLE MODELO (
    idModelo INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nomeModelo VARCHAR(30) NOT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1;
 
CREATE TABLE PROPRIETARIO (
    cpf VARCHAR(12) PRIMARY KEY NOT NULL,
    nome VARCHAR(50) NOT NULL,
    sexo VARCHAR(1) NOT NULL,
    dataNascimento DATE NOT NULL,
    rua VARCHAR(20) NOT NULL,
    numero INT NOT NULL,
    bairro VARCHAR(30) NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    uf VARCHAR(2) NOT NULL
);
 
CREATE TABLE TIPO_INFRACAO (
    idTipo INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    valor INT NOT NULL,
    descricao VARCHAR(50) NOT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1;
 
CREATE TABLE LOCAL (
    idLocal INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    latitude FLOAT(5) NOT NULL,
    longitude FLOAT(5) NOT NULL,
    velocidadePermitida INT NOT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1;
 
CREATE TABLE AGENTE (
    matricula INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    dataContratacao DATE NOT NULL,
    nome VARCHAR(50) NOT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1000;
 
 
CREATE TABLE VEICULO (
    placa VARCHAR(7) PRIMARY KEY NOT NULL,
    idCategoria INT NOT NULL,
    idModelo INT NOT NULL,
    cpf VARCHAR(12) NOT NULL,
    chassi INT UNIQUE NOT NULL,
    cor VARCHAR(20) NOT NULL,
    anoFabricacao DATE NOT NULL,
    FOREIGN KEY (idCategoria) REFERENCES CATEGORIA (idCategoria),
    FOREIGN KEY (idModelo) REFERENCES MODELO (idModelo),
    FOREIGN KEY (cpf) REFERENCES PROPRIETARIO (cpf)
);
 
 
CREATE TABLE INFRACAO (
    idInfracao INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    placa VARCHAR(7) NOT NULL,
    idLocal INT NOT NULL,
    matricula INT,
    idTipo INT NOT NULL,
    dataHora DATETIME NOT NULL,
    velocidadeMarcada INT NOT NULL,
    FOREIGN KEY (placa) REFERENCES VEICULO (placa),
    FOREIGN KEY (idLocal) REFERENCES LOCAL (idLocal),
    FOREIGN KEY (matricula)REFERENCES AGENTE (matricula),
    FOREIGN KEY (idTipo) REFERENCES TIPO_INFRACAO (idTipo)
) ENGINE = InnoDB AUTO_INCREMENT = 1;
 
CREATE TABLE telefone (
    cpf VARCHAR(12) NOT NULL NOT NULL,
    telefone VARCHAR(11) NOT NULL,
    FOREIGN KEY (cpf) REFERENCES PROPRIETARIO (cpf)
);