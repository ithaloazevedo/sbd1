-- --------  << Farmacia do Posto de Saude  >>  ----------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 03/05/2021
-- Autor(es) ..............: Ithalo Azevedo
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF2
--
-- Ultimas Alteracoes
--         => Criacao de 14 novas tabelas
--         => Remocao do atributo dtRetorno da tabela ATENDIMENTO
--         => Correcao de siglas e remocao do tamanho dos atributos int e bigint
--
-- PROJETO => 01 Base de Dados
--         => 24 Tabelas
--         => 04 Consultas
-- 		   => 02 Views
--         => 03 perfis de usuario
--
-- ---------------------------------------------------------

-- BASE DE DADOS
CREATE DATABASE
    IF NOT EXISTS TF2;

USE TF2;

-- TABELAS

CREATE TABLE MEDICO (
    crm BIGINT NOT NULL,
    ufMedico CHAR(2) NOT NULL,
    nomeMedico VARCHAR(50) NOT NULL,
    
    CONSTRAINT MEDICO_PK PRIMARY KEY (crm, ufMedico)
) ENGINE = InnoDB;

CREATE TABLE PACIENTE (
    numeroSus BIGINT NOT NULL,
    nomePaciente VARCHAR(50) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    rua VARCHAR(50) NOT NULL,
    numero INT NOT NULL,
    ufPaciente CHAR(2) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    telefonePaciente BIGINT NOT NULL,
    rg BIGINT NOT NULL,
    ufRg CHAR(2) NOT NULL,
    
    CONSTRAINT PACIENTE_PK PRIMARY KEY (numeroSus)
) ENGINE = InnoDB;

CREATE TABLE FUNCIONARIO (
    cpfFuncionario BIGINT,
    nomeFuncionario VARCHAR(50) NOT NULL,
    telefoneFuncionario BIGINT NOT NULL,
    
    CONSTRAINT FUNCIONARIO_PK PRIMARY KEY (cpfFuncionario)
) ENGINE = InnoDB;

CREATE TABLE FARMACEUTICO (
    crf BIGINT NOT NULL,
    ufFarmaceutico CHAR(2) NOT NULL,
    cpfFuncionario BIGINT NOT NULL,
    
    CONSTRAINT FARMACEUTICO_PK PRIMARY KEY (crf, ufFarmaceutico),
    
    CONSTRAINT FARMACEUTICO_FUNCIONARIO_FK FOREIGN KEY (cpfFuncionario)
		REFERENCES FUNCIONARIO(cpfFuncionario)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
) ENGINE = InnoDB;

CREATE TABLE RECEITA (
    idReceita INT NOT NULL AUTO_INCREMENT,
    dtPrescricao DATE NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    rua VARCHAR(50) NOT NULL,
    numero INT NOT NULL,
    ufReceita CHAR(2) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    numeroSus BIGINT NOT NULL,
    crm BIGINT NOT NULL,
    ufMedico CHAR(2) NOT NULL,
    crf BIGINT NOT NULL,
    ufFarmaceutico CHAR(2) NOT NULL,
    
    CONSTRAINT RECEITA_PK PRIMARY KEY (idReceita),
    
    CONSTRAINT RECEITA_MEDICO_FK FOREIGN KEY (crm, ufMedico) 
		REFERENCES MEDICO(crm, ufMedico)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
        
    CONSTRAINT RECEITA_PACIENTE_FK FOREIGN KEY (numeroSus) 
		REFERENCES PACIENTE(numeroSus)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
        
    CONSTRAINT RECEITA_FARMACEUTICO_FK FOREIGN KEY (crf, ufFarmaceutico) 
        REFERENCES FARMACEUTICO(crf, ufFarmaceutico)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE RECEITAESPECIAL (
    codigoUnico BIGINT NOT NULL,
    ufEspecial CHAR(2) NOT NULL,
    tipo ENUM('A1', 'A2', 'A3', 'B1', 'B2', 'C1', 'C2', 'C3', 'C4', 'C5') NOT NULL,
    idReceita INT NOT NULL,
    
    CONSTRAINT RECEITAESPECIAL_PK PRIMARY KEY (codigoUnico),
    
    CONSTRAINT RECEITAESPECIAL_RECEITA_FK FOREIGN KEY (idReceita) 
		REFERENCES RECEITA(idReceita)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
) ENGINE = InnoDB;

CREATE TABLE LAUDO (
    idLaudo INT NOT NULL AUTO_INCREMENT,
    duracaoTratamento VARCHAR(10) NOT NULL,
    diagnostico VARCHAR(30) NOT NULL,
    cid CHAR(3) NOT NULL,
    idReceita INT NOT NULL,
    
    CONSTRAINT LAUDO_PK PRIMARY KEY (idLaudo),
    
    CONSTRAINT LAUDO_RECEITA_FK FOREIGN KEY (idReceita) 
		REFERENCES RECEITA(idReceita)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE PRODUTO (
    codigoProduto BIGINT NOT NULL,
    nomeProduto VARCHAR(50) NOT NULL,
    tipoUnidade ENUM('comprimido', 'frasco', 'caixa') NOT NULL,
    qtdDisponivel INT NOT NULL,
    tipoProduto ENUM('medicamento', 'insumo') NOT NULL,
    
    CONSTRAINT PRODUTO_PK PRIMARY KEY (codigoProduto)
) ENGINE = InnoDB;

CREATE TABLE ATENDIMENTO (
    idAtendimento INT NOT NULL AUTO_INCREMENT,
    dtRetirada DATE NOT NULL,
    idReceita INT NOT NULL,
    cpfFuncionario BIGINT NOT NULL,
    
    CONSTRAINT ATENDIMENTO_PK PRIMARY KEY (idAtendimento),
    
    CONSTRAINT ATENDIMENTO_RECEITA_FK FOREIGN KEY (idReceita) 
		REFERENCES RECEITA(idReceita)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
        
    CONSTRAINT ATENDIMENTO_FUNCIONARIO_FK FOREIGN KEY (cpfFuncionario) 
		REFERENCES FUNCIONARIO(cpfFuncionario)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE contem (
    idReceita INT NOT NULL,
    codigoProduto BIGINT NOT NULL,
    posologia VARCHAR(100) NOT NULL,
    
    CONSTRAINT contem_RECEITA_FK FOREIGN KEY (idReceita) 
		REFERENCES RECEITA(idReceita)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
        
    CONSTRAINT contem_PRODUTO_FK FOREIGN KEY (codigoProduto) 
        REFERENCES PRODUTO(codigoProduto)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
) ENGINE = InnoDB;

CREATE TABLE despacha (
    codigoProduto BIGINT NOT NULL,
    idAtendimento INT NOT NULL,
    qtdEntregue INT NOT NULL,
    
    CONSTRAINT despacha_PRODUTO_FK FOREIGN KEY (codigoProduto) 
        REFERENCES PRODUTO(codigoProduto)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
        
    CONSTRAINT despacha_ATENDIMENTO_FK FOREIGN KEY (idAtendimento) 
        REFERENCES ATENDIMENTO(idAtendimento)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
) ENGINE = InnoDB;

CREATE TABLE PEDIDOEXTERNO (
    idPedidoExt INT NOT NULL AUTO_INCREMENT, 
    dtPedido DATE NOT NULL,
    situacao ENUM('aprovado', 'rejeitado', 'aguardando') NOT NULL,
    
    CONSTRAINT PEDIDOEXTERNO_PK PRIMARY KEY (idPedidoExt)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE NOTA (
    idNota INT NOT NULL AUTO_INCREMENT,
    dtEntrega DATE NOT NULL,
    dtEmissao DATE NOT NULL,
    idPedidoExt INT NOT NULL,
    crf BIGINT NOT NULL,
    ufFarmaceutico CHAR(2) NOT NULL,
    
    CONSTRAINT NOTA_PK PRIMARY KEY (idNota),
    
    CONSTRAINT NOTA_PEDIDOEXTERNO_FK FOREIGN KEY (idPedidoExt)
        REFERENCES PEDIDOEXTERNO(idPedidoExt)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
        
    CONSTRAINT NOTA_FARMACEUTICO_FK FOREIGN KEY (crf, ufFarmaceutico)
        REFERENCES FARMACEUTICO(crf, ufFarmaceutico)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE FORNECEDOR (
    cnpjFornecedor BIGINT NOT NULL,
    nomeFornecedor VARCHAR(50) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    rua VARCHAR(50) NOT NULL,
    numero INT NOT NULL,
    ufFornecedor CHAR(2) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    CONSTRAINT FORNECEDOR_PK PRIMARY KEY (cnpjFornecedor)
) ENGINE = InnoDB;

CREATE TABLE telefoneFornecedor (
    cnpjFornecedor BIGINT NOT NULL,
    telefoneFornecedor BIGINT NOT NULL,
    
    CONSTRAINT telefoneFornecedor_UK UNIQUE KEY (telefoneFornecedor),
    
    CONSTRAINT telefoneFornecedor_FORNECEDOR_FK FOREIGN KEY (cnpjFornecedor)
        REFERENCES FORNECEDOR(cnpjFornecedor)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
) ENGINE = InnoDB;

CREATE TABLE FORMULARIO (
    idFormulario INT NOT NULL AUTO_INCREMENT,
    setorDestino VARCHAR(30) NOT NULL,
    dtPedido DATE NOT NULL,
    cpfFuncionario BIGINT NOT NULL,
    
    CONSTRAINT FORMULARIO_PK PRIMARY KEY (idFormulario),
        
     CONSTRAINT FORMULARIO_FUNCIONARIO_FK FOREIGN KEY (cpfFuncionario)
        REFERENCES FUNCIONARIO(cpfFuncionario)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT   
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE PEDIDOINTERNO (
    idPedidoInt INT NOT NULL AUTO_INCREMENT,
    dtEntrega DATE NOT NULL,
    idFormulario INT NOT NULL,
    
    CONSTRAINT PEDIDOINTERNO_PK PRIMARY KEY (idPedidoInt),
    
    CONSTRAINT PEDIDOINTERNO_FORMULARIO_FK FOREIGN KEY (idFormulario)
        REFERENCES FORMULARIO(idFormulario)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE faz (
    crf BIGINT NOT NULL,
    ufFarmaceutico CHAR(2) NOT NULL,
    idPedidoExt INT NOT NULL,
    
    CONSTRAINT faz_FARMACEUTICO_FK FOREIGN KEY (crf, ufFarmaceutico)
        REFERENCES FARMACEUTICO(crf, ufFarmaceutico)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
        
    CONSTRAINT faz_PEDIDOEXTERNO_FK FOREIGN KEY (idPedidoExt)
        REFERENCES PEDIDOEXTERNO(idPedidoExt)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
) ENGINE = InnoDB;

CREATE TABLE envolve (
    codigoProduto BIGINT NOT NULL,
    idPedidoExt INT NOT NULL,
    qtdNecessaria INT NOT NULL,
    
    CONSTRAINT envolve_PRODUTO_FK FOREIGN KEY (codigoProduto)
        REFERENCES PRODUTO(codigoProduto)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
        
    CONSTRAINT envolve_PEDIDOEXTERNO_FK FOREIGN KEY (idPedidoExt)
        REFERENCES PEDIDOEXTERNO(idPedidoExt)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
) ENGINE = InnoDB;

CREATE TABLE emite (
    cnpjFornecedor BIGINT NOT NULL,
    idNota INT NOT NULL,
    
    CONSTRAINT emite_FORNECEDOR_FK FOREIGN KEY (cnpjFornecedor)
        REFERENCES FORNECEDOR(cnpjFornecedor)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
        
    CONSTRAINT emite_NOTA_FK FOREIGN KEY (idNota)
        REFERENCES NOTA(idNota)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
) ENGINE = InnoDB;

CREATE TABLE abrange (
    codigoProduto BIGINT NOT NULL,
    idNota INT NOT NULL,
    qtdEntregue INT NOT NULL,
    
    CONSTRAINT abrange_NOTA_FK FOREIGN KEY (idNota)
        REFERENCES NOTA(idNota)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
        
    CONSTRAINT abrange_PRODUTO_FK FOREIGN KEY (codigoProduto)
        REFERENCES PRODUTO(codigoProduto)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
) ENGINE = InnoDB;

CREATE TABLE preenche (
    cpfFuncionario BIGINT NOT NULL,
    idFormulario INT NOT NULL,
    
    CONSTRAINT preenche_FORMULARIO_FK FOREIGN KEY (idFormulario)
        REFERENCES FORMULARIO(idFormulario)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
        
    CONSTRAINT preenche_FUNCIONARIO_FK FOREIGN KEY (cpfFuncionario)
        REFERENCES FUNCIONARIO(cpfFuncionario)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
) ENGINE = InnoDB;

CREATE TABLE compreende (
    codigoProduto BIGINT NOT NULL,
    idFormulario INT NOT NULL,
    
    CONSTRAINT compreende_PRODUTO_FK FOREIGN KEY (codigoProduto)
        REFERENCES PRODUTO(codigoProduto)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
        
    CONSTRAINT compreende_FORMULARIO_FK FOREIGN KEY (idFormulario)
        REFERENCES FORMULARIO(idFormulario)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
) ENGINE = InnoDB;

CREATE TABLE expede (
    codigoProduto BIGINT NOT NULL,
    idPedidoInt INT NOT NULL,
    qtdEntregue INT NOT NULL,
    
    CONSTRAINT expede_PEDIDOINTERNO_FK FOREIGN KEY (idPedidoInt)
        REFERENCES PEDIDOINTERNO(idPedidoInt)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
        
    CONSTRAINT expede_PRODUTO_FK FOREIGN KEY (codigoProduto)
        REFERENCES PRODUTO(codigoProduto)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
) ENGINE = InnoDB;