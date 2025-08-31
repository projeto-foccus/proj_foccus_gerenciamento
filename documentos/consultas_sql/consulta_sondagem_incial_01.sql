

=========script do banco 
USE sap_tea

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

DROP TABLE hab_ati_com_lin

CREATE TABLE hab_pro_com_lin (
	id_hab_pro_com_lin INT PRIMARY KEY AUTO_INCREMENT,
	fk_id_hab_com_lin INT,
	fk_id_pro_com_lin int

)

RENAME TABLE hab_ati_com_lin TO hab_pro_com_lin;

SELECT *FROM eixo_comportamento
SELECT *FROM eixo_int_socio
DESC eixo_comportamento
DESC eixo_com_lin
DESC eixo_int_socio



/*
tenho 3 tabelas com nomes eixo_com_lin e os campos a ser verificado fk_alu_id_ecomling,data_insert_com_lin,fase_inv_com_lin
a outra tabela eixo_comportamento e os campos a ser verificado fk_alu_id_ecomp,data_insert_comportamento,fase_inv_comportamento e 
outra tabela eixo_int_socio e os campos fk_alu_id_eintsoc,data_insert_int_socio,fase_inv_int_socio, quero que mostre os alunos que existe nessas 3 tabelas
ou seja verifique pelo campo codigo do aluno em cada tabela citada acima pelo fk_alu_id_ecomling,fk_alu_id_ecomp,fk_alu_id_eintsoc se ele exite nas tres tabelas 
simultaneamente ou seja tem que esta nas 3.


tenho uma tabela funcionario com a seguinte estrutura campos func_id,fun_data_cad,inep,func_nome,func_cpf,email_func,,
func_cod_funcao e outra que diz o tipo de funcao que relaciona com a tabela funcionario com os campos :tipo_funcao_id,
desc_tipo_funcao , na tabela fucniocionario tenho  um campo inep que relaciona com a tabela escola pelo campo esc_inep 
e  o campo mail_func que é o email do fucnionario que vai virar usuario do siistema e pdde refifinir sua senha por esse campo. entendeu?


voce pode  criar uma senha 123 para usuario foccus pois pretendo definir os acessos para cadas tipo de usuario no decorrer  
do desenvolvimento . pois ainda nao tenho um plano apenas os 
tipos de usuario. vc acha melhor fazer esse sistema de login agora ou deixo pra depos . se fizer esse usuario ficaria legal

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

USE sap_tea
SELECT *FROM hab_pro_com_lin
DROP TABLE hab_pro_com_lin
ALTER TABLE hab_ati_com_lin AUTO_INCREMENT = 1

CREATE TABLE IF NOT EXISTS `hab_pro_com_lin` (
  `id_hab_pro_com_lin` int(11) NOT NULL AUTO_INCREMENT,
  `fk_id_hab_com_lin` int(11) DEFAULT NULL,
  `fk_id_pro_com_lin` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_hab_pro_com_lin`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



CREATE TABLE 
-- inserindo dados habilidade_atividade _ eixo com lin
INSERT INTO hab_pro_com_lin (fk_id_hab_com_lin, fk_id_pro_com_lin) 
VALUES 
(1, 1),(1, 2),(1, 3),(1, 4),(1, 7),(1, 8),
(2,1),(2,2),(2,3),(2,4),(2,5),(2,7),(2,8),
(3,1),(3,2),(3,3),(3,5),(3,6),(3,7),(3,8),
(4,1),(4,2),(4,3),(4,4),(4,5),(4,6),(4,7),(4,8),
(5,3),(5,6),
(6,1),(6,2),(6,3),(6,4),(6,5),(6,6),(6,7),(6,8),
(7,4),(7,5),
(8,2),(8,4),(8,8),
(9,4),(9,5),(9,8),
(10,2),(10,4),(10,6),(10,7),(10,8),
(11,1),(11,3),(11,6),(11,7),(11,8),
(12,1),(12,2),(12,3),(12,6),(12,7),(12,8),
(13,2),(13,4),(13,6),(13,7),(13,8),
(14,1),(14,2),(14,3),(14,4),(14,6),(14,7),(14,8),
(15,1),(15,3),(15,6),(15,8),
(16,1),(16,3),(16,6), 
(17,1),(17,2),(17,4),(17,8),
(18,1),(18,2),(18,4),(18,8),
(19,5),(19,8),
(20,1),(20,3),(20,8),
(21,2),(21,4),(21,5),(21,6),(21,7),(21,8),
(22,3),(22,6),
(23,3),(23,6),
(24,2),(24,3),(24,5),(24,6),
(25,2),(25,5),(25,8),
(26,1),(26,2),(26,3),(26,4),(26,6),(26,7),(26,8),
(27,2),(27,4),(27,5),(27,8),
(28,4),(28,5),
(29,1),(29,2),(29,3),(29,4),(29,5),(29,6),(29,7),(29,8),
(30,1),(30,2),(30,3),(30,4),(30,5),(30,6),(30,7),(30,8),
(31,2),(31,3),(31,5),(31,6),(31,7),(31,8),
(32,1),(32,2),(32,3),(32,4),(32,5),(32,6),(32,7),(32,8)

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
SELECT *from hab_pro_int_soc
DESC hab_pro_int_soc

INSERT INTO hab_pro_int_soc(fk_id_hab_int_soc,fk_id_pro_int_soc) VALUES 

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
	
	
	
	update aluno SET flag_inventario = " " 
	
	
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
USE sap_tea
SHOW CREATE TABLE result_eixo_com_lin
SHOW CREATE TABLE result_eixo_comportamento
SHOW CREATE TABLE result_eixo_int_socio



SELECT *FROM aluno
UPDATE aluno SET flag_inventario = " "



DELETE FROM eixo_com_lin
DELETE FROM eixo_comportamento
DELETE FROM eixo_int_socio


ALTER TABLE eixo_com_lin AUTO_INCREMENT =1
ALTER TABLE eixo_comportamento AUTO_INCREMENT =1
ALTER TABLE eixo_int_socio AUTO_INCREMENT =1

USE sap_tea
SELECT *FROM hab_pro_com_lin
DELETE FROM hab_pro_com_lin WHERE id_hab_pro_com_lin = 4

SELECT *FROM eixo_com_lin

DELETE FROM result_eixo_com_lin
DELETE FROM result_eixo_com_lin


DELETE  FROM  result_eixo_com_lin
DELETE FROM result_eixo_comportamento
DELETE FROM result_eixo_int_socio








SELECT *FROM result_eixo_com_lin
DELETE FROM result_eixo_com_lin
ALTER TABLE  result_eixo_com_lin AUTO_INCREMENT = 1


SELECT *FROM result_eixo_comportamento
DELETE FROM result_eixo_comportamento
ALTER TABLE  result_eixo_comportamento AUTO_INCREMENT = 1


SELECT *FROM result_eixo_int_socio
DELETE FROM result_eixo_int_socio
ALTER TABLE result_eixo_int_socio AUTO_INCREMENT = 1













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













<<<<<<< Updated upstream
=======
SELECT *FROM funcionario
>>>>>>> Stashed changes



