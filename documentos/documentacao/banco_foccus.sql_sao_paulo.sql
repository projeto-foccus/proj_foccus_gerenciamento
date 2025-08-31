-- --------------------------------------------------------
-- Servidor:                     localhost
-- Versão do servidor:           10.4.18-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Copiando estrutura para tabela foccus.aluno
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
  PRIMARY KEY (`alu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela foccus.aluno: ~56 rows (aproximadamente)
INSERT INTO `aluno` (`alu_id`, `alu_dt_cad`, `alu_ra`, `alu_nome`, `alu_dtnasc`, `alu_inep`, `alu_nome_resp`, `alu_tipo_parentesco`, `alu_email_resp`, `alu_tel_resp`) VALUES
	(1, '2025-01-20', '1234567890', 'João Souza Silva Pereira', '2016-02-15', '35067350', 'Felipe Souza Costa Almeida Silva', 'Pai', 'joao.silva123@email.com', '(11) 91234-5678'),
	(2, '2025-01-20', '9876543210', 'Maria Oliveira Santos Costa', '2017-03-02', '35067350', 'Juliana Pereira Barbosa Nogueira Costa', 'Mãe', 'maria.oliveira456@email.com', '(11) 91876-5432'),
	(3, '2025-01-20', '1122334455', 'Carlos Almeida Rocha Pinto', '2016-05-11', '35067350', 'Tiago Oliveira Santos Lima Rocha', 'Pai biológico', 'pedro.martins789@email.com', '(11) 93765-4321'),
	(4, '2025-01-20', '9988776655', 'Ana Paula Lima Costa Souza', '2017-07-24', '35067350', 'Isabela Carvalho Almeida Souza Pinto', 'Mãe biológica', 'beatriz.lima112@email.com', '(11) 99123-4567'),
	(5, '2025-01-20', '2233445566', 'Pedro Henrique Santos Almeida', '2018-09-08', '35067350', 'Gustavo Lima Silva Pereira Santos', 'Pai adotivo', 'carlos.rocha987@email.com', '(11) 98876-5432'),
	(6, '2025-01-20', '4455667788', 'Beatriz Nogueira Silva Lima', '2019-01-20', '35067350', 'Mariana Costa Alves Pereira Martins', 'Mãe adotiva', 'ana.santos334@email.com', '(11) 96987-6543'),
	(7, '2025-01-20', '6677889900', 'Rafael Oliveira Rocha Almeida', '2016-04-14', '35067350', 'Rafael Oliveira Almeida Rocha Dias', 'Pai de criação', 'rafael.oliveira654@email.com', '(11) 93876-4321'),
	(8, '2025-01-20', '2345678901', 'Juliana Costa Almeida Silva', '2017-06-09', '35067350', 'Camila Barbosa Silva Lima Oliveira', 'Mãe de criação', 'juliana.pinto432@email.com', '(11) 92345-6789'),
	(9, '2025-01-20', '3456789012', 'Gabriel Martins Rocha Souza', '2018-10-30', '25666665', 'André Gomes Pereira Santos Almeida', 'Padrasto', 'gabriel.souza876@email.com', '(11) 91432-7654'),
	(10, '2025-01-20', '4567890123', 'Larissa Oliveira Santos Costa', '2019-12-23', '25666665', 'Lorena Nogueira Barbosa Costa Silva', 'Madrasta', 'larissa.costa223@email.com', '(11) 97865-4321'),
	(11, '2025-01-20', '5678901234', 'Felipe Almeida Lima Rocha', '2017-02-04', '25666665', 'Bruno Oliveira Costa Lima Rocha', 'Tutor', 'felipe.almeida567@email.com', '(11) 91987-6543'),
	(12, '2025-01-20', '6789012345', 'Mariana Pereira Silva Nogueira', '2016-05-17', '25666665', 'Aline Silva Santos Pereira Gomes', 'Responsável legal', 'mariana.rodrigues890@email.com', '(11) 93765-4321'),
	(13, '2025-01-20', '7890123456', 'Tiago Costa Almeida Oliveira', '2018-08-21', '25666665', 'Vitor Alves Martins Souza Barbosa', 'Curador', 'tiago.martins234@email.com', '(11) 96123-4567'),
	(14, '2025-01-20', '8901234567', 'Aline Souza Lima Barbosa', '2019-11-12', '25666665', 'Larissa Lima Pinto Oliveira Souza', 'Guardião', 'aline.silva111@email.com', '(11) 92345-6789'),
	(15, '2025-01-20', '9012345678', 'Igor Pereira Rocha Almeida', '2016-01-03', '25666665', 'Matheus Pereira Almeida Costa Nogueira', 'Pai afetivo', 'igor.pereira345@email.com', '(11) 93456-7890'),
	(16, '2025-01-20', '1023456789', 'Fernanda Lima Oliveira Costa', '2017-06-18', '35060136', 'Beatriz Santos Oliveira Silva Lima', 'Mãe afetiva', 'fernanda.barbosa876@email.com', '(11) 90567-8910'),
	(17, '2025-01-20', '2134567890', 'Victor Souza Rocha Martins', '2018-10-10', '35060136', 'Henrique Carvalho Souza Lima Pinto', 'Pai de coração', 'victor.rocha654@email.com', '(11) 98234-5678'),
	(18, '2025-01-20', '3245678901', 'Camila Nogueira Lima Oliveira', '2019-03-25', '35060136', 'Priscila Rocha Nogueira Alves Barbosa', 'Mãe de coração', 'camila.souza908@email.com', '(11) 91567-4321'),
	(19, '2025-01-20', '4356789012', 'Bruno Silva Costa Barbosa', '2016-05-13', '35060136', 'Leandro Pereira Oliveira Costa Santos', 'Pai de guarda', 'bruno.lima567@email.com', '(11) 92876-5432'),
	(20, '2025-01-20', '5467890123', 'Larissa Martins Pereira Almeida', '2017-07-07', '35060136', 'Fernanda Souza Lima Martins Rocha', 'Mãe de guarda', 'larissa.almeida876@email.com', '(11) 99654-3210'),
	(21, '2025-01-20', '6578901234', 'Diego Oliveira Lima Rocha', '2018-09-19', '35060136', 'José Costa Barbosa Nogueira Almeida', 'Pai temporário', 'diego.pinto223@email.com', '(11) 98987-6543'),
	(22, '2025-01-20', '7689012345', 'Paula Costa Santos Pereira', '2019-02-22', '25666665', 'Rafaela Silva Souza Pereira Lima', 'Mãe temporária', 'paula.santos234@email.com', '(11) 98123-4567'),
	(23, '2025-01-20', '8790123456', 'Rodrigo Silva Almeida Lima', '2016-04-28', '25666665', 'Bruna Oliveira Santos Nogueira Alves', 'Pai substituto', 'rodrigo.rocha987@email.com', '(11) 96345-6789'),
	(24, '2025-01-20', '9801234567', 'Isabela Barbosa Rocha Nogueira', '2017-07-14', '25666665', 'Diego Almeida Lima Pereira Rocha', 'Mãe substituta', 'isabela.costa876@email.com', '(11) 93256-7890'),
	(25, '2025-01-20', '3467890123', 'Eduardo Souza Almeida Costa', '2018-10-15', '25666665', 'Sara Martins Santos Oliveira Silva', 'Pai de adoção', 'eduardo.pereira654@email.com', '(11) 97654-3210'),
	(26, '2025-01-20', '4578901234', 'Rafaela Lima Pereira Rocha', '2019-11-06', '25666665', 'Carlos Pereira Costa Barbosa Nogueira', 'Mãe de adoção', 'rafaela.almeida112@email.com', '(11) 91234-5678'),
	(27, '2025-01-20', '5689012345', 'Lucas Almeida Santos Costa', '2016-03-20', '25666665', 'Tiago Rocha Oliveira Souza Lima', 'Pai de afeto', 'lucas.barbosa908@email.com', '(11) 98321-7654'),
	(28, '2025-01-20', '6790123456', 'Gabriela Oliveira Lima Martins', '2017-08-11', '25666665', 'Ana Clara Souza Alves Pereira Martins', 'Mãe de afeto', 'gabriela.lima223@email.com', '(11) 96123-4567'),
	(29, '2025-01-20', '7801234567', 'Gustavo Rocha Silva Pereira', '2018-12-30', '25666665', 'Felipe Gomes Oliveira Barbosa Lima', 'Pai de sangue', 'gustavo.martins345@email.com', '(11) 98765-4321'),
	(30, '2025-01-20', '8912345678', 'Renata Costa Nogueira Lima', '2019-05-08', '25666665', 'Igor Silva Santos Rocha Nogueira', 'Mãe de sangue', 'renata.rodrigues567@email.com', '(11) 93456-7890'),
	(31, '2025-01-20', '9023456789', 'Sérgio Lima Almeida Santos', '2017-01-24', '25666665', 'Camila Lima Alves Santos Pereira', 'Responsável por guarda compartilhada', 'sérgio.silva432@email.com', '(11) 91123-4567'),
	(32, '2025-01-20', '1012345678', 'Vanessa Oliveira Rocha Souza', '2018-07-02', '25666665', 'João Pedro Rocha Oliveira Costa Lima', 'Responsável por guarda unilateral', 'vanessa.almeida345@email.com', '(11) 97345-6789'),
	(33, '2025-01-20', '2123456789', 'Matheus Pereira Almeida Silva', '2019-09-19', '25666665', 'Vivi Rocha Costa Nogueira Souza', 'Pai biológico de criação', 'matheus.rocha112@email.com', '(11) 96654-3210'),
	(34, '2025-01-20', '3234567890', 'Priscila Lima Souza Rocha', '2016-03-09', '25666665', 'Jorge Souza Oliveira Lima Barbosa', 'Mãe biológica de criação', 'cristiane.costa234@email.com', '(11) 99876-5432'),
	(35, '2025-01-20', '4345678901', 'Leandro Oliveira Costa Martins', '2017-06-26', '25666665', 'Nicole Pereira Lima Santos Rocha', 'Pai de visitação', 'ricardo.souza567@email.com', '(11) 92654-3210'),
	(36, '2025-01-20', '5456789012', 'Larissa Nogueira Silva Almeida', '2018-08-05', '35060136', 'Rafael Silva Barbosa Nogueira Lima', 'Mãe de visitação', 'juliano.lima654@email.com', '(11) 92234-5678'),
	(37, '2025-01-20', '6567890123', 'Marcos Lima Souza Pereira', '2019-01-11', '35060136', 'Lucas Santos Pereira Almeida Rocha', 'Pai biológico em regime de visitas', 'larissa.barbosa223@email.com', '(11) 91865-4321'),
	(38, '2025-01-20', '7678901234', 'Camila Rocha Almeida Oliveira', '2017-04-20', '35060136', 'Patrícia Lima Alves Barbosa Oliveira', 'Mãe biológica em regime de visitas', 'fábio.rodrigues890@email.com', '(11) 93567-4321'),
	(39, '2025-01-20', '8789012345', 'Fábio Costa Santos Lima', '2018-12-03', '25666665', 'Thiago Oliveira Costa Nogueira Almeida', 'Pai de afiliação', 'thais.pinto234@email.com', '(11) 96345-6789'),
	(40, '2025-01-20', '9890123456', 'Thais Souza Almeida Nogueira', '2019-02-21', '25666665', 'Gabriela Nogueira Lima Souza Costa', 'Mãe de afiliação', 'josé.santos345@email.com', '(11) 92456-7890'),
	(41, '2025-01-20', '2101234567', 'José Roberto Lima Rocha', '2017-06-14', '25666665', 'Marcos Silva Almeida Oliveira Pinto', 'Responsável por tutela', 'beatriz.silva223@email.com', '(11) 90987-6543'),
	(42, '2025-01-20', '3212345678', 'Beatriz Almeida Lima Costa', '2018-09-01', '25666665', 'Lúcia Costa Nogueira Lima Souza', 'Responsável por curatela', 'raquel.martins432@email.com', '(11) 94123-4567'),
	(43, '2025-01-20', '4323456789', 'Raquel Pereira Santos Lima', '2019-11-07', '25666665', 'Arthur Barbosa Lima Almeida Rocha', 'Pai de abrigo', 'lucas.santos876@email.com', '(11) 97456-7890'),
	(44, '2025-01-20', '5434567890', 'Lucas Rocha Silva Almeida', '2017-02-12', '25666665', 'Juliana Silva Lima Pereira Santos', 'Mãe de abrigo', 'gabriela.rocha345@email.com', '(11) 93654-3210'),
	(45, '2025-01-20', '6545678901', 'Sofia Oliveira Nogueira Rocha', '2018-04-09', '25666665', 'Renata Pereira Nogueira Souza Lima', 'Pai de acolhimento', 'gustavo.lima987@email.com', '(11) 91234-5678'),
	(46, '2025-01-20', '7656789012', 'Marcelo Lima Pereira Costa', '2019-05-28', '35060136', 'Ricardo Lima Rocha Alves Souza', 'Mãe de acolhimento', 'renata.almeida223@email.com', '(11) 98321-7654'),
	(47, '2025-01-20', '8767890123', 'Paula Barbosa Souza Lima', '2016-01-13', '35060136', 'Bruno Costa Almeida Santos Lima', 'Pai colaborador', 'marcelo.pereira908@email.com', '(11) 93987-6543'),
	(48, '2025-01-20', '9878901234', 'Felipe Costa Nogueira Almeida', '2017-03-27', '35060136', 'Karina Oliveira Pereira Barbosa Lima', 'Mãe colaboradora', 'paula.martins567@email.com', '(11) 92234-5678'),
	(49, '2025-01-20', '1098765432', 'Vitória Souza Lima Rocha', '2018-10-01', '35060136', 'Eduardo Souza Lima Rocha Nogueira', 'Pai com convivência alternada', 'felipe.rodrigues223@email.com', '(11) 96654-3210'),
	(50, '2025-01-20', '2109876543', 'Anderson Martins Almeida Lima', '2019-12-25', '35060136', 'Sofia Santos Pereira Lima Rocha', 'Mãe com convivência alternada', 'lucas.costa112@email.com', '(11) 97456-7890'),
	(51, '2025-01-20', '3210987654', 'Mariana Rocha Costa Pereira', '2016-06-18', '35060136', 'Fábio Almeida Oliveira Pinto Costa', 'Responsável familiar', 'isabela.barbosa345@email.com', '(11) 90765-4321'),
	(52, '2025-01-20', '4321098765', 'Ricardo Lima Souza Barbosa', '2017-05-05', '35060136', 'Clara Costa Pereira Lima Nogueira', 'Responsável institucional', 'tiago.lima876@email.com', '(11) 91432-7654'),
	(53, '2025-01-20', '5432109876', 'Cristiane Silva Lima Nogueira', '2018-08-20', '35060136', 'Leandro Santos Almeida Lima Rocha', 'Pai com visitação regular', 'andré.souza987@email.com', '(11) 92765-4321'),
	(54, '2025-01-20', '6543210987', 'Rodrigo Pereira Rocha Costa', '2019-10-22', '25789435', 'Nicole Silva Souza Lima Barbosa', 'Mãe com visitação regular', 'luciana.rocha432@email.com', '(11) 98123-4567'),
	(55, '2025-01-20', '7654321098', 'Karina Almeida Souza Rocha', '2016-03-15', '25789435', 'Guilherme Oliveira Pinto Costa Rocha', 'Pai com responsabilidade compartilhada', 'rafaela.silva223@email.com', '(11) 96234-5678'),
	(56, '2025-01-20', '8765432109', 'Eduardo Oliveira Nogueira Lima', '2017-06-10', '25789435', 'Viviane Souza Lima Nogueira Pereira', 'Mãe com responsabilidade compartilhada', 'josé.lima890@email.com', '(11) 91567-4321');

-- Copiando estrutura para tabela foccus.enturmacao
CREATE TABLE IF NOT EXISTS `enturmacao` (
  `id_enturmacao` int(11) NOT NULL AUTO_INCREMENT,
  `fk_id_escola` int(11) DEFAULT NULL,
  `fk_id_modalidade` int(11) DEFAULT NULL,
  `fk_inep` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_enturmacao`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela foccus.enturmacao: ~9 rows (aproximadamente)
INSERT INTO `enturmacao` (`id_enturmacao`, `fk_id_escola`, `fk_id_modalidade`, `fk_inep`) VALUES
	(1, 19, 1, '25666665'),
	(2, 16, 1, '35060136'),
	(3, 16, 2, '35060136'),
	(4, 16, 3, '35060136'),
	(5, 16, 4, '35060136'),
	(6, 18, 11, '25789435'),
	(7, 17, 10, '56899555'),
	(8, 16, 11, '35060136'),
	(9, 19, 2, '25666665');

-- Copiando estrutura para tabela foccus.enturmacao_professor
CREATE TABLE IF NOT EXISTS `enturmacao_professor` (
  `id_entur_professor` int(11) NOT NULL AUTO_INCREMENT,
  `fk_id_func` int(11) DEFAULT NULL,
  `fk_id_enturmacao` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_entur_professor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela foccus.enturmacao_professor: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela foccus.escola
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela foccus.escola: ~5 rows (aproximadamente)
INSERT INTO `escola` (`esc_id`, `esc_dtcad`, `esc_inep`, `esc_cnpj`, `esc_razao_social`, `esc_endereco`, `esc_bairro`, `esc_municipio`, `esc_cep`, `esc_uf`, `esc_telefone`, `esc_email`, `fk_org_esc_id`) VALUES
	(16, '2025-01-16', '35060136', '11.111.000/0001-91', 'RAMIRO ARAUJO FILHO DR', 'aaaa', 'JOAO SCABIN', 'JUNDIAI', '13207-180', 'SP', '( 11)8359-5875', 'joaoscabin@gmail.com', 2),
	(17, '2025-01-16', '56899555', '33.444.000/0001-91', 'Carla Andressa de Oliveira Sinigalia Emeb', 'bbb', ' Santos Dumont', 'JUNDIAI', '13214-410', 'SP', '(11)8957-5875', 'carlaandressa@gmail.com', NULL),
	(18, '2025-01-16', '25789435', '44.555.000/0001-24', 'Americo Mendes Emeb', 'ccc', 'bairro dos fernandes', 'JUNDIAI', '13214-890', 'SP', '(11)3268-6321', 'americomendes@gmail.com', NULL),
	(19, '2025-01-16', '25666665', '71.256.000/0001-21', 'Alpha Kids Educacional', 'dddd', 'Jardim Santa Gertrudes', 'JUNDIAI', '56884-582', 'SP', '(11)8968-2698', 'alphamendes@hotmail.com', NULL),
	(20, '2025-01-16', '', ' ', '', '', '', '', '', '', '', '', NULL);

-- Copiando estrutura para tabela foccus.funcionario
CREATE TABLE IF NOT EXISTS `funcionario` (
  `func_id` int(11) NOT NULL AUTO_INCREMENT,
  `inep` varchar(15) NOT NULL,
  `func_nome` varchar(200) NOT NULL,
  `func_cpf` varchar(20) DEFAULT NULL,
  `email_func` varchar(200) DEFAULT NULL,
  `func_cod_funcao` int(11) NOT NULL,
  PRIMARY KEY (`func_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela foccus.funcionario: ~13 rows (aproximadamente)
INSERT INTO `funcionario` (`func_id`, `inep`, `func_nome`, `func_cpf`, `email_func`, `func_cod_funcao`) VALUES
	(53, '35060136', 'Ana Beatriz Almeida', '123.456.789-09', 'ana.almeida@email.com', 1),
	(54, '35060136', 'Bruno Henrique Costa', '234.567.890-18', ' bruno.costa@email.com', 2),
	(55, '35060136', 'Carla Mendes Oliveira', '345.678.901-27', ' carla.oliveira@email.com', 3),
	(56, '35060136', 'Diego Santos Pereira', '456.789.012-36', '  diego.pereira@email.com', 4),
	(57, '35060136', 'Eduarda Silva Ramos', '567.890.123-45', ' eduarda.ramos@email.com', 5),
	(58, '35060136', 'Felipe Augusto Rocha', '678.901.234-54', ' felipe.rocha@email.com', 6),
	(59, '35060136', 'Gabriela Nunes Carvalho', '789.012.345-63', ' gabriela.carvalho@email.com', 7),
	(60, '35060136', 'Henrique Matos Lima', '890.123.456-72', ' henrique.lima@email.com', 8),
	(61, '35060136', 'Isabela Ferreira Martins', '901.234.567-81', ' isabela.martins@email.com', 9),
	(62, '35060136', 'João Victor Andrade', '012.345.678-90', ' joao.andrade@email.com', 10),
	(63, '35060136', 'Larissa Cunha Ribeiro', '112.233.445-56', ' larissa.ribeiro@email.com', 11),
	(64, '35060136', 'Marcos Vinícius Teixeira', '223.344.556-67', ' marcos.teixeira@email.com', 6),
	(65, '35060136', 'Natália Borges Souza', '334.455.667-78', ' natalia.souza@email.com', 6);

-- Copiando estrutura para tabela foccus.instituicao
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela foccus.instituicao: ~6 rows (aproximadamente)
INSERT INTO `instituicao` (`inst_id`, `inst_razaosocial`, `inst_cnpj`, `inst_endereco`, `inst_bairro`, `inst_municipio`, `inst_cep`, `inst_uf`, `inst_email`, `inst_tel1`, `inst_tel2`) VALUES
	(1, ' Prefeitura Municipal de Santa Rosa', '88.888.888/8888-88', 'Rua das Flores, 123 xxxxxxxxxxxxxxxxx', 'centro yyyyyyyyyy', 'São Bela', '88888-888', 'SP', 'prefeitura@santarosa.rs.gov.br', '(88) 88888-8888', '(88) 88888-8888'),
	(2, 'Prefeitura Municipal de Vila Verde', '23.456.789/0001 - 67', 'Avenida Verde, 234', 'Jardim Verde', 'Vila Verde', '45678-902', 'BA', 'contato@vilaverde.ba.gov.br', '(71) 45678 - 901', '(71) 98765 - 4321'),
	(3, 'Prefeitura Municipal de São Bela', '12.345.678/0001-90', 'Avenida Verde, 234', 'Jardim Verde', 'Vila Verde', '45 678 - 901', 'BA', 'contato@vilaverde.ba.gov.br', '(71) 45678 - 901', '(71) 98765 - 4321'),
	(4, 'BBBBBBBBBBBBBBBBB', '00.000.000/0000-00', 'BBBBBBBBBBBBBBBBBBBBBB', 'BBBBBBBBBBBBBBBBBBBBB', 'BBBBBBBBBBBBBBBBBBBBB', '22222-222', 'AL', 'AAAAAAAAA@GMAIL.COM', '(33) 33333-3333', '(22) 22222-2222'),
	(5, 'a', '11.212.111/1212-12', 'aaaaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaa', '54564-564', 'SP', '4545@gmail.com', '(45) 46564-5646', '(45) 45645-6456'),
	(6, 'aaaaaaaaaaaaaa', '45.464.646/4455-45', 'dfdfdfdfdf', '454464654', '4554654564564', '45564-645', 'SP', '4545645465@mmm.com.br', '(45) 45464-5645', '(54) 54456-4565');

-- Copiando estrutura para tabela foccus.modalidade
CREATE TABLE IF NOT EXISTS `modalidade` (
  `id_modalidade` int(11) NOT NULL AUTO_INCREMENT,
  `desc_modalidade` varchar(100) NOT NULL,
  `desc_serie_modalidade` varchar(80) NOT NULL,
  PRIMARY KEY (`id_modalidade`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela foccus.modalidade: ~11 rows (aproximadamente)
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

-- Copiando estrutura para tabela foccus.orgao
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela foccus.orgao: ~3 rows (aproximadamente)
INSERT INTO `orgao` (`org_id`, `org_razaosocial`, `org_cnpj`, `org_endereco`, `org_bairro`, `org_municipio`, `org_cep`, `org_uf`, `org_email`, `org_tel1`, `org_tel2`, `fk_org_inst_id`) VALUES
	(1, 'Secretaria Municipal de Educação de Nova Esperança', '12.345.678/0001 - 23', 'Rua da Educação, 101', 'Centro', ' Nova Esperança', '23 456 - 789', 'PR', 'educacao@novaesperanca.pr.gov.br', '(41) 12345 - 678', '(41) 98765 - 4321', 2),
	(2, 'dfdfdf', '22.222.222/2222-22', '22222222222222222', 'vila popular', 'vila popular', '54545-644', 'PE', 'marcosbarrosobia@gmail.com', '(81) 99320-8077', '(11) 11111-1111', 4),
	(3, 'aaaaaaaaaaaaaaa', '45.456.456/4564-56', '54564564564654456', '5455645645645', '454656456', '45545-646', 'PE', 'mmmmmm', '(45) 64646-4564', NULL, 3);

-- Copiando estrutura para tabela foccus.serie
CREATE TABLE IF NOT EXISTS `serie` (
  `serie_id` int(11) NOT NULL AUTO_INCREMENT,
  `serie_desc` varchar(50) NOT NULL,
  `fk_mod_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`serie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela foccus.serie: ~9 rows (aproximadamente)
INSERT INTO `serie` (`serie_id`, `serie_desc`, `fk_mod_id`) VALUES
	(1, '1º ANO', 2),
	(2, '2º ANO', 2),
	(3, '3º ANO', 2),
	(4, '4º ANO', 2),
	(5, '5º ANO', 2),
	(6, '6º ANO', 3),
	(7, '7º ANO', 3),
	(8, '8º ANO', 3),
	(9, '9º ANO', 3);

-- Copiando estrutura para tabela foccus.tipo_funcao
CREATE TABLE IF NOT EXISTS `tipo_funcao` (
  `tipo_funcao_id` int(11) NOT NULL AUTO_INCREMENT,
  `desc_tipo_funcao` varchar(200) NOT NULL,
  PRIMARY KEY (`tipo_funcao_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela foccus.tipo_funcao: ~11 rows (aproximadamente)
INSERT INTO `tipo_funcao` (`tipo_funcao_id`, `desc_tipo_funcao`) VALUES
	(1, 'Diretor da escola'),
	(2, 'Vice diretor da escola'),
	(3, 'Coordenador'),
	(4, 'Supervisor da escola'),
	(5, 'Professor'),
	(6, 'Professor AEE'),
	(7, 'Psicopedagogo'),
	(8, 'Terapeuta Ocupacional'),
	(9, 'Psicologo'),
	(10, 'Fonodiologo'),
	(11, 'Coordenado AEE');

-- Copiando estrutura para tabela foccus.turma
CREATE TABLE IF NOT EXISTS `turma` (
  `id_turma` int(11) NOT NULL AUTO_INCREMENT,
  `fk_cod_enturmacao` int(11) DEFAULT NULL,
  `fk_cod_func` int(11) DEFAULT NULL,
  `fk_cod_mod` int(11) DEFAULT NULL,
  `fk_inep` varchar(20) DEFAULT NULL,
  `cod_turma` int(11) DEFAULT 0,
  `cod_valor` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_turma`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela foccus.turma: ~3 rows (aproximadamente)
INSERT INTO `turma` (`id_turma`, `fk_cod_enturmacao`, `fk_cod_func`, `fk_cod_mod`, `fk_inep`, `cod_turma`, `cod_valor`) VALUES
	(1, 2, 57, 1, '35060136', 0, '1-35060136'),
	(2, 2, 58, 1, '35060136', 0, '1-35060136'),
	(3, 8, 65, 11, '35060136', 0, '11-35060136');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
