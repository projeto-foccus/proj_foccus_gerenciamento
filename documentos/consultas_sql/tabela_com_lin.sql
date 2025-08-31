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

-- Copiando estrutura para tabela sap_tea.hab_pro_com_lin
CREATE TABLE IF NOT EXISTS `hab_pro_com_lin` (
  `id_hab_pro_com_lin` int(11) NOT NULL AUTO_INCREMENT,
  `fk_id_hab_com_lin` int(11) DEFAULT NULL,
  `fk_id_pro_com_lin` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_hab_pro_com_lin`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela sap_tea.hab_pro_com_lin: ~119 rows (aproximadamente)
INSERT INTO `hab_pro_com_lin` (`id_hab_pro_com_lin`, `fk_id_hab_com_lin`, `fk_id_pro_com_lin`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 1, 3),
	(4, 1, 4),
	(5, 1, 6),
	(6, 1, 7),
	(7, 1, 8),
	(8, 2, 1),
	(9, 2, 2),
	(10, 2, 4),
	(11, 2, 5),
	(12, 2, 7),
	(13, 2, 8),
	(14, 3, 8),
	(15, 4, 1),
	(16, 4, 2),
	(17, 4, 3),
	(18, 4, 5),
	(19, 4, 6),
	(20, 4, 7),
	(21, 4, 8),
	(22, 5, 3),
	(23, 5, 6),
	(24, 6, 3),
	(25, 6, 4),
	(26, 6, 5),
	(27, 6, 6),
	(28, 6, 7),
	(29, 7, 4),
	(30, 7, 5),
	(31, 8, 4),
	(32, 8, 5),
	(33, 8, 8),
	(34, 9, 4),
	(35, 9, 5),
	(36, 10, 2),
	(37, 10, 4),
	(38, 10, 7),
	(39, 11, 1),
	(40, 11, 3),
	(41, 11, 6),
	(42, 11, 7),
	(43, 12, 1),
	(44, 12, 2),
	(45, 12, 8),
	(46, 13, 2),
	(47, 13, 4),
	(48, 13, 7),
	(49, 14, 2),
	(50, 14, 3),
	(51, 14, 7),
	(52, 15, 1),
	(53, 15, 3),
	(54, 15, 6),
	(55, 16, 1),
	(56, 16, 3),
	(57, 16, 6),
	(58, 16, 7),
	(59, 17, 1),
	(60, 17, 2),
	(61, 17, 4),
	(62, 17, 7),
	(63, 18, 1),
	(64, 18, 8),
	(65, 19, 5),
	(66, 19, 8),
	(67, 20, 1),
	(68, 20, 3),
	(69, 20, 6),
	(70, 20, 7),
	(71, 20, 8),
	(72, 21, 2),
	(73, 21, 4),
	(74, 21, 5),
	(75, 21, 7),
	(76, 22, 3),
	(77, 22, 6),
	(78, 23, 3),
	(79, 23, 6),
	(80, 24, 1),
	(81, 24, 2),
	(82, 24, 3),
	(83, 24, 4),
	(84, 24, 5),
	(85, 25, 6),
	(86, 25, 7),
	(87, 25, 8),
	(88, 25, 2),
	(89, 25, 5),
	(90, 25, 8),
	(91, 26, 1),
	(92, 26, 6),
	(93, 26, 7),
	(94, 26, 8),
	(95, 27, 2),
	(96, 27, 5),
	(97, 28, 4),
	(98, 28, 5),
	(99, 29, 1),
	(100, 29, 2),
	(101, 29, 3),
	(102, 29, 4),
	(103, 29, 5),
	(104, 29, 6),
	(105, 29, 7),
	(106, 29, 8),
	(107, 30, 1),
	(108, 30, 2),
	(109, 30, 3),
	(110, 30, 5),
	(111, 30, 6),
	(112, 30, 8),
	(113, 31, 2),
	(114, 31, 3),
	(115, 31, 4),
	(116, 31, 5),
	(117, 31, 6),
	(118, 32, 1),
	(119, 32, 8);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
