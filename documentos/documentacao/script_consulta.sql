CREATE DATABASE foccus
USE foccus


DROP TABLE aluno
CREATE TABLE aluno(
	alu_id INT PRIMARY KEY AUTO_INCREMENT,
	alu_dt_cad DATE,
	alu_ra VARCHAR(20) NOT NULL,
	alu_nome VARCHAR(200) NOT NULL,
	alu_dtnasc DATE,
	alu_inep VARCHAR(15) NOT NULL,
	alu_nome_resp VARCHAR(200),
	alu_tipo_parentesco VARCHAR(100),
	alu_email_resp VARCHAR(150),
	alu_tel_resp VARCHAR(20)
 )
 
ALTER TABLE aluno
ADD CONSTRAINT fk_id_escola
FOREIGN KEY (alu_inep)
REFERENCES escola(esc_inep);



CREATE TABLE escola(
	esc_id INT PRIMARY KEY AUTO_INCREMENT,
	esc_dtcad DATE,
	esc_inep VARCHAR(15) NOT NULL,
	esc_cnpj VARCHAR(25),
	esc_razao_social  VARCHAR(200) NOT NULL,
	esc_endereco VARCHAR(250) ,
   esc_bairro VARCHAR(100),
	esc_municipio VARCHAR(100),
	esc_cep VARCHAR(15),
	esc_uf VARCHAR(02),
	esc_telefone VARCHAR(20),
	esc_email VARCHAR(150),
	esc_gestor VARCHAR(200),
	esc_coordenador VARCHAR(200)
    );
    
    
DELETE from escola    
    SELECT *FROM escola
    
    
    CREATE TABLE instituicao(
	inst_id INT PRIMARY KEY AUTO_INCREMENT,
	inst_razaosocial VARCHAR(250) NOT NULL,
	inst_endereco VARCHAR(250),
	inst_bairro VARCHAR(150),
	inst_municipio VARCHAR(150),
	inst_cep VARCHAR(20),
	inst_uf CHAR(2),
	inst_email VARCHAR(200) ,
	inst_tel1 VARCHAR(20),
	inst_tel2 VARCHAR(20)

)

SELECT *FROM instituicao
ALTER TABLE instituicao ADD COLUMN inst_cnpj VARCHAR(20) AFTER inst_razaosocial
DESC instituicao


CREATE TABLE orgao(
	org_id INT PRIMARY KEY AUTO_INCREMENT,
	org_razaosocial VARCHAR(250) NOT NULL,
   org_cnpj VARCHAR(20),
	org_endereco VARCHAR(250),
	org_bairro VARCHAR(150),
	org_municipio VARCHAR(150),
	org_cep VARCHAR(20),
	org_uf CHAR(2),
	org_email VARCHAR(200) ,
	org_tel1 VARCHAR(20),
	org_tel2 VARCHAR(20),
	fk_org_inst_id int

)
ALTER TABLE orgao ADD FOREIGN KEY (fk_org_inst_id) 
REFERENCES  instituicao(inst_id)

CREATE DATABASE foccus
USE foccus
DROP TABLE instituicao
CREATE TABLE instituicao(
	inst_id INT PRIMARY KEY AUTO_INCREMENT,
	inst_razaosocial VARCHAR(250) NOT NULL,
	inst_cnpj VARCHAR(20),
	inst_endereco VARCHAR(250),
	inst_bairro VARCHAR(150),
	inst_municipio VARCHAR(150),
	inst_cep VARCHAR(20),
	inst_uf CHAR(2),
	inst_email VARCHAR(200) ,
	inst_tel1 VARCHAR(20),
	inst_tel2 VARCHAR(20)

)
SELECT *FROM instituicao
DELETE FROM instituicao
instituicaoinstituicaoSELECT *FROM instituicao
ALTER TABLE instituicao ADD COLUMN inst_cnpj VARCHAR(20) AFTER inst_razaosocial
DESC instituicao


CREATE TABLE orgao(
	org_id INT PRIMARY KEY AUTO_INCREMENT,
	org_razaosocial VARCHAR(250) NOT NULL,
   org_cnpj VARCHAR(20),
	org_endereco VARCHAR(250),
	org_bairro VARCHAR(150),
	org_municipio VARCHAR(150),
	org_cep VARCHAR(20),
	org_uf CHAR(2),
	org_email VARCHAR(200) ,
	org_tel1 VARCHAR(20),
	org_tel2 VARCHAR(20),
	fk_org_inst_id int

)
ALTER TABLE orgao ADD FOREIGN KEY (fk_org_inst_id) 
REFERENCES  instituicao(inst_id)
SELECT *FROM orgao

SELECT *FROM INSTITUICAO
 INSERT INTO orgao (org_razaosocial,org_cnpj,org_endereco,org_bairro,org_municipio,org_cep,
    org_uf,org_email,org_tel1,org_tel2)
      VALUES 
 ("aa", "bb", "c", "d","e", "g","h", "i", "j", "l")

    DELETE FROM IN
   DESC orgao
   SELECT *FROM ORGAO
    INSERT INTO instituicao (inst_razaosocial, inst_cnpj, inst_endereco, inst_bairro, 
	 inst_municipio, inst_cep, inst_uf, inst_email, inst_tel1, inst_tel2) 
	 VALUES 
	 ("aa", "bb", "c", "d","e", "g","h", "i", "j", "l")
    
    
ALTER TABLE instituicao AUTO_INCREMENT = 1






-----------------------------

CREATE TABLE escola(
	esc_id INT PRIMARY KEY AUTO_INCREMENT,
	esc_dtcad DATE,
	esc_inep VARCHAR(15) NOT NULL,
	esc_cnpj VARCHAR(25),
	esc_razao_social  VARCHAR(200) NOT NULL,
	esc_endereco VARCHAR(250) ,
   esc_bairro VARCHAR(100),
	esc_municipio VARCHAR(100),
	esc_cep VARCHAR(15),
	esc_uf VARCHAR(02),
	esc_telefone VARCHAR(20),
	esc_email VARCHAR(150),
	esc_gestor VARCHAR(200),
	esc_coordenador VARCHAR(200)
    );
    
CREATE TABLE aluno(
	alu_id INT PRIMARY KEY AUTO_INCREMENT,
	alu_dt_cad DATE,
	alu_ra VARCHAR(20) NOT NULL,
	alu_nome VARCHAR(200) NOT NULL,
	alu_dtnasc DATE,
	alu_inep VARCHAR(15) NOT NULL,
	alu_nome_resp VARCHAR(200),
	alu_tipo_parentesco VARCHAR(100),
	alu_email_resp VARCHAR(150),
	alu_tel_resp VARCHAR(20),
	fk_esc_inep INT 
)
DESC instituicao
SELECT *FROM instituicao
ADD CONSTRAINT fk_id_escola
FOREIGN KEY (alu_inep)
REFERENCES escola(esc_inep);



SELECT *FROM escola
    DESC orgao    
    DELETE FROM escola
    
    
sELECT * from instituicao
SELECT *FROM orgao
DELETE FROM orgao
DELETE FROM  instituicao
ALTER TABLE instituicao AUTO_INCREMENT = 1






DESC instituicao


SELECT *FROM aluno

ALTER TABLE INSTITUICAO AUTO_INCREMENT = 1

USE foccus


CREATE TABLE modalidade(

	mod_id INT AUTO_INCREMENT PRIMARY KEY,
	mod_desc VARCHAR(100) NOT NULL
)
DROP TABLE serie
CREATE TABLE serie(
	serie_id INT AUTO_INCREMENT PRIMARY KEY,
	serie_desc VARCHAR(50) NOT null,
	fk_mod_id int
)

CREATE TABLE turma(
	turma_id INT AUTO_INCREMENT PRIMARY KEY,
	turma_desc VARCHAR(5) NOT null
)

INSERT INTO modalidade (mod_desc) values (UPPER("Educação infantil"));
INSERT INTO modalidade (mod_desc) values (UPPER(""));
INSERT INTO modalidade (mod_desc) values (UPPER("educacao Jovem e Adulto"));
SELECT *FROM modalidade

SELECT *FROM modalidade
SELECT *FROM funcionario
DELETE from funcionario

INSERT INTO serie (serie_desc,fk_mod_id) VALUES (UPPER("1º Ano"),2);

 INSERT INTO serie (serie_desc, fk_mod_id) VALUES (UPPER("1º Ano"), 2); 

SELECT *FROM escola


CREATE TABLE tipo_funcao(
	funcao_id INT AUTO_INCREMENT PRIMARY KEY,
	desc_tipo_funcao VARCHAR(150) NOT NULL
)

UPDATE tipo_funcao SET desc_tipo_funcao = 'Terapeuta ocupacional' WHERE desc_tipo_funcao = 'Terapeuta'

SELECT *FROM tipo_funcao
DELETE FROM tipo_funcao
SELECT *FROM tipo_funcao
ALTER TABLE tipo_funcao AUTO_INCREMENT = 1

INSERT INTO tipo_funcao(desc_tipo_funcao) VALUES ('Diretor da escola');
INSERT INTO tipo_funcao(desc_tipo_funcao) VALUES ('Vice diretor da escola');
INSERT INTO tipo_funcao(desc_tipo_funcao) VALUES ('Coordenador');
INSERT INTO tipo_funcao(desc_tipo_funcao) VALUES ('Supervisor da escola');
INSERT INTO tipo_funcao(desc_tipo_funcao) VALUES ('Professor');
INSERT INTO tipo_funcao(desc_tipo_funcao) VALUES ('Professor AEE');
INSERT INTO tipo_funcao(desc_tipo_funcao) VALUES ('Psicopedagogo');
INSERT INTO tipo_funcao(desc_tipo_funcao) VALUES ('Terapeuta Ocupacional');
INSERT INTO tipo_funcao(desc_tipo_funcao) VALUES ('Psicologo');
INSERT INTO tipo_funcao(desc_tipo_funcao) VALUES ('Fonodiologo');
INSERT INTO tipo_funcao(desc_tipo_funcao) VALUES ('Coordenado AEE');

CREATE TABLE funcionario (
	func_id INT AUTO_INCREMENT PRIMARY KEY,
	func_nome VARCHAR(250) NOT NULL,
	func_cpf VARCHAR(12),
	func_email VARCHAR(250),
	fk_tipo_func_id int
)
DESC escola

ALTER TABLE funcionario ADD COLUMN inep VARCHAR(15) AFTER func_email
DELETE FROM 
SELECT *FROM tipo_funcao ORDER BY FUNCAO_ID 

SELECT alu_ra FROM aluno group_by(alu_ra)
SELECT COUNT(alu_id) FROM aluno
SELECT *FROM aluno





DELETE FROM escola
SELECT *FROM escola

DELETE FROM instituicao
ALTER TABLE instituicao AUTO_INCREMENT = 1
ALTER TABLE orgao AUTO_INCREMENT = 1
.
SELECT *FROM escola
SELECT * from orgao

DELETE FROM orgao
 
 UPDATE orgao SET fk_org_inst_id = 1 WHERE org_id = 1;
 
 SELECT inst_id, inst.inst_razaosocial FROM instituicao inst INNER join orgao org on
 inst.inst_id = org.fk_org_inst_id
 



---------  cadastro escola ----
DELETE FROM escola


SELECT *FROM escola
ALTER TABLE escola AUTO_INCREMENT =  1
































    