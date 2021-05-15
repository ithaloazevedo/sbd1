-- --------     << Clínica Médica >>     ------------
-- 
--                    SCRIPT POPULA
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
USE aula4exer5Evolucao6;


INSERT INTO MEDICO
    ( crm, estado, nomeCompleto )
VALUES
    ( 125408543, 'DF', 'Ana Luiza Marques Costa' ),
    ( 000157846, 'DF', 'Alexandre Antônio da Silva' ),
    ( 753159846, 'DF', 'Rebeca Mota Maques de Sá' );

INSERT INTO PACIENTE
    ( nomeCompleto, dtNascimento, sexo, rua, numero, bairro, complemento, cidade, estado, cep )
VALUES
    ( 'Ithalo Azevedo', '1998-09-12', 'M', 'Quadra 24', 302,
        'Gama Leste', NULL, 'Brasília', 'DF', 72460240),
    ( 'Damaso Junio Pereira', '2000-05-01', 'M', 'Rua 76', 18, 'Gama',
        'Condominio ', 'Brasília', 'DF', 72373086 ),
    ( 'Arthur Paiva', '2004-04-01', 'M', 'Quadra 25', 8, 'Gama Leste', 
        NULL, 'Brasília', 'DF', 72480406 );

INSERT INTO MEDICAMENTO
    ( principioAtivo)
VALUES
    ( 'Ipubrofeno' ),
    ( 'Paracetamol' ),
    ( 'Amoxilina' ),
    ( 'Nimesulida' ),
    ( 'Cloridrato de Fluoxetina' );

INSERT INTO ESPECIALIDADE
    ( idEspecialidade, nomeEspecialidade )
VALUES
    ( 1,'Clinico Geral' ),
    ( 2,'Anestesista' ),
    ( 3,'Gastrologista' ),
    ( 4,'Psiquiatra' );

INSERT INTO CONSULTA
    ( dataHora, crm, estado, idPaciente )
VALUES
    ( NOW(), 13341, 'DF', 1 ),
    ( NOW(), 11349, 'DF', 2 ),
    ( NOW(), 11549, 'DF', 3 );

INSERT INTO RECEITA
    ( posologia, idConsulta )
VALUES
    ( '3 vezes ao dia / 2 vezes ao dia', 1 ),
    ( '12 em 12 horas / 8 em 8 horas', 2 ),
    ( '1 comprimido ao dia', 3 );

INSERT INTO contem
    (idReceita, idMedicamento)
VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (3, 4),
    (3, 5);

INSERT INTO possui
    (crm, estado, idEspecialidade)
VALUES
    (125408543, 'DF', 1),
    (000157846, 'DF', 2),
    (753159846, 'DF', 1),

INSERT INTO telefone
    (idPaciente, telefone)
VALUES
    ( 1, 982347659 ),
    ( 2, 986573289 ),
    ( 3, 984569023 );