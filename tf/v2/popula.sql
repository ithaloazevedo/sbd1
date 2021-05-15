-- --------  << farmaciaPostoSaude >>  ----------
--
--                    SCRIPT DE POPULA (DML)
--
-- Data Criacao ...........: 30/04/2021
-- Autor(es) ..............: Igor Paiva, Ithalo Mendes, Kleidson Correa e Lucas Santos
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF2_2B_lucassantos
--
-- Ultimas Alteracoes
--   05/05/2021 => Insercoes para a nova tabela FARMACEUTICO
--              => Insercoes para a nova tabela REQUISICAO
--              => Insercoes para a nova tabela arrecada
--              => Mudanca nome da tabela MEDICO para PRESCRITOR
--              => Mudanca do atributo idMedico para idPrescritor
--   07/05/2021 => Edição dos dados da tabela REQUISICAO
--              => Insercoes para a nova tabela requista
--              => Adicao das insercoes restantes para possuir 5 tuplas por tabela
--   11/05/2021 => Adicao do atributo cargo nas insercoes da tabela FUNCIONARIO
--              => Adicao do atributo horarioAtendimento nas insercoes da tabela ATENDIMENTO
--              => Adicao do atributo tipo nas insercoes da tabela MEDICAMENTO
--              => Adicao do atributo validade nas insercoes da tabela RECEITA
--              => Adicao das insercoes restantes para possuir 10 tuplas por tabela
--
-- PROJETO => 01 Base de Dados
--         => 19 Tabelas
--         => 02 Visoes
--         => 03 Usuarios
--
-- ---------------------------------------------------------

-- SELECIONAR A BASE DE DADOS
USE TF2_2B_lucassantos;

-- INSERCOES
INSERT INTO FUNCIONARIO (cpf, nome, cargo, dataAdmissao) VALUES
    (39354024572, 'Cauê Osvaldo Castro', 'farmacêutico', '2005-02-24'),
    (67546568080, 'Elza Nicole da Cunha', 'balconista', '1989-07-03'),
    (66544011665, 'Lumena Aleluia Luz', 'farmacêutico', '1997-08-22'),
    (73293795064, 'Tânia Luanda Teixeira', 'farmacêutico', '1981-05-25'),
    (13366392489, 'Osvaldo Severino Barroso', 'balconista', '1963-01-23'),
    (95762416500, 'Pietra Laureano de Jesus', 'balconista', '1987-02-06'),
    (26122820768, 'Augusto José da Rocha', 'balconista', '1994-02-01'),
    (94663463770, 'Andreia Barreto Corte', 'balconista', '1961-03-06'),
    (03666492487, 'José Victor Barros', 'farmacêutico', '1993-01-23'),
    (86245125731, 'Maitê Peroni Viana', 'balconista', '1992-09-09'),
    (26505210822, 'Aurora Lula Lopes', 'farmacêutico', '1999-03-25'),
    (16703235520, 'Josefa Fogaça Barros', 'farmacêutico', '1993-01-23'),
    (40817392939, 'Lúcia Fernandes Nogueira', 'farmacêutico', '1983-05-26'),
    (06125384357, 'Antonio Renato Rocha', 'farmacêutico', '1998-09-12'),
    (03632307857, 'Philipe Rosa Monteiro', 'farmacêutico', '1997-12-23'),
    (45661117418, 'Isabela Lívia Moreira', 'farmacêutico', '1994-03-13');


INSERT INTO FARMACEUTICO (cpf, crf, unidadeFederativa) VALUES
    (39354024572, 852311, 'DF'),
    (66544011665, 67969, 'DF'),
    (03666492487, 049208, 'DF'),
    (45661117418, 098204, 'DF'),
    (03632307857, 124649, 'DF'),
    (06125384357, 309146, 'DF'),
    (40817392939, 888195, 'DF'),
    (16703235520, 455506, 'DF'),
    (26505210822, 495799, 'DF'),
    (73293795064, 349248, 'DF');


INSERT INTO PACIENTE (numeroSus, nomeCompleto, registroGeral, orgaoEmissor, bairro, logradouro, numero, complemento, cidade, unidadeFederativa) VALUES
    (0949815, 'Stefany Marina Patrícia Brito', 488542078, 'SSP-DF', 'Bosque', 'Rua Isaura Parente', 521, null, 'Brasília', 'DF'),
    (8269256, 'Samuel Arthur Ferreira', 329456052, 'SSP-DF', 'Cidade Universitária', '5ª Travessa Benedito Calaça Loureiro', 656, null, 'Brasília', 'DF'),
    (7599759, 'Luís Luan Ryan Gonçalves', 457311599, 'SSP-DF', 'Conjunto Taquaril', 'Rua Cruzeiro', 507, null, 'Brasília', 'DF'),
    (7728984, 'Yasmin Cecília Mendes', 365703187, 'SSP-GO', 'Campo Grande', 'Rua Figueirópolis', 894, null, 'Brasília', 'DF'),
    (2882342, 'Bryan Nicolas Rafael Rocha', 364994307, 'SSP-DF', 'Conjunto Tucumã', '906', 906, null, 'Brasília', 'DF'),
    (675986, 'Malu Jéssica Oliveira', 176036921, 'SSP-DF', 'Setor 05', 'Rua Paraná', 337, null, 'Brasília', 'DF'),
    (832287, 'Matheus Pereira Junior', 286686843, 'SSP-DF', 'Jardim Internorte', 'Avenida José Alves Nendo', 367, null, 'Brasília', 'DF'),
    (134420, 'Marcus Santos de Melo', 498210923, 'SSP-DF', 'Setor Buenos Aires - 2ª Etapa', 'Rua Payssandú', 931, null, 'Brasília', 'DF'),
    (725133, 'Andreia Pereira Carvalho', 215665272, 'SSP-DF', 'Centro', 'Rua Adoniran Barbosa 118', 893, null, 'Brasília', 'DF'),
    (913354, 'Lucas Lopes Carvalho', 265035168, 'SSP-DF', 'Loteamento Monte Sinai', 'Avenida Bernardo Sayão', 288, null, 'Brasília', 'DF'),
    (665841, 'Carla Santos Pereira', 392881147, 'SSP-GO', 'Barroso', 'Rua Miguel Martins', 190, null, 'Brasília', 'DF');


INSERT INTO ATENDIMENTO (dataAtendimento, horarioAtendimento, cpf, numeroSus) VALUES
    ('2013-01-09', '12:00:59', '03632307857', 725133),
    ('2014-01-07', '11:30:02', '66544011665', 7728984),
    ('2014-12-09', '16:43:41', '40817392939', 134420),
    ('2015-01-01', '17:45:22', '73293795064', 832287),
    ('2015-01-10', '08:39:30', '67546568080', 2882342),
    ('2016-05-14', '12:52:04', '67546568080', 0949815),
    ('2017-01-09', '11:59:09', '06125384357', 665841),
    ('2018-11-10', '12:04:08', '39354024572', 8269256),
    ('2020-02-02', '14:33:10', '45661117418', 7728984),
    ('2021-09-09', '18:00:15', '39354024572', 913354);


INSERT INTO PRESCRITOR (nome, unidadeFederativa, siglaConselho, numeroConselho) VALUES
    ('Vicente Enzo Duarte', 'DF', 'CRM', 194528),
    ('Márcio Anthony Nunes', 'DF', 'CRO', 286),
    ('Giovanna Melissa Bianca Assunção', 'GO', 'CRM', 6379),
    ('Joaquim Fernando Gustavo Novaes', 'DF', 'CRO', 076573),
    ('Tânia Evelyn Drumond', 'DF', 'CRM', 515393),
    ('Tadeu Pontes Silva', 'DF', 'CRM', 101233),
    ('Márcio Fernandez', 'DF', 'CRO', 260),
    ('Ruan Raimundo Bernardes', 'GO', 'CRM', 64539),
    ('Lucas Thomas Joaquim da Costa', 'DF', 'CRO', 032073),
    ('Pietra Nina Sophia Caldeira', 'DF', 'CRM', 334009);


INSERT INTO RECEITA (dataEmissao, validade, idAtendimento, idPrescritor) VALUES
	('2016-05-14', 60, 1, 1),
	('2018-11-10', 45, 2, 2),
	('2014-01-07', 40, 3, 3),
	('2014-01-09', 60, 4, 3),
	('2015-03-09', 90, 5, 3),
	('2016-05-10', 120, 1, 3),
    ('2015-05-07', 360, 5, 4),
	('2020-06-15', 15, 1, 5),
    ('2016-04-07', 7, 6, 7),
	('2019-07-10', 14, 7, 8);    


INSERT INTO MEDICAMENTO (nome, tipo, miligramas, principioAtivo) VALUES
	('Dipirona monoidratada', 'Comum', 500, 'dipirona'),
    ('Paracetamol', 'Comum', 500, 'paracetamol'),
    ('Bezitramida', 'Controlado', 100, 'bezitramida'),
    ('Azitromicina ', 'Comum', 250, 'azitromicina'),
    ('Amoxicilina', 'Comum', 200, 'amoxicilina'),
    ('Trobicim', 'Comum', 200, 'espectinomicina'),
    ('Zidovudina', 'Comum', 100, 'zidovudina'),
    ('Aciclovir', 'Comum', 400, 'aciclovir'),
    ('Albendazol', 'Comum', 100, 'albendazol'),
    ('Priquincare', 'Comum', 200, 'primaquina'),
    ('Rivotril', 'Comum', 20, 'clonazepam'),
    ('Ergotamina', 'Comum', 200, 'ergotamina'),
    ('Drotebanol', 'Controlado', 188, 'drotebanol');


INSERT INTO contem (posologia, quantidade, tipoUso, idReceita, idMedicamento) VALUES
	('40 gotas 1 vez por dia toda a vez que sentir dor', 30, 'Oral', 1, 1),
    ('1 comprimido de 4 em 4 horas', 10, 'Oral', 2, 2),
    ('1 comprimido de 5 em 5 horas', 10, 'Oral', 3, 1),
    ('1 comprimido antes de dormir', 20, 'Oral', 6, 11),
    ('1 comprimido de 8 em 8 horas', 10, 'Oral', 7, 9),
    ('2 comprimido de 12 em 12 horas', 10, 'Oral', 8, 8),
    ('1 comprimido de 5 em 5 horas', 10, 'Oral', 8, 7),
    ('1 injeção a cada 7 dias durante 5 semanas', 5, 'Intravenoso', 4, 3),
    ('1 injeção a cada 7 dias durante 3 semanas', 3, 'Intravenoso', 4, 4),
    ('1 injeção a cada 7 dias durante 2 semanas', 2, 'Intravenoso', 4, 5);


INSERT INTO NOTIFICACAO (unidadeFederativa, numero, tipo, idReceita) VALUES
	('DF', 01000001, 'A1', 1),
    ('DF', 63511615, 'A1', 5),
    ('DF', 12580439, 'A1', 6),
    ('DF', 13011669, 'A1', 7),
    ('DF', 13880709, 'A1', 8),
    ('DF', 01220331, 'A1', 4),
    ('DF', 33409221, 'B1', 9),
    ('DF', 12580439, 'C1', 3),
    ('DF', 13011669, 'A2', 2),
    ('DF', 13880709, 'C5', 10);


INSERT INTO PRODUTO (codigo, tipo, nome, quantidade) VALUES
	('7304521', 'C', 'Dipirona 500 mg', 6000),
    ('56059470', 'C', 'Benzocaína', 900),
    ('09258931', 'I', 'Gaze', 200),
    ('89998309', 'I', 'Esparadrapo', 159),
    ('631004', 'I', 'Água oxigenada', 23),
    ('97396085', 'C', 'Paracetamol', 188),
    ('84877791', 'C', 'Rivotril', 22),
    ('76294575', 'I', 'Luva', 233),
    ('1455963', 'I', 'Seringa', 88),
    ('15227444', 'C', 'Trobicim', 45);


INSERT INTO REQUISICAO (dataRequisicao, cpf) VALUES
    ('2016-02-26', 39354024572),
    ('2019-03-05', 66544011665),
    ('2019-03-05', 66544011665),
    ('2021-07-07', 66544011665),
    ('2013-04-10', 73293795064),
    ('2017-04-21', 06125384357),
    ('2019-01-12', 40817392939),
    ('2019-09-07', 16703235520),
    ('2021-07-07', 26505210822),
    ('2015-05-10', 73293795064);

INSERT INTO requisita(quantidadeRequisitada, codigo, idRequisicao) VALUES
    (1500, '97396085', 1),
    (500, '56059470', 2),
    (1000, '89998309', 3),
    (2000, '631004', 4),
    (998, '7304521', 5),
    (3000, '15227444', 8),
    (5500, '1455963', 7),
    (1800, '84877791', 6),
    (2000, '76294575', 10),
    (900, '56059470', 9);


INSERT INTO arrecada(quantidadeArrecadada, codigo, idRequisicao) VALUES
    (1201, '97396085', 1),
    (200, '89998309', 3),
    (500, '56059470', 2),
    (700, '631004', 4),
    (920, '7304521', 5),
    (3000, '15227444', 8),
    (2800, '1455963', 7),
    (1800, '84877791', 6),
    (1900, '76294575', 10),
    (600, '56059470', 9);


INSERT INTO RECEITA_INSUMO (dataEmissao, numeroSus, idPrescritor) VALUES
	('2014-07-23', 7728984, 2),
    ('2018-04-24', 2882342, 1),
    ('2018-04-24', 7728984, 3),
    ('2018-04-24', 7599759, 4),
    ('2012-03-10', 675986, 2),
    ('2016-04-15', 832287, 5),
    ('2018-09-14', 134420, 8),
    ('2014-08-25', 725133, 3),
    ('2015-01-26', 913354, 7),
    ('2020-11-17', 665841, 9);


INSERT INTO item (item, idReceitaInsumo) VALUES
	('Gaze', 1),
    ('Gaze', 2),
    ('Esparadrapo', 2),
    ('Gaze', 3),
    ('Esparadrapo', 3),
    ('Água oxigenada', 3),
    ('Cateter', 4),
    ('Seringa', 5),
    ('Gaze', 6),
    ('Esparadrapo', 6);


INSERT INTO PEDIDO_PRODUTO (setor, dataPedido, solicitante) VALUES
	('Enfermagem', '2005-10-15', 'Bruna Adriana Silvana Nascimento'),
    ('Pediatria', '2015-01-14', 'Márcia Antonella Rita da Silva'),
    ('Geriatria', '2013-05-23', 'Igor Isaac Fernando Rezende'),
    ('Enfermagem', '2013-05-23', 'Bruna Adriana Silvana Nascimento'),
    ('Pediatria', '2020-08-22', 'Heloise Emanuelly Corte Real'),
    ('Pediatria', '2018-06-21', 'Luna Heloise Castro'),
    ('Oncologia', '2013-05-23', 'Thomas Felipe Pedro Henrique Ferreira'),
    ('Geriatria', '2020-08-22', 'Igor Isaac Fernando Rezende'),
    ('Enfermagem', '2019-03-11', 'Juan José Vinicius Martins'),
    ('Pediatria', '2005-10-15', 'Heloise Emanuelly Corte Real');


INSERT INTO consome (quantidadeConsumida, codigo, idAtendimento) VALUES
	(30, '7304521', 1),
    (10, '7304521', 3),
    (10, '97396085', 2),
    (1, '97396085', 4),
    (2, '7304521', 5),
    (1, '84877791', 6),
    (6, '76294575', 7),
    (15, '1455963', 8),
    (9, '15227444', 9),
    (7, '7304521', 10);



INSERT INTO solicita (quantidadeSolicitada, codigo, idPedido) VALUES
	(85, '09258931', 1),
    (7, '89998309', 2),
    (6, '631004', 3),
    (17, '89998309', 4),
    (122, '631004', 1),
    (7, '56059470', 5),
    (13, '56059470', 6),
    (16, '84877791', 7),
    (6, '76294575', 8),
    (4, '1455963', 9),
    (11, '15227444', 10);


INSERT INTO recebe (quantidadeRecebida, codigo, idPedido) VALUES
	(80, '09258931', 1),
    (7, '89998309', 2),
    (6, '631004', 3),
    (13, '89998309', 4),
    (122, '631004', 1),
    (7, '56059470', 5),
    (11, '56059470', 6),
    (5, '84877791', 7),
    (6, '76294575', 8),
    (4, '1455963', 9),
    (10, '15227444', 10);
