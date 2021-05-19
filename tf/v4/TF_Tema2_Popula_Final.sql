-- --------  << Farmacia do Posto de Saude  >>  ----------
--
--                    SCRIPT DE INSERCAO (DML)
--
-- Data Criacao ...........: 03/05/2021
-- Autor(es) ..............: Ithalo Azevedo
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF_Tema2
--
-- Ultimas Alteracoes
--             04/05/2021 => Insercao de dados nas 14 novas tabelas
--             05/05/2021 => Adicao de 2 tuplas nas 10 tabelas ja criadas
--
-- PROJETO => 01 Base de Dados
--         => 24 Tabelas
--         => 04 Consultas
-- 		   => 02 Views
--         => 03 perfis de usuario
--
-- ---------------------------------------------------------

-- BASE DE DADOS
USE TF_Tema2;


-- INSERCOES

INSERT INTO MEDICO VALUES
(697043, 'DF', 'Lisandra Pequeno Caminha'),
(400846, 'DF', 'Antonio Valentim Lagos'),
(947034, 'DF', 'Armando Holanda Valcanaia'),
(15538, 'DF', 'Ryan Osvaldo Moura'),
(18023, 'DF', 'Leonardo Claudio Fogaca'),
(54389, 'DF', 'Lourdes Silveira'),
(93291, 'DF', 'Lineu Silva Maroto'),
(10928, 'DF', 'Jorge Amado Silva'),
(38155, 'DF', 'Antonio Silveira'),
(25183, 'DF', 'Augusto Carrara Soares');
 
INSERT INTO PACIENTE VALUES
(524370829230083, 'Lucca Bruno Fernando Martins', 'Samambaia', 'Area residencial 12', 11, 'DF',
'Brasilia', 61982507492, 4234928402, 'DF'),
(544163871661192, 'Flavia Eloa Campos', 'Ceilandia', 'Setor Habitacional Por do Sol', 21, 'DF',
'Brasilia', 61942514482, 1504323028, 'DF'),
(869972159622455, 'Agatha Marina Marcela Pinto', 'Noroeste', 'Quadra CRNW 706 Lote D', 913, 'DF',
'Brasilia', 61952209525, 1318600442, 'DF'),
(757929864432721, 'Mariane Carla Luna Jesus', 'Samambaia', 'Quadra QR 210 Conjunto 4', 898, 'DF',
'Brasilia', 61983481269, 411276578, 'DF'),
(983126390291273, 'Felipe Danilo da Mata', 'Areal', 'Quadra QS 8 Conjunto 630B', 859, 'DF',
'Brasilia', 61989074405, 360559153, 'DF'),
(780228253057920, 'Jaqueline Carla Mariana Novaes', 'Ceilandia', 'Quadra QNP 13 Conjunto V', 562, 'DF',
'Brasilia', 61999239805, 362833819, 'DF'),
(545416542600821, 'Elias Fernando Gomes', 'Asa Norte', 'Quadra SHCGN 710 Bloco O', 856, 'DF',
'Brasilia', 61989233498, 470929418, 'DF'),
(273618996596123, 'Andrea Bianca Eduarda Pinto', 'Samambaia', 'Quadra QR 210 Conjunto 13', 385, 'DF',
'Brasilia', 61985031312, 313611907, 'DF'),
(126319461911657, 'Miguel Daniel Barros', 'Asa Sul', 'Quadra SQS 309 Bloco G', 985, 'DF',
'Brasilia', 61991576869, 246670927, 'DF'),
(388744333972243, 'Lorena Sueli Rodrigues', 'Samambaia', 'Quadra QR 511 Conjunto 6', 152, 'DF',
'Brasilia', 61996320333, 396614966, 'DF');

INSERT INTO FUNCIONARIO VALUES 
(19855146050, 'Lucia Betina Costa', 61985007277),
(13909174019, 'Liz Vera da Mata', 61984668030),
(96656079792, 'Lais Silvana Larissa', 61991561672),
(29073872197, 'Ryan Matheus Diego Barros', 61991533028),
(08031050104, 'Lucia Olivia Sabrina da Conceicao', 61994409069),
(23530681113, 'Diogo Lucas Vieira', 61988777210),
(16193814191, 'Clara Teresinha Luna Gomes', 61986819708),
(20812892100, 'Luciana Emily Baptista', 61986478141),
(89136941158, 'Caio Benedito Levi Martins', 61987496705),
(03842423160, 'Gabrielly Brenda Ribeiro', 61993697505);

INSERT INTO FARMACEUTICO VALUES 
(32974, 'DF', 19855146050),
(27388, 'DF', 13909174019),
(41734, 'DF', 96656079792),
(31639, 'DF', 29073872197),
(71903, 'DF', 08031050104),
(42918, 'DF', 23530681113),
(83764, 'DF', 16193814191),
(60018, 'DF', 20812892100),
(82445, 'DF', 89136941158),
(53378, 'DF', 03842423160);

INSERT INTO RECEITA VALUES
(1, '2021-04-20', 'Asa Norte', 'Quadra SMHN Quadra 2 Bloco A', 386, 'DF', 'Brasilia', 524370829230083, 697043, 'DF', 32974, 'DF'),
(2, '2021-04-15', 'Taguatinga Norte', 'Quadra QNL 17 Conjunto F', 471, 'DF', 'Brasilia', 544163871661192, 400846, 'DF', 27388, 'DF'),
(3, '2021-04-08', 'Recanto das Emas', 'Quadra Quadra 605 Conjunto 14', 871, 'DF', 'Brasilia', 869972159622455, 947034, 'DF', 41734, 'DF'),
(4, '2021-04-01', 'Samambaia', 'Quadra QN 320 Conjunto 4', 342, 'DF', 'Brasilia', 757929864432721, 15538, 'DF', 31639, 'DF'),
(5, '2021-03-29', 'Sobradinho', 'Quadra Quadra 8 Comercio Local 7', 533, 'DF', 'Brasilia', 983126390291273, 18023, 'DF', 71903, 'DF'),
(6, '2021-02-13', 'Vicente Pires', 'Rua 8 Chacara 210', 251, 'DF', 'Brasilia', 780228253057920, 54389, 'DF', 42918, 'DF'),
(7, '2021-02-19', 'Sobradinho', 'Quadra 11 AR 1', 515, 'DF', 'Brasilia', 545416542600821, 93291, 'DF', 83764, 'DF'),
(8, '2021-04-11', 'Ceilandia', 'Quadra QNP 28 Conjunto N', 647, 'DF', 'Brasilia', 273618996596123, 10928, 'DF', 60018, 'DF'),
(9, '2021-04-23', 'Paranoa', 'Quadra 6 Conjunto F', 351, 'DF', 'Brasilia', 126319461911657, 38155, 'DF', 82445, 'DF'),
(10, '2021-05-01', 'Cruzeiro Velho', 'Quadra QS 111 Conjunto C', 708, 'DF', 'Brasilia', 388744333972243, 25183, 'DF', 53378, 'DF');

INSERT INTO RECEITAESPECIAL VALUES
(8577994703, 'DF', 'C1', 1),
(4205205030, 'DF', 'B1', 2),
(4133121017, 'DF', 'C2', 3),
(7200705043, 'DF', 'A3', 4),
(8900602044, 'DF', 'C5', 5),
(5560209537, 'DF', 'C2', 6),
(5576265697, 'DF', 'A1', 7),
(5226562091, 'DF', 'C4', 8),
(3486154048, 'DF', 'A3', 9),
(6062827707, 'DF', 'C3', 10);

INSERT INTO LAUDO VALUES
(1, '3 anos', 'Episodios depressivos', 'F32', 1),
(2, '10 anos', 'Lupus eritematoso', 'L93', 2),
(3, '5 meses', 'Febre amarela', 'A95', 3),
(4, 'Uma semana', 'Carie dentaria', 'K02', 4),
(5, '15 anos', 'Doencas cisticas do rim', 'Q61', 5),
(6, '1 ano', 'Glaucoma', 'H40', 6),
(7, '8 meses', 'Conjuntivite', 'H10', 7),
(8, '3 meses', 'Catarata', 'H25', 8),
(9, '5 anos', 'Transtorno Afetivo Bipolar', 'F31', 9),
(10, 'Observacao', 'Transtornos da Alimentação', 'F50', 10);

INSERT INTO PRODUTO VALUES
(8669337051882, 'Fluoxetina', 'caixa', 560, 'medicamento'),
(3697982373509, 'Imunossupressor', 'frasco', 1676, 'medicamento'),
(7843303702742, 'Paracetamol', 'caixa', 250, 'medicamento'),
(8951004633591, 'Dipirona', 'frasco', 294, 'medicamento'),
(1010233070484, 'Furosemida', 'frasco', 842, 'medicamento'),
(4908552154780, 'Latanoprosta', 'frasco', 623, 'medicamento'),
(9932008374382, 'Maxitrol', 'frasco', 1882, 'medicamento'),
(8475843336705, 'Clarvisol', 'frasco', 1113, 'medicamento'),
(6177712001906, 'Rivotril', 'caixa', 398, 'medicamento'),
(8299527604290, 'Cloridrato de sertralina', 'caixa', 1013, 'medicamento'),
(4555258592515, 'Luva nitrilica', 'caixa', 2500, 'insumo'),
(5929284924924, 'Regue de gases', 'caixa', 1805, 'insumo'),
(5442898582944, 'Seringa hipodermica', 'caixa', 1003, 'insumo'),
(7159145267321, 'Mascaras cirurgicas', 'caixa', 944, 'insumo'),
(9785216294470, 'Caixa de curativo adesivo', 'caixa', 4400, 'insumo'),
(4433774113150, 'Rolo de Esparadrapo', 'caixa', 2330, 'insumo'),
(1269430852868, 'Soro fisiologico', 'caixa', 5340, 'insumo'),
(7695987350397, 'Algodao hidrofilo', 'caixa', 6500, 'insumo'),
(5879755562341, 'Bolsa termicas', 'caixa', 1500, 'insumo'),
(2979898148944, 'Tesoura', 'caixa', 750, 'insumo');

INSERT INTO ATENDIMENTO VALUES
(1, '2021-04-20', 1, 19855146050),
(2, '2021-04-15', 2, 13909174019),
(3, '2021-04-08', 3, 96656079792),
(4, '2021-04-23', 4, 29073872197),
(5, '2021-03-29', 5, 08031050104),
(6, '2021-05-12', 6, 23530681113),
(7, '2021-05-23', 7, 16193814191),
(8, '2021-07-05', 8, 20812892100),
(9, '2021-05-17', 9, 89136941158),
(10, '2021-08-27', 10, 03842423160);

INSERT INTO contem VALUES
(1, 8669337051882, 'Tomar 3 comprimidos pela manha'),
(2, 3697982373509, 'Tomar uma vez ao dia'),
(3, 7843303702742, 'Tomar 1 ao sentir dor'),
(4, 8951004633591, 'Tomar 1 comprimidos por semana'),
(5, 1010233070484, 'Tomar 3 comprimidos ao dia'),
(6, 4908552154780, 'Pingar 3 gotas nos olhos ao dia'),
(7, 9932008374382, 'Pingar 1 gota nos olhos ao acordar'),
(8, 8475843336705, 'Pingar 1 gota nos olhos de 8 em 8 horas'),
(9, 6177712001906, 'Tomar 1 comprimido pela manha'),
(10, 8299527604290, 'Tomar 3 comprimidos após o jantar');

INSERT INTO despacha VALUES
(1010233070484, 1, 10),
(4908552154780, 2, 8),
(9932008374382, 3, 20),
(8475843336705, 4, 4),
(6177712001906, 5, 90),
(8299527604290, 6, 22),
(4555258592515, 7, 74),
(5929284924924, 8, 9),
(5442898582944, 9, 83),
(7159145267321, 10, 59);

INSERT INTO PEDIDOEXTERNO VALUES
(1, '2021-04-28', 'aprovado'),
(2, '2021-05-02', 'aprovado'),
(3, '2021-05-03', 'aguardando'),
(4, '2021-03-26', 'aprovado'),
(5, '2021-04-15', 'aprovado'),
(6, '2021-01-29', 'rejeitado'),
(7, '2021-01-31', 'aguardando'),
(8, '2021-02-10', 'aprovado'),
(9, '2021-04-29', 'aprovado'),
(10, '2021-05-04', 'aprovado');

INSERT INTO NOTA VALUES
(1, '2021-04-28', '2021-03-27', 1, 32974, 'DF'),
(2, '2021-05-02', '2021-04-02', 2, 27388, 'DF'),
(3, '2021-05-03', '2021-04-15', 3, 41734, 'DF'),
(4, '2021-03-26', '2021-03-11', 4, 31639, 'DF'),
(5, '2021-04-15', '2021-03-19', 5, 71903, 'DF'),
(6, '2021-01-26', '2021-01-14', 6, 42918, 'DF'),
(7, '2021-02-22', '2021-02-02', 7, 83764, 'DF'),
(8, '2021-03-22', '2021-03-01', 8, 60018, 'DF'),
(9, '2021-04-19', '2021-04-17', 9, 82445, 'DF'),
(10, '2021-05-12', '2021-04-21', 10, 53378, 'DF');

INSERT INTO FORNECEDOR VALUES
(48387474000164, 'Johnson & Johnson', 'Vicente Pires', 'Chacara 74', 991, 'DF', 'Brasilia'),
(23918033000110, 'EMS', 'Distrito Industrial', 'Rua Vicente Ferrucci', 746, 'SP', 'Jau'),
(52583551000129, 'Eurofarma', 'Roseira', 'Avenida Joao Batista Spiandorello', 383, 'SP', 'Jundiai'),
(46919285000160, 'Sanofi', 'Samambaia', 'Quadra QR 110 Conjunto 14A', 322, 'DF', 'Brasilia'),
(79350118000108, 'Novartis', 'Candangolândia', 'Quadra QR 1 Conjunto A', 741, 'DF', 'Brasilia'),
(75691496000196, 'Bayer', 'Gama', 'Quadra EQ 10/21', 321, 'DF', 'Brasilia'),
(71017882000146, 'AstraZeneca', 'Sobradinho', 'Quadra 2 Conjunto B/C Bloco C', 925, 'DF', 'Brasilia'),
(35240111000150, 'Bergamo', 'Riacho Fundo I', 'Quadra QS 12 Área Especial F', 283, 'DF', 'Brasilia'),
(82351467000140, 'Injeflex', 'Taguatinga', 'Quadra QNL 14 Conjunto D', 497, 'DF', 'Brasilia'),
(90919753000198, 'Pfizer', 'Ceilândia', 'Quadra QNN 22 Conjunto K', 894, 'DF', 'Brasilia');

INSERT INTO telefoneFornecedor VALUES
(48387474000164, 61991139484),
(23918033000110, 19987319085),
(52583551000129, 11996651723),
(46919285000160, 61998703814),
(79350118000108, 61988033271),
(75691496000196, 61984193752),
(71017882000146, 61987182871),
(35240111000150, 61981034734),
(82351467000140, 61991408032),
(90919753000198, 61985962357);

INSERT INTO FORMULARIO VALUES
(1, 'Posto de Saude', '2021-04-28', 19855146050),
(2, 'Farmacia Interna', '2021-05-02', 13909174019),
(3, 'Estoque', '2021-05-03', 96656079792),
(4, 'Posto de Saude', '2021-04-28', 29073872197),
(5, 'Posto de Saude', '2021-04-13', 08031050104),
(6, 'Estoque', '2021-04-14', 23530681113),
(7, 'Farmacia Interna', '2021-04-16', 16193814191),
(8, 'Farmacia Interna', '2021-04-19', 20812892100),
(9, 'Estoque', '2021-04-23', 89136941158),
(10, 'Posto de Saude', '2021-04-27', 03842423160);

INSERT INTO PEDIDOINTERNO VALUES
(1, '2021-05-08', 1),
(2, '2021-05-09', 2),
(3, '2021-05-10', 3),
(4, '2021-05-02', 4),
(5, '2021-05-10', 5),
(6, '2021-04-23', 6),
(7, '2021-04-29', 7),
(8, '2021-05-04', 8),
(9, '2021-05-06', 9),
(10, '2021-05-11', 10);

INSERT INTO faz VALUES
(32974, 'DF', 1),
(32974, 'DF', 2),
(41734, 'DF', 3),
(31639, 'DF', 4),
(71903, 'DF', 5),
(42918, 'DF', 6),
(83764, 'DF', 7),
(60018, 'DF', 8),
(82445, 'DF', 9),
(53378, 'DF', 10);

INSERT INTO envolve VALUES
(4555258592515, 1, 10),
(5929284924924, 2, 50),
(5442898582944, 3, 130),
(7159145267321, 4, 400),
(9785216294470, 5, 100),
(4433774113150, 6, 970),
(1269430852868, 7, 590),
(7695987350397, 8, 530),
(5879755562341, 9, 315),
(2979898148944, 10, 680);

INSERT INTO emite VALUES
(48387474000164, 1),
(23918033000110, 2),
(52583551000129, 3),
(46919285000160, 4),
(79350118000108, 5),
(75691496000196, 6),
(71017882000146, 7),
(35240111000150, 8),
(82351467000140, 9),
(90919753000198, 10);

INSERT INTO abrange VALUES
(7843303702742, 1, 600),
(8951004633591, 2, 400),
(1010233070484, 3, 40),
(4555258592515, 4, 23),
(5929284924924, 5, 140), 
(4908552154780, 6, 200),
(9932008374382, 7, 40),
(8475843336705, 8, 60),
(6177712001906, 9, 130),
(8299527604290, 10, 40);

INSERT INTO preenche VALUES
(19855146050, 1),
(13909174019, 2),
(96656079792, 3),
(29073872197, 4),
(08031050104, 5),
(23530681113, 6),
(16193814191, 7),
(20812892100, 8),
(89136941158, 9),
(03842423160, 10);

INSERT INTO compreende VALUES
(7843303702742, 1),
(5929284924924, 2),
(5442898582944, 3),
(1010233070484, 4),
(4908552154780, 5),
(4433774113150, 6),
(6177712001906, 7),
(2979898148944, 8),
(1269430852868, 9),
(7159145267321, 10);

INSERT INTO expede VALUES
(4908552154780, 1, 50),
(4555258592515, 2, 40),
(7843303702742, 3, 70),
(8951004633591, 4, 85),
(1010233070484, 5, 67),
(4908552154780, 6, 78),
(9932008374382, 7, 98),
(8475843336705, 8, 120),
(6177712001906, 9, 140),
(8299527604290, 10, 30);