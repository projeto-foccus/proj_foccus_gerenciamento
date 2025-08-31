SELECT *FROM aluno WHERE alu_id = 66
SELECT *FROM funcionario WHERE func_id = 66

USE sap_tea
SELECT *FROM eixo_com_lin

DELETE FROM eixo_com_lin
DELETE FROM eixo_comportamento
DELETE FROM eixo_int_socio


DELETE FROM result_eixo_com_lin
DELETE FROM result_eixo_comportamento
DELETE FROM result_eixo_int_socio

UPDATE aluno SET flag_inventario = ""


SELECT * FROM result_eixo_com_lin

ALTER TABLE eixo_com_lin AUTO_INCREMENT = 1
ALTER TABLE eixo_comportamento AUTO_INCREMENT = 1
ALTER TABLE eixo_int_socio AUTO_INCREMENT = 1

ALTER TABLE result_eixo_com_lin AUTO_INCREMENT = 1
ALTER TABLE result_eixo_comportamento AUTO_INCREMENT = 1
ALTER TABLE result_eixo_int_socio AUTO_INCREMENT = 1




SELECT * FROM result_eixo_com_lin
SELECT * FROM result_eixo_comportamento
SELECT * FROM result_eixo_int_socio


SHOW CREATE table result_eixo_com_lin
SHOW CREATE TABLE  hab_pro_com_lin
SELECT *FROM atividade_com_lin
SHOW CREATE TABLE atividade_com_lin

DESC atividade_com_lin
DESC atividade_comportamento
DESC atividade_int_soc

SELECT acom.cod_ati_com_lin,acom.desc_ati_com_lin   FROM atividade_com_lin as acom INNER JOIN result_eixo_com_lin AS res ON
acom.id_ati_com_lin = res.fk_id_pro_com_lin ORDER BY cod_ati_com_lin


SELECT acom.cod_ati_comportamento,acom.desc_ati_comportamento   FROM atividade_comportamento as acom INNER JOIN result_eixo_comportamento AS res ON
acom.id_ati_comportamento = res.fk_id_pro_comportamento ORDER BY cod_ati_comportamento




SELECT acom.cod_ati_int_soc, acom.desc_ati_int_soc   FROM atividade_int_soc as acom INNER JOIN result_eixo_int_socio AS res ON
acom.id_ati_int_soc = res.fk_id_pro_int_socio ORDER BY cod_ati_int_soc


SELECT *FROM hab_pro_com_lin

SELECT *FROM funcionario
