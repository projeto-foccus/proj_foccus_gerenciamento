-- --------------------------------------------------------
-- Servidor:                     sap_tea.mysql.dbaas.com.br
-- Versão do servidor:           5.7.32-35-log - Percona Server (GPL), Release 35, Revision 5688520
-- OS do Servidor:               Linux
-- HeidiSQL Versão:              12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para sap_tea
CREATE DATABASE IF NOT EXISTS `sap_tea` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `sap_tea`;

-- Copiando estrutura para tabela sap_tea.aluno
CREATE TABLE IF NOT EXISTS `aluno` (
  `alu_id` int(11) NOT NULL AUTO_INCREMENT,
  `alu_dt_cad` date DEFAULT NULL,
  `alu_ra` varchar(20) NOT NULL,
  `alu_nome` varchar(200) NOT NULL,
  `alu_dtnasc` date DEFAULT NULL,
  `alu_inep` varchar(15) NOT NULL,
  `alu_nome_resp` varchar(200) DEFAULT NULL,
  `alu_tipo_parentesco` varchar(100) DEFAULT NULL,
  `alu_email_resp` varchar(150) DEFAULT NULL,
  `alu_tel_resp` varchar(20) DEFAULT NULL,
  `flag_perfil` char(1) DEFAULT NULL,
  `flag_inventario` char(1) DEFAULT NULL,
  PRIMARY KEY (`alu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela sap_tea.aluno: ~56 rows (aproximadamente)
INSERT INTO `aluno` (`alu_id`, `alu_dt_cad`, `alu_ra`, `alu_nome`, `alu_dtnasc`, `alu_inep`, `alu_nome_resp`, `alu_tipo_parentesco`, `alu_email_resp`, `alu_tel_resp`, `flag_perfil`, `flag_inventario`) VALUES
	(1, '2025-04-29', '3456789012', 'Gabriel Martins Rocha Souza', '2018-10-30', '25666665', 'André Gomes Pereira Santos Almeida', 'Padrasto', 'gabriel.souza876@email.com', '(11) 91432-7654', NULL, NULL),
	(2, '2025-04-29', '4567890123', 'Larissa Oliveira Santos Costa', '2019-12-23', '25666665', 'Lorena Nogueira Barbosa Costa Silva', 'Madrasta', 'larissa.costa223@email.com', '(11) 97865-4321', NULL, NULL),
	(3, '2025-04-29', '5678901234', 'Felipe Almeida Lima Rocha', '2017-02-04', '25666665', 'Bruno Oliveira Costa Lima Rocha', 'Tutor', 'felipe.almeida567@email.com', '(11) 91987-6543', NULL, NULL),
	(4, '2025-04-29', '6789012345', 'Mariana Pereira Silva Nogueira', '2016-05-17', '25666665', 'Aline Silva Santos Pereira Gomes', 'Responsável legal', 'mariana.rodrigues890@email.com', '(11) 93765-4321', NULL, NULL),
	(5, '2025-04-29', '7890123456', 'Tiago Costa Almeida Oliveira', '2018-08-21', '25666665', 'Vitor Alves Martins Souza Barbosa', 'Curador', 'tiago.martins234@email.com', '(11) 96123-4567', NULL, NULL),
	(6, '2025-04-29', '8901234567', 'Aline Souza Lima Barbosa', '2019-11-12', '25666665', 'Larissa Lima Pinto Oliveira Souza', 'Guardião', 'aline.silva111@email.com', '(11) 92345-6789', NULL, NULL),
	(7, '2025-04-29', '9012345678', 'Igor Pereira Rocha Almeida', '2016-01-03', '25666665', 'Matheus Pereira Almeida Costa Nogueira', 'Pai afetivo', 'igor.pereira345@email.com', '(11) 93456-7890', NULL, NULL),
	(8, '2025-04-29', '7689012345', 'Paula Costa Santos Pereira', '2019-02-22', '25666665', 'Rafaela Silva Souza Pereira Lima', 'Mãe temporária', 'paula.santos234@email.com', '(11) 98123-4567', NULL, NULL),
	(9, '2025-04-29', '8790123456', 'Rodrigo Silva Almeida Lima', '2016-04-28', '25666665', 'Bruna Oliveira Santos Nogueira Alves', 'Pai substituto', 'rodrigo.rocha987@email.com', '(11) 96345-6789', NULL, NULL),
	(10, '2025-04-29', '9801234567', 'Isabela Barbosa Rocha Nogueira', '2017-07-14', '25666665', 'Diego Almeida Lima Pereira Rocha', 'Mãe substituta', 'isabela.costa876@email.com', '(11) 93256-7890', NULL, NULL),
	(11, '2025-04-29', '3467890123', 'Eduardo Souza Almeida Costa', '2018-10-15', '25666665', 'Sara Martins Santos Oliveira Silva', 'Pai de adoção', 'eduardo.pereira654@email.com', '(11) 97654-3210', NULL, NULL),
	(12, '2025-04-29', '4578901234', 'Rafaela Lima Pereira Rocha', '2019-11-06', '25666665', 'Carlos Pereira Costa Barbosa Nogueira', 'Mãe de adoção', 'rafaela.almeida112@email.com', '(11) 91234-5678', NULL, NULL),
	(13, '2025-04-29', '5689012345', 'Lucas Almeida Santos Costa', '2016-03-20', '25666665', 'Tiago Rocha Oliveira Souza Lima', 'Pai de afeto', 'lucas.barbosa908@email.com', '(11) 98321-7654', NULL, NULL),
	(14, '2025-04-29', '6790123456', 'Gabriela Oliveira Lima Martins', '2017-08-11', '25666665', 'Ana Clara Souza Alves Pereira Martins', 'Mãe de afeto', 'gabriela.lima223@email.com', '(11) 96123-4567', NULL, NULL),
	(15, '2025-04-29', '7801234567', 'Gustavo Rocha Silva Pereira', '2018-12-30', '25666665', 'Felipe Gomes Oliveira Barbosa Lima', 'Pai de sangue', 'gustavo.martins345@email.com', '(11) 98765-4321', NULL, NULL),
	(16, '2025-04-29', '8912345678', 'Renata Costa Nogueira Lima', '2019-05-08', '25666665', 'Igor Silva Santos Rocha Nogueira', 'Mãe de sangue', 'renata.rodrigues567@email.com', '(11) 93456-7890', NULL, NULL),
	(17, '2025-04-29', '9023456789', 'Sérgio Lima Almeida Santos', '2017-01-24', '25666665', 'Camila Lima Alves Santos Pereira', 'Responsável por guarda compartilhada', 'sérgio.silva432@email.com', '(11) 91123-4567', NULL, NULL),
	(18, '2025-04-29', '1012345678', 'Vanessa Oliveira Rocha Souza', '2018-07-02', '25666665', 'João Pedro Rocha Oliveira Costa Lima', 'Responsável por guarda unilateral', 'vanessa.almeida345@email.com', '(11) 97345-6789', NULL, NULL),
	(19, '2025-04-29', '2123456789', 'Matheus Pereira Almeida Silva', '2019-09-19', '25666665', 'Vivi Rocha Costa Nogueira Souza', 'Pai biológico de criação', 'matheus.rocha112@email.com', '(11) 96654-3210', NULL, NULL),
	(20, '2025-04-29', '3234567890', 'Priscila Lima Souza Rocha', '2016-03-09', '25666665', 'Jorge Souza Oliveira Lima Barbosa', 'Mãe biológica de criação', 'cristiane.costa234@email.com', '(11) 99876-5432', NULL, NULL),
	(21, '2025-04-29', '4345678901', 'Leandro Oliveira Costa Martins', '2017-06-26', '25666665', 'Nicole Pereira Lima Santos Rocha', 'Pai de visitação', 'ricardo.souza567@email.com', '(11) 92654-3210', NULL, NULL),
	(22, '2025-04-29', '8789012345', 'Fábio Costa Santos Lima', '2018-12-03', '25666665', 'Thiago Oliveira Costa Nogueira Almeida', 'Pai de afiliação', 'thais.pinto234@email.com', '(11) 96345-6789', NULL, NULL),
	(23, '2025-04-29', '9890123456', 'Thais Souza Almeida Nogueira', '2019-02-21', '25666665', 'Gabriela Nogueira Lima Souza Costa', 'Mãe de afiliação', 'josé.santos345@email.com', '(11) 92456-7890', NULL, NULL),
	(24, '2025-04-29', '2101234567', 'José Roberto Lima Rocha', '2017-06-14', '25666665', 'Marcos Silva Almeida Oliveira Pinto', 'Responsável por tutela', 'beatriz.silva223@email.com', '(11) 90987-6543', NULL, NULL),
	(25, '2025-04-29', '3212345678', 'Beatriz Almeida Lima Costa', '2018-09-01', '25666665', 'Lúcia Costa Nogueira Lima Souza', 'Responsável por curatela', 'raquel.martins432@email.com', '(11) 94123-4567', NULL, NULL),
	(26, '2025-04-29', '4323456789', 'Raquel Pereira Santos Lima', '2019-11-07', '25666665', 'Arthur Barbosa Lima Almeida Rocha', 'Pai de abrigo', 'lucas.santos876@email.com', '(11) 97456-7890', NULL, NULL),
	(27, '2025-04-29', '5434567890', 'Lucas Rocha Silva Almeida', '2017-02-12', '25666665', 'Juliana Silva Lima Pereira Santos', 'Mãe de abrigo', 'gabriela.rocha345@email.com', '(11) 93654-3210', NULL, NULL),
	(28, '2025-04-29', '6545678901', 'Sofia Oliveira Nogueira Rocha', '2018-04-09', '25666665', 'Renata Pereira Nogueira Souza Lima', 'Pai de acolhimento', 'gustavo.lima987@email.com', '(11) 91234-5678', NULL, NULL),
	(29, '2025-04-29', '6543210987', 'Rodrigo Pereira Rocha Costa', '2019-10-22', '25789435', 'Nicole Silva Souza Lima Barbosa', 'Mãe com visitação regular', 'luciana.rocha432@email.com', '(11) 98123-4567', NULL, NULL),
	(30, '2025-04-29', '7654321098', 'Karina Almeida Souza Rocha', '2016-03-15', '25789435', 'Guilherme Oliveira Pinto Costa Rocha', 'Pai com responsabilidade compartilhada', 'rafaela.silva223@email.com', '(11) 96234-5678', NULL, NULL),
	(31, '2025-04-29', '8765432109', 'Eduardo Oliveira Nogueira Lima', '2017-06-10', '25789435', 'Viviane Souza Lima Nogueira Pereira', 'Mãe com responsabilidade compartilhada', 'josé.lima890@email.com', '(11) 91567-4321', NULL, NULL),
	(32, '2025-04-29', '1023456789', 'Fernanda Lima Oliveira Costa', '2017-06-18', '35060136', 'Beatriz Santos Oliveira Silva Lima', 'Mãe afetiva', 'fernanda.barbosa876@email.com', '(11) 90567-8910', NULL, NULL),
	(33, '2025-04-29', '2134567890', 'Victor Souza Rocha Martins', '2018-10-10', '35060136', 'Henrique Carvalho Souza Lima Pinto', 'Pai de coração', 'victor.rocha654@email.com', '(11) 98234-5678', NULL, NULL),
	(34, '2025-04-29', '3245678901', 'Camila Nogueira Lima Oliveira', '2019-03-25', '35060136', 'Priscila Rocha Nogueira Alves Barbosa', 'Mãe de coração', 'camila.souza908@email.com', '(11) 91567-4321', NULL, NULL),
	(35, '2025-04-29', '4356789012', 'Bruno Silva Costa Barbosa', '2016-05-13', '35060136', 'Leandro Pereira Oliveira Costa Santos', 'Pai de guarda', 'bruno.lima567@email.com', '(11) 92876-5432', NULL, NULL),
	(36, '2025-04-29', '5467890123', 'Larissa Martins Pereira Almeida', '2017-07-07', '35060136', 'Fernanda Souza Lima Martins Rocha', 'Mãe de guarda', 'larissa.almeida876@email.com', '(11) 99654-3210', NULL, NULL),
	(37, '2025-04-29', '6578901234', 'Diego Oliveira Lima Rocha', '2018-09-19', '35060136', 'José Costa Barbosa Nogueira Almeida', 'Pai temporário', 'diego.pinto223@email.com', '(11) 98987-6543', NULL, NULL),
	(38, '2025-04-29', '5456789012', 'Larissa Nogueira Silva Almeida', '2018-08-05', '35060136', 'Rafael Silva Barbosa Nogueira Lima', 'Mãe de visitação', 'juliano.lima654@email.com', '(11) 92234-5678', NULL, NULL),
	(39, '2025-04-29', '6567890123', 'Marcos Lima Souza Pereira', '2019-01-11', '35060136', 'Lucas Santos Pereira Almeida Rocha', 'Pai biológico em regime de visitas', 'larissa.barbosa223@email.com', '(11) 91865-4321', NULL, NULL),
	(40, '2025-04-29', '7678901234', 'Camila Rocha Almeida Oliveira', '2017-04-20', '35060136', 'Patrícia Lima Alves Barbosa Oliveira', 'Mãe biológica em regime de visitas', 'fábio.rodrigues890@email.com', '(11) 93567-4321', NULL, NULL),
	(41, '2025-04-29', '7656789012', 'Marcelo Lima Pereira Costa', '2019-05-28', '35060136', 'Ricardo Lima Rocha Alves Souza', 'Mãe de acolhimento', 'renata.almeida223@email.com', '(11) 98321-7654', NULL, NULL),
	(42, '2025-04-29', '8767890123', 'Paula Barbosa Souza Lima', '2016-01-13', '35060136', 'Bruno Costa Almeida Santos Lima', 'Pai colaborador', 'marcelo.pereira908@email.com', '(11) 93987-6543', NULL, NULL),
	(43, '2025-04-29', '9878901234', 'Felipe Costa Nogueira Almeida', '2017-03-27', '35060136', 'Karina Oliveira Pereira Barbosa Lima', 'Mãe colaboradora', 'paula.martins567@email.com', '(11) 92234-5678', NULL, NULL),
	(44, '2025-04-29', '1098765432', 'Vitória Souza Lima Rocha', '2018-10-01', '35060136', 'Eduardo Souza Lima Rocha Nogueira', 'Pai com convivência alternada', 'felipe.rodrigues223@email.com', '(11) 96654-3210', NULL, NULL),
	(45, '2025-04-29', '2109876543', 'Anderson Martins Almeida Lima', '2019-12-25', '35067350', 'Sofia Santos Pereira Lima Rocha', 'Mãe com convivência alternada', 'lucas.costa112@email.com', '(11) 97456-7890', NULL, NULL),
	(46, '2025-04-29', '3210987654', 'Mariana Rocha Costa Pereira', '2016-06-18', '35067350', 'Fábio Almeida Oliveira Pinto Costa', 'Responsável familiar', 'isabela.barbosa345@email.com', '(11) 90765-4321', NULL, NULL),
	(47, '2025-04-29', '4321098765', 'Ricardo Lima Souza Barbosa', '2017-05-05', '35067350', 'Clara Costa Pereira Lima Nogueira', 'Responsável institucional', 'tiago.lima876@email.com', '(11) 91432-7654', NULL, NULL),
	(48, '2025-04-29', '5432109876', 'Cristiane Silva Lima Nogueira', '2018-08-20', '35067350', 'Leandro Santos Almeida Lima Rocha', 'Pai com visitação regular', 'andré.souza987@email.com', '(11) 92765-4321', NULL, NULL),
	(49, '2025-04-29', '1234567890', 'João Souza Silva Pereira', '2016-02-15', '35067350', 'Felipe Souza Costa Almeida Silva', 'Pai', 'joao.silva123@email.com', '(11) 91234-5678', NULL, NULL),
	(50, '2025-04-29', '9876543210', 'Maria Oliveira Santos Costa', '2017-03-02', '35067350', 'Juliana Pereira Barbosa Nogueira Costa', 'Mãe', 'maria.oliveira456@email.com', '(11) 91876-5432', NULL, NULL),
	(51, '2025-04-29', '1122334455', 'Carlos Almeida Rocha Pinto', '2016-05-11', '35067350', 'Tiago Oliveira Santos Lima Rocha', 'Pai biológico', 'pedro.martins789@email.com', '(11) 93765-4321', NULL, NULL),
	(52, '2025-04-29', '9988776655', 'Ana Paula Lima Costa Souza', '2017-07-24', '35067350', 'Isabela Carvalho Almeida Souza Pinto', 'Mãe biológica', 'beatriz.lima112@email.com', '(11) 99123-4567', NULL, NULL),
	(53, '2025-04-29', '2233445566', 'Pedro Henrique Santos Almeida', '2018-09-08', '35067350', 'Gustavo Lima Silva Pereira Santos', 'Pai adotivo', 'carlos.rocha987@email.com', '(11) 98876-5432', NULL, NULL),
	(54, '2025-04-29', '4455667788', 'Beatriz Nogueira Silva Lima', '2019-01-20', '35067350', 'Mariana Costa Alves Pereira Martins', 'Mãe adotiva', 'ana.santos334@email.com', '(11) 96987-6543', NULL, NULL),
	(55, '2025-04-29', '6677889900', 'Rafael Oliveira Rocha Almeida', '2016-04-14', '35067350', 'Rafael Oliveira Almeida Rocha Dias', 'Pai de criação', 'rafael.oliveira654@email.com', '(11) 93876-4321', NULL, NULL),
	(56, '2025-04-29', '2345678901', 'Juliana Costa Almeida Silva', '2017-06-09', '35067350', 'Camila Barbosa Silva Lima Oliveira', 'Mãe de criação', 'juliana.pinto432@email.com', '(11) 92345-6789', NULL, NULL);

-- Copiando estrutura para tabela sap_tea.atividade
CREATE TABLE IF NOT EXISTS `atividade` (
  `id_atividade` int(11) NOT NULL AUTO_INCREMENT,
  `cod_atividade` varchar(20) NOT NULL,
  `desc_atividade` varchar(200) NOT NULL,
  `fk_idhabilidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_atividade`),
  KEY `fk_habilidade_atividade` (`fk_idhabilidade`),
  CONSTRAINT `fk_habilidade_atividade` FOREIGN KEY (`fk_idhabilidade`) REFERENCES `habilidade` (`id_habilidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela sap_tea.atividade: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela sap_tea.atividade_comportamento
CREATE TABLE IF NOT EXISTS `atividade_comportamento` (
  `id_ati_comportamento` int(11) NOT NULL AUTO_INCREMENT,
  `cod_ati_comportamento` char(5) COLLATE latin1_general_ci NOT NULL,
  `desc_ati_comportamento` varchar(250) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id_ati_comportamento`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Copiando dados para a tabela sap_tea.atividade_comportamento: ~7 rows (aproximadamente)
INSERT INTO `atividade_comportamento` (`id_ati_comportamento`, `cod_ati_comportamento`, `desc_ati_comportamento`) VALUES
	(1, 'ECP01', 'A ordem é...'),
	(2, 'ECP02', 'Mexe e remexe'),
	(3, 'ECP03', 'Minha rotina'),
	(4, 'ECP04', 'PIQUENIQUE'),
	(5, 'ECP05', 'Positivo e negativo'),
	(6, 'ECP06', 'Rotina de autocuidado'),
	(7, 'NECP1', 'Cortando o Cabelo');

-- Copiando estrutura para tabela sap_tea.atividade_com_lin
CREATE TABLE IF NOT EXISTS `atividade_com_lin` (
  `id_ati_com_lin` int(11) NOT NULL AUTO_INCREMENT,
  `cod_ati_com_lin` varchar(5) COLLATE latin1_general_ci NOT NULL,
  `desc_ati_com_lin` varchar(250) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id_ati_com_lin`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Copiando dados para a tabela sap_tea.atividade_com_lin: ~8 rows (aproximadamente)
INSERT INTO `atividade_com_lin` (`id_ati_com_lin`, `cod_ati_com_lin`, `desc_ati_com_lin`) VALUES
	(1, 'ECM01', '1, 2, 3... acerte uma vez'),
	(2, 'ECM02', 'A mágica da gentileza'),
	(3, 'ECM03', 'Ache e junte'),
	(4, 'ECM04', ' Expressão ilustrada'),
	(5, 'ECM05', 'Minha rede de ajuda'),
	(6, 'ECM06', 'Onde encaixa?'),
	(7, 'ECM07', 'Que animal é esse?'),
	(8, 'ECM08', 'ECM08 - Vivências do cotidiano');

-- Copiando estrutura para tabela sap_tea.atividade_int_soc
CREATE TABLE IF NOT EXISTS `atividade_int_soc` (
  `id_ati_int_soc` int(11) NOT NULL AUTO_INCREMENT,
  `cod_ati_int_soc` char(5) COLLATE latin1_general_ci NOT NULL,
  `desc_ati_int_soc` varchar(250) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id_ati_int_soc`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Copiando dados para a tabela sap_tea.atividade_int_soc: ~6 rows (aproximadamente)
INSERT INTO `atividade_int_soc` (`id_ati_int_soc`, `cod_ati_int_soc`, `desc_ati_int_soc`) VALUES
	(1, 'EIS01', 'Emocionômetro'),
	(2, 'EIS02', 'Eu como sou!'),
	(3, 'EIS03', 'Nomeando as emoções'),
	(4, 'EIS04', ' A professora faltou'),
	(5, 'NEIS2', 'Ano Novo, turma nova'),
	(6, 'NEIS3', 'Hora do intervalo');

-- Copiando estrutura para tabela sap_tea.comunicacao
CREATE TABLE IF NOT EXISTS `comunicacao` (
  `id_comunicacao` int(11) NOT NULL AUTO_INCREMENT,
  `precisa_comunicacao` tinyint(1) DEFAULT NULL,
  `entende_instrucao` tinyint(1) DEFAULT NULL,
  `recomenda_instrucao` text,
  `fk_id_aluno` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_comunicacao`),
  KEY `fk_alu_id` (`fk_id_aluno`),
  CONSTRAINT `comunicacao_ibfk_1` FOREIGN KEY (`fk_id_aluno`) REFERENCES `aluno` (`alu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela sap_tea.comunicacao: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela sap_tea.eixo_comportamento
CREATE TABLE IF NOT EXISTS `eixo_comportamento` (
  `id_eixo_comport` int(11) NOT NULL AUTO_INCREMENT,
  `ecp01` tinyint(1) DEFAULT NULL,
  `ecp02` tinyint(1) DEFAULT NULL,
  `ecp03` tinyint(1) DEFAULT NULL,
  `ecp04` tinyint(1) DEFAULT NULL,
  `ecp05` tinyint(1) DEFAULT NULL,
  `ecp06` tinyint(1) DEFAULT NULL,
  `ecp07` tinyint(1) DEFAULT NULL,
  `ecp08` tinyint(1) DEFAULT NULL,
  `ecp09` tinyint(1) DEFAULT NULL,
  `ecp10` tinyint(1) DEFAULT NULL,
  `ecp11` tinyint(1) DEFAULT NULL,
  `ecp12` tinyint(1) DEFAULT NULL,
  `ecp13` tinyint(1) DEFAULT NULL,
  `ecp14` tinyint(1) DEFAULT NULL,
  `ecp15` tinyint(1) DEFAULT NULL,
  `ecp16` tinyint(1) DEFAULT NULL,
  `ecp17` tinyint(1) DEFAULT NULL,
  `fk_alu_id_ecomp` int(11) DEFAULT NULL,
  `data_insert_comportamento` date DEFAULT NULL,
  `fase_inv_comportamento` char(2) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_eixo_comport`),
  KEY `fk_alu_id_ecomp` (`fk_alu_id_ecomp`),
  CONSTRAINT `eixo_comportamento_ibfk_1` FOREIGN KEY (`fk_alu_id_ecomp`) REFERENCES `aluno` (`alu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Copiando dados para a tabela sap_tea.eixo_comportamento: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela sap_tea.eixo_com_lin
CREATE TABLE IF NOT EXISTS `eixo_com_lin` (
  `id_eixo_com_lin` int(11) NOT NULL AUTO_INCREMENT,
  `ecm01` tinyint(1) DEFAULT NULL,
  `ecm02` tinyint(1) DEFAULT NULL,
  `ecm03` tinyint(1) DEFAULT NULL,
  `ecm04` tinyint(1) DEFAULT NULL,
  `ecm05` tinyint(1) DEFAULT NULL,
  `ecm06` tinyint(1) DEFAULT NULL,
  `ecm07` tinyint(1) DEFAULT NULL,
  `ecm08` tinyint(1) DEFAULT NULL,
  `ecm09` tinyint(1) DEFAULT NULL,
  `ecm10` tinyint(1) DEFAULT NULL,
  `ecm11` tinyint(1) DEFAULT NULL,
  `ecm12` tinyint(1) DEFAULT NULL,
  `ecm13` tinyint(1) DEFAULT NULL,
  `ecm14` tinyint(1) DEFAULT NULL,
  `ecm15` tinyint(1) DEFAULT NULL,
  `ecm16` tinyint(1) DEFAULT NULL,
  `ecm17` tinyint(1) DEFAULT NULL,
  `ecm18` tinyint(1) DEFAULT NULL,
  `ecm19` tinyint(1) DEFAULT NULL,
  `ecm20` tinyint(1) DEFAULT NULL,
  `ecm21` tinyint(1) DEFAULT NULL,
  `ecm22` tinyint(1) DEFAULT NULL,
  `ecm23` tinyint(1) DEFAULT NULL,
  `ecm24` tinyint(1) DEFAULT NULL,
  `ecm25` tinyint(1) DEFAULT NULL,
  `ecm26` tinyint(1) DEFAULT NULL,
  `ecm27` tinyint(1) DEFAULT NULL,
  `ecm28` tinyint(1) DEFAULT NULL,
  `ecm29` tinyint(1) DEFAULT NULL,
  `ecm30` tinyint(1) DEFAULT NULL,
  `ecm31` tinyint(1) DEFAULT NULL,
  `ecm32` tinyint(1) DEFAULT NULL,
  `fk_alu_id_ecomling` int(11) DEFAULT NULL,
  `data_insert_com_lin` date DEFAULT NULL,
  `fase_inv_com_lin` char(2) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_eixo_com_lin`),
  KEY `fk_alu_id_ecomling` (`fk_alu_id_ecomling`),
  CONSTRAINT `eixo_com_lin_ibfk_1` FOREIGN KEY (`fk_alu_id_ecomling`) REFERENCES `aluno` (`alu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Copiando dados para a tabela sap_tea.eixo_com_lin: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela sap_tea.enturmacao
CREATE TABLE IF NOT EXISTS `enturmacao` (
  `id_enturmacao` int(11) NOT NULL AUTO_INCREMENT,
  `fk_id_escola` int(11) DEFAULT NULL,
  `fk_id_modalidade` int(11) DEFAULT NULL,
  `fk_inep` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_enturmacao`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela sap_tea.enturmacao: ~20 rows (aproximadamente)
INSERT INTO `enturmacao` (`id_enturmacao`, `fk_id_escola`, `fk_id_modalidade`, `fk_inep`) VALUES
	(25, 5, 1, '26190915'),
	(26, 5, 2, '26190915'),
	(27, 5, 3, '26190915'),
	(28, 5, 4, '26190915'),
	(29, 5, 5, '26190915'),
	(30, 5, 6, '26190915'),
	(32, 2, 1, '56899555'),
	(33, 5, 7, '26190915'),
	(34, 4, 10, '25666665'),
	(35, 4, 11, '25666665'),
	(36, 3, 2, '25789435'),
	(37, 3, 3, '25789435'),
	(38, 3, 4, '25789435'),
	(39, 3, 5, '25789435'),
	(40, 3, 6, '25789435'),
	(41, 3, 7, '25789435'),
	(42, 3, 8, '25789435'),
	(43, 3, 9, '25789435'),
	(44, 3, 10, '25789435'),
	(45, 3, 11, '25789435');

-- Copiando estrutura para tabela sap_tea.enturmacao_professor
CREATE TABLE IF NOT EXISTS `enturmacao_professor` (
  `id_entur_professor` int(11) NOT NULL AUTO_INCREMENT,
  `fk_id_func` int(11) DEFAULT NULL,
  `fk_id_enturmacao` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_entur_professor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela sap_tea.enturmacao_professor: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela sap_tea.escola
CREATE TABLE IF NOT EXISTS `escola` (
  `esc_id` int(11) NOT NULL AUTO_INCREMENT,
  `esc_dtcad` date DEFAULT NULL,
  `esc_inep` varchar(15) NOT NULL,
  `esc_cnpj` varchar(25) DEFAULT NULL,
  `esc_razao_social` varchar(200) NOT NULL,
  `esc_endereco` varchar(250) DEFAULT NULL,
  `esc_bairro` varchar(100) DEFAULT NULL,
  `esc_municipio` varchar(100) DEFAULT NULL,
  `esc_cep` varchar(15) DEFAULT NULL,
  `esc_uf` varchar(2) DEFAULT NULL,
  `esc_telefone` varchar(20) DEFAULT NULL,
  `esc_email` varchar(150) DEFAULT NULL,
  `fk_org_esc_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`esc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela sap_tea.escola: ~11 rows (aproximadamente)
INSERT INTO `escola` (`esc_id`, `esc_dtcad`, `esc_inep`, `esc_cnpj`, `esc_razao_social`, `esc_endereco`, `esc_bairro`, `esc_municipio`, `esc_cep`, `esc_uf`, `esc_telefone`, `esc_email`, `fk_org_esc_id`) VALUES
	(1, '2025-04-29', '12375642', '10.424.655/0001-40', 'Foccus Editora e Serviços', 'Rua Norivaldo Martins da Silva', 'Retiro', 'Jundiaí', '13211-241', 'SP', '(11) 2449-1962', 'suporte@foccuseditora.com.br', 3),
	(2, '2025-04-29', '12345678', '12.345.678/0001-90', 'Colégio Estrela do Saber', 'Rua das Flores, 120', 'Jardim Primavera', 'Campinas', '13045-678', 'SP', '(19) 3345-6789', 'contato@estreladosaber.edu.br', 4),
	(3, '2025-04-29', '23456789', '23.456.789/0001-80', 'Escola Integração Moderna', 'Avenida Brasil, 1020', 'Centro', 'Curitiba', '80010-000', 'PR', '(41) 3234-5678', 'secretaria@integracaomoderna.com.br', 5),
	(4, '2025-04-29', '34567890', '34.567.890/0001-70', 'Instituto Horizonte Azul', 'Rua das Palmeiras, 555', 'Boa Vista', 'Recife', '52060-001', 'PE', '(81) 3123-4567', 'contato@horizonteazul.edu.br', 3),
	(5, '2025-04-29', '45678901', '45.678.901/0001-60', 'Centro Educacional Nova Geração', 'Rua do Comércio, 250', 'Centro', 'Florianópolis', '88010-300', 'SC', '(48) 3222-1234', 'atendimento@novageracao.edu.br', 2),
	(6, '2025-04-29', '56789012', '56.789.012/0001-50', 'Escola Vida e Saber', 'Rua das Acácias, 45', 'Vila Nova', 'Salvador', '40240-000', 'BA', '(71) 3322-4567', 'contato@vidaesaber.com.br', 2),
	(7, '2025-04-29', '67890123', '67.890.123/0001-40', 'Colégio Raízes do Futuro', 'Avenida Central, 890', 'Nova Esperança', 'Manaus', '69050-100', 'AM', '(92) 3234-7890', 'secretaria@raizesdofuturo.edu.br', 4),
	(8, '2025-04-29', '78901234', '78.901.234/0001-30', 'Escola Nova Visão', 'Rua da Paz, 350', 'Jardim América', 'Goiânia', '74080-010', 'GO', '(62) 3212-3456', 'contato@novavisao.com.br', 1),
	(9, '2025-04-29', '89012345', '89.012.345/0001-20', 'Instituto Alfa e Ômega', 'Rua Aurora, 678', 'Santa Luzia', 'Fortaleza', '60040-000', 'CE', '(85) 3456-7890', 'secretaria@alfaeomega.edu.br', 5),
	(10, '2025-04-29', '90123456', '90.123.456/0001-10', 'Centro Educacional Saber Mais', 'Rua do Sol, 200', 'Morada Nova', 'Porto Alegre', '90010-200', 'RS', '(51) 3345-6789', 'contato@sabermais.com.br', 3),
	(11, '2025-04-29', '', '', ' ', '', '', '', '', '', '', '', 1);

-- Copiando estrutura para tabela sap_tea.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela sap_tea.failed_jobs: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela sap_tea.funcionario
CREATE TABLE IF NOT EXISTS `funcionario` (
  `func_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `func_data_cad` date NOT NULL,
  `inep` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `func_nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `func_cpf` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_func` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `func_cod_funcao` bigint(20) unsigned NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`func_id`),
  UNIQUE KEY `funcionario_func_cpf_unique` (`func_cpf`),
  UNIQUE KEY `funcionario_email_func_unique` (`email_func`),
  KEY `funcionario_func_cod_funcao_foreign` (`func_cod_funcao`),
  CONSTRAINT `funcionario_func_cod_funcao_foreign` FOREIGN KEY (`func_cod_funcao`) REFERENCES `tipo_funcao` (`tipo_funcao_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela sap_tea.funcionario: ~0 rows (aproximadamente)
INSERT INTO `funcionario` (`func_id`, `func_data_cad`, `inep`, `func_nome`, `func_cpf`, `email_func`, `password`, `func_cod_funcao`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`) VALUES
	(1, '2025-05-07', '00000000', 'Usuário Foccus', '000.000.000-00', 'foccus@email.com', '$2y$10$oB3Zm/shhbs16.33Tyth0.x47s3OGXs.LSMPJF/yPLxqeD4rYAQ6.', 1, NULL, NULL, '2025-05-07 04:16:58', '2025-05-07 05:49:14'),
	(3, '2025-05-07', '12345678', 'Marcos Barroso', '595.968.306-78', 'marcosbarroso.info@gmail.com', '$2y$10$9y2JEIUZxUgQX9uMLoj3ReJfo1034KkiFFVnIe/UNmuxRq1X.2Q4C', 1, NULL, NULL, '2025-05-07 14:50:30', '2025-05-07 15:08:14');

-- Copiando estrutura para tabela sap_tea.habilidade
CREATE TABLE IF NOT EXISTS `habilidade` (
  `id_habilidade` int(11) NOT NULL AUTO_INCREMENT,
  `desc_habilidade` varchar(200) NOT NULL,
  `fk_tpeixo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_habilidade`),
  KEY `fk_tpeixo_habilidade` (`fk_tpeixo`),
  CONSTRAINT `fk_tpeixo_habilidade` FOREIGN KEY (`fk_tpeixo`) REFERENCES `tp_eixo` (`id_tpeixo`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela sap_tea.habilidade: ~67 rows (aproximadamente)
INSERT INTO `habilidade` (`id_habilidade`, `desc_habilidade`, `fk_tpeixo`) VALUES
	(1, 'Amplia gradativamente seu vocabulário?', 1),
	(2, 'Amplia gradativamente sua comunicação social?', 1),
	(3, 'Apresenta entonação vocal, com boa articulação e ritmo adequado?', 1),
	(4, 'Ativa conhecimentos prévios em situações de novas aprendizagens?', 1),
	(5, 'Categoriza diferentes elementos de acordo com critérios preestabelecidos?', 1),
	(6, 'Compreende e utiliza comunicação alternativa para se comunicar?', 1),
	(7, 'Compreende que pode receber ajuda de pessoas conhecidas que estão ao seu redor', 1),
	(8, 'Comunica fatos, acontecimentos e ações de seu cotidiano de modo compreensível, ainda que não seja por meio da linguagem verbal?', 1),
	(9, 'Comunica suas necessidades básicas (banheiro, água, comida, entre outros)?', 1),
	(10, 'Entende expressões faciais em uma conversa?', 1),
	(11, 'Executa mais de um comando sequencialmente?', 1),
	(12, 'Expressa-se com clareza e objetividade?', 1),
	(13, 'Faz uso de expressões faciais para se comunicar?', 1),
	(14, 'Faz uso de gestos para se comunicar?', 1),
	(15, 'Identifica diferentes elementos, ampliando seu repertório?', 1),
	(16, 'Identifica semelhanças e diferenças entre elementos?', 1),
	(17, 'Inicia uma situação comunicativa?', 1),
	(18, 'Mantem uma situação comunicativa?', 1),
	(19, 'Nomeia as pessoas que fazem parte de sua rede de apoio?', 1),
	(20, 'Nomeia diferentes elementos, ampliando seu vocabulário?', 1),
	(21, 'Possui autonomia para se comunicar, mesmo em situações que geram conflito?', 1),
	(22, 'Realiza pareamento de elementos idênticos?', 1),
	(23, 'Reconhece e pareia elementos diferentes?', 1),
	(24, 'Reconhece visualmente estímulos apresentados?', 1),
	(25, 'Refere-se a si mesmo em primeira pessoa?', 1),
	(26, 'Respeita turnos de fala?', 1),
	(27, 'Responde ao ouvir seu nome?', 1),
	(28, 'Solicita ajuda de pessoas que estão ao seu redor, quando necessário?', 1),
	(29, 'Utiliza linguagem não verbal para se comunicar?', 1),
	(30, 'Utiliza linguagem verbal para se comunicar?', 1),
	(31, 'Utiliza respostas simples para se comunicar?', 1),
	(32, 'Utiliza vocabulário adequado, de acordo com seu nível de desenvolvimento?', 1),
	(33, 'Adapta-se com flexibilidade a mudanças, em sua rotina', 2),
	(34, 'Apresenta autonomia na realização das atividades propostas?', 2),
	(35, 'Autorregula-se evitando comportamentos disruptivos em situações de desconforto?', 2),
	(36, 'Compreende acontecimentos de sua rotina por meio de ilustrações?', 2),
	(37, 'Compreende regras de convivência?', 2),
	(38, 'Entende ações de autocuidado?', 2),
	(39, 'Faz uso de movimentos corporais, como: apontar, movimentar a cabeça em sinal afirmativo/negativo, entre outros?', 2),
	(40, 'Imita gestos, movimentos e segue comandos?', 2),
	(41, 'Inicia e finaliza as atividades propostas diariamente?', 2),
	(42, 'Interage nos momentos de jogos, lazer e demais atividades, respeitando as regras de convivência?', 2),
	(43, 'Mantem a organização em sua rotina escolar?', 2),
	(44, 'Permanece sentado por mais de dez minutos para a realização das atividades?', 2),
	(45, 'Realiza ações motoras que envolvam movimento e equilíbrio?', 2),
	(46, 'Realiza atividades com atenção e tolerância?', 2),
	(47, 'Realiza, em sua rotina, ações de autocuidado com autonomia?', 2),
	(48, 'Reconhece e identifica alimentos que lhe são oferecidos?', 2),
	(49, 'Responde a comandos de ordem direta?', 2),
	(50, 'Compartilha brinquedos e brincadeiras?', 3),
	(51, 'Compartilha interesses?', 3),
	(52, 'Controla suas emoções? (Autorregula-se)', 3),
	(53, 'Coopera em situações que envolvem interação?', 3),
	(54, 'Demonstra e compartilha afeto?', 3),
	(55, 'Demonstra interesse nas atividades propostas?', 3),
	(56, 'Expressa suas emoções?', 3),
	(57, 'Identifica/reconhece a emoção do outro?', 3),
	(58, 'Identifica/reconhece suas emoções?', 3),
	(59, 'Inicia e mantém interação em situações sociais?', 3),
	(60, 'Interage com o(a) professor(a), seus colegas e outras pessoas de seu convívio escolar?', 3),
	(61, 'Interage, fazendo contato visual?', 3),
	(62, 'Reconhece e entende seus sentimentos, pensamentos e comportamentos?', 3),
	(63, 'Relaciona-se, estabelecendo vínculos?', 3),
	(64, 'Respeita regras em jogos e brincadeiras?', 3),
	(65, 'Respeita regras sociais?', 3),
	(66, 'Responde a interações?', 3),
	(67, 'Solicita ajuda, quando necessário?', 3);

-- Copiando estrutura para tabela sap_tea.habilidade_comportamento
CREATE TABLE IF NOT EXISTS `habilidade_comportamento` (
  `id_hab_comportamento` int(11) NOT NULL AUTO_INCREMENT,
  `cod_hab_comportamento` char(5) COLLATE latin1_general_ci NOT NULL,
  `desc_hab_comportamento` varchar(250) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id_hab_comportamento`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Copiando dados para a tabela sap_tea.habilidade_comportamento: ~17 rows (aproximadamente)
INSERT INTO `habilidade_comportamento` (`id_hab_comportamento`, `cod_hab_comportamento`, `desc_hab_comportamento`) VALUES
	(1, 'ecp01', 'Adapta-se com flexibilidade a mudanças, em sua rotina (familiar, escolar e social)?'),
	(2, 'ecp02', 'Apresenta autonomia na realização das atividades propostas?'),
	(3, 'ecp03', 'Autorregula-se evitando comportamentos disruptivos em situações de desconforto?'),
	(4, 'ecp04', 'Compreende acontecimentos de sua rotina por meio de ilustrações?'),
	(5, 'ecp05', 'Compreende regras de convivência?'),
	(6, 'ecp06', 'Entende ações de autocuidado?'),
	(7, 'ecp07', 'Faz uso de movimentos corporais, como: apontar, movimentar a cabeça em sinal afirmativo/negativo, entre outros?'),
	(8, 'ecp08', 'Imita gestos, movimentos e segue comandos?'),
	(9, 'ecp09', 'Inicia e finaliza as atividades propostas diariamente?'),
	(10, 'ecp10', 'Interage nos momentos de jogos, lazer e demais atividades, respeitando as regras de convivência?'),
	(11, 'ecp11', 'Mantem a organização em sua rotina escolar?'),
	(12, 'ecp12', 'Permanece sentado por mais de dez minutos para a realização das atividades?'),
	(13, 'ecp13', 'Realiza ações motoras que envolvam movimento e equilíbrio?'),
	(14, 'ecp14', 'Realiza atividades com atenção e tolerância?'),
	(15, 'ecp15', 'Realiza, em sua rotina, ações de autocuidado com autonomia?'),
	(16, 'ecp16', 'Reconhece e identifica alimentos que lhe são oferecidos?'),
	(17, 'ecp17', 'Responde a comandos de ordem direta?');

-- Copiando estrutura para tabela sap_tea.habilidade_com_lin
CREATE TABLE IF NOT EXISTS `habilidade_com_lin` (
  `id_hab_com_lin` int(11) NOT NULL AUTO_INCREMENT,
  `cod_hab_com_lin` char(5) COLLATE latin1_general_ci NOT NULL,
  `desc_hab_com_lin` varchar(250) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id_hab_com_lin`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Copiando dados para a tabela sap_tea.habilidade_com_lin: ~32 rows (aproximadamente)
INSERT INTO `habilidade_com_lin` (`id_hab_com_lin`, `cod_hab_com_lin`, `desc_hab_com_lin`) VALUES
	(1, 'ecm01', 'Amplia gradativamente seu vocabulário?'),
	(2, 'ecm02', 'Amplia gradativamente sua comunicação social?'),
	(3, 'ecm03', 'Apresenta entonação vocal, com boa articulação e ritmo adequado?'),
	(4, 'ecm04', 'Ativa conhecimentos prévios em situações de novas aprendizagens?'),
	(5, 'ecm05', 'Categoriza diferentes elementos de acordo com critérios preestabelecidos?'),
	(6, 'ecm06', 'Compreende e utiliza comunicação alternativa para se comunicar?'),
	(7, 'ecm07', 'Compreende que pode receber ajuda de pessoas conhecidas que estão ao seu redor?'),
	(8, 'ecm08', 'Comunica fatos, acontecimentos e ações de seu cotidiano de modo compreensível, ainda que não seja por meio da linguagem verbal?'),
	(9, 'ecm09', 'Comunica suas necessidades básicas (banheiro, água, comida, entre outros)?'),
	(10, 'ecm10', 'Entende expressões faciais em uma conversa?'),
	(11, 'ecm11', 'Executa mais de um comando sequencialmente?'),
	(12, 'ecm12', 'Expressa-se com clareza e objetividade?'),
	(13, 'ecm13', 'Faz uso de expressões faciais para se comunicar?'),
	(14, 'ecm14', 'Faz uso de gestos para se comunicar?'),
	(15, 'ecm15', 'Identifica diferentes elementos, ampliando seu repertório?'),
	(16, 'ecm16', 'Identifica semelhanças e diferenças entre elementos?'),
	(17, 'ecm17', 'Inicia uma situação comunicativa?'),
	(18, 'ecm18', 'Mantem uma situação comunicativa?'),
	(19, 'ecm19', 'Nomeia as pessoas que fazem parte de sua rede de apoio?'),
	(20, 'ecm20', 'Nomeia diferentes elementos, ampliando seu vocabulário?'),
	(21, 'ecm21', 'Possui autonomia para se comunicar, mesmo em situações que geram conflito?'),
	(22, 'ecm22', 'Realiza pareamento de elementos idênticos?'),
	(23, 'ecm23', 'Reconhece e pareia elementos diferentes?'),
	(24, 'ecm24', 'Reconhece visualmente estímulos apresentados?'),
	(25, 'ecm25', 'Refere-se a si mesmo em primeira pessoa?'),
	(26, 'ecm26', 'Respeita turnos de fala?'),
	(27, 'ecm27', 'Responde ao ouvir seu nome?'),
	(28, 'ecm28', 'Solicita ajuda de pessoas que estão ao seu redor, quando necessário?'),
	(29, 'ecm29', 'Utiliza linguagem não verbal para se comunicar?'),
	(30, 'ecm30', 'Utiliza linguagem verbal para se comunicar?'),
	(31, 'ecm31', 'Utiliza respostas simples para se comunicar?'),
	(32, 'ecm32', 'Utiliza vocabulário adequado, de acordo com seu nível de desenvolvimento?');

-- Copiando estrutura para tabela sap_tea.habilidade_int_soc
CREATE TABLE IF NOT EXISTS `habilidade_int_soc` (
  `id_hab_int_soc` int(11) NOT NULL AUTO_INCREMENT,
  `cod_hab_int_soc` char(5) COLLATE latin1_general_ci NOT NULL,
  `desc_hab_int_soc` varchar(250) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id_hab_int_soc`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Copiando dados para a tabela sap_tea.habilidade_int_soc: ~18 rows (aproximadamente)
INSERT INTO `habilidade_int_soc` (`id_hab_int_soc`, `cod_hab_int_soc`, `desc_hab_int_soc`) VALUES
	(1, 'eis01', 'Compartilha brinquedos e brincadeiras?'),
	(2, 'eis02', 'Compartilha interesses?'),
	(3, 'eis03', 'Controla suas emoções? (Autorregula-se)'),
	(4, 'eis04', 'Coopera em situações que envolvem interação?'),
	(5, 'eis05', 'Demonstra e compartilha afeto?'),
	(6, 'eis06', 'Demonstra interesse nas atividades propostas?'),
	(7, 'eis07', 'Expressa suas emoções? '),
	(8, 'eis08', 'Identifica/reconhece a emoção do outro?'),
	(9, 'eis09', 'Identifica/reconhece suas emoções?'),
	(10, 'eis10', 'Inicia e mantém interação em situações sociais?'),
	(11, 'eis11', 'Interage com o(a) professor(a), seus colegas e outras pessoas de seu convívio escolar?'),
	(12, 'eis12', 'Interage, fazendo contato visual?'),
	(13, 'eis13', 'Reconhece e entende seus sentimentos, pensamentos e comportamentos? '),
	(14, 'eis14', 'Relaciona-se, estabelecendo vínculos? '),
	(15, 'eis15', 'Respeita regras em jogos e brincadeiras?'),
	(16, 'eis16', 'Respeita regras sociais?'),
	(17, 'eis17', 'Responde a interações? '),
	(18, 'eis18', 'Solicita ajuda, quando necessário?');

-- Copiando estrutura para tabela sap_tea.hab_pro_com_lin
CREATE TABLE IF NOT EXISTS `hab_pro_com_lin` (
  `id_hab_pro_com_lin` int(11) NOT NULL AUTO_INCREMENT,
  `fk_id_hab_com_lin` int(11) DEFAULT NULL,
  `fk_id_pro_com_lin` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_hab_pro_com_lin`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela sap_tea.hab_pro_com_lin: ~118 rows (aproximadamente)
INSERT INTO `hab_pro_com_lin` (`id_hab_pro_com_lin`, `fk_id_hab_com_lin`, `fk_id_pro_com_lin`) VALUES
	(1, 1, 2),
	(2, 1, 3),
	(3, 1, 4),
	(4, 1, 6),
	(5, 1, 7),
	(6, 1, 8),
	(7, 2, 1),
	(8, 2, 1),
	(9, 2, 1),
	(10, 2, 1),
	(11, 2, 1),
	(12, 2, 1),
	(13, 3, 8),
	(14, 4, 1),
	(15, 4, 2),
	(16, 4, 3),
	(17, 4, 5),
	(18, 4, 6),
	(19, 4, 7),
	(20, 4, 8),
	(21, 5, 3),
	(22, 5, 6),
	(23, 6, 3),
	(24, 6, 4),
	(25, 6, 5),
	(26, 6, 6),
	(27, 6, 7),
	(28, 7, 4),
	(29, 7, 5),
	(30, 8, 4),
	(31, 8, 5),
	(32, 8, 8),
	(33, 9, 4),
	(34, 9, 5),
	(35, 10, 2),
	(36, 10, 4),
	(37, 10, 7),
	(38, 11, 1),
	(39, 11, 3),
	(40, 11, 6),
	(41, 11, 7),
	(42, 12, 1),
	(43, 12, 2),
	(44, 12, 8),
	(45, 13, 2),
	(46, 13, 4),
	(47, 13, 7),
	(48, 14, 2),
	(49, 14, 3),
	(50, 14, 7),
	(51, 15, 1),
	(52, 15, 3),
	(53, 15, 6),
	(54, 16, 1),
	(55, 16, 3),
	(56, 16, 6),
	(57, 16, 7),
	(58, 17, 1),
	(59, 17, 2),
	(60, 17, 4),
	(61, 17, 7),
	(62, 18, 1),
	(63, 18, 8),
	(64, 19, 5),
	(65, 19, 8),
	(66, 20, 1),
	(67, 20, 3),
	(68, 20, 6),
	(69, 20, 7),
	(70, 20, 8),
	(71, 21, 2),
	(72, 21, 4),
	(73, 21, 5),
	(74, 21, 7),
	(75, 22, 3),
	(76, 22, 6),
	(77, 23, 3),
	(78, 23, 6),
	(79, 24, 1),
	(80, 24, 2),
	(81, 24, 3),
	(82, 24, 4),
	(83, 24, 5),
	(84, 25, 6),
	(85, 25, 7),
	(86, 25, 8),
	(87, 25, 2),
	(88, 25, 5),
	(89, 25, 8),
	(90, 26, 1),
	(91, 26, 6),
	(92, 26, 7),
	(93, 26, 8),
	(94, 27, 2),
	(95, 27, 5),
	(96, 28, 4),
	(97, 28, 5),
	(98, 29, 1),
	(99, 29, 2),
	(100, 29, 3),
	(101, 29, 4),
	(102, 29, 5),
	(103, 29, 6),
	(104, 29, 7),
	(105, 29, 8),
	(106, 30, 1),
	(107, 30, 2),
	(108, 30, 3),
	(109, 30, 5),
	(110, 30, 6),
	(111, 30, 8),
	(112, 31, 2),
	(113, 31, 3),
	(114, 31, 4),
	(115, 31, 5),
	(116, 31, 6),
	(117, 32, 1),
	(118, 32, 8);

-- Copiando estrutura para tabela sap_tea.instituicao
CREATE TABLE IF NOT EXISTS `instituicao` (
  `inst_id` int(11) NOT NULL AUTO_INCREMENT,
  `inst_razaosocial` varchar(250) NOT NULL,
  `inst_cnpj` varchar(20) DEFAULT NULL,
  `inst_endereco` varchar(250) DEFAULT NULL,
  `inst_bairro` varchar(150) DEFAULT NULL,
  `inst_municipio` varchar(150) DEFAULT NULL,
  `inst_cep` varchar(20) DEFAULT NULL,
  `inst_uf` char(2) DEFAULT NULL,
  `inst_email` varchar(200) DEFAULT NULL,
  `inst_tel1` varchar(20) DEFAULT NULL,
  `inst_tel2` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`inst_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela sap_tea.instituicao: ~5 rows (aproximadamente)
INSERT INTO `instituicao` (`inst_id`, `inst_razaosocial`, `inst_cnpj`, `inst_endereco`, `inst_bairro`, `inst_municipio`, `inst_cep`, `inst_uf`, `inst_email`, `inst_tel1`, `inst_tel2`) VALUES
	(1, ' Prefeitura Municipal de Serra Dourada', '11.222.333/0001-10', 'Rua Principal, 101', 'Centro', 'Serra Dourada', '75800-001', 'BA', 'contato@serradourada.ba.gov.br', '(77) 33411-000', '(77) 33411-001'),
	(2, 'Governo do Estado de Nova Alvorada', '22.333.444/0001-20', 'Av. das Bandeiras, 500', 'Jardim das Estrelas', 'Nova Alvorada', '74500-002', 'MS', 'governo@novaalvorada.ms.gov.br', '6733222000', '6733222001'),
	(3, 'Prefeitura Municipal de Pedra Branca', '33.444.555/0001-30', 'Travessa da Paz, 75', 'Bela Vista', 'Pedra Branca', '76800-003', 'CE', 'ouvidoria@pedrabranca.ce.gov.br', '8835353000', '8835353001'),
	(4, 'Governo do Estado de Campo Limpo', '44.555.666/0001-40', 'Rodovia Estadual KM 12', 'Zona Norte', 'Campo Limpo', '74900-004', 'GO', 'gabinete@campolimpo.go.gov.br', '6234564000', '6536255001'),
	(5, 'Prefeitura Municipal de Rio Verde', '55.666.777/0001-50', 'Praça da República, 200', 'Centro', 'Rio Verde', '75900-005', 'MT', 'comunicacao@rioverde.mt.gov.br', '6536255000', '6536255001');

-- Copiando estrutura para tabela sap_tea.inventario
CREATE TABLE IF NOT EXISTS `inventario` (
  `id_inventario` int(11) NOT NULL AUTO_INCREMENT,
  `fk_idsondagem` int(11) DEFAULT NULL,
  `fk_idhabilidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_inventario`),
  KEY `fk_sondagem_inventario` (`fk_idsondagem`),
  KEY `fk_habilidade_inventario` (`fk_idhabilidade`),
  CONSTRAINT `fk_habilidade_inventario` FOREIGN KEY (`fk_idhabilidade`) REFERENCES `habilidade` (`id_habilidade`),
  CONSTRAINT `fk_sondagem_inventario` FOREIGN KEY (`fk_idsondagem`) REFERENCES `sondagem` (`id_sondagem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela sap_tea.inventario: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela sap_tea.matricula
CREATE TABLE IF NOT EXISTS `matricula` (
  `id_matricula` int(11) NOT NULL AUTO_INCREMENT,
  `numero_matricula` varchar(20) NOT NULL,
  `fk_cod_valor_turma` varchar(20) NOT NULL,
  `ano_matricula` int(11) DEFAULT NULL,
  `fk_id_aluno` int(11) DEFAULT NULL,
  `fk_cod_mod` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_matricula`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela sap_tea.matricula: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela sap_tea.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela sap_tea.migrations: ~4 rows (aproximadamente)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2019_08_19_000000_create_failed_jobs_table', 1),
	(3, '2025_05_07_004949_create_tipo_funcao_table', 1),
	(4, '2025_05_07_005601_create_funcionario_table', 1),
	(5, '2014_10_12_100000_create_password_resets_table', 2);

-- Copiando estrutura para tabela sap_tea.modalidade
CREATE TABLE IF NOT EXISTS `modalidade` (
  `id_modalidade` int(11) NOT NULL AUTO_INCREMENT,
  `desc_modalidade` varchar(100) NOT NULL,
  `desc_serie_modalidade` varchar(80) NOT NULL,
  PRIMARY KEY (`id_modalidade`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela sap_tea.modalidade: ~11 rows (aproximadamente)
INSERT INTO `modalidade` (`id_modalidade`, `desc_modalidade`, `desc_serie_modalidade`) VALUES
	(1, 'ensino Infantil', 'Infantil'),
	(2, 'Anos Iniciais', '1º Ano'),
	(3, 'Anos Iniciais', '2º Ano'),
	(4, 'Anos Iniciais', '3º Ano'),
	(5, 'Anos Iniciais', '4º Ano'),
	(6, 'Anos Iniciais', '5º Ano'),
	(7, 'Anos Finais', '6º Ano'),
	(8, 'Anos Finais', '7º Ano'),
	(9, 'Anos Finais', '8º Ano'),
	(10, 'Anos Finais', '9º Ano'),
	(11, 'Educação Jovens e Adultos', 'Eja');

-- Copiando estrutura para tabela sap_tea.orgao
CREATE TABLE IF NOT EXISTS `orgao` (
  `org_id` int(11) NOT NULL AUTO_INCREMENT,
  `org_razaosocial` varchar(250) NOT NULL,
  `org_cnpj` varchar(20) DEFAULT NULL,
  `org_endereco` varchar(250) DEFAULT NULL,
  `org_bairro` varchar(150) DEFAULT NULL,
  `org_municipio` varchar(150) DEFAULT NULL,
  `org_cep` varchar(20) DEFAULT NULL,
  `org_uf` char(2) DEFAULT NULL,
  `org_email` varchar(200) DEFAULT NULL,
  `org_tel1` varchar(20) DEFAULT NULL,
  `org_tel2` varchar(20) DEFAULT NULL,
  `fk_org_inst_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`org_id`),
  KEY `fk_org_inst_id` (`fk_org_inst_id`),
  CONSTRAINT `orgao_ibfk_1` FOREIGN KEY (`fk_org_inst_id`) REFERENCES `instituicao` (`inst_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela sap_tea.orgao: ~5 rows (aproximadamente)
INSERT INTO `orgao` (`org_id`, `org_razaosocial`, `org_cnpj`, `org_endereco`, `org_bairro`, `org_municipio`, `org_cep`, `org_uf`, `org_email`, `org_tel1`, `org_tel2`, `fk_org_inst_id`) VALUES
	(1, 'Secretaria Municipal de Educação de Vale Verde', '45.678.912/0001-34', 'Av. das Palmeiras, 1234', 'Jardim Central', 'Vale Verde', '38900-000', 'GO', 'educacao@valeverde.go.gov.br', '6233456789', '(62) 33456-789', 5),
	(2, 'Secretaria Municipal de Educação de Pedra Clara', '56.789.123/0001-45', 'Rua das Flores, 567', 'Vila Nova', 'Pedra Clara', '38880-000', 'MG', 'educacao@pedraclara.mg.gov.br', '6233456789', NULL, 1),
	(3, 'Secretaria Municipal de Educação de Nova Esperança', '67.891.234/0001-56', 'Praça Central, 890', 'Centro', 'Nova Esperança', '38910-000', 'PR', 'educacao@novaesperanca.pr.gov.br', '4434567890', NULL, 3),
	(4, 'Secretaria Municipal de Educação de São Lázaro', '78.912.345/0001-67', 'Rua do Saber, 321', 'Bela Vista', 'São Lázaro', '38870-000', 'BA', 'educacao@saolazaro.ba.gov.br', '(88) 88888-8888', '(88) 88888-8888', 1),
	(5, 'Secretaria Municipal de Educação de Lago Azul', '89.123.456/0001-78', 'Av. Beira Lago, 456', 'Lagoa', 'Lago Azul', '38920-000', 'MT', 'educacao@lagoazul.mt.gov.br', '6532321001', NULL, 4);

-- Copiando estrutura para tabela sap_tea.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela sap_tea.password_resets: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela sap_tea.perfil_estudante
CREATE TABLE IF NOT EXISTS `perfil_estudante` (
  `id_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `diag_laudo` tinyint(1) NOT NULL,
  `cid` varchar(100) DEFAULT NULL,
  `nome_medico` varchar(250) DEFAULT NULL,
  `data_laudo` date DEFAULT NULL,
  `nivel_suporte` varchar(100) DEFAULT NULL,
  `uso_medicamento` tinyint(1) DEFAULT NULL,
  `quais_medicamento` varchar(250) DEFAULT NULL,
  `nec_pro_apoio` int(11) DEFAULT NULL,
  `prof_apoio` tinyint(1) DEFAULT NULL,
  `loc_01` tinyint(1) DEFAULT NULL,
  `hig_02` tinyint(1) DEFAULT NULL,
  `ali_03` tinyint(1) DEFAULT NULL,
  `com_04` tinyint(1) DEFAULT NULL,
  `out_05` tinyint(1) DEFAULT NULL,
  `out_momentos` varchar(250) DEFAULT NULL,
  `at_especializado` int(11) DEFAULT NULL,
  `nome_prof_AEE` varchar(250) DEFAULT NULL,
  `fk_id_aluno` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela sap_tea.perfil_estudante: ~10 rows (aproximadamente)
INSERT INTO `perfil_estudante` (`id_perfil`, `diag_laudo`, `cid`, `nome_medico`, `data_laudo`, `nivel_suporte`, `uso_medicamento`, `quais_medicamento`, `nec_pro_apoio`, `prof_apoio`, `loc_01`, `hig_02`, `ali_03`, `com_04`, `out_05`, `out_momentos`, `at_especializado`, `nome_prof_AEE`, `fk_id_aluno`) VALUES
	(62, 0, '11213121312231233', 'fdfddddfddf', '2003-10-20', '2', 0, 'adfdfdf', 0, 0, 1, 0, 1, 0, 0, NULL, 0, NULL, 108),
	(63, 0, '11213121312231233', 'fdfddddfddf', '2003-10-20', '2', 0, 'adfdfdf', 0, NULL, 1, 0, 1, 0, 0, NULL, 0, NULL, 108),
	(64, 1, NULL, NULL, NULL, '1', 1, NULL, 1, NULL, 0, 0, 0, 0, 0, NULL, 1, NULL, 110),
	(65, 1, NULL, NULL, NULL, '1', 1, NULL, 1, 0, 0, 0, 0, 0, 0, NULL, 1, NULL, 107),
	(66, 1, NULL, NULL, NULL, '1', 1, NULL, 1, NULL, 0, 0, 0, 0, 0, NULL, 1, NULL, 102),
	(67, 1, NULL, NULL, NULL, '1', 1, NULL, 1, 0, 0, 0, 0, 0, 0, NULL, 1, NULL, 105),
	(68, 1, NULL, NULL, NULL, '1', 1, 'xxxxxxxxxxxxxxxxxxx', 1, 0, 1, 1, 1, 1, 1, NULL, 1, NULL, 112),
	(69, 1, NULL, NULL, NULL, '1', 1, NULL, 1, NULL, 0, 0, 0, 0, 0, NULL, 1, NULL, 104),
	(70, 1, NULL, NULL, NULL, '1', 1, NULL, 1, NULL, 0, 0, 0, 0, 0, NULL, 1, NULL, 109),
	(71, 1, 'dfddfdfdfdf', 'fddffddf', NULL, '1', 1, NULL, 1, NULL, 0, 0, 0, 0, 0, NULL, 1, NULL, 108);

-- Copiando estrutura para tabela sap_tea.perfil_familia
CREATE TABLE IF NOT EXISTS `perfil_familia` (
  `id_perfil_familia` int(11) NOT NULL AUTO_INCREMENT,
  `expectativa_05` text,
  `estrategia_05` text,
  `crise_esta_05` text,
  `fk_id_aluno` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_perfil_familia`),
  KEY `fk_id_aluno` (`fk_id_aluno`),
  CONSTRAINT `perfil_familia_ibfk_1` FOREIGN KEY (`fk_id_aluno`) REFERENCES `aluno` (`alu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela sap_tea.perfil_familia: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela sap_tea.personalidade
CREATE TABLE IF NOT EXISTS `personalidade` (
  `id_personalidade` int(11) NOT NULL AUTO_INCREMENT,
  `carac_principal` text,
  `inter_princ_carac` text,
  `livre_gosta_fazer` text,
  `feliz_est` text,
  `trist_est` text,
  `obj_apego` text,
  `fk_id_aluno` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_personalidade`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela sap_tea.personalidade: ~10 rows (aproximadamente)
INSERT INTO `personalidade` (`id_personalidade`, `carac_principal`, `inter_princ_carac`, `livre_gosta_fazer`, `feliz_est`, `trist_est`, `obj_apego`, `fk_id_aluno`) VALUES
	(61, 'marcos barrosoxxxxxxxxxxxxxxxxxxxxxxxxxxxxffffffffffffffffff', 'aaaaaaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaa', 'aafdfdfdfdfdfdfdfdf', 'bbbbbbbbbbbbbbbbbbbbbbbbbbb', 108),
	(62, 'aaaaaaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaaaaaaa', 108),
	(63, NULL, NULL, NULL, NULL, NULL, NULL, 110),
	(64, NULL, NULL, NULL, NULL, NULL, NULL, 107),
	(65, NULL, NULL, NULL, NULL, NULL, NULL, 102),
	(66, 'elianae barroso', 'marcos barroso', NULL, NULL, NULL, NULL, 105),
	(67, 'xxxxxxxxxxxxxxxxxxxxxxxxx', 'xxxxxxxxxxxxxxxxxxxxxxx', 'xxxxxxxxxxxxxxxxx', NULL, NULL, NULL, 112),
	(68, 'teste de perfil', 'teste de perfil', NULL, NULL, NULL, NULL, 104),
	(69, NULL, NULL, NULL, NULL, NULL, NULL, 109),
	(70, 'dffddffd', 'dfdfdfdf', 'dfdfdffd', 'dfdfdf', 'fdfdf', 'dfdf', 108);

-- Copiando estrutura para tabela sap_tea.preenchimento_inventario
CREATE TABLE IF NOT EXISTS `preenchimento_inventario` (
  `id_preenchimento` int(11) NOT NULL AUTO_INCREMENT,
  `professor_responsavel` tinyint(1) DEFAULT NULL,
  `nivel_suporte` tinyint(1) DEFAULT NULL,
  `nivel_comunicacao` tinyint(1) DEFAULT NULL,
  `fase_inv_preenchimento` char(2) COLLATE latin1_general_ci DEFAULT NULL,
  `fk_id_aluno` int(11) DEFAULT NULL,
  `data_cad_inventario` date DEFAULT NULL,
  PRIMARY KEY (`id_preenchimento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Copiando dados para a tabela sap_tea.preenchimento_inventario: ~2 rows (aproximadamente)
INSERT INTO `preenchimento_inventario` (`id_preenchimento`, `professor_responsavel`, `nivel_suporte`, `nivel_comunicacao`, `fase_inv_preenchimento`, `fk_id_aluno`, `data_cad_inventario`) VALUES
	(1, 1, 1, 1, 'In', 108, '2025-04-22'),
	(2, 0, 2, 2, 'In', 110, '2025-04-22');

-- Copiando estrutura para tabela sap_tea.preferencia
CREATE TABLE IF NOT EXISTS `preferencia` (
  `id_preferencia` int(11) NOT NULL AUTO_INCREMENT,
  `auditivo_04` tinyint(1) DEFAULT NULL,
  `visual_04` tinyint(1) DEFAULT NULL,
  `tatil_04` tinyint(1) DEFAULT NULL,
  `outros_04` tinyint(1) DEFAULT NULL,
  `maneja_04` text,
  `asa_04` tinyint(1) DEFAULT NULL,
  `alimentos_pref_04` text,
  `alimento_evita_04` text,
  `contato_pc_04` text,
  `reage_contato` text,
  `interacao_escola_04` text,
  `interesse_atividade_04` text,
  `aprende_visual_04` tinyint(1) DEFAULT NULL,
  `recurso_auditivo_04` tinyint(1) DEFAULT NULL,
  `material_concreto_04` tinyint(1) DEFAULT NULL,
  `outro_identificar_04` tinyint(1) DEFAULT NULL,
  `descricao_outro_identificar_04` text,
  `realiza_tarefa_04` text,
  `mostram_eficazes_04` text,
  `prefere_ts_04` text,
  `fk_id_aluno` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_preferencia`),
  KEY `fk_id_aluno` (`fk_id_aluno`),
  CONSTRAINT `preferencia_ibfk_1` FOREIGN KEY (`fk_id_aluno`) REFERENCES `aluno` (`alu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela sap_tea.preferencia: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela sap_tea.proposta_comportamento
CREATE TABLE IF NOT EXISTS `proposta_comportamento` (
  `id_pro_comportamento` int(11) NOT NULL AUTO_INCREMENT,
  `cod_pro_comportamento` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc_pro_comportamento` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_pro_comportamento`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela sap_tea.proposta_comportamento: ~7 rows (aproximadamente)
INSERT INTO `proposta_comportamento` (`id_pro_comportamento`, `cod_pro_comportamento`, `desc_pro_comportamento`) VALUES
	(1, 'ECP01', 'A ordem é...'),
	(2, 'ECP02', 'Mexe e remexe'),
	(3, 'ECP03', 'Minha rotina'),
	(4, 'ECP04', 'PIQUENIQUE'),
	(5, 'ECP05', 'Positivo e negativo'),
	(6, 'ECP06', 'Rotina de autocuidado'),
	(7, 'NECP1', 'Cortando o Cabelo');

-- Copiando estrutura para tabela sap_tea.proposta_com_lin
CREATE TABLE IF NOT EXISTS `proposta_com_lin` (
  `id_pro_com_lin` int(11) NOT NULL AUTO_INCREMENT,
  `cod_pro_com_lin` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc_pro_com_lin` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_pro_com_lin`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela sap_tea.proposta_com_lin: ~8 rows (aproximadamente)
INSERT INTO `proposta_com_lin` (`id_pro_com_lin`, `cod_pro_com_lin`, `desc_pro_com_lin`) VALUES
	(1, 'ECM01', '1, 2, 3... acerte uma vez'),
	(2, 'ECM02', 'A mágica da gentileza'),
	(3, 'ECM03', 'Ache e junte'),
	(4, 'ECM04', ' Expressão ilustrada'),
	(5, 'ECM05', 'Minha rede de ajuda'),
	(6, 'ECM06', 'Onde encaixa?'),
	(7, 'ECM07', 'Que animal é esse?'),
	(8, 'ECM08', 'ECM08 - Vivências do cotidiano');

-- Copiando estrutura para tabela sap_tea.proposta_int_soc
CREATE TABLE IF NOT EXISTS `proposta_int_soc` (
  `id_pro_int_soc` int(11) NOT NULL AUTO_INCREMENT,
  `cod_pro_int_soc` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc_pro_int_soc` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_pro_int_soc`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela sap_tea.proposta_int_soc: ~6 rows (aproximadamente)
INSERT INTO `proposta_int_soc` (`id_pro_int_soc`, `cod_pro_int_soc`, `desc_pro_int_soc`) VALUES
	(1, 'EIS01', 'Emocionômetro'),
	(2, 'EIS02', 'Eu como sou!'),
	(3, 'EIS03', 'Nomeando as emoções'),
	(4, 'EIS04', ' A professora faltou'),
	(5, 'NEIS2', 'Ano Novo, turma nova'),
	(6, 'NEIS3', 'Hora do intervalo');

-- Copiando estrutura para tabela sap_tea.serie
CREATE TABLE IF NOT EXISTS `serie` (
  `serie_id` int(11) NOT NULL AUTO_INCREMENT,
  `serie_desc` varchar(50) NOT NULL,
  `fk_mod_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`serie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela sap_tea.serie: ~10 rows (aproximadamente)
INSERT INTO `serie` (`serie_id`, `serie_desc`, `fk_mod_id`) VALUES
	(1, '1º ANO', 2),
	(2, '2º ANO', 2),
	(3, '3º ANO', 2),
	(4, '4º ANO', 2),
	(5, '5º ANO', 2),
	(6, '6º ANO', 3),
	(7, '7º ANO', 3),
	(8, '8º ANO', 3),
	(9, '9º ANO', 3),
	(10, 'Infantil', 1);

-- Copiando estrutura para tabela sap_tea.sondagem
CREATE TABLE IF NOT EXISTS `sondagem` (
  `id_sondagem` int(11) NOT NULL AUTO_INCREMENT,
  `n_sup01` char(1) DEFAULT NULL,
  `n_sup02` char(1) DEFAULT NULL,
  `n_sup03` char(1) DEFAULT NULL,
  `v_comunicacao` int(11) DEFAULT NULL,
  `fk_id_matricula` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_sondagem`),
  KEY `fk_matricula_sondagem` (`fk_id_matricula`),
  CONSTRAINT `fk_matricula_sondagem` FOREIGN KEY (`fk_id_matricula`) REFERENCES `matricula` (`id_matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela sap_tea.sondagem: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela sap_tea.tipo_funcao
CREATE TABLE IF NOT EXISTS `tipo_funcao` (
  `tipo_funcao_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `desc_tipo_funcao` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`tipo_funcao_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela sap_tea.tipo_funcao: ~0 rows (aproximadamente)
INSERT INTO `tipo_funcao` (`tipo_funcao_id`, `desc_tipo_funcao`, `created_at`, `updated_at`) VALUES
	(1, 'Administrador', '2025-05-07 04:16:23', '2025-05-07 04:16:23');

-- Copiando estrutura para tabela sap_tea.tp_eixo
CREATE TABLE IF NOT EXISTS `tp_eixo` (
  `id_tpeixo` int(11) NOT NULL AUTO_INCREMENT,
  `desc_tpeixo` varchar(200) NOT NULL,
  PRIMARY KEY (`id_tpeixo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela sap_tea.tp_eixo: ~3 rows (aproximadamente)
INSERT INTO `tp_eixo` (`id_tpeixo`, `desc_tpeixo`) VALUES
	(1, 'eixo comunicacão linguagem'),
	(2, 'eixo comportamento'),
	(3, 'eixo interação socioemocional');

-- Copiando estrutura para tabela sap_tea.turma
CREATE TABLE IF NOT EXISTS `turma` (
  `id_turma` int(11) NOT NULL AUTO_INCREMENT,
  `fk_cod_enturmacao` int(11) DEFAULT NULL,
  `fk_cod_func` int(11) DEFAULT NULL,
  `fk_cod_mod` int(11) DEFAULT NULL,
  `fk_inep` varchar(20) DEFAULT NULL,
  `cod_turma` int(11) DEFAULT '0',
  `cod_valor` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_turma`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela sap_tea.turma: ~18 rows (aproximadamente)
INSERT INTO `turma` (`id_turma`, `fk_cod_enturmacao`, `fk_cod_func`, `fk_cod_mod`, `fk_inep`, `cod_turma`, `cod_valor`) VALUES
	(17, 2, 80, 1, '35060136', 0, '1-35060136'),
	(18, 3, 80, 2, '35060136', 0, '2-35060136'),
	(19, 19, 20, 1, '26190915', 0, '1-26190915'),
	(20, 19, 20, 1, '26190915', 0, '1-26190915'),
	(21, 25, 37, 1, '26190915', 0, '1-26190915'),
	(22, 25, 37, 1, '26190915', 0, '1-26190915'),
	(23, 26, 37, 2, '26190915', 0, '2-26190915'),
	(24, 30, 41, 6, '26190915', 0, '6-26190915'),
	(25, 25, 44, 1, '26190915', 0, '1-26190915'),
	(26, 26, 44, 2, '26190915', 0, '2-26190915'),
	(27, 27, 44, 3, '26190915', 0, '3-26190915'),
	(28, 28, 44, 4, '26190915', 0, '4-26190915'),
	(29, 29, 44, 5, '26190915', 0, '5-26190915'),
	(30, 30, 44, 6, '26190915', 0, '6-26190915'),
	(31, 30, 41, 6, '26190915', 0, '6-26190915'),
	(32, 33, 41, 7, '26190915', 0, '7-26190915'),
	(33, 33, 27, 7, '26190915', 0, '7-26190915'),
	(34, 33, 27, 7, '26190915', 0, '7-26190915');

-- Copiando estrutura para tabela sap_tea.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela sap_tea.users: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
