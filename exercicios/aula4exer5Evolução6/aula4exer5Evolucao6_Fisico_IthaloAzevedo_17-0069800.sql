-- --------     << Clínica Médica >>     ------------
-- 
--                    SCRIPT FISICO
-- 
-- Data Criacao ...........: 29/03/2021
-- Autor(es) ..............: Ithalo Luiz de Azevedo Mendes
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: aula4exer5Evolucao6
-- 
-- Data Ultima Alteracao ..: 29/03/2021
-- 
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
-- -----------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS aula4exer5Evolucao6;
USE aula4exer5Evolucao6;

CREATE TABLE MEDICO (
    nomeCompleto VARCHAR(100) NOT NULL,
    crm VARCHAR(9) NOT NULL,
    estado CHAR(2) NOT NULL,
    CONSTRAINT MEDICO_PK PRIMARY KEY(crm, estado)
) ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8 ;

CREATE TABLE CONSULTA(
    data DATE NOT NULL,
    idConsulta INT NOT NULL,
    hora TIMESTAMP NOT NULL,
    crm VARCHAR(8) NOT NULL,
    ufMedico CHAR(2),
    idPaciente INT NOT NULL,
    CONSTRAINT CONSULTA_PK PRIMARY KEY (idConsulta),
    CONSTRAINT CONSULTA_PACIENTE_FK FOREIGN KEY (idPaciente) REFERENCES PACIENTE (idPaciente),
	CONSTRAINT CONSULTA_MEDICO_FK FOREIGN KEY (crm, estado) REFERENCES MEDICO (crm, estado)
) ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8 ;

CREATE TABLE PACIENTE(
    idPaciente INT NOT NULL,
    nomeCompleto VARCHAR(100) NOT NULL,
    dtNascimento DATE NOT NULL,
    sexo VARCHAR(100),
    rua VARCHAR(100),
    numero INT,
    bairro VARCHAR(100),
    complemento VARCHAR(100),
    cidade VARCHAR(100),
    cep CHAR(8),
    estado VARCHAR(100),
    idade INT NOT NULL
    CONSTRAINT PACIENTE_PK PRIMARY KEY (idPaciente)
) ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8 ;

CREATE TABLE ESPECIALIDADE(
    nomeEspecialidade VARCHAR(100) NOT NULL,
    idEspecialidade INT NOT NULL,
    CONSTRAINT ESPECIALIDADE_PK PRIMARY KEY (idEspecialidade)
) ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8 ;

CREATE TABLE possui(
    crm VARCHAR(9) NOT NULL,
    estado CHAR(2) NOT NULL,
    idEspecialidade INT NOT NULL,
    CONSTRAINT possui_ESPECIALIDADE_FK FOREIGN KEY (idEspecialidade) REFERENCES ESPECIALIDADE (idEspecialidade),
    CONSTRAINT possui_MEDICO_FK FOREIGN KEY (crm, estado) REFERENCES MEDICO (crm, estado)
) ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8 ;

CREATE TABLE telefone(
    idPaciente INT NOT NULL,
    telefone BIGINT NOT NULL,
    CONSTRAINT telefone_PACIENTE_FK FOREIGN KEY (idPaciente) REFERENCES PACIENTE (idPaciente)
) ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8 ;

CREATE TABLE RECEITA(
    idReceita INT NOT NULL,
    dtEmissao DATE NOT NULL,
    idConsulta INT NOT NULL,
    CONSTRAINT RECEITA_PK PRIMARY KEY (idReceita),
    CONSTRAINT RECEITA_CONSULTA_FK FOREIGN KEY (idConsulta) REFERENCES CONSULTA (idConsulta)
) ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8 ;

CREATE TABLE MEDICAMENTO(
    nomeMedicamento VARCHAR(100) NOT NULL,
    idMedicamento INT NOT NULL,
    miligramas INT,
    CONSTRAINT MEDICAMENTO_PK PRIMARY KEY (idMedicamento)
)ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8 ;

CREATE TABLE contem(
    idMedicamento INT NOT NULL,
    idReceita INT NOT NULL,
    posologia VARCHAR(100),
    CONSTRAINT contem_MEDICAMENTO_FK FOREIGN KEY (idMedicamento) REFERENCES MEDICAMENTO (idMedicamento),
    CONSTRAINT contem_RECEITA_FK FOREIGN KEY (idReceita) REFERENCES RECEITA (idReceita)
)ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8 ;
