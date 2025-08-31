-- rotina e monitoramento
USE sap_tea
SELECT *FROM cad_ativ_eixo_com_lin
SELECT *FROM cad_ativ_eixo_comportamento
SELECT  *FROM cad_ativ_eixo_int_socio

DESC cad_ativ_eixo_com_lin

SHOW CREATE table cad_ativ_eixo_com_lin;
SHOW CREATE table cad_ativ_eixo_comportamento;
SHOW CREATE table cad_ativ_eixo_int_socio

delete FROM cad_ativ_eixo_com_lin;
delete FROM cad_ativ_eixo_comportamento;
DELETE FROM cad_ativ_eixo_int_socio;


ALTER TABLE cad_ativ_eixo_com_lin AUTO_INCREMENT = 1;
ALTER TABLE cad_ativ_eixo_comportamento AUTO_INCREMENT = 1;
ALTER TABLE cad_ativ_eixo_int_socio AUTO_INCREMENT = 1



ALTER TABLE cad_ativ_eixo_com_lin ADD UNIQUE INDEX idx_unico_linha (aluno_id, cod_atividade, flag);
ALTER TABLE cad_ativ_eixo_comportamento ADD UNIQUE INDEX idx_unico_linha (aluno_id, cod_atividade, flag);
ALTER TABLE cad_ativ_eixo_int_socio ADD UNIQUE INDEX idx_unico_linha (aluno_id, cod_atividade, flag);
