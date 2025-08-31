-- --------------------------------------------------------
-- Servidor:                     sap_tea.mysql.dbaas.com.br
-- Versão do servidor:           5.7.32-35-log - Percona Server (GPL), Release 35, Revision 5688520
-- OS do Servidor:               Linux
-- HeidiSQL Versão:              12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Copiando estrutura para tabela sap_tea.aluno
CREATE TABLE IF NOT EXISTS `aluno` (
  `alu_id` int(11) NOT NULL AUTO_INCREMENT,
  `alu_dt_cad` date DEFAULT NULL,
  `alu_ra` varchar(20) NOT NULL,
  `alu_nome` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alu_dtnasc` date DEFAULT NULL,
  `alu_inep` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alu_nome_resp` varchar(200) DEFAULT NULL,
  `alu_tipo_parentesco` varchar(100) DEFAULT NULL,
  `alu_email_resp` varchar(150) DEFAULT NULL,
  `alu_tel_resp` varchar(20) DEFAULT NULL,
  `flag_perfil` char(1) DEFAULT NULL,
  `flag_inventario` char(1) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`alu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

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

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.atividade_comportamento
CREATE TABLE IF NOT EXISTS `atividade_comportamento` (
  `id_ati_comportamento` int(11) NOT NULL AUTO_INCREMENT,
  `cod_ati_comportamento` char(5) COLLATE latin1_general_ci NOT NULL,
  `desc_ati_comportamento` varchar(250) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id_ati_comportamento`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.atividade_com_lin
CREATE TABLE IF NOT EXISTS `atividade_com_lin` (
  `id_ati_com_lin` int(11) NOT NULL AUTO_INCREMENT,
  `cod_ati_com_lin` varchar(5) COLLATE latin1_general_ci NOT NULL,
  `desc_ati_com_lin` varchar(250) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id_ati_com_lin`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.atividade_int_soc
CREATE TABLE IF NOT EXISTS `atividade_int_soc` (
  `id_ati_int_soc` int(11) NOT NULL AUTO_INCREMENT,
  `cod_ati_int_soc` char(5) COLLATE latin1_general_ci NOT NULL,
  `desc_ati_int_soc` varchar(250) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id_ati_int_soc`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.cad_ativ_eixo_comportamento
CREATE TABLE IF NOT EXISTS `cad_ativ_eixo_comportamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aluno_id` int(11) NOT NULL,
  `cod_atividade` varchar(20) NOT NULL,
  `data_monitoramento` date DEFAULT NULL,
  `data_aplicacao` date DEFAULT NULL,
  `realizado` tinyint(1) DEFAULT NULL,
  `observacoes` text,
  `fase_cadastro` varchar(20) DEFAULT 'Inicial',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `registro_timestamp` bigint(20) DEFAULT NULL,
  `flag` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_atividade_aluno_comportamento` (`aluno_id`,`cod_atividade`,`flag`,`fase_cadastro`),
  UNIQUE KEY `idx_comp_aluno_ativ_data_flag` (`aluno_id`,`cod_atividade`,`data_monitoramento`,`flag`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.cad_ativ_eixo_com_lin
CREATE TABLE IF NOT EXISTS `cad_ativ_eixo_com_lin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aluno_id` int(11) NOT NULL,
  `cod_atividade` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_monitoramento` date DEFAULT NULL,
  `data_aplicacao` date DEFAULT NULL,
  `realizado` tinyint(1) DEFAULT NULL,
  `observacoes` text,
  `fase_cadastro` varchar(20) DEFAULT 'Inicial',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `registro_timestamp` bigint(20) DEFAULT NULL,
  `flag` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_comlin_aluno_ativ_data_flag` (`aluno_id`,`cod_atividade`,`data_monitoramento`,`flag`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.cad_ativ_eixo_int_socio
CREATE TABLE IF NOT EXISTS `cad_ativ_eixo_int_socio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aluno_id` int(11) NOT NULL,
  `cod_atividade` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_monitoramento` date DEFAULT NULL,
  `data_aplicacao` date DEFAULT NULL,
  `realizado` tinyint(1) DEFAULT NULL,
  `observacoes` text,
  `fase_cadastro` varchar(20) DEFAULT 'Inicial',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `registro_timestamp` bigint(20) DEFAULT NULL,
  `flag` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_socio_aluno_ativ_data_flag` (`aluno_id`,`cod_atividade`,`data_monitoramento`,`flag`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.comunicacao
CREATE TABLE IF NOT EXISTS `comunicacao` (
  `id_comunicacao` int(11) NOT NULL AUTO_INCREMENT,
  `precisa_comunicacao` tinyint(4) DEFAULT NULL,
  `entende_instrucao` tinyint(4) DEFAULT NULL,
  `recomenda_instrucao` varchar(255) DEFAULT NULL,
  `fk_id_aluno` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_comunicacao`),
  KEY `fk_alu_id` (`fk_id_aluno`),
  CONSTRAINT `comunicacao_ibfk_1` FOREIGN KEY (`fk_id_aluno`) REFERENCES `aluno` (`alu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.controle_fases_sondagem
CREATE TABLE IF NOT EXISTS `controle_fases_sondagem` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_aluno` int(11) NOT NULL,
  `ano` int(11) NOT NULL,
  `fase_inicial` enum('In','Pendente') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pendente',
  `cont_I` int(11) NOT NULL DEFAULT '0',
  `fase_cont1` enum('Cont1','Pendente') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pendente',
  `cont_fase_c1` int(11) NOT NULL DEFAULT '0',
  `fase_cont2` enum('Cont2','Pendente') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pendente',
  `cont_fase_c2` int(11) NOT NULL DEFAULT '0',
  `fase_final` enum('Final','Pendente') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pendente',
  `cont_fase_final` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `controle_fases_sondagem_aluno_ano_unique` (`id_aluno`,`ano`),
  CONSTRAINT `controle_fases_sondagem_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `aluno` (`alu_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportação de dados foi desmarcado.

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Exportação de dados foi desmarcado.

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.eixo_int_socio
CREATE TABLE IF NOT EXISTS `eixo_int_socio` (
  `id_eixo_int_socio` int(11) NOT NULL AUTO_INCREMENT,
  `eis01` tinyint(1) DEFAULT NULL,
  `eis02` tinyint(1) DEFAULT NULL,
  `eis03` tinyint(1) DEFAULT NULL,
  `eis04` tinyint(1) DEFAULT NULL,
  `eis05` tinyint(1) DEFAULT NULL,
  `eis06` tinyint(1) DEFAULT NULL,
  `eis07` tinyint(1) DEFAULT NULL,
  `eis08` tinyint(1) DEFAULT NULL,
  `eis09` tinyint(1) DEFAULT NULL,
  `eis10` tinyint(1) DEFAULT NULL,
  `eis11` tinyint(1) DEFAULT NULL,
  `eis12` tinyint(1) DEFAULT NULL,
  `eis13` tinyint(1) DEFAULT NULL,
  `eis14` tinyint(1) DEFAULT NULL,
  `eis15` tinyint(1) DEFAULT NULL,
  `eis16` tinyint(1) DEFAULT NULL,
  `eis17` tinyint(1) DEFAULT NULL,
  `eis18` tinyint(1) DEFAULT NULL,
  `fk_alu_id_eintsoc` int(11) DEFAULT NULL,
  `data_insert_int_socio` date DEFAULT NULL,
  `fase_inv_int_socio` char(2) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_eixo_int_socio`),
  KEY `fk_alu_id_eintsoc` (`fk_alu_id_eintsoc`),
  CONSTRAINT `eixo_int_socio_ibfk_1` FOREIGN KEY (`fk_alu_id_eintsoc`) REFERENCES `aluno` (`alu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='SELECT COLUMN_NAME \r\nFROM INFORMATION_SCHEMA.COLUMNS \r\nWHERE TABLE_SCHEMA = ''sap_tea'' \r\n  AND TABLE_NAME = ''eixo_int_socio'';\r\n\r\nshow columns from eixo_int_socio\r\n\r\n\r\nSHOW CREATE TABLE eixo_int_socio  INTO OUTFILE  ''/Users/Marcos/Documents/estrutuo_eixo_int_scio.txt'';\r\neis15';

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.enturmacao
CREATE TABLE IF NOT EXISTS `enturmacao` (
  `id_enturmacao` int(11) NOT NULL AUTO_INCREMENT,
  `fk_id_escola` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_id_modalidade` int(11) DEFAULT NULL,
  `fk_inep` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_enturmacao`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.enturmacao_professor
CREATE TABLE IF NOT EXISTS `enturmacao_professor` (
  `id_entur_professor` int(11) NOT NULL AUTO_INCREMENT,
  `fk_id_func` int(11) DEFAULT NULL,
  `fk_id_enturmacao` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_entur_professor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.escola
CREATE TABLE IF NOT EXISTS `escola` (
  `esc_id` int(11) NOT NULL AUTO_INCREMENT,
  `esc_dtcad` date DEFAULT NULL,
  `esc_inep` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `esc_cnpj` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `esc_razao_social` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `esc_endereco` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `esc_bairro` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `esc_municipio` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `esc_cep` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `esc_uf` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `esc_telefone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `esc_email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_org_esc_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`esc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.estoque_atividades
CREATE TABLE IF NOT EXISTS `estoque_atividades` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `aluno_id` bigint(20) unsigned NOT NULL,
  `eixo` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cod_atividade` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `flag` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `estoque_unico` (`aluno_id`,`eixo`,`cod_atividade`),
  KEY `idx_aluno_eixo` (`aluno_id`,`eixo`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportação de dados foi desmarcado.

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

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.funcionario
CREATE TABLE IF NOT EXISTS `funcionario` (
  `func_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `func_data_cad` date NOT NULL,
  `inep` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `func_nome` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `func_cpf` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_func` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precisa_trocar_senha` tinyint(1) NOT NULL DEFAULT '1',
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
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.habilidade
CREATE TABLE IF NOT EXISTS `habilidade` (
  `id_habilidade` int(11) NOT NULL AUTO_INCREMENT,
  `desc_habilidade` varchar(200) NOT NULL,
  `fk_tpeixo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_habilidade`),
  KEY `fk_tpeixo_habilidade` (`fk_tpeixo`),
  CONSTRAINT `fk_tpeixo_habilidade` FOREIGN KEY (`fk_tpeixo`) REFERENCES `tp_eixo` (`id_tpeixo`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.habilidade_comportamento
CREATE TABLE IF NOT EXISTS `habilidade_comportamento` (
  `id_hab_comportamento` int(11) NOT NULL AUTO_INCREMENT,
  `cod_hab_comportamento` char(5) COLLATE latin1_general_ci NOT NULL,
  `desc_hab_comportamento` varchar(250) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id_hab_comportamento`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.habilidade_com_lin
CREATE TABLE IF NOT EXISTS `habilidade_com_lin` (
  `id_hab_com_lin` int(11) NOT NULL AUTO_INCREMENT,
  `cod_hab_com_lin` char(5) COLLATE latin1_general_ci NOT NULL,
  `desc_hab_com_lin` varchar(250) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id_hab_com_lin`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.habilidade_int_soc
CREATE TABLE IF NOT EXISTS `habilidade_int_soc` (
  `id_hab_int_soc` int(11) NOT NULL AUTO_INCREMENT,
  `cod_hab_int_soc` char(5) COLLATE latin1_general_ci NOT NULL,
  `desc_hab_int_soc` varchar(250) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id_hab_int_soc`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.hab_pro_comportamento
CREATE TABLE IF NOT EXISTS `hab_pro_comportamento` (
  `id_hab_pro_comportamento` int(11) NOT NULL AUTO_INCREMENT,
  `fk_id_hab_comportamento` int(11) DEFAULT NULL,
  `fk_id_pro_comportamento` int(11) DEFAULT NULL,
  `cod_atividade` varchar(5) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`id_hab_pro_comportamento`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.hab_pro_com_lin
CREATE TABLE IF NOT EXISTS `hab_pro_com_lin` (
  `id_hab_pro_com_lin` int(11) NOT NULL AUTO_INCREMENT,
  `fk_id_hab_com_lin` int(11) DEFAULT NULL,
  `fk_id_pro_com_lin` int(11) DEFAULT NULL,
  `cod_atividade` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_hab_pro_com_lin`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.hab_pro_int_soc
CREATE TABLE IF NOT EXISTS `hab_pro_int_soc` (
  `id_hab_pro_int_soc` int(11) NOT NULL AUTO_INCREMENT,
  `fk_id_hab_int_soc` int(11) DEFAULT NULL,
  `fk_id_pro_int_soc` int(11) DEFAULT NULL,
  `cod_atividade` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_hab_pro_int_soc`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportação de dados foi desmarcado.

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

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

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.matricula
CREATE TABLE IF NOT EXISTS `matricula` (
  `id_matricula` int(11) NOT NULL AUTO_INCREMENT,
  `numero_matricula` varchar(20) NOT NULL,
  `fk_cod_valor_turma` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ano_matricula` int(11) DEFAULT NULL,
  `fk_id_aluno` int(11) DEFAULT NULL,
  `fk_cod_mod` int(11) DEFAULT NULL,
  `fk_id_serie` int(11) DEFAULT NULL,
  `periodo` enum('Manhã','Tarde','Noite') DEFAULT NULL,
  PRIMARY KEY (`id_matricula`),
  KEY `fk_matricula_serie` (`fk_id_serie`),
  CONSTRAINT `fk_matricula_serie` FOREIGN KEY (`fk_id_serie`) REFERENCES `serie` (`serie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.modalidade
CREATE TABLE IF NOT EXISTS `modalidade` (
  `id_modalidade` int(11) NOT NULL AUTO_INCREMENT,
  `data_migracao` datetime DEFAULT NULL,
  `fk_id_modalidade` int(11) DEFAULT NULL,
  `inep_escola` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_modalidade`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.perfil_alteracoes
CREATE TABLE IF NOT EXISTS `perfil_alteracoes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `aluno_id` bigint(20) NOT NULL,
  `total_alteracoes` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.perfil_estudante
CREATE TABLE IF NOT EXISTS `perfil_estudante` (
  `id_perfil` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `diag_laudo` tinyint(1) NOT NULL DEFAULT '0',
  `data_laudo` date DEFAULT NULL,
  `cid` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nome_medico` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nivel_suporte` tinyint(1) NOT NULL DEFAULT '1',
  `uso_medicamento` tinyint(1) NOT NULL DEFAULT '0',
  `quais_medicamento` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nec_pro_apoio` tinyint(1) NOT NULL DEFAULT '0',
  `prof_apoio` tinyint(1) NOT NULL DEFAULT '0',
  `loc_01` tinyint(1) NOT NULL DEFAULT '0',
  `hig_02` tinyint(1) NOT NULL DEFAULT '0',
  `ali_03` tinyint(1) NOT NULL DEFAULT '0',
  `com_04` tinyint(1) NOT NULL DEFAULT '0',
  `out_05` tinyint(1) NOT NULL DEFAULT '0',
  `out_momentos` text COLLATE utf8mb4_unicode_ci,
  `at_especializado` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_id_aluno` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_perfil`),
  KEY `perfil_estudante_fk_id_aluno_foreign` (`fk_id_aluno`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportação de dados foi desmarcado.

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.perfil_profissional
CREATE TABLE IF NOT EXISTS `perfil_profissional` (
  `id_perfil_profissional` int(11) NOT NULL AUTO_INCREMENT,
  `nome_profissional` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `especialidade_profissional` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observacoes_profissional` text COLLATE utf8mb4_unicode_ci,
  `fk_id_aluno` int(11) DEFAULT NULL,
  `data_cadastro_profissional` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_perfil_profissional`),
  KEY `perfil_profissional_fk_id_aluno_foreign` (`fk_id_aluno`),
  CONSTRAINT `perfil_profissional_fk_id_aluno_foreign` FOREIGN KEY (`fk_id_aluno`) REFERENCES `aluno` (`alu_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportação de dados foi desmarcado.

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Exportação de dados foi desmarcado.

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.proposta_comportamento
CREATE TABLE IF NOT EXISTS `proposta_comportamento` (
  `id_pro_comportamento` int(11) NOT NULL AUTO_INCREMENT,
  `cod_pro_comportamento` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc_pro_comportamento` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_pro_comportamento`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.proposta_com_lin
CREATE TABLE IF NOT EXISTS `proposta_com_lin` (
  `id_pro_com_lin` int(11) NOT NULL AUTO_INCREMENT,
  `cod_pro_com_lin` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc_pro_com_lin` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_pro_com_lin`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.proposta_int_soc
CREATE TABLE IF NOT EXISTS `proposta_int_soc` (
  `id_pro_int_soc` int(11) NOT NULL AUTO_INCREMENT,
  `cod_pro_int_soc` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc_pro_int_soc` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_pro_int_soc`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.resultado_agrupado
CREATE TABLE IF NOT EXISTS `resultado_agrupado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eixo` tinyint(4) NOT NULL,
  `aluno_id` int(11) NOT NULL,
  `proposta_id` int(11) NOT NULL,
  `fase` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` int(11) NOT NULL,
  `data_agrupamento` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.result_eixo_comportamento
CREATE TABLE IF NOT EXISTS `result_eixo_comportamento` (
  `id_result_eixo_comportamento` int(11) NOT NULL AUTO_INCREMENT,
  `fk_hab_pro_comportamento` int(11) DEFAULT NULL,
  `fk_id_pro_comportamento` int(11) DEFAULT NULL,
  `fk_result_alu_id_comportamento` int(11) DEFAULT NULL,
  `date_cadastro` datetime DEFAULT CURRENT_TIMESTAMP,
  `tipo_fase_comportamento` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_result_eixo_comportamento`)
) ENGINE=InnoDB AUTO_INCREMENT=996 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.result_eixo_com_lin
CREATE TABLE IF NOT EXISTS `result_eixo_com_lin` (
  `id_result_eixo_com_lin` int(11) NOT NULL AUTO_INCREMENT,
  `fk_hab_pro_com_lin` int(11) DEFAULT NULL,
  `fk_id_pro_com_lin` int(11) DEFAULT NULL,
  `fk_result_alu_id_ecomling` int(11) DEFAULT NULL,
  `date_cadastro` datetime DEFAULT CURRENT_TIMESTAMP,
  `tipo_fase_com_lin` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_result_eixo_com_lin`)
) ENGINE=InnoDB AUTO_INCREMENT=1802 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.result_eixo_int_socio
CREATE TABLE IF NOT EXISTS `result_eixo_int_socio` (
  `id_result_eixo_int_socio` int(11) NOT NULL AUTO_INCREMENT,
  `fk_hab_pro_int_socio` int(11) DEFAULT NULL,
  `fk_id_pro_int_socio` int(11) DEFAULT NULL,
  `fk_result_alu_id_int_socio` int(11) DEFAULT NULL,
  `date_cadastro` datetime DEFAULT CURRENT_TIMESTAMP,
  `tipo_fase_int_socio` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_result_eixo_int_socio`)
) ENGINE=InnoDB AUTO_INCREMENT=1143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.serie
CREATE TABLE IF NOT EXISTS `serie` (
  `serie_id` int(11) NOT NULL AUTO_INCREMENT,
  `serie_desc` varchar(50) NOT NULL,
  `fk_mod_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`serie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

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

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.sondagem_fase_aluno
CREATE TABLE IF NOT EXISTS `sondagem_fase_aluno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aluno_id` int(11) NOT NULL,
  `fase` enum('In','C1','C2','FI') COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_inicio` date NOT NULL,
  `data_conclusao` date DEFAULT NULL,
  `status` enum('aberta','concluida','expirada') COLLATE utf8mb4_unicode_ci DEFAULT 'aberta',
  `dias_entre_fases` int(11) DEFAULT '40',
  `observacoes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aluno_id` (`aluno_id`),
  CONSTRAINT `sondagem_fase_aluno_ibfk_1` FOREIGN KEY (`aluno_id`) REFERENCES `aluno` (`alu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.tipo_funcao
CREATE TABLE IF NOT EXISTS `tipo_funcao` (
  `tipo_funcao_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `desc_tipo_funcao` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tipo_funcao_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.tipo_modalidade
CREATE TABLE IF NOT EXISTS `tipo_modalidade` (
  `id_tipo_modalidade` int(11) NOT NULL AUTO_INCREMENT,
  `desc_modalidade` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_tipo_modalidade`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.tp_eixo
CREATE TABLE IF NOT EXISTS `tp_eixo` (
  `id_tpeixo` int(11) NOT NULL AUTO_INCREMENT,
  `desc_tpeixo` varchar(200) NOT NULL,
  PRIMARY KEY (`id_tpeixo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sap_tea.turma
CREATE TABLE IF NOT EXISTS `turma` (
  `id_turma` int(11) NOT NULL AUTO_INCREMENT,
  `fk_cod_enturmacao` int(11) DEFAULT NULL,
  `fk_cod_func` int(11) DEFAULT NULL,
  `fk_cod_mod` int(11) DEFAULT NULL,
  `fk_inep` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cod_turma` int(11) DEFAULT '0',
  `cod_valor` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_turma`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

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

-- Exportação de dados foi desmarcado.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
