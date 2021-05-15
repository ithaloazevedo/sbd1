-- --------      aula4exer6Evolucao4      ------------
--
--                    SCRIPT DE POPULAR (DDL)
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
 


USE aula4exer6Evolucao4;

INSERT INTO CATEGORIA (tipoCategoria) VALUES 
    ('AUTOMOVEL'),
	('BARCO'),
	('MOTO');
 
INSERT INTO MODELO (nomeModelo) VALUES
    ('Gol'),
	('Fox'),
	('CG50');
 
INSERT INTO PROPRIETARIO ( cpf, nome, sexo, dataNascimento, rua, numero, bairro, cidade, uf) VALUES 
    ("1234567890", "Daniel", 'M', DATE('1990-12-30'), 'Norte', 204, 'Gama', 'Brasília', 'DF'),
	("1234567891", "Daniela", 'F', DATE('1994-11-04'), 'Sul', 205, 'Aguas Claras', 'Brasília', 'DF'),
	("1234567892", "João", 'M', DATE('1988-8-20'), "Oeste", 206, 'Arniqueira', 'Brasília', 'DF');
 
INSERT INTO TIPO_INFRACAO ( valor, descricao) VALUES 
    ( 130, 'Furou Sinal' ),
	( 293, 'Travessia Proibida' ),
	( 195, 'Não Usou Cinto' );
 
INSERT INTO LOCAL (latitude, longitude, velocidadePermitida) VALUES
    ( 54.12540, 311.64920, 80 ),
	( 30.19280, 101.10931, 50 ),
	( 20.00249, 502.19232, 60 );
 
INSERT INTO AGENTE (nome, dataContratacao) VALUES
	( 'Joaquim', DATE('2010-08-30') ),
	( 'Cristian', DATE('2012-09-30') ),
	( 'Yan', DATE('2015-08-10') ); 
 
 
INSERT INTO VEICULO ( placa, idCategoria, idModelo, cpf, chassi, cor, anoFabricacao) VALUES 
    ( 'abc1234', 1,1, "1234567890",  312212, 'Azul', DATE('2001-01-01')),
	('abc1235', 1, 1, "1234567891", 31221332, 'Branco', DATE('2010-01-01')),
	('abc1236', 1, 1,"1234567892", 2313211, 'Vermelho',  DATE('2015-01-01'));
 
 
INSERT INTO INFRACAO (
    placa,
    idLocal,
    matricula,
    idTipo,
    dataHora,
    velocidadeMarcada
) VALUES 
	('abc1234', 1, 1001 , 1, "2021-03-13T00:03:31+00:00", 60 ),
	('abc1235', 2, NULL , 2, "2021-02-18T00:03:31+00:00", 70 ),
	('abc1236', 3, NULL , 3, "2021-01-18T00:03:31+00:00", 120 );
 
INSERT INTO telefone (cpf,telefone) VALUES 
    ("1234567890", "1231232312"), 
    ("1234567891", "8231232313"), 
    ("1234567892", "9231232312");