

=========script do banco 
USE sap_tea



SHOW CREATE TABLE hab_pro_com_lin

CREATE TABLE `hab_pro_com_lin` (
  `id_hab_pro_com_lin` int(11) NOT NULL AUTO_INCREMENT,
  `fk_id_hab_com_lin` int(11) DEFAULT NULL,
  `fk_id_pro_com_lin` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_hab_pro_com_lin`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci






SELECT *FROM instituicao

SELECT *FROM teste
DROP TABLE teste

CREATE TABLE habilidade_com_lin(
	id_hab_com_lin INT PRIMARY KEY AUTO_INCREMENT,
	cod_hab_com_lin CHAR(05) NOT NULL,
	desc_hab_com_lin VARCHAR(250) NOT NULL

)


DROP TABLE tb_eixo_com_lin
ALTER TABLE habilidade_com_lin AUTO_INCREMENT = 1
DESC eixo_com_lin
DESC habilidade_com_lin

INSERT INTO tb_eixo_com_lin (cod_eixo_com_lin,desc_eixo_com_lin) VALUES ('ecm01','Amplia gradativamente seu vocabulário?')
SELECT *FROM tb_eixo_com_lin


INSERT INTO habilidade_com_lin (cod_hab_com_lin, desc_hab_com_lin) VALUES
('ecm01', 'Amplia gradativamente seu vocabulário?'),
('ecm02', 'Amplia gradativamente sua comunicação social?'),
('ecm03', 'Apresenta entonação vocal, com boa articulação e ritmo adequado?'),
('ecm04', 'Ativa conhecimentos prévios em situações de novas aprendizagens?'),
('ecm05', 'Categoriza diferentes elementos de acordo com critérios preestabelecidos?'),
('ecm06', 'Compreende e utiliza comunicação alternativa para se comunicar?'),
('ecm07', 'Compreende que pode receber ajuda de pessoas conhecidas que estão ao seu redor?'),
('ecm08', 'Comunica fatos, acontecimentos e ações de seu cotidiano de modo compreensível, ainda que não seja por meio da linguagem verbal?'),
('ecm09', 'Comunica suas necessidades básicas (banheiro, água, comida, entre outros)?'),
('ecm10', 'Entende expressões faciais em uma conversa?'),
('ecm11', 'Executa mais de um comando sequencialmente?'),
('ecm12', 'Expressa-se com clareza e objetividade?'),
('ecm13', 'Faz uso de expressões faciais para se comunicar?'),
('ecm14', 'Faz uso de gestos para se comunicar?'),
('ecm15', 'Identifica diferentes elementos, ampliando seu repertório?'),
('ecm16', 'Identifica semelhanças e diferenças entre elementos?'),
('ecm17', 'Inicia uma situação comunicativa?'),
('ecm18', 'Mantem uma situação comunicativa?'),
('ecm19', 'Nomeia as pessoas que fazem parte de sua rede de apoio?'),
('ecm20', 'Nomeia diferentes elementos, ampliando seu vocabulário?'),
('ecm21', 'Possui autonomia para se comunicar, mesmo em situações que geram conflito?'),
('ecm22', 'Realiza pareamento de elementos idênticos?'),
('ecm23', 'Reconhece e pareia elementos diferentes?'),
('ecm24', 'Reconhece visualmente estímulos apresentados?'),
('ecm25', 'Refere-se a si mesmo em primeira pessoa?'),
('ecm26', 'Respeita turnos de fala?'),
('ecm27', 'Responde ao ouvir seu nome?'),
('ecm28', 'Solicita ajuda de pessoas que estão ao seu redor, quando necessário?'),
('ecm29', 'Utiliza linguagem não verbal para se comunicar?'),
('ecm30', 'Utiliza linguagem verbal para se comunicar?'),
('ecm31', 'Utiliza respostas simples para se comunicar?'),
('ecm32', 'Utiliza vocabulário adequado, de acordo com seu nível de desenvolvimento?');


SELECT *FROM habilidade_com_lin

DESC eixo_comportamento





DROP TABLE tb_eixo_comportamento

CREATE TABLE habilidade_comportamento(
	id_hab_comportamento INT PRIMARY KEY AUTO_INCREMENT,
	cod_hab_comportamento CHAR(05) NOT null,
	desc_hab_comportamento VARCHAR(250) NOT null

)


INSERT INTO habilidade_comportamento (cod_hab_comportamento, desc_hab_comportamento) VALUES
('ecp01', 'Adapta-se com flexibilidade a mudanças, em sua rotina (familiar, escolar e social)?'),
('ecp02', 'Apresenta autonomia na realização das atividades propostas?'),
('ecp03', 'Autorregula-se evitando comportamentos disruptivos em situações de desconforto?'),
('ecp04', 'Compreende acontecimentos de sua rotina por meio de ilustrações?'),
('ecp05', 'Compreende regras de convivência?'),
('ecp06', 'Entende ações de autocuidado?'),
('ecp07', 'Faz uso de movimentos corporais, como: apontar, movimentar a cabeça em sinal afirmativo/negativo, entre outros?'),
('ecp08', 'Imita gestos, movimentos e segue comandos?'),
('ecp09', 'Inicia e finaliza as atividades propostas diariamente?'),
('ecp10', 'Interage nos momentos de jogos, lazer e demais atividades, respeitando as regras de convivência?'),
('ecp11', 'Mantem a organização em sua rotina escolar?'),
('ecp12', 'Permanece sentado por mais de dez minutos para a realização das atividades?'),
('ecp13', 'Realiza ações motoras que envolvam movimento e equilíbrio?'),
('ecp14', 'Realiza atividades com atenção e tolerância?'),
('ecp15', 'Realiza, em sua rotina, ações de autocuidado com autonomia?'),
('ecp16', 'Reconhece e identifica alimentos que lhe são oferecidos?'),
('ecp17', 'Responde a comandos de ordem direta?')

SELECT *FROM habilidade_comportamento

 DESC eixo_int_socio

CREATE TABLE habilidade_int_soc(
	id_hab_int_soc INT PRIMARY KEY AUTO_INCREMENT,
	cod_hab_int_soc CHAR(05) NOT null,
	desc_hab_int_soc VARCHAR(250) NOT null

)
SELECT *FROM habilidade_int_soc
INSERT INTO habilidade_int_soc (cod_hab_int_soc, desc_hab_int_soc) VALUES
('eis01', 'Compartilha brinquedos e brincadeiras?'),
('eis02', 'Compartilha interesses?'),
('eis03', 'Controla suas emoções? (Autorregula-se)'),
('eis04', 'Coopera em situações que envolvem interação?'),
('eis05', 'Demonstra e compartilha afeto?'),
('eis06', 'Demonstra interesse nas atividades propostas?'),
('eis07', 'Expressa suas emoções? '),
('eis08', 'Identifica/reconhece a emoção do outro?'),
('eis09', 'Identifica/reconhece suas emoções?'),
('eis10', 'Inicia e mantém interação em situações sociais?'),
('eis11', 'Interage com o(a) professor(a), seus colegas e outras pessoas de seu convívio escolar?'),
('eis12', 'Interage, fazendo contato visual?'),
('eis13', 'Reconhece e entende seus sentimentos, pensamentos e comportamentos? '),
('eis14', 'Relaciona-se, estabelecendo vínculos? '),
('eis15', 'Respeita regras em jogos e brincadeiras?'),
('eis16', 'Respeita regras sociais?'),
('eis17', 'Responde a interações? '),
('eis18', 'Solicita ajuda, quando necessário?')

-- criando as tabelas de propostas
SELECT *FROM habilidade_int_soc



CREATE TABLE proposta_com_lin(
	id_ati_com_lin INT PRIMARY KEY AUTO_INCREMENT,
	cod_ati_com_lin VARCHAR(05) NOT NULL,
	desc_ati_com_lin VARCHAR(250) NOT null

)

INSERT INTO atividade_com_lin(cod_ati_com_lin,desc_ati_com_lin) VALUES 

		('ECM01','1, 2, 3... acerte uma vez'),
		('ECM02','A mágica da gentileza'),
		('ECM03','Ache e junte'),
		('ECM04',' Expressão ilustrada'),
		('ECM05','Minha rede de ajuda'),
		('ECM06','Onde encaixa?'),
		('ECM07','Que animal é esse?'),
		('ECM08','ECM08 - Vivências do cotidiano')
		
		
SELECT *FROM atividade_com_lin	


CREATE TABLE atividade_comportamento(
	id_ati_comportamento INT PRIMARY KEY AUTO_INCREMENT,
	cod_ati_comportamento CHAR(05) NOT NULL,
	desc_ati_comportamento VARCHAR(250) NOT null
)


insert INTO atividade_comportamento (cod_ati_comportamento,desc_ati_comportamento) VALUES 

		('ECP01','A ordem é...'),
		('ECP02','Mexe e remexe'),
		('ECP03','Minha rotina'),
		('ECP04','PIQUENIQUE'),
		('ECP05','Positivo e negativo'),
		('ECP06','Rotina de autocuidado'),
		('NECP1','Cortando o Cabelo')
		
		
	SELECT *FROM  atividade_comportamento	
		
		

CREATE TABLE atividade_int_soc(
	id_ati_int_soc INT PRIMARY KEY AUTO_INCREMENT,
	cod_ati_int_soc CHAR(05) NOT NULL,
	desc_ati_int_soc VARCHAR(250) NOT null
)

INSERT INTO atividade_int_soc(cod_ati_int_soc,desc_ati_int_soc) VALUES 
	('EIS01','Emocionômetro'),
	('EIS02','Eu como sou!'),
	('EIS03','Nomeando as emoções'),
	('EIS04',' A professora faltou'),
('NEIS2','Ano Novo, turma nova'),
('NEIS3','Hora do intervalo')

SELECT *FROM atividade_int_soc




SELECT *FROM instituicao
SELECT *FROM orgao
SELECT *FROM escola
ALTER TABLE escola AUTO_INCREMENT = 1


SELECT *FROM aluno
DELETE FROM aluno
ALTER TABLE aluno AUTO_INCREMENT = 1




SELECT *FROM funcionario
DELETE FROM funcionario
ALTER TABLE funcionario AUTO_INCREMENT = 1




SHOW TABLES


-- consultas de sondagem 

DESC proposta_comportamento

ALTER TABLE proposta_comportamento CHANGE COLUMN id_ati_comportamento  id_pro_comportamento int
ALTER TABLE proposta_comportamento CHANGE COLUMN cod_ati_comportamento  cod_pro_comportamento int
ALTER TABLE proposta_comportamento CHANGE COLUMN desc_ati_comportamento  desc_pro_comportamento VARCHAR(250)


DESC proposta_com_lin
ALTER TABLE proposta_int_soc CHANGE COLUMN id_ati_int_soc  id_pro_int_sco int
ALTER TABLE proposta_int_soc CHANGE COLUMN cod_ati_int_soc  cod_pro_int_soc int
ALTER TABLE proposta_int_soc CHANGE COLUMN desc_ati_int_soc  desc_pro_int_soc VARCHAR(250)


DESC proposta_int_soc

SELECT *FROM atividade

-- nessas tabelas vou buscar as descricoes das atividades
SELECT *FROM proposta_comportamento
SELECT *FROM proposta_com_lin
SELECT *FROM proposta_int_soc

USE sap_tea
rename table atividade_int_soc  TO proposta_int_soc

SELECT *FROM eixo_com_lin
SELECT *FROM atividade_com_lin
SELECT *FROM habilidade_com_lin

SHOW tables
DESC eixo_com_lin
DESC habilidade_com_lin
USE sap_tea
DROP TABLE hab_pro_com_lin

CREATE TABLE hab_pro_com_lin (
	id_hab_pro_com_lin INT PRIMARY KEY AUTO_INCREMENT,
	fk_id_hab_com_lin INT,
	fk_id_pro_com_lin int

)

RENAME TABLE hab_ati_com_lin TO hab_pro_com_lin;
SELECT *FROM hab_pro_com_lin
SELECT *FROM eixo_comportamento
SELECT *FROM eixo_int_socio
DESC eixo_comportamento
DESC eixo_com_lin
DESC eixo_int_socio





*/
USE sap_tea
DESC funcionario
DESC tipo_funcao
DESC escola
sap_tea
SHOW tables






USE sap_tea
SHOW tables

DESC atividade_comportamento
SELECT *FROM atividade_comportamento

DESC hab_pro_com_lin
DROP TABLE hab_ati_com_lin
SHOW TABLES 


SELECT *FROM hab_pro_com_lin
ALTER TABLE hab_ati_com_lin AUTO_INCREMENT = 1
-- inserindo dados habilidade_atividade _ eixo com lin

USE sap_tea
SELECT *FROM eixo_com_lin WHERE id_eixo_com_lin = 2

DESC hab_pro_com_lin
SELECT *FROM hab_pro_com_lin

CREATE TABLE hab_pro_comportamento (
	id_hab_pro_comportamento INT PRIMARY KEY AUTO_INCREMENT,
	fk_id_hab_comportamento INT,
	fk_id_pro_comportamento int

)
DESC hab_pro_comportamento

INSERT INTO hab_pro_comportamento (fk_id_hab_comportamento,fk_id_pro_comportamento) 
VALUES
	(1,3),(1,5),(1,6),(1,7),
	(2,1),(2,3),(2,4),(2,5),(2,6),
	(3,1),(3,2),(3,3),(3,4),(3,5),(3,7),
	
	(4,3),(4,4),(4,6),(4,7),
	(5,1),(5,5),(5,7),
	(6,6),(6,7),
	(7,2),(7,4),(7,5),(7,7),
	
	(8,1),(8,2),(8,6),
	(9,2),(9,3),(9,6),
	
	(10,1),(10,2),(10,4),
	(11,3),(11,5),
	
	(12,3),(12,4),(12,5),(12,7),
	(13,1),(13,2),
	
	(14,1),(14,2),(14,3),(14,5),(14,6),
	(15,3),(15,6),(15,7),
   (16,3),(16,4),
   (17,1),(17,2),(17,3),(17,4),(17,7)

SELECT *FROM atividade_int_soc
SELECT *from hab_pro_com_lin
DESC hab_pro_int_soc

INSERT INTO hab_pro_com_lin(fk_id_hab_com_lin,fk_id_pro_com_lin) VALUES (4,4) AFTER id_hab_pro_com_lin = 17 

	(1,5),(1,6),
	(2,5),(2,6),
	(3,1),(3,3),(3,4),(3,5),(3,6),
	
	(4,4),(4,5),(4,6),
	(5,1),(5,3),(5,4),(5,6),
	(6,2),(6,4),(6,5),
	
	(7,1),(7,2),(7,3),(7,4),(7,5),(7,6),
	(8,1),(8,3),
	(9,1),(9,3),(9,4),(9,5),
	(10,2),(10,3),(10,4),(10,5),(10,6),
	(11,1),(11,2),(11,3),(11,4),(11,5),(11,6),
	(12,1),(12,2),(12,3),(12,4),
	(13,1),(13,2),(13,3),
	(14,1),(14,2),(14,4),(14,5),(14,6),
	(15,3),(15,6),
	(16,5),(16,6),
	(17,1),(17,2),(17,4),(17,5),(17,6),
	(18,1),(18,2),(18,4)
	
	
	
	SELECT *FROM funcionario
	DELETE FROM funcionario
	ALTER TABLE funcionario AUTO_INCREMENT = 1
	
	SHOW CREATE TABLE escola
	SHOW CREATE TABLE modalidade	
	SHOW CREATE TABLE tipo_modalidade
	
	SELECT * from turma
	
	SELECT *FROM enturmacao
	SELECT *FROM modalidade	
	SELECT *FROM turma
	
	
	-- trabalhando com matricula
	SHOW CREATE TABLE funcionario
	SHOW CREATE TABLE tipo_funcao
	SHOW CREATE TABLE enturmacao
		SHOW CREATE TABLE aluno
		SHOW CREATE TABLE escola
		SHOW CREATE TABLE modalidade		
		SHOW CREATE TABLE tipo_modalidade
			SHOW CREATE TABLE turma
			SHOW CREATE TABLE matricula
			
			DELETE from
			SELECT *FROM enturmacao
			SELECT *FROM turma WHERE fk_inep = "45678901" 
			id_turma
			fk_cod_enturmacao
			fk_cod_func
			fk_cod_mod
			fk_inep
			cod_turma
			cod_valor
	SELECT *FROM escola WHERE esc_inep = "78901234"
	
	
	SELECT * FROM aluno WHERE alu_inep =  '78901234'
	
SELECT * FROM aluno WHERE alu_inep = '78901234';
	DELETE from enturmacao
	SELECT *FROM enturmacao
	aLTER TABLE enturmacao AUTO_INCREMENT = 1
	
	DELETE FROM turma
	ALTER TABLE turma AUTO_INCREMENT = 1
	SELECT *FROM turma
	
	
	SELECT *FROM eixo_comportamento
	SELECT *FROM eixo_com_lin
	SELECT *FROM eixo_int_socio
	SELECT *FROM preenchimento_inventario
	
	SELECT *FROM habilidade_com_lin
		SELECT *FROM habilidade_comportamento
			SELECT *FROM habilidade_int_soc
	
	
	SELECT *FROM habilidade_com_lin
	
	SHOW CREATE TABLE eixo_com_lin
	SHOW CREATE TABLE eixo_comportamento
   SHOW CREATE TABLE eixo_int_socio
	
	SHOW CREATE TABLE habilidade_com_lin
	SHOW CREATE TABLE habilidade_comportamento
	SHOW CREATE TABLE eixo_int_socio
	
	
	SELECT *FROM proposta_com_lin
	
	
	
	
	SHOW CREATE TABLE proposta_com_lin
	SHOW CREATE TABLE proposta_comportamento
	SHOW CREATE TABLE proposta_int_soc
	
SELECT *FROM hab_pro_com_lin

	DESC eixo_com_lin
	DESC hab_pro_com_lin
	
SELECT *FROM hab_pro_com_lin

SHOW CREATE TABLE hab_pro_com_lin
SHOW CREATE TABLE hab_pro_comportamento
SHOW CREATE TABLE hab_pro_int_soc

SELECT *FROM hab_pro_com_lin


SELECT *
FROM eixo_com_lin AS ecl
INNER JOIN hab_pro_com_lin AS pcl
    ON ecl.id_eixo_com_lin = pcl.id_hab_pro_com_lin;
DESC 

SELECT *FROM eixo_com_lin
SELECT *FROM hab_pro_com_lin 
SELECT fk_id_pro_com_lin FROM proposta_com_lin GROUP BY (FK_ID_pro_COM_LIN)

SELECT fk_id_pro_com_lin 
FROM hab_pro_com_lin 
GROUP BY fk_id_pro_com_lin;

SELECT fk_id_pro_com_lin, COUNT(*) AS quantidade
FROM hab_pro_com_lin
GROUP BY fk_id_pro_com_lin
ORDER BY quantidade DESC;

SELECT *FROM hab_pro_co
SELECT *FROM atividade_com_lin
SHOW create TABLE atividade_com_lin

SELECT *FROM eixo_comportamento
SHOW CREATE TABLE hab_pro_comportamento 
SHOW CREATE TABLE hab_pro_comportamento




--gerando a tabela para guardar qtd de propostas geradas 

CREATE TABLE result_proposta_com_lin (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,             -- ID único do aluno
    fk_id_pro_com_lin INT NOT NULL,    -- Código da proposta/atividade
    fk_id_hab_com_lin INT NOT NULL,    -- Código da habilidade (para buscar a descrição)
    total_marcacoes INT NOT NULL,      -- Quantidade de marcações (sim)
    total_zeros INT NOT NULL,          -- Quantidade de respostas 0
    lista_zeros TEXT,                  -- Lista dos campos zerados (ex: JSON ou separado por vírgula)
    tipo_eixo VARCHAR(50) NOT NULL,    -- Tipo de eixo (ex: 'comunicacao', 'socioemocional', etc)
    data_criacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    INDEX (id_aluno),
    INDEX (fk_id_pro_com_lin),
    INDEX (fk_id_hab_com_lin),
    INDEX (tipo_eixo)
);

DROP table result_proposta_com_lin



-- vamos comecar a sondagem 
SELECT *FROM aluno
UPDATE aluno SET flag_inventario = " "

DESC eixo_com_lin
DESC eixo_comportamento
DESC eixo_int_socio

SHOW CREATE table eixo_com_lin
SHOW CREATE table eixo_comportamento
SHOW CREATE table eixo_int_socio


SHOW CREATE table hab_pro_com_lin
SHOW CREATE TABLE hab_pro_comportamento
SHOW CREATE TABLE hab_pro_int_soc


SELECT *FROM hab_pro_com_lin


DROP TABLE  result_eixo_com_lin
CREATE TABLE result_eixo_com_lin(
	id_result_eixo_com_lin INT PRIMARY KEY AUTO_INCREMENT,
	fk_hab_pro_com_lin INT,
	fk_id_pro_com_lin INT,
	fk_result_alu_id_ecomling int,
	date_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
		tipo_fase_com_lin CHAR(02)
	
)
SHOW CREATE TABLE result_eixo_com_lin
DROP TABLE  result_eixo_comportamento
CREATE TABLE result_eixo_comportamento(
	id_result_eixo_comportamento INT PRIMARY KEY AUTO_INCREMENT,
	fk_hab_pro_comportamento INT,
	fk_id_pro_comportamento INT,
	fk_result_alu_id_comportamento int,
	date_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
	tipo_fase_comportamento CHAR(02)
	
)

SHOW CREATE TABLE result_eixo_comportamento

CREATE TABLE result_eixo_int_socio(
	id_result_eixo_int_socio INT PRIMARY KEY AUTO_INCREMENT,
	fk_hab_pro_int_socio INT,
	fk_id_pro_int_socio INT,
	fk_result_alu_id_int_socio int,
	date_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
	tipo_fase_int_socio CHAR(02)
	
)
SELECT *FROM result_eixo_int_socio
SHOW CREATE TABLE result_eixo_int_socio



DELETE FROM eixo_com_lin
DELETE FROM eixo_comportamento
DELETE FROM eixo_int_socio


SELECT *FROM eixo_com_lin
DELETE FROM result_eixo_com_lin
DELETE FROM result_eixo_comportamento

ALTER TABLE eixo_com_lin AUTO_INCREMENT = 1
ALTER TABLE eixo_com_lin AUTO_INCREMENT = 1
ALTER TABLE eixo_comportamento AUTO_INCREMENT = 1



DELETE  FROM  result_eixo_com_lin
DELETE FROM result_eixo_com_lin
DELETE FROM result_eixo_int_socio


ALTER TABLE result_eixo_com_lin AUTO_INCREMENT = 1
ALTER TABLE result_eixo_comportamento AUTO_INCREMENT = 1
ALTER TABLE result_eixo_com_lin AUTO_INCREMENT = 


SELECT *FROM result_eixo_com_lin




SELECT *FROM result_eixo_comportamento
SELECT *FROM result_eixo_com_lin
SELECT *FROM result_eixo_int_socio
















CREATE TABLE hab_pro_int_soc (
	id_hab_pro_int_soc INT PRIMARY KEY AUTO_INCREMENT,
	fk_id_hab_int_soc INT,
	fk_id_pro_int_soc int
)

SELECT *FROM hab_pro_com_lin




SELECT *FROM habilidade_com_lin AS hcl INNER JOIN  hab_pro_com_lin AS hpcl on
hcl.id_hab_com_lin = hpcl.id_hab_pro_com_lin   GROUP BY(fk_id_pro_com_lin)

SELECT *FROM eixo_com_lin







delet
DELETE FROM enturmacao
SELECT *FROM enturmacao
SELECT *FROM matricula

------
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

DROP TABLE hab_pro_com_lin


-- Copiando estrutura para tabela sap_tea.hab_pro_com_lin
CREATE TABLE `hab_pro_com_lin` (
  `id_hab_pro_com_lin` int(11) NOT NULL AUTO_INCREMENT,
  `fk_id_hab_com_lin` int(11) DEFAULT NULL,
  `fk_id_pro_com_lin` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_hab_pro_com_lin`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela sap_tea.hab_pro_com_lin: ~119 rows (aproximadamente)
INSERT INTO `hab_pro_com_lin` (`id_hab_pro_com_lin`, `fk_id_hab_com_lin`, `fk_id_pro_com_lin`) VALUES
  (
  `id_hab_pro_com_lin` int(11) NOT NULL AUTO_INCREMENT,
  `fk_id_hab_com_lin` int(11) DEFAULT NULL,
  `fk_id_pro_com_lin` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_hab_pro_com_lin`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(18, 4, 4),
(19, 4, 5),
(20, 4, 6),
(21, 4, 7),
(22, 4, 8),
(23, 5, 3),
(24, 5, 6),
(25, 6, 3),
(26, 6, 4),
(27, 6, 5),
(28, 6, 6),
(29, 6, 7),
(30, 7, 4),
(31, 7, 5),
(32, 8, 4),
(33, 8, 5),
(34, 8, 8),
(35, 9, 4),
(36, 9, 5),
(37, 10, 2),
(38, 10, 4),
(39, 10, 7),
(40, 11, 1),
(41, 11, 3),
(42, 11, 6),
(43, 11, 7),
(44, 12, 1),
(45, 12, 2),
(46, 12, 8),
(47, 13, 2),
(48, 13, 4),
(49, 13, 7),
(50, 14, 2),
(51, 14, 3),
(52, 14, 7),
(53, 15, 1),
(54, 15, 3),
(55, 15, 6),
(56, 16, 1),
(57, 16, 3),
(58, 16, 6),
(59, 16, 7),
(60, 17, 1),
(61, 17, 2),
(62, 17, 4),
(63, 17, 7),
(64, 18, 1),
(65, 18, 8),
(66, 19, 5),
(67, 19, 8),
(68, 20, 1),
(69, 20, 3),
(70, 20, 6),
(71, 20, 7),
(72, 20, 8),
(73, 21, 2),
(74, 21, 4),
(75, 21, 5),
(76, 21, 7),
(77, 22, 3),
(78, 22, 6),
(79, 23, 3),
(80, 23, 6),
(81, 24, 1),
(82, 24, 2),
(83, 24, 3),
(84, 24, 4),
(85, 24, 5),
(86, 25, 6),
(87, 25, 7),
(88, 25, 8),
(89, 25, 2),
(90, 25, 5),
(91, 25, 8),
(92, 26, 1),
(93, 26, 6),
(94, 26, 7),
(95, 26, 8),
(96, 27, 2),
(97, 27, 5),
(98, 28, 4),
(99, 28, 5),
(100, 29, 1),
(101, 29, 2),
(102, 29, 3),
(103, 29, 4),
(104, 29, 5),
(105, 29, 6),
(106, 29, 7),
(107, 29, 8),
(108, 30, 1),
(109, 30, 2),
(110, 30, 3),
(111, 30, 5),
(112, 30, 6),
(113, 30, 8),
(114, 31, 2),
(115, 31, 3),
(116, 31, 4),
(117, 31, 5),
(118, 31, 6),
(119, 32, 1),
(120, 32, 8);


SELECT *FROM hab_pro_com_lin


/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;





DROP TABLE hab_pro_com_lin






SELECT *FROM hab_pro_




<<<<<<< Updated upstream
=======
SELECT *FROM funcionario
>>>>>>> Stashed changes


SELECT *FROM hab_pro_com_lin
SELECT *FROM habilidade
SELECT *FROM proposta_com_lin
SELECT *FROM proposta_comportamento
SELECT *FROM habilidade_com_lin

SELECT *FROM habilidade_comportamento
SELECT *FROM hab_pro_comportamento
SELECT *FROM hab_proposta_comportamento
DESC hab_pro_comportamento


-- gera consulta por eixo e atividade - comunicacao linguagem
SELECT hab.id_hab_com_lin,hab.desc_hab_com_lin,
pcom.cod_pro_com_lin,pcom.desc_pro_com_lin  
FROM habilidade_com_lin AS hab INNER JOIN hab_pro_com_lin AS pro
ON hab.id_hab_com_lin = pro.fk_id_hab_com_lin
INNER JOIN proposta_com_lin AS pcom ON
pcom.id_pro_com_lin = pro.fk_id_pro_com_lin

-- gera consulta por eixo e atividade - comportameno
SELECT 
    hab.id_hab_comportamento,
    hab.desc_hab_comportamento,
    pcom.cod_pro_comportamento,
    pcom.desc_pro_comportamento  
FROM habilidade_comportamento AS hab
INNER JOIN hab_pro_comportamento AS pro
    ON hab.id_hab_comportamento = pro.fk_id_hab_comportamento
INNER JOIN proposta_comportamento AS pcom
    ON pcom.id_pro_comportamento = pro.fk_id_pro_comportamento;


DESC habilidade_int_soc
SHOW  CREATE table modalidade


SELECT 
    hab.id_hab_int_soc,
    hab.desc_hab_int_soc,
    pcom.cod_pro_int_soc,
    pcom.desc_pro_int_soc  
FROM habilidade_int_soc AS hab
INNER JOIN hab_pro_int_soc AS pro
    ON hab.id_hab_int_soc = pro.fk_id_hab_int_soc
INNER JOIN proposta_int_soc AS pcom
    ON pcom.id_pro_int_soc = pro.fk_id_pro_int_soc;
    
    
    
    SELECT *FROM habilidade_com_lin
    SELECT *FROM atividade_com_lin
    SELECT *FROM hab_pro_com_lin
    
    INSERT INTO hab_pro_com_lin (fk_

