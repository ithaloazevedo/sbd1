-- --------  << Farmacia do Posto de Saude  >>  ----------
--
--                    SCRIPT DE CONTROLE
--
-- Data Criacao ...........: 04/05/2021
-- Autor(es) ..............: Ithalo Azevedo
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF_Tema2
--
-- Ultimas Alteracoes
--             05/05/2021 => Criacao dos perfis diretor, funcionario e farmaceutico
--             13/05/2021 => Correcao da criacao de perfis
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

-- Usuarios

CREATE USER 'diretor'
IDENTIFIED BY 'dirposto123';

CREATE USER 'funcionario' 
IDENTIFIED BY 'funcposto123';

CREATE USER 'farmaceutico' 
IDENTIFIED BY 'farmposto123';

-- Privilegios

-- O diretor e o perfil responsavel pela administracao geral do posto de saude, podendo
-- somente ele alterar os registros do posto para sua manutencao. Logo, requer
-- privilegios sobre quase todas as tabelas que armazenam registros que envolvem produtos, 
-- pedidos e atendimentos, exceto deletar e modificar notas fiscais de pedidos 
-- recebidos, visto que isso pode dar brecha a fraudes.
GRANT ALL PRIVILEGES ON TF_Tema2.PRODUTO TO diretor;
GRANT ALL PRIVILEGES ON TF_Tema2.ATENDIMENTO TO diretor;
GRANT ALL PRIVILEGES ON TF_Tema2.PEDIDOEXTERNO TO diretor;
GRANT ALL PRIVILEGES ON TF_Tema2.PEDIDOINTERNO TO diretor;
GRANT SELECT, INSERT ON TF_Tema2.NOTA TO diretor;
GRANT SELECT, INSERT ON TF_Tema2.CONTROLE_FARMACIA TO diretor;
GRANT SELECT, INSERT ON TF_Tema2.CONTROLE_INTERNO TO diretor;

-- O perfil funcionario tem a responsabilidade de realizar atendimento, podendo alterar
-- seus dados por questao de erros na digitacao de dados. Tambem e responsavel por 
-- preencher formulario no caso do pedido de produtos para uso interno do posto e 
-- atualiza-lo, no caso de erros na digitacao.

GRANT SELECT, INSERT, UPDATE ON TF_Tema2.ATENDIMENTO TO funcionario;
GRANT ALL PRIVILEGES ON TF_Tema2.despacha TO funcionario;
GRANT SELECT, INSERT, UPDATE ON TF_Tema2.FORMULARIO TO funcionario;
GRANT ALL PRIVILEGES ON TF_Tema2.compreende TO funcionario;


-- O perfil farmaceutico tem como responsabilidade assinar uma nota de produtos recebidos,
-- mas nao altera-la, pois isso pode dar brecha a fraudes. O farmaceutico assina formulario,
-- para pedidos de uso interno de produtos, e receita, para uso de pacientes. Porem, nao pode
-- altera-los, atribuicao essa do medico. Ainda tem a responsabilidade de fazer pedidos ao
-- fornecedor e modifica-los nas situacoes em que o fornecedor nao possuir os produtos
-- e ou a quantidade necessarios, mas nao pode excluir os seus registros, pois isso
-- da brecha a fraudes.

GRANT SELECT, INSERT ON TF_Tema2.NOTA TO farmaceutico;
GRANT SELECT, INSERT ON TF_Tema2.FORMULARIO TO farmaceutico;
GRANT SELECT, INSERT ON TF_Tema2.RECEITA TO farmaceutico;
GRANT SELECT, INSERT, UPDATE ON TF_Tema2.PEDIDOEXTERNO TO farmaceutico;
GRANT ALL PRIVILEGES ON TF_Tema2.envolve TO farmaceutico;
