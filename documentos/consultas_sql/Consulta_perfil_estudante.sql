-- desc tipo_modalidade

SHOW CREATE TABLE  tipo_modalidade
SHOW CREATE TABLE modalidade



SHOW CREATE TABLE aluno
SHOW CREATE TABLE perfil_estudante
SHOW CREATE TABLE personalidade
SHOW CREATE TABLE preferencia
SHOW CREATE TABLE perfil_familia





--perfil de estudante  


USE sap_tea

DESC aluno

UPDATE aluno set flag_perfil = " " WHERE 

SELECT * from perfil_estudante

DELETE FROM perfil_estudante
DESC personalidade
ALTER TABLE perfil_estudante AUTO_INCREMENT = 1
DELETE FROM perfil_familia
ALTER TABLE perfil_familia AUTO_INCREMENT = 1
DELETE FROM personalidade
ALTER TABLE personalidade AUTO_INCREMENT = 1
DELETE FROM preferencia
ALTER TABLE preferencia AUTO_INCREMENT = 1


CREATE TABLE 



CREATE TABLE `personalidade` (
  `id_personalidade` int(11) NOT NULL AUTO_INCREMENT,
  `carac_principal` text,
  `inter_princ_carac` text,
  `livre_gosta_fazer` text,
  `feliz_est` text,
  `trist_est` text,
  `obj_apego` text,
  `fk_id_aluno` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_personalidade`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4



SELECT *FROM perfil_estudante
SHOW CREATE TABLE aluno


ALTER TABLE perfil_estudante ADD COLUMN update_count INT 




CREATE TABLE perfil_profissional(
		id_perfil_prossionais INT PRIMARY KEY auto_increment,
	   nome_profissional CHARACTER(250),
	   especialidade_area CHARACTER(250),
	   observacoes TEXT ,
	   fk_id_aluno INT(11) 
	   

)

SHOW CREATE TABLE  perfil_estudante



