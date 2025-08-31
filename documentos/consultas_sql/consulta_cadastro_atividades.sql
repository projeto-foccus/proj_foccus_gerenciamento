--- fator x

SHOW TABLES
ECP03
EIS01




SELECT *FROM atividade_comportamento
SHOW CREATE TABLE atividade_comportamento
DESC atividade_comportamento

SELECT *FROM atividade_int_soc
DESC atividade_int_soc
SHOW CREATE TABLE atividade_int_soc


EIS01

id_ati_int_soc = 1



SELECT 
    r.fk_id_pro_int_soc, 
    a.id_ati_int_soc, 
    a.cod_ati_int_socio, 
    a.desc_ati_int_socio
FROM 
    result_eixo_int_socio r
LEFT JOIN 
    atividade_int_soc a ON r.fk_id_pro_int_soc = a.id_ati_int_soc
WHERE 
    r.fk_result_alu_id_int_socio = 6;
    
    SELECT *FROM result_eixo_int_socio
    
    SHOW CREATE TABLE result_eixo_int_socio
    
    
    
    SELECT * FROM atividade_int_soc WHERE id_ati_int_soc = 1 OR cod_ati_int_soc = 'EIS01';
SELECT * FROM result_eixo_int_socio WHERE fk_id_pro_int_socio = 1;


SHOW CREATE TABLE result_eixo_com_lin
SHOW CREATE TABLE hab_pro_com_lin
SHOW CREATE TABLE proposta_com_lin





SELECT *FROM result_eixo_comportamento
SHOW CREATE TABLE result_eixo_comportamento
SHOW CREATE TABLE hab_pro_comportamento
SHOW CREATE TABLE proposta_comportamento






SELECT *FROM aluno order BY alu_nome