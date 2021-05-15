-- --------  << farmaciaPostoSaude >>  ----------
--
--                    SCRIPT DE CONTROLE (DDL)
--
-- Data Criacao ...........: 08/05/2021
-- Autor(es) ..............: Igor Paiva, Ithalo Mendes, Kleidson Correa e Lucas Santos
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF2_2B_lucassantos
--
-- Ultimas Alteracoes
--   11/05/2021 => Adicao de permissoes para nova view
--              => Adicao de flush previleges no final do script
--
-- PROJETO => 01 Base de Dados
--         => 19 Tabelas
--         => 02 Visoes
--         => 03 Usuarios
--
-- ---------------------------------------------------------

-- CRIACAO DO PERFIL ADMINISTRADOR

-- usuário responsável por administrar o banco de dados,
-- possui todos os privilégios nesta base de dados.
CREATE USER 'administrador'
  IDENTIFIED BY 'admin123';


-- CRIACAO DO PERFIL BALCONISTA

-- usuário responsável por atender pacientes e fornecer os medicamentos
-- prescritos nas receitas apresentadas, se possível for. Para as respectivas
-- tabelas envolvidas nas atividades citadas anteriormente, só é vetado o privilégio
-- de apagar registros e remover ou alterar tabelas (por questões de transparência).
CREATE USER 'balconista'
  IDENTIFIED BY 'balconista123';


-- CRIACAO DO PERFIL FARMACEUTICO

-- usuário responsável por realizar todas as funções dentro do banco de dados exceto
-- o privilégio de apagar registros e remover ou alterar tabelas (por questões de transparência).
CREATE USER 'farmaceutico'
  IDENTIFIED BY 'farmaceutico123';


-- DEFINICAO DAS PERMISSOES DO USUARIO administrador
GRANT ALL PRIVILEGES
  ON TF2_2B_lucassantos.* TO 'administrador'
  WITH GRANT OPTION;


-- DEFINICAO DAS PERMISSOES DO USUARIO farmaceutico
GRANT SELECT, INSERT, UPDATE ON TF2_2B_lucassantos.recebe TO 'farmaceutico';
GRANT SELECT, INSERT, UPDATE ON TF2_2B_lucassantos.solicita TO 'farmaceutico';
GRANT SELECT, INSERT, UPDATE ON TF2_2B_lucassantos.PEDIDO_PRODUTO TO 'farmaceutico';
GRANT SELECT, INSERT, UPDATE ON TF2_2B_lucassantos.consome TO 'farmaceutico';
GRANT SELECT, INSERT, UPDATE ON TF2_2B_lucassantos.contem TO 'farmaceutico';
GRANT SELECT, INSERT, UPDATE ON TF2_2B_lucassantos.item TO 'farmaceutico';
GRANT SELECT, INSERT, UPDATE ON TF2_2B_lucassantos.PRODUTO TO 'farmaceutico';
GRANT SELECT, INSERT, UPDATE ON TF2_2B_lucassantos.RECEITA_INSUMO TO 'farmaceutico';
GRANT SELECT, INSERT, UPDATE ON TF2_2B_lucassantos.NOTIFICACAO TO 'farmaceutico';
GRANT SELECT, INSERT, UPDATE ON TF2_2B_lucassantos.MEDICAMENTO TO 'farmaceutico';
GRANT SELECT, INSERT, UPDATE ON TF2_2B_lucassantos.RECEITA TO 'farmaceutico';
GRANT SELECT, INSERT, UPDATE ON TF2_2B_lucassantos.PRESCRITOR TO 'farmaceutico';
GRANT SELECT, INSERT, UPDATE ON TF2_2B_lucassantos.ATENDIMENTO TO 'farmaceutico';
GRANT SELECT, INSERT, UPDATE ON TF2_2B_lucassantos.PACIENTE TO 'farmaceutico';
GRANT SELECT, INSERT, UPDATE ON TF2_2B_lucassantos.FUNCIONARIO TO 'farmaceutico';
GRANT SELECT, INSERT, UPDATE ON TF2_2B_lucassantos.FARMACEUTICO TO 'farmaceutico';
GRANT SELECT, INSERT, UPDATE ON TF2_2B_lucassantos.REQUISICAO TO 'farmaceutico';
GRANT SELECT, INSERT, UPDATE ON TF2_2B_lucassantos.requisita TO 'farmaceutico';
GRANT SELECT, INSERT, UPDATE ON TF2_2B_lucassantos.arrecada TO 'farmaceutico';

-- DEFINICAO DAS PERMISSOES DO USUARIO balconista
GRANT SELECT, INSERT, UPDATE ON TF2_2B_lucassantos.recebe TO 'balconista';
GRANT SELECT, INSERT, UPDATE ON TF2_2B_lucassantos.solicita TO 'balconista';
GRANT SELECT, INSERT, UPDATE ON TF2_2B_lucassantos.PEDIDO_PRODUTO TO 'balconista';
GRANT SELECT, INSERT, UPDATE ON TF2_2B_lucassantos.consome TO 'balconista';
GRANT SELECT, INSERT, UPDATE ON TF2_2B_lucassantos.contem TO 'balconista';
GRANT SELECT, INSERT, UPDATE ON TF2_2B_lucassantos.item TO 'balconista';
GRANT SELECT, INSERT, UPDATE ON TF2_2B_lucassantos.PRODUTO TO 'balconista';
GRANT SELECT, INSERT, UPDATE ON TF2_2B_lucassantos.RECEITA_INSUMO TO 'balconista';
GRANT SELECT, INSERT, UPDATE ON TF2_2B_lucassantos.NOTIFICACAO TO 'balconista';
GRANT SELECT, INSERT, UPDATE ON TF2_2B_lucassantos.MEDICAMENTO TO 'balconista';
GRANT SELECT, INSERT, UPDATE ON TF2_2B_lucassantos.RECEITA TO 'balconista';
GRANT SELECT, INSERT, UPDATE ON TF2_2B_lucassantos.PRESCRITOR TO 'balconista';
GRANT SELECT, INSERT, UPDATE ON TF2_2B_lucassantos.ATENDIMENTO TO 'balconista';
GRANT SELECT, INSERT, UPDATE ON TF2_2B_lucassantos.PACIENTE TO 'balconista';
GRANT SELECT, INSERT, UPDATE ON TF2_2B_lucassantos.FUNCIONARIO TO 'balconista';

-- RECARREGANDO A TABELA DE PRIVILEGIOS
FLUSH PRIVILEGES;
