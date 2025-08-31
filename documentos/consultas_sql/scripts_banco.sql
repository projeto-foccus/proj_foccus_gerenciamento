-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: foccus
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno` (
  `alu_id` int NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`alu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (57,'1970-05-10','3456789012','Gabriel Martins Rocha Souza','2018-10-30','35060136','André Gomes Pereira Santos Almeida','Padrasto','gabriel.souza876@email.com','(11) 91432-7654','*'),(58,'2025-01-27','4567890123','Larissa Oliveira Santos Costa','2019-12-23','35060136','Lorena Nogueira Barbosa Costa Silva','Madrasta','larissa.costa223@email.com','(11) 97865-4321',''),(59,'2025-01-27','5678901234','Felipe Almeida Lima Rocha','2017-02-04','35060136','Bruno Oliveira Costa Lima Rocha','Tutor','felipe.almeida567@email.com','(11) 91987-6543',''),(60,'1968-12-10','6789012345','Mariana Pereira Silva Nogueira','2016-05-17','35060136','Aline Silva Santos Pereira Gomes','Responsável legal','mariana.rodrigues890@email.com','(11) 93765-4321',''),(61,'2025-01-27','7890123456','Tiago Costa Almeida Oliveira','2018-08-21','35060136','Vitor Alves Martins Souza Barbosa','Curador','tiago.martins234@email.com','(11) 96123-4567',''),(62,'2025-01-27','8901234567','Aline Souza Lima Barbosa','2019-11-12','35060136','Larissa Lima Pinto Oliveira Souza','Guardião','aline.silva111@email.com','(11) 92345-6789',''),(63,'2025-01-27','9012345678','Igor Pereira Rocha Almeida','2016-01-03','35060136','Matheus Pereira Almeida Costa Nogueira','Pai afetivo','igor.pereira345@email.com','(11) 93456-7890',''),(64,'2025-01-27','7689012345','Paula Costa Santos Pereira','2019-02-22','35060136','Rafaela Silva Souza Pereira Lima','Mãe temporária','paula.santos234@email.com','(11) 98123-4567',''),(65,'2025-01-27','8790123456','Rodrigo Silva Almeida Lima','2016-04-28','35060136','Bruna Oliveira Santos Nogueira Alves','Pai substituto','rodrigo.rocha987@email.com','(11) 96345-6789',''),(66,'2025-01-27','9801234567','Isabela Barbosa Rocha Nogueira','2017-07-14','56899555','Diego Almeida Lima Pereira Rocha','Mãe substituta','isabela.costa876@email.com','(11) 93256-7890',''),(67,'2025-01-27','3467890123','Eduardo Souza Almeida Costa','2018-10-15','56899555','Sara Martins Santos Oliveira Silva','Pai de adoção','eduardo.pereira654@email.com','(11) 97654-3210',''),(68,'2025-01-27','4578901234','Rafaela Lima Pereira Rocha','2019-11-06','56899555','Carlos Pereira Costa Barbosa Nogueira','Mãe de adoção','rafaela.almeida112@email.com','(11) 91234-5678',''),(69,'2025-01-27','5689012345','Lucas Almeida Santos Costa','2016-03-20','56899555','Tiago Rocha Oliveira Souza Lima','Pai de afeto','lucas.barbosa908@email.com','(11) 98321-7654',''),(70,'2025-01-27','6790123456','Gabriela Oliveira Lima Martins','2017-08-11','56899555','Ana Clara Souza Alves Pereira Martins','Mãe de afeto','gabriela.lima223@email.com','(11) 96123-4567',''),(71,'2025-01-27','7801234567','Gustavo Rocha Silva Pereira','2018-12-30','56899555','Felipe Gomes Oliveira Barbosa Lima','Pai de sangue','gustavo.martins345@email.com','(11) 98765-4321',''),(72,'2025-01-27','8912345678','Renata Costa Nogueira Lima','2019-05-08','56899555','Igor Silva Santos Rocha Nogueira','Mãe de sangue','renata.rodrigues567@email.com','(11) 93456-7890',''),(73,'2025-01-27','9023456789','Sérgio Lima Almeida Santos','2017-01-24','56899555','Camila Lima Alves Santos Pereira','Responsável por guarda compartilhada','sérgio.silva432@email.com','(11) 91123-4567',''),(74,'2025-01-27','1012345678','Vanessa Oliveira Rocha Souza','2018-07-02','56899555','João Pedro Rocha Oliveira Costa Lima','Responsável por guarda unilateral','vanessa.almeida345@email.com','(11) 97345-6789',''),(75,'2025-01-27','2123456789','Matheus Pereira Almeida Silva','2019-09-19','56899555','Vivi Rocha Costa Nogueira Souza','Pai biológico de criação','matheus.rocha112@email.com','(11) 96654-3210',''),(76,'2025-01-27','3234567890','Priscila Lima Souza Rocha','2016-03-09','25789435','Jorge Souza Oliveira Lima Barbosa','Mãe biológica de criação','cristiane.costa234@email.com','(11) 99876-5432',''),(77,'2025-01-27','4345678901','Leandro Oliveira Costa Martins','2017-06-26','25789435','Nicole Pereira Lima Santos Rocha','Pai de visitação','ricardo.souza567@email.com','(11) 92654-3210',''),(78,'2025-01-27','8789012345','Fábio Costa Santos Lima','2018-12-03','25789435','Thiago Oliveira Costa Nogueira Almeida','Pai de afiliação','thais.pinto234@email.com','(11) 96345-6789',''),(79,'2025-01-27','9890123456','Thais Souza Almeida Nogueira','2019-02-21','25789435','Gabriela Nogueira Lima Souza Costa','Mãe de afiliação','josé.santos345@email.com','(11) 92456-7890',''),(80,'2025-01-27','2101234567','José Roberto Lima Rocha','2017-06-14','25789435','Marcos Silva Almeida Oliveira Pinto','Responsável por tutela','beatriz.silva223@email.com','(11) 90987-6543',''),(81,'2025-01-27','3212345678','Beatriz Almeida Lima Costa','2018-09-01','25789435','Lúcia Costa Nogueira Lima Souza','Responsável por curatela','raquel.martins432@email.com','(11) 94123-4567',''),(82,'2025-01-27','4323456789','Raquel Pereira Santos Lima','2019-11-07','25789435','Arthur Barbosa Lima Almeida Rocha','Pai de abrigo','lucas.santos876@email.com','(11) 97456-7890',''),(83,'2025-01-27','5434567890','Lucas Rocha Silva Almeida','2017-02-12','25789435','Juliana Silva Lima Pereira Santos','Mãe de abrigo','gabriela.rocha345@email.com','(11) 93654-3210',''),(84,'2025-01-27','6545678901','Sofia Oliveira Nogueira Rocha','2018-04-09','25789435','Renata Pereira Nogueira Souza Lima','Pai de acolhimento','gustavo.lima987@email.com','(11) 91234-5678',''),(85,'2025-01-27','9878901234','Felipe Costa Nogueira Almeida','2017-03-27','25789435','Karina Oliveira Pereira Barbosa Lima','Mãe colaboradora','paula.martins567@email.com','(11) 92234-5678',''),(86,'2025-01-27','1098765432','Vitória Souza Lima Rocha','2018-10-01','25666665','Eduardo Souza Lima Rocha Nogueira','Pai com convivência alternada','felipe.rodrigues223@email.com','(11) 96654-3210',''),(87,'2025-01-27','2109876543','Anderson Martins Almeida Lima','2019-12-25','25666665','Sofia Santos Pereira Lima Rocha','Mãe com convivência alternada','lucas.costa112@email.com','(11) 97456-7890',''),(88,'2025-01-27','3210987654','Mariana Rocha Costa Pereira','2016-06-18','25666665','Fábio Almeida Oliveira Pinto Costa','Responsável familiar','isabela.barbosa345@email.com','(11) 90765-4321',''),(89,'2025-01-27','4321098765','Ricardo Lima Souza Barbosa','2017-05-05','25666665','Clara Costa Pereira Lima Nogueira','Responsável institucional','tiago.lima876@email.com','(11) 91432-7654',''),(90,'2025-01-27','5432109876','Cristiane Silva Lima Nogueira','2018-08-20','25666665','Leandro Santos Almeida Lima Rocha','Pai com visitação regular','andré.souza987@email.com','(11) 92765-4321',''),(91,'2025-01-27','6543210987','Rodrigo Pereira Rocha Costa','2019-10-22','25666665','Nicole Silva Souza Lima Barbosa','Mãe com visitação regular','luciana.rocha432@email.com','(11) 98123-4567',''),(92,'2025-01-27','7654321098','Karina Almeida Souza Rocha','2016-03-15','25666665','Guilherme Oliveira Pinto Costa Rocha','Pai com responsabilidade compartilhada','rafaela.silva223@email.com','(11) 96234-5678',''),(93,'2025-01-27','8765432109','Eduardo Oliveira Nogueira Lima','2017-06-10','25666665','Viviane Souza Lima Nogueira Pereira','Mãe com responsabilidade compartilhada','josé.lima890@email.com','(11) 91567-4321',''),(94,'2025-01-27','1023456789','Fernanda Lima Oliveira Costa','2017-06-18','25666665','Beatriz Santos Oliveira Silva Lima','Mãe afetiva','fernanda.barbosa876@email.com','(11) 90567-8910',''),(95,'2025-01-27','2134567890','Victor Souza Rocha Martins','2018-10-10','25666665','Henrique Carvalho Souza Lima Pinto','Pai de coração','victor.rocha654@email.com','(11) 98234-5678',''),(96,'2025-01-27','3245678901','Camila Nogueira Lima Oliveira','2019-03-25','25666665','Priscila Rocha Nogueira Alves Barbosa','Mãe de coração','camila.souza908@email.com','(11) 91567-4321',''),(97,'2025-01-27','4356789012','Bruno Silva Costa Barbosa','2016-05-13','25666665','Leandro Pereira Oliveira Costa Santos','Pai de guarda','bruno.lima567@email.com','(11) 92876-5432',''),(98,'2025-01-27','5467890123','Larissa Martins Pereira Almeida','2017-07-07','25666665','Fernanda Souza Lima Martins Rocha','Mãe de guarda','larissa.almeida876@email.com','(11) 99654-3210',''),(99,'2025-01-27','6578901234','Diego Oliveira Lima Rocha','2018-09-19','25666665','José Costa Barbosa Nogueira Almeida','Pai temporário','diego.pinto223@email.com','(11) 98987-6543',''),(100,'2025-01-27','5456789012','Larissa Nogueira Silva Almeida','2018-08-05','25666665','Rafael Silva Barbosa Nogueira Lima','Mãe de visitação','juliano.lima654@email.com','(11) 92234-5678',''),(101,'2025-01-27','6567890123','Marcos Lima Souza Pereira','2019-01-11','26190915','Lucas Santos Pereira Almeida Rocha','Pai biológico em regime de visitas','larissa.barbosa223@email.com','(11) 91865-4321',''),(102,'2025-01-27','7678901234','Camila Rocha Almeida Oliveira','2017-04-20','26190915','Patrícia Lima Alves Barbosa Oliveira','Mãe biológica em regime de visitas','fábio.rodrigues890@email.com','(11) 93567-4321',''),(103,'2025-01-27','7656789012','Marcelo Lima Pereira Costa','2019-05-28','26190915','Ricardo Lima Rocha Alves Souza','Mãe de acolhimento','renata.almeida223@email.com','(11) 98321-7654',''),(104,'2025-01-27','8767890123','Paula Barbosa Souza Lima','2016-01-13','26190915','Bruno Costa Almeida Santos Lima','Pai colaborador','marcelo.pereira908@email.com','(11) 93987-6543',''),(105,'2025-01-27','1234567890','João Souza Silva Pereira','2016-02-15','26190915','Felipe Souza Costa Almeida Silva','Pai','joao.silva123@email.com','(11) 91234-5678',''),(106,'2025-01-27','9876543210','Maria Oliveira Santos Costa','2017-03-02','26190915','Juliana Pereira Barbosa Nogueira Costa','Mãe','maria.oliveira456@email.com','(11) 91876-5432',''),(107,'2025-01-27','1122334455','Carlos Almeida Rocha Pinto','2016-05-11','26190915','Tiago Oliveira Santos Lima Rocha','Pai biológico','pedro.martins789@email.com','(11) 93765-4321',''),(108,'2025-01-27','9988776655','Ana Paula Lima Costa Souza','2017-07-24','26190915','Isabela Carvalho Almeida Souza Pinto','Mãe biológica','beatriz.lima112@email.com','(11) 99123-4567',''),(109,'2025-01-27','2233445566','Pedro Henrique Santos Almeida','2018-09-08','26190915','Gustavo Lima Silva Pereira Santos','Pai adotivo','carlos.rocha987@email.com','(11) 98876-5432',''),(110,'2025-01-27','4455667788','Beatriz Nogueira Silva Lima','2019-01-20','26190915','Mariana Costa Alves Pereira Martins','Mãe adotiva','ana.santos334@email.com','(11) 96987-6543',''),(111,'2025-01-27','6677889900','Rafael Oliveira Rocha Almeida','2016-04-14','26190915','Rafael Oliveira Almeida Rocha Dias','Pai de criação','rafael.oliveira654@email.com','(11) 93876-4321',''),(112,'2025-01-27','2345678901','Juliana Costa Almeida Silva','2017-06-09','26190915','Camila Barbosa Silva Lima Oliveira','Mãe de criação','juliana.pinto432@email.com','(11) 92345-6789',''),(113,'2025-03-07','545448484','MARCOS BARROSO','2001-01-20','123123123','MARCOS BARROSO','PAI','ADSASDASD@ASDAS.COM','(11) 23213-2131',''),(114,'2025-03-07','55555555555','555555555555555','5555-05-05','555555','555555','55555','555555@55555.com','(55) 55555-5555',''),(115,'2025-03-07','11111111111111','111111111111111','1545-11-11','11111111','1111111111111111','11111111111111','111111111@1111111.com','(11) 11111-1111',''),(116,'2025-03-07','44333434334','Marcos Antônio barroso de moraes Marcos Barroso','2025-03-07','121213223131','dfdf','fdfdf','marcosbarrosobia@gmail.com','(81) 99320-8077',''),(117,'2025-03-07','13312','RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR','2025-03-13','233333333333','RRRRRRRRRRRRRRRRRRRRRRR','RRRRRRRRRRRRRRRRRRRRRRRR','rrrrrrrrrrrrr@rrrrrrrrrr.com','(33) 33333-3333',''),(118,'2025-03-10','4564464644','MARCOS ANTONIO BARROSO DE MORAES','1968-12-10','2619415','JOSE BARROSO DE MORAES','APAI','mmmm@gmail.com','(12) 21111-1111',''),(119,'2025-03-10','12121213','XXXXXXXXXXXXXXXXXX','2000-03-10','26121212','AAAAAAAAAAA','AAAAAAAAAAAAAA','marcosbarrosobia@gmail.com','(81) 99320-8077',''),(120,'2025-03-13','1111111111111','MARCOS ANTONIO BARROSO DE MORAES','2000-01-01','1111111','JOSE BARROSO DE MORAES','PAI','marcosbarroso@gia.com','(55) 55555-5555','');
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atividade`
--

DROP TABLE IF EXISTS `atividade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atividade` (
  `id_atividade` int NOT NULL AUTO_INCREMENT,
  `cod_atividade` varchar(20) NOT NULL,
  `desc_atividade` varchar(200) NOT NULL,
  `fk_idhabilidade` int DEFAULT NULL,
  PRIMARY KEY (`id_atividade`),
  KEY `fk_habilidade_atividade` (`fk_idhabilidade`),
  CONSTRAINT `fk_habilidade_atividade` FOREIGN KEY (`fk_idhabilidade`) REFERENCES `habilidade` (`id_habilidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atividade`
--

LOCK TABLES `atividade` WRITE;
/*!40000 ALTER TABLE `atividade` DISABLE KEYS */;
/*!40000 ALTER TABLE `atividade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comunicacao`
--

DROP TABLE IF EXISTS `comunicacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comunicacao` (
  `id_comunicacao` int NOT NULL AUTO_INCREMENT,
  `precisa_comunicacao` tinyint(1) DEFAULT NULL,
  `entende_instrucao` tinyint(1) DEFAULT NULL,
  `recomenda_instrucao` text,
  `fk_alu_id` int DEFAULT NULL,
  PRIMARY KEY (`id_comunicacao`),
  KEY `fk_alu_id` (`fk_alu_id`),
  CONSTRAINT `comunicacao_ibfk_1` FOREIGN KEY (`fk_alu_id`) REFERENCES `aluno` (`alu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comunicacao`
--

LOCK TABLES `comunicacao` WRITE;
/*!40000 ALTER TABLE `comunicacao` DISABLE KEYS */;
INSERT INTO `comunicacao` VALUES (1,1,1,'cccccccccccc',57);
/*!40000 ALTER TABLE `comunicacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enturmacao`
--

DROP TABLE IF EXISTS `enturmacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enturmacao` (
  `id_enturmacao` int NOT NULL AUTO_INCREMENT,
  `fk_id_escola` int DEFAULT NULL,
  `fk_id_modalidade` int DEFAULT NULL,
  `fk_inep` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_enturmacao`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enturmacao`
--

LOCK TABLES `enturmacao` WRITE;
/*!40000 ALTER TABLE `enturmacao` DISABLE KEYS */;
INSERT INTO `enturmacao` VALUES (25,5,1,'26190915'),(26,5,2,'26190915'),(27,5,3,'26190915'),(28,5,4,'26190915'),(29,5,5,'26190915'),(30,5,6,'26190915'),(31,3,1,'25789435'),(32,2,1,'56899555'),(33,5,7,'26190915');
/*!40000 ALTER TABLE `enturmacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enturmacao_professor`
--

DROP TABLE IF EXISTS `enturmacao_professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enturmacao_professor` (
  `id_entur_professor` int NOT NULL AUTO_INCREMENT,
  `fk_id_func` int DEFAULT NULL,
  `fk_id_enturmacao` int DEFAULT NULL,
  PRIMARY KEY (`id_entur_professor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enturmacao_professor`
--

LOCK TABLES `enturmacao_professor` WRITE;
/*!40000 ALTER TABLE `enturmacao_professor` DISABLE KEYS */;
/*!40000 ALTER TABLE `enturmacao_professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escola`
--

DROP TABLE IF EXISTS `escola`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escola` (
  `esc_id` int NOT NULL AUTO_INCREMENT,
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
  `fk_org_esc_id` int DEFAULT NULL,
  PRIMARY KEY (`esc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escola`
--

LOCK TABLES `escola` WRITE;
/*!40000 ALTER TABLE `escola` DISABLE KEYS */;
INSERT INTO `escola` VALUES (1,'2025-01-26','35060136','11.111.000/0001-91','RAMIRO ARAUJO FILHO DR','aaaa','JOAO SCABIN','JUNDIAI','13207-180','SP','( 11)8359-5875','joaoscabin@gmail.com',NULL),(2,'2025-01-26','56899555','33.444.000/0001-91','Carla Andressa de Oliveira Sinigalia Emeb','bbb','Santos Dumont','JUNDIAI','13214-410','SP','(11)8957-5875','carlaandressa@gmail.com',NULL),(3,'2025-01-26','25789435','44.555.000/0001-24','Americo Mendes Emeb','ccc','bairro dos fernandes','JUNDIAI','13214-890','SP','(11)3268-6321','americomendes@gmail.com',NULL),(4,'2025-01-26','25666665','71.256.000/0001-21','Alpha Kids Educacional','dddd','Jardim Santa Gertrudes','JUNDIAI','56884-582','SP','(11)8968-2698','alphamendes@hotmail.com',NULL),(5,'2025-01-26','26190915','71.256.000/0001-21','Foccus centro de educacao','eee','Jardim Santa Gertrudes','JUNDIAI','56884-582','SP','(11)8968-2698','escolafoccus@foccus.com',4),(6,'2025-03-10','',' ','','','','','','','','',NULL),(7,'2025-03-13','11','11.111.111/1111-11','1111','1111','111','1111','11111-111','MG','(11) 11111-1111','marcosbarrosobia@gmail.com',NULL),(8,'2025-03-13','44444444','44.444.444/4444-44','4444444444444444444','444444444444444444','44444444444444','4444444444','11111-111','ES','(44) 44444-4444','marcosbarrosobia@gmail.com',NULL),(9,'2025-03-13','eeeeeeee','22.222.222/2222-22','22222222222222222222222','222222222222222','222222222222222222222','2222222222222222','22222-222','SE','(22) 22222-2222','marcosbarrosobia@gmail.com',NULL),(10,'2025-03-13','7777777777777','77.777.777/7777-77','77777777777777777777','7777777777777777','777777777777777777','77777777777777','77777-777','ES','(77) 77777-7777','marcosbarrosobia@gmail.com',NULL),(11,'2025-03-21','dfdf','46.544.564/5646-45','564465456','4564564','564564564','564654','56456-456','PE','(46) 54446-4564','dfdfdf',NULL),(12,'2025-03-21','dfdf','46.544.564/5646-45','564465456','4564564','564564564','564654','56456-456','PE','(46) 54446-4564','dfdfdf',NULL),(13,'2025-03-21','sdfgfg','45.545.455/4454-54','gfffgfg','fgfgfg','gffgf','gfg','45343-433','ES','(34) 43344-3443','fd',NULL),(14,'2025-03-21','asdasdasd','23123123123','123sadasdsadsadasd','sadasdsadasd','sadsadasdsad','sadsadsadsa','21312-312','BA','(23) 12312-3213','dasdsad',NULL);
/*!40000 ALTER TABLE `escola` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `func_id` int NOT NULL AUTO_INCREMENT,
  `inep` varchar(15) NOT NULL,
  `func_nome` varchar(200) NOT NULL,
  `func_cpf` varchar(20) DEFAULT NULL,
  `email_func` varchar(200) DEFAULT NULL,
  `func_cod_funcao` int NOT NULL,
  PRIMARY KEY (`func_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (24,'35060136','João Victor Andrade','012.345.678-90',' joao.andrade@email.com',10),(25,'26190915','Marcos Aurelio','025.455.658-73','marco.aurelio@foccus.com',6),(26,'35060136','Larissa Cunha Ribeiro','112.233.445-56',' larissa.ribeiro@email.com',11),(27,'26190915','Luiz simplicio','113.200.658-78','luiz.simplicio@foccus.com',5),(28,'26190915','Daniela silva','113.203.658-78','daniela.silva@foccus.com',6),(29,'35060136','Ana Beatriz Almeida','123.456.789-09','ana.almeida@email.com',1),(30,'35060136','Marcos Vinícius Teixeira','223.344.556-67',' marcos.teixeira@email.com',6),(31,'35060136','Bruno Henrique Costa','234.567.890-18',' bruno.costa@email.com',2),(32,'35060136','Natália Borges Souza','334.455.667-78',' natalia.souza@email.com',6),(33,'35060136','Carla Mendes Oliveira','345.674.901-27',' carla.oliveira@email.com',3),(34,'26190915','Mariana de Souza','345.678.901-27','mariana.souza@foccus.com',6),(35,'26190915','Marcos Barroso','345.678.901-28','marcosbarroso.info@gmail.com',11),(36,'35060136','Diego Santos Pereira','456.789.012-36','  diego.pereira@email.com',4),(37,'26190915','Stelita Paes','456.888.012-36','stelita.paes@foccus.com',6),(38,'35060136','Eduarda Silva Ramos','567.890.123-45',' eduarda.ramos@email.com',5),(39,'35060136','Felipe Augusto Rocha','678.901.234-54',' felipe.rocha@email.com',6),(40,'26190915','Rafael Melo','782.014.345-69','rafaelbarroso@gmail.com',1),(41,'26190915','Marcos gabriel','789.012.342-68','marcos.gabriel@foccus.com',5),(42,'35060136','Gabriela Nunes Carvalho','789.012.345-63',' gabriela.carvalho@email.com',7),(43,'26190915','Aldenice gomes','789.024.345-63','aldenice.moraes@gmail.com',6),(44,'26190915','Jose barroso','789.034.345-63','josebarroso@gmail.com',6),(45,'35060136','Henrique Matos Lima','890.123.456-72',' henrique.lima@email.com',8),(46,'35060136','Isabela Ferreira Martins','901.234.567-81',' isabela.martins@email.com',9),(47,'2619415','dfdfdfdfdf','68555270430','marcosbarrosobia@gmail.com',11),(48,'2619415','dfdfdfdfdf','68555270430','marcosbarrosobia@gmail.com',10),(49,'2619415','dfdfdfdfdf','68555270430','marcosbarrosobia@gmail.com',10),(50,'2619415','xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','68555270430','marcosbarrosobia@gmail.com',10),(51,'121231231','aaaaaaaaaaaaa','454564444','aaaa@gmail.com',11),(52,'454545454','rafael melo','84454545454','sadsad@asds.com',1),(53,'328472348327','MARCOS BARROSO DE MORAES','99999999999999','DASDAD@ASDAS.COM',1),(54,'45564464','4564564654','44556456465446','fddfdf@gmail.com',3);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habilidade`
--

DROP TABLE IF EXISTS `habilidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habilidade` (
  `id_habilidade` int NOT NULL AUTO_INCREMENT,
  `desc_habilidade` varchar(200) NOT NULL,
  `fk_tpeixo` int DEFAULT NULL,
  PRIMARY KEY (`id_habilidade`),
  KEY `fk_tpeixo_habilidade` (`fk_tpeixo`),
  CONSTRAINT `fk_tpeixo_habilidade` FOREIGN KEY (`fk_tpeixo`) REFERENCES `tp_eixo` (`id_tpeixo`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habilidade`
--

LOCK TABLES `habilidade` WRITE;
/*!40000 ALTER TABLE `habilidade` DISABLE KEYS */;
INSERT INTO `habilidade` VALUES (1,'Amplia gradativamente seu vocabulário?',1),(2,'Amplia gradativamente sua comunicação social?',1),(3,'Apresenta entonação vocal, com boa articulação e ritmo adequado?',1),(4,'Ativa conhecimentos prévios em situações de novas aprendizagens?',1),(5,'Categoriza diferentes elementos de acordo com critérios preestabelecidos?',1),(6,'Compreende e utiliza comunicação alternativa para se comunicar?',1),(7,'Compreende que pode receber ajuda de pessoas conhecidas que estão ao seu redor',1),(8,'Comunica fatos, acontecimentos e ações de seu cotidiano de modo compreensível, ainda que não seja por meio da linguagem verbal?',1),(9,'Comunica suas necessidades básicas (banheiro, água, comida, entre outros)?',1),(10,'Entende expressões faciais em uma conversa?',1),(11,'Executa mais de um comando sequencialmente?',1),(12,'Expressa-se com clareza e objetividade?',1),(13,'Faz uso de expressões faciais para se comunicar?',1),(14,'Faz uso de gestos para se comunicar?',1),(15,'Identifica diferentes elementos, ampliando seu repertório?',1),(16,'Identifica semelhanças e diferenças entre elementos?',1),(17,'Inicia uma situação comunicativa?',1),(18,'Mantem uma situação comunicativa?',1),(19,'Nomeia as pessoas que fazem parte de sua rede de apoio?',1),(20,'Nomeia diferentes elementos, ampliando seu vocabulário?',1),(21,'Possui autonomia para se comunicar, mesmo em situações que geram conflito?',1),(22,'Realiza pareamento de elementos idênticos?',1),(23,'Reconhece e pareia elementos diferentes?',1),(24,'Reconhece visualmente estímulos apresentados?',1),(25,'Refere-se a si mesmo em primeira pessoa?',1),(26,'Respeita turnos de fala?',1),(27,'Responde ao ouvir seu nome?',1),(28,'Solicita ajuda de pessoas que estão ao seu redor, quando necessário?',1),(29,'Utiliza linguagem não verbal para se comunicar?',1),(30,'Utiliza linguagem verbal para se comunicar?',1),(31,'Utiliza respostas simples para se comunicar?',1),(32,'Utiliza vocabulário adequado, de acordo com seu nível de desenvolvimento?',1),(33,'Adapta-se com flexibilidade a mudanças, em sua rotina',2),(34,'Apresenta autonomia na realização das atividades propostas?',2),(35,'Autorregula-se evitando comportamentos disruptivos em situações de desconforto?',2),(36,'Compreende acontecimentos de sua rotina por meio de ilustrações?',2),(37,'Compreende regras de convivência?',2),(38,'Entende ações de autocuidado?',2),(39,'Faz uso de movimentos corporais, como: apontar, movimentar a cabeça em sinal afirmativo/negativo, entre outros?',2),(40,'Imita gestos, movimentos e segue comandos?',2),(41,'Inicia e finaliza as atividades propostas diariamente?',2),(42,'Interage nos momentos de jogos, lazer e demais atividades, respeitando as regras de convivência?',2),(43,'Mantem a organização em sua rotina escolar?',2),(44,'Permanece sentado por mais de dez minutos para a realização das atividades?',2),(45,'Realiza ações motoras que envolvam movimento e equilíbrio?',2),(46,'Realiza atividades com atenção e tolerância?',2),(47,'Realiza, em sua rotina, ações de autocuidado com autonomia?',2),(48,'Reconhece e identifica alimentos que lhe são oferecidos?',2),(49,'Responde a comandos de ordem direta?',2),(50,'Compartilha brinquedos e brincadeiras?',3),(51,'Compartilha interesses?',3),(52,'Controla suas emoções? (Autorregula-se)',3),(53,'Coopera em situações que envolvem interação?',3),(54,'Demonstra e compartilha afeto?',3),(55,'Demonstra interesse nas atividades propostas?',3),(56,'Expressa suas emoções?',3),(57,'Identifica/reconhece a emoção do outro?',3),(58,'Identifica/reconhece suas emoções?',3),(59,'Inicia e mantém interação em situações sociais?',3),(60,'Interage com o(a) professor(a), seus colegas e outras pessoas de seu convívio escolar?',3),(61,'Interage, fazendo contato visual?',3),(62,'Reconhece e entende seus sentimentos, pensamentos e comportamentos?',3),(63,'Relaciona-se, estabelecendo vínculos?',3),(64,'Respeita regras em jogos e brincadeiras?',3),(65,'Respeita regras sociais?',3),(66,'Responde a interações?',3),(67,'Solicita ajuda, quando necessário?',3);
/*!40000 ALTER TABLE `habilidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instituicao`
--

DROP TABLE IF EXISTS `instituicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instituicao` (
  `inst_id` int NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instituicao`
--

LOCK TABLES `instituicao` WRITE;
/*!40000 ALTER TABLE `instituicao` DISABLE KEYS */;
INSERT INTO `instituicao` VALUES (7,'foccus','44.444.444/4444-44','8888888888888888888888888','BBBBBBBBBBBBBBBBBB','55555555555555555555555','6666666','AL','11111@gmail.com','(22) 22222-2222','(77) 77777-7777'),(8,'MARCOS BARROSO','12.345.678/9','RUA MARIA CANDIDA','VILA POPULAR','RECIFE','53230-260','SP','m@gmail.com','(11) 11111-1111','(99) 99999-9999'),(9,'marcos barroso informatica','11.111.111/1111-11','rua maria candidad correira','vila popular','olinda','52333-333','RJ','bia@gmail.com','(00) 00000-0000','(88) 88888-8888'),(10,'111111111111111111','11.111.111/1111-11','1111111111111111111','1111111111111111111','11111111111111111','55555-555','PB','11111111111@gmail.com','(11) 11111-1111','(11) 11111-1111'),(11,'xxxxxxxxxxxxxxxxxxmarcos barroso informatica','11.111.111/1111-11','rua maria candidad correira','vila popular','olinda','52333-333',NULL,'marcosbarroso@gmail.com','(99) 99999-9999','(88) 88888-8888'),(12,'TTTTTTTTTTTTTTTT','88.888.888/8888-88','TTTTTTTTTTTTTTTTTTTT','TTTTTTTTTTTTTTTTTTTTTT','TTTTTTTTTTTTTTTTT','88888-888','AM','TTT@GMAIL.COM','(88) 88888-8888','(99) 99999-9999'),(13,'foccus','44.444.444/4444-44','8888888888888888888888888','BBBBBBBBBBBBBBBBBB','55555555555555555555555','44444-444',NULL,'11111@gmail.com','(22) 22222-2222','(77) 77777-7777'),(14,'foccusX','55.555.555/5555-55','55555555555555555555','555555555555555','55555555555555555555555','55555-555',NULL,'222222@gmail.com','(22) 22222-2222','(22) 22222-2222'),(15,'foccus','44.444.444/4444-44','8888888888888888888888888','BBBBBBBBBBBBBBBBBB','55555555555555555555555','6666666',NULL,'222222222@gmail.com','(22) 22222-2222','(22) 22222-2222'),(16,'foccus','88.888.888/8888-88','8888888888888888888888888','BBBBBBBBBBBBBBBBBB','55555555555555555555555','55555-555','PE','222222@gmail.com','(22) 22222-2222','(22) 22222-2222'),(17,'foccusXXX','33.333.333/3333-33','333333333333333333','333333333333333333','3333333333333333333','33333-333',NULL,'3333333@gmail.com','(33) 33333-3333','(33) 33333-3333'),(18,'foccusXXX','33.333.333/3333-33','333333333333333333','333333333333333333','3333333333333333333','33333-333',NULL,'3333333@gmail.com','(33) 33333-3333','(33) 33333-3333'),(19,'222222222222RAFAEL','22.222.222/2222-22','RUA MARIA CANDIDA','VILA POPULAR','OLINDA','53230-23','SP','11111111111@1111.com','(11) 11111-1111','(11) 11111-1111'),(20,'101010','10.101.010/1010-0','1010101010101','10101010101','10101010','10101-010','MG','10101010@GMAIL.COM','(10) 10101-0101','(10) 1010'),(21,'9999999999999999999','99.999.999/9999-99','99999999999999999','999999999999999999','999999999999999','99999-999','ES','999999999999@GMAIL.COM','(99) 99999-9999','(99) 99999-9999'),(22,'yyyyyyyyyyyyyy','45.565.656/4545-64','xxxxxxxxxxxxxxxxxx','xxxxxxxxxxxxxxxxxx','xxxxxxxxxxxxxxxxx','54654-564','SP','xxxxxxxxxxxxx@gmail.com','(55) 55555-5555','(55) 55555-5555'),(23,'8888888888','88.888.888/8888-88','88888888888','888888888888','88888888','88888-888','SP','88888888888@88888888.com','(88) 88888-8888',''),(24,'julia','11.111.111/1111-11','Rua Maria Cândida Corrêa, 100','vila popular','olinda','53230-230','AL','marcosbarrosobia@gmail.com','(81) 99320-8077','(88) 88888-8888');
/*!40000 ALTER TABLE `instituicao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `id_inventario` int NOT NULL AUTO_INCREMENT,
  `fk_idsondagem` int DEFAULT NULL,
  `fk_idhabilidade` int DEFAULT NULL,
  PRIMARY KEY (`id_inventario`),
  KEY `fk_sondagem_inventario` (`fk_idsondagem`),
  KEY `fk_habilidade_inventario` (`fk_idhabilidade`),
  CONSTRAINT `fk_habilidade_inventario` FOREIGN KEY (`fk_idhabilidade`) REFERENCES `habilidade` (`id_habilidade`),
  CONSTRAINT `fk_sondagem_inventario` FOREIGN KEY (`fk_idsondagem`) REFERENCES `sondagem` (`id_sondagem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matricula`
--

DROP TABLE IF EXISTS `matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matricula` (
  `id_matricula` int NOT NULL AUTO_INCREMENT,
  `numero_matricula` varchar(20) NOT NULL,
  `fk_cod_valor_turma` varchar(20) NOT NULL,
  `ano_matricula` int DEFAULT NULL,
  `fk_id_aluno` int DEFAULT NULL,
  `fk_cod_mod` int DEFAULT NULL,
  PRIMARY KEY (`id_matricula`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matricula`
--

LOCK TABLES `matricula` WRITE;
/*!40000 ALTER TABLE `matricula` DISABLE KEYS */;
INSERT INTO `matricula` VALUES (18,'108-2025','1-26190915',2025,108,1),(19,'110-2025','1-26190915',2025,110,1),(20,'102-2025','1-26190915',2025,102,1),(21,'107-2025','1-26190915',2025,107,1),(22,'105-2025','1-26190915',2025,105,1),(23,'112-2025','1-26190915',2025,112,1);
/*!40000 ALTER TABLE `matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2019_08_19_000000_create_failed_jobs_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modalidade`
--

DROP TABLE IF EXISTS `modalidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modalidade` (
  `id_modalidade` int NOT NULL AUTO_INCREMENT,
  `desc_modalidade` varchar(100) NOT NULL,
  `desc_serie_modalidade` varchar(80) NOT NULL,
  PRIMARY KEY (`id_modalidade`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modalidade`
--

LOCK TABLES `modalidade` WRITE;
/*!40000 ALTER TABLE `modalidade` DISABLE KEYS */;
INSERT INTO `modalidade` VALUES (1,'ensino Infantil','Infantil'),(2,'Anos Iniciais','1º Ano'),(3,'Anos Iniciais','2º Ano'),(4,'Anos Iniciais','3º Ano'),(5,'Anos Iniciais','4º Ano'),(6,'Anos Iniciais','5º Ano'),(7,'Anos Finais','6º Ano'),(8,'Anos Finais','7º Ano'),(9,'Anos Finais','8º Ano'),(10,'Anos Finais','9º Ano'),(11,'Educação Jovens e Adultos','Eja');
/*!40000 ALTER TABLE `modalidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orgao`
--

DROP TABLE IF EXISTS `orgao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orgao` (
  `org_id` int NOT NULL AUTO_INCREMENT,
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
  `fk_org_inst_id` int DEFAULT NULL,
  PRIMARY KEY (`org_id`),
  KEY `fk_org_inst_id` (`fk_org_inst_id`),
  CONSTRAINT `orgao_ibfk_1` FOREIGN KEY (`fk_org_inst_id`) REFERENCES `instituicao` (`inst_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orgao`
--

LOCK TABLES `orgao` WRITE;
/*!40000 ALTER TABLE `orgao` DISABLE KEYS */;
INSERT INTO `orgao` VALUES (4,'22222222222222','22.222.222/2222-22','222222222222222222222222222','222222222222222222222','222222222222222222','22222-222','PE','222222222222@gmail.com','(22) 22222-2222','(22) 22222-2222',7),(5,'marcos orgao','11.111.111/1111-11','aaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaa','56445-645','SE','marcosorgao@gmail.com','(99) 99999-9999','(99) 99999-9999',9),(6,'marcos orgao','11.111.111/1111-11','aaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaa','56445-645','PB','marcosorgao@gmail.com','(22) 22222-2222','(99) 99999-9999',7),(7,'marcos orgao','11.111.111/1111-11','aaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaaa','eeeeeeeeeeeee','56445-645','PB','marcosorgao@gmail.com','(99) 99999-9999','(99) 99999-9999',7),(8,'222222222222222222222222','55.555.555/5555-55','Rua Maria Cândida Corrêa, 97','xxxxxxxxxxxxxxxxxx','olinda','53230-230','PE','marcosbarrosobia@gmail.com','(81) 99320-8088','(11) 11111-1111',8),(9,'AAAAAAAAAAAAAAA','11.111.111/1111-11','AAAAAAAAAAAAAAAA','AAAAAAAAAAAAAAAAA','AAAAAAAAAAAAAAAAAAA','11111-111','PE','AAAAAAAAAAAAA@GMAIL.COM','(11) 11111-1111',NULL,12),(10,'rafael barroso moraes','55.555.555/5555-55','Rua Maria Cândida Corrêa, 100','VILA POPULAR','olinda','53230-230','RJ','asdsad@asdsad.com','(81) 98575-0207','(22) 22222-2222',8),(11,'dasdsadasda','123123123213','sadasdsads','123123sadasd','asdasdasdsad','34123-123','PE','qweqwe@asdas.com','(55) 65151-5151',NULL,NULL),(12,'dasdsadasda','123123123213','sadasdsads','123123sadasd','asdasdasdsad','34123-123','PE','qweqwe@asdas.com','(55) 65151-5151',NULL,NULL);
/*!40000 ALTER TABLE `orgao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil_estudante`
--

DROP TABLE IF EXISTS `perfil_estudante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfil_estudante` (
  `id_perfil` int NOT NULL AUTO_INCREMENT,
  `diag_laudo` tinyint(1) NOT NULL,
  `cid` varchar(100) DEFAULT NULL,
  `nome_medico` varchar(250) DEFAULT NULL,
  `data_laudo` date DEFAULT NULL,
  `nivel_suporte` varchar(100) DEFAULT NULL,
  `uso_medicamento` tinyint(1) DEFAULT NULL,
  `quais_medicamento` varchar(250) DEFAULT NULL,
  `nec_pro_apoio` int DEFAULT NULL,
  `loc_01` tinyint(1) DEFAULT NULL,
  `hig_02` tinyint(1) DEFAULT NULL,
  `ali_03` tinyint(1) DEFAULT NULL,
  `com_04` tinyint(1) DEFAULT NULL,
  `out_05` tinyint(1) DEFAULT NULL,
  `out_momentos` varchar(250) DEFAULT NULL,
  `at_especializado` int DEFAULT NULL,
  `nome_prof_AEE` varchar(250) DEFAULT NULL,
  `fk_alu_id` int DEFAULT NULL,
  PRIMARY KEY (`id_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil_estudante`
--

LOCK TABLES `perfil_estudante` WRITE;
/*!40000 ALTER TABLE `perfil_estudante` DISABLE KEYS */;
INSERT INTO `perfil_estudante` VALUES (1,1,'22222222222','marcos barroso','2025-03-22','1',1,'aaaaaaaaaaaaaaaaaaaa',1,1,1,1,1,0,NULL,1,NULL,57);
/*!40000 ALTER TABLE `perfil_estudante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil_familia`
--

DROP TABLE IF EXISTS `perfil_familia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfil_familia` (
  `id_perfil_familia` int NOT NULL AUTO_INCREMENT,
  `expectativa_05` text,
  `estrategia_05` text,
  `crise_esta_05` text,
  `fk_id_aluno` int DEFAULT NULL,
  PRIMARY KEY (`id_perfil_familia`),
  KEY `fk_id_aluno` (`fk_id_aluno`),
  CONSTRAINT `perfil_familia_ibfk_1` FOREIGN KEY (`fk_id_aluno`) REFERENCES `aluno` (`alu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil_familia`
--

LOCK TABLES `perfil_familia` WRITE;
/*!40000 ALTER TABLE `perfil_familia` DISABLE KEYS */;
INSERT INTO `perfil_familia` VALUES (1,'familia','familia',NULL,57);
/*!40000 ALTER TABLE `perfil_familia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personalidade`
--

DROP TABLE IF EXISTS `personalidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personalidade` (
  `id_personalidade` int NOT NULL AUTO_INCREMENT,
  `carac_principal` text,
  `inter_princ_carac` text,
  `livre_gosta_fazer` text,
  `feliz_est` text,
  `trist_est` text,
  `obj_apego` text,
  `fk_alu_id` int DEFAULT NULL,
  PRIMARY KEY (`id_personalidade`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personalidade`
--

LOCK TABLES `personalidade` WRITE;
/*!40000 ALTER TABLE `personalidade` DISABLE KEYS */;
INSERT INTO `personalidade` VALUES (1,'pppppppp','pppppppp','pppppppppppp','pppppppppp','ppppppppppp','pppppppppppp',57);
/*!40000 ALTER TABLE `personalidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferencia`
--

DROP TABLE IF EXISTS `preferencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preferencia` (
  `id_preferencia` int NOT NULL AUTO_INCREMENT,
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
  `prefere_ts_04` text,
  `mostram_eficazes_04` text,
  `realiza_tarefa_04` text,
  `fk_id_aluno` int DEFAULT NULL,
  PRIMARY KEY (`id_preferencia`),
  KEY `fk_id_aluno` (`fk_id_aluno`),
  CONSTRAINT `preferencia_ibfk_1` FOREIGN KEY (`fk_id_aluno`) REFERENCES `aluno` (`alu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferencia`
--

LOCK TABLES `preferencia` WRITE;
/*!40000 ALTER TABLE `preferencia` DISABLE KEYS */;
INSERT INTO `preferencia` VALUES (1,1,1,1,1,'preferencia',1,'preferencia','preferencia','preferencia','preferencia','preferencia','preferencia',1,1,1,1,'preferencia','preferencia','preferencia','preferencia',57);
/*!40000 ALTER TABLE `preferencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serie`
--

DROP TABLE IF EXISTS `serie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serie` (
  `serie_id` int NOT NULL AUTO_INCREMENT,
  `serie_desc` varchar(50) NOT NULL,
  `fk_mod_id` int DEFAULT NULL,
  PRIMARY KEY (`serie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serie`
--

LOCK TABLES `serie` WRITE;
/*!40000 ALTER TABLE `serie` DISABLE KEYS */;
INSERT INTO `serie` VALUES (1,'1º ANO',2),(2,'2º ANO',2),(3,'3º ANO',2),(4,'4º ANO',2),(5,'5º ANO',2),(6,'6º ANO',3),(7,'7º ANO',3),(8,'8º ANO',3),(9,'9º ANO',3);
/*!40000 ALTER TABLE `serie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sondagem`
--

DROP TABLE IF EXISTS `sondagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sondagem` (
  `id_sondagem` int NOT NULL AUTO_INCREMENT,
  `n_sup01` char(1) DEFAULT NULL,
  `n_sup02` char(1) DEFAULT NULL,
  `n_sup03` char(1) DEFAULT NULL,
  `v_comunicacao` int DEFAULT NULL,
  `fk_id_matricula` int DEFAULT NULL,
  PRIMARY KEY (`id_sondagem`),
  KEY `fk_matricula_sondagem` (`fk_id_matricula`),
  CONSTRAINT `fk_matricula_sondagem` FOREIGN KEY (`fk_id_matricula`) REFERENCES `matricula` (`id_matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sondagem`
--

LOCK TABLES `sondagem` WRITE;
/*!40000 ALTER TABLE `sondagem` DISABLE KEYS */;
/*!40000 ALTER TABLE `sondagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teste`
--

DROP TABLE IF EXISTS `teste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teste` (
  `id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teste`
--

LOCK TABLES `teste` WRITE;
/*!40000 ALTER TABLE `teste` DISABLE KEYS */;
/*!40000 ALTER TABLE `teste` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_funcao`
--

DROP TABLE IF EXISTS `tipo_funcao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_funcao` (
  `tipo_funcao_id` int NOT NULL AUTO_INCREMENT,
  `desc_tipo_funcao` varchar(200) NOT NULL,
  PRIMARY KEY (`tipo_funcao_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_funcao`
--

LOCK TABLES `tipo_funcao` WRITE;
/*!40000 ALTER TABLE `tipo_funcao` DISABLE KEYS */;
INSERT INTO `tipo_funcao` VALUES (1,'Diretor da escola'),(2,'Vice diretor da escola'),(3,'Coordenador'),(4,'Supervisor da escola'),(5,'Professor'),(6,'Professor AEE'),(7,'Psicopedagogo'),(8,'Terapeuta Ocupacional'),(9,'Psicologo'),(10,'Fonodiologo'),(11,'Coordenado AEE');
/*!40000 ALTER TABLE `tipo_funcao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_eixo`
--

DROP TABLE IF EXISTS `tp_eixo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_eixo` (
  `id_tpeixo` int NOT NULL AUTO_INCREMENT,
  `desc_tpeixo` varchar(200) NOT NULL,
  PRIMARY KEY (`id_tpeixo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_eixo`
--

LOCK TABLES `tp_eixo` WRITE;
/*!40000 ALTER TABLE `tp_eixo` DISABLE KEYS */;
INSERT INTO `tp_eixo` VALUES (1,'eixo comunicacão linguagem'),(2,'eixo comportamento'),(3,'eixo interação socioemocional');
/*!40000 ALTER TABLE `tp_eixo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turma`
--

DROP TABLE IF EXISTS `turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turma` (
  `id_turma` int NOT NULL AUTO_INCREMENT,
  `fk_cod_enturmacao` int DEFAULT NULL,
  `fk_cod_func` int DEFAULT NULL,
  `fk_cod_mod` int DEFAULT NULL,
  `fk_inep` varchar(20) DEFAULT NULL,
  `cod_turma` int DEFAULT '0',
  `cod_valor` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_turma`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma`
--

LOCK TABLES `turma` WRITE;
/*!40000 ALTER TABLE `turma` DISABLE KEYS */;
INSERT INTO `turma` VALUES (17,2,80,1,'35060136',0,'1-35060136'),(18,3,80,2,'35060136',0,'2-35060136'),(19,19,20,1,'26190915',0,'1-26190915'),(20,19,20,1,'26190915',0,'1-26190915'),(21,25,37,1,'26190915',0,'1-26190915'),(22,25,37,1,'26190915',0,'1-26190915'),(23,26,37,2,'26190915',0,'2-26190915'),(24,30,41,6,'26190915',0,'6-26190915'),(25,25,44,1,'26190915',0,'1-26190915'),(26,26,44,2,'26190915',0,'2-26190915'),(27,27,44,3,'26190915',0,'3-26190915'),(28,28,44,4,'26190915',0,'4-26190915'),(29,29,44,5,'26190915',0,'5-26190915'),(30,30,44,6,'26190915',0,'6-26190915'),(31,30,41,6,'26190915',0,'6-26190915'),(32,33,41,7,'26190915',0,'7-26190915');
/*!40000 ALTER TABLE `turma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'foccus'
--

--
-- Dumping routines for database 'foccus'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-25 16:28:23
