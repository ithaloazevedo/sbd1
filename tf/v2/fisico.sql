-- --------  << farmaciaPostoSaude >>  ----------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 30/04/2021
-- Autor(es) ..............: Igor Paiva, Ithalo Mendes, Kleidson Correa e Lucas Santos
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF2_2B_lucassantos
--
-- Ultimas Alteracoes
--   05/05/2021 => Criacao de nova tabela FARMACEUTICO
--              => Criacao de nova tabela REQUISICAO
--              => Criacao de nova tabela arrecada
--              => Criacao da especializacao FARMACEUTICO de FUNCIONARIO
--              => Remocao do atributo cargo na tabela FUNCIONARIO
--              => Mudanca no nome da entidade MEDICO para PRESCRITOR
--              => Mudanca no atributo idMedico para idPrescritor
--   07/05/2021 => Remoção dos atributos codigo e quantidadeRequisitada na tabela REQUISICAO
--              => criação da tabela requisita
--   11/05/2021 => Adicao do atributo cargo na tabela FUNCIONARIO
--              => Adicao do atributo horarioAtendimento na tabela ATENDIMENTO
--              => Adicao do atributo tipo na tabela MEDICAMENTO
--              => Adicao do atributo validade na tabela RECEITA
--
-- PROJETO => 01 Base de Dados
--         => 19 Tabelas
--         => 02 Visoes
--         => 03 Usuarios
--
-- ---------------------------------------------------------

-- BASE DE DADOS 
CREATE DATABASE
  IF NOT EXISTS TF2_2B_lucassantos;

-- SELECIONAR A BASE DE DADOS
USE TF2_2B_lucassantos;

-- TABELAS
CREATE TABLE FUNCIONARIO (
    cpf BIGINT UNSIGNED NOT NULL,
    nome VARCHAR(100) NOT NULL,
    dataAdmissao DATE NOT NULL,
    cargo VARCHAR(30) NOT NULL,
    CONSTRAINT FUNCIONARIO_PK PRIMARY KEY (cpf)
) ENGINE = InnoDB;


CREATE TABLE FARMACEUTICO (
    cpf BIGINT UNSIGNED NOT NULL,
    crf INT UNSIGNED NOT NULL,
    unidadeFederativa CHAR(2) NOT NULL,
    CONSTRAINT FARMACEUTICO_PK PRIMARY KEY (cpf),
    CONSTRAINT FARMACEUTICO_UK UNIQUE KEY (crf, unidadeFederativa),
    CONSTRAINT FUNCIONARIO_FK FOREIGN KEY (cpf)
        REFERENCES FUNCIONARIO (cpf)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
) ENGINE = InnoDB;


CREATE TABLE PACIENTE (
    numeroSus INT UNSIGNED NOT NULL,
    nomeCompleto VARCHAR(100) NOT NULL,
    registroGeral INT UNSIGNED NOT NULL,
    orgaoEmissor VARCHAR(6) NOT NULL,
    bairro VARCHAR(30) NOT NULL,
    logradouro VARCHAR(50) NOT NULL,
    numero SMALLINT UNSIGNED NOT NULL,
    complemento VARCHAR(30),
    cidade VARCHAR(30) NOT NULL,
    unidadeFederativa CHAR(2) NOT NULL,
    CONSTRAINT PACIENTE_PK PRIMARY KEY (numeroSus),
    CONSTRAINT identidade_UK UNIQUE KEY (registroGeral, orgaoEmissor)
) ENGINE = InnoDB;


CREATE TABLE ATENDIMENTO (
    idAtendimento INT UNSIGNED NOT NULL AUTO_INCREMENT,
    dataAtendimento DATE NOT NULL,
    horarioAtendimento TIME NOT NULL,
    cpf BIGINT UNSIGNED NOT NULL,
    numeroSus INT UNSIGNED NOT NULL,
    CONSTRAINT ATENDIMENTO_PK PRIMARY KEY (idAtendimento),
    CONSTRAINT ATENDIMENTO_FUNCIONARIO_FK FOREIGN KEY (cpf)
        REFERENCES FUNCIONARIO (cpf)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
    CONSTRAINT ATENDIMENTO_PACIENTE_FK FOREIGN KEY (numeroSus)
        REFERENCES PACIENTE (numeroSus)
		ON DELETE RESTRICT
        ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE PRESCRITOR (
    idPrescritor INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    unidadeFederativa CHAR(2) NOT NULL,
    siglaConselho VARCHAR(5) NOT NULL,
    numeroConselho INT UNSIGNED NOT NULL,
    CONSTRAINT PRESCRITOR_PK PRIMARY KEY (idPrescritor),
    CONSTRAINT PRESCRITOR_UK UNIQUE KEY (unidadeFederativa, siglaConselho, numeroConselho)
) ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE RECEITA (
    idReceita BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    dataEmissao DATE NOT NULL,
    validade SMALLINT UNSIGNED NOT NULL,
    enderecoClinica VARCHAR(150),
    telefoneClinica BIGINT UNSIGNED,
    idAtendimento INT UNSIGNED NOT NULL,
    idPrescritor INT UNSIGNED NOT NULL,
    CONSTRAINT RECEITA_PK PRIMARY KEY (idReceita),
    CONSTRAINT RECEITA_PRESCRITOR_FK FOREIGN KEY (idPrescritor)
        REFERENCES PRESCRITOR (idPrescritor)
		ON DELETE RESTRICT
        ON UPDATE RESTRICT,
    CONSTRAINT RECEITA_ATENDIMENTO_FK FOREIGN KEY (idAtendimento)
        REFERENCES ATENDIMENTO (idAtendimento)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE MEDICAMENTO (
    idMedicamento INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    miligramas DECIMAL(6,2),
    principioAtivo VARCHAR(30),
    tipo VARCHAR(30) DEFAULT 'Comum',
    CONSTRAINT MEDICAMENTO_PK PRIMARY KEY (idMedicamento)
) ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE NOTIFICACAO (
    unidadeFederativa CHAR(2) NOT NULL,
    numero INT UNSIGNED NOT NULL,
    tipo CHAR(2) NOT NULL,
    idReceita BIGINT UNSIGNED NOT NULL,
    CONSTRAINT NOTIFICACAO_RECEITA_UK UNIQUE KEY (idReceita),
    CONSTRAINT NOTIFICACAO_UK UNIQUE KEY (tipo, numero, unidadeFederativa),
    CONSTRAINT NOTIFICACAO_RECEITA_FK FOREIGN KEY (idReceita)
        REFERENCES RECEITA (idReceita)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
) ENGINE = InnoDB;


CREATE TABLE PRODUTO (
    codigo VARCHAR(9) NOT NULL,
    tipo ENUM('I', 'C') NOT NULL,
    nome VARCHAR(100) NOT NULL,
    quantidade INT UNSIGNED NOT NULL,
    CONSTRAINT PRODUTO_PK PRIMARY KEY (codigo)
) ENGINE = InnoDB;


CREATE TABLE REQUISICAO (
    idRequisicao INT UNSIGNED NOT NULL AUTO_INCREMENT,
    dataRequisicao DATE NOT NULL,
    cpf BIGINT UNSIGNED NOT NULL,
    CONSTRAINT REQUISICAO_PK PRIMARY KEY (idRequisicao),
    CONSTRAINT REQUISICAO_FARMACEUTICO_FK FOREIGN KEY (cpf)
        REFERENCES FARMACEUTICO (cpf)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE requisita (
    quantidadeRequisitada INT UNSIGNED NOT NULL,
    codigo VARCHAR(9) NOT NULL,
    idRequisicao INT UNSIGNED NOT NULL,
    CONSTRAINT requisita_REQUISICAO_FK FOREIGN KEY (idRequisicao)
        REFERENCES REQUISICAO (idRequisicao)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
    CONSTRAINT requisita_PRODUTO_FK FOREIGN KEY (codigo)
        REFERENCES PRODUTO (codigo)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
) ENGINE = InnoDB;


CREATE TABLE arrecada (
    quantidadeArrecadada INT UNSIGNED NOT NULL,
    codigo VARCHAR(9) NOT NULL,
    idRequisicao INT UNSIGNED NOT NULL,
    CONSTRAINT arrecada_REQUISICAO_FK FOREIGN KEY (idRequisicao)
        REFERENCES REQUISICAO (idRequisicao)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
    CONSTRAINT arrecada_PRODUTO_FK FOREIGN KEY (codigo)
        REFERENCES PRODUTO (codigo)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
) ENGINE = InnoDB;


CREATE TABLE RECEITA_INSUMO (
    idReceitaInsumo INT UNSIGNED NOT NULL AUTO_INCREMENT,
    dataEmissao DATE NOT NULL,
    numeroSus INT UNSIGNED NOT NULL,
    idPrescritor INT UNSIGNED NOT NULL,
    CONSTRAINT RECEITA_INSUMO_PK PRIMARY KEY (idReceitaInsumo)
) ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE item (
    item VARCHAR(100) NOT NULL,
    idReceitaInsumo INT UNSIGNED NOT NULL,
    CONSTRAINT item_RECEITA_INSUMO_FK FOREIGN KEY (idReceitaInsumo)
        REFERENCES RECEITA_INSUMO (idReceitaInsumo)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
) ENGINE = InnoDB;


CREATE TABLE PEDIDO_PRODUTO (
    idPedido INT UNSIGNED NOT NULL AUTO_INCREMENT,
    setor VARCHAR(30) NOT NULL,
    dataPedido DATE NOT NULL,
    solicitante VARCHAR(100) NOT NULL,
    CONSTRAINT PEDIDO_PRODUTO_PK PRIMARY KEY (idPedido)
) ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE contem (
    posologia VARCHAR(100) NOT NULL,
    quantidade INT UNSIGNED NOT NULL,
    tipoUso VARCHAR(30),
    idReceita BIGINT UNSIGNED NOT NULL,
    idMedicamento INT UNSIGNED NOT NULL,
    CONSTRAINT contem_RECEITA_FK FOREIGN KEY (idReceita)
        REFERENCES RECEITA (idReceita)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
    CONSTRAINT contem_MEDICAMENTO_FK FOREIGN KEY (idMedicamento)
        REFERENCES MEDICAMENTO (idMedicamento)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
) ENGINE = InnoDB;


CREATE TABLE consome (
    quantidadeConsumida INT UNSIGNED NOT NULL,
    codigo VARCHAR(9) NOT NULL,
    idAtendimento INT UNSIGNED NOT NULL,
    CONSTRAINT consome_UK UNIQUE KEY (codigo, idAtendimento),
    CONSTRAINT consome_PRODUTO_FK FOREIGN KEY (codigo)
        REFERENCES PRODUTO (codigo)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
    CONSTRAINT consome_ATENDIMENTO_FK FOREIGN KEY (idAtendimento)
        REFERENCES ATENDIMENTO (idAtendimento)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
) ENGINE = InnoDB;


CREATE TABLE solicita (
    quantidadeSolicitada INT UNSIGNED NOT NULL,
    codigo VARCHAR(9) NOT NULL,
    idPedido INT UNSIGNED NOT NULL,
    CONSTRAINT solicita_PRODUTO_FK FOREIGN KEY (codigo)
        REFERENCES PRODUTO (codigo)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
    CONSTRAINT solicita_PEDIDO_FK FOREIGN KEY (idPedido)
        REFERENCES PEDIDO_PRODUTO (idPedido)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
) ENGINE = InnoDB;


CREATE TABLE recebe (
    quantidadeRecebida INT UNSIGNED NOT NULL,
    idPedido INT UNSIGNED NOT NULL,
    codigo VARCHAR(9) NOT NULL,
    CONSTRAINT recebe_PRODUTO_FK FOREIGN KEY (codigo)
        REFERENCES PRODUTO (codigo)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
    CONSTRAINT recebe_PEDIDO_FK FOREIGN KEY (idPedido)
        REFERENCES PEDIDO_PRODUTO (idPedido)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
) ENGINE = InnoDB;
