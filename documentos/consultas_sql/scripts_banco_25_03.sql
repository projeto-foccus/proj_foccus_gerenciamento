CREATE DATABASE foccus
USE foccus

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
SELECT *FROM orgao

ALTER TABLE orgao ADD FOREIGN KEY (fk_org_inst_id) 
REFERENCES  instituicao(inst_id)

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



drop table aluno

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

 ALTER TABLE aluno ADD CONSTRAINT fk_id_escola FOREIGN KEY (alu_inep)
 REFERENCES escola(esc_in
 
 DELETE from aluno
 
 SELECT *FROM aluno
 
 SELECT *FROM aluno
 DELETE FROM aluno
 
 
  SELECT *FROM instituicao
  
  DELETE FROM instituicao
 
ALTER TABLE instituicao AUTO_INCREMENT = 1














