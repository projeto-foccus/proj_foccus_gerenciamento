SELECT *FROM  result_eixo_com_lin AS r  JOIN 
hab_pro_com_lin AS h ON r.fk_hab_pro_com_lin = r.fk_hab_pro_com_lin 
WHERE r.fk_result_alu_id_ecomling = 25


SELECT *FROM  result_eixo_com_lin WHERE fk_result_alu_id_ecomling = 25
DESC fk_hab_pro_com_lin



SELECT DISTINCT
    hcl.desc_hab_com_lin AS habilidade
FROM
    result_eixo_com_lin AS r
INNER JOIN hab_pro_com_lin AS h ON r.fk_hab_pro_com_lin = h.id_hab_pro_com_lin
INNER JOIN habilidade_com_lin AS hcl ON h.fk_id_hab_com_lin = hcl.id_hab_com_lin
WHERE
    r.fk_result_alu_id_ecomling = 25
ORDER BY
    hcl.desc_hab_com_lin;


SELECT DISTINCT r.fk_hab_pro_com_lin
FROM result_eixo_com_lin AS r
WHERE r.fk_result_alu_id_ecomling = 25;


SELECT 
    r.fk_hab_pro_com_lin,
    h.id_hab_pro_com_lin AS id_hab_pro_encontrado,
    h.fk_id_hab_com_lin AS id_habilidade,
    hcl.desc_hab_com_lin
FROM
    result_eixo_com_lin AS r
LEFT JOIN hab_pro_com_lin AS h 
    ON r.fk_hab_pro_com_lin = h.id_hab_pro_com_lin
LEFT JOIN habilidade_com_lin AS hcl 
    ON h.fk_id_hab_com_lin = hcl.id_hab_com_lin
WHERE
    r.fk_result_alu_id_ecomling = 25
ORDER BY r.fk_hab_pro_com_lin;


SELECT *FROM habilidade_com_lin
SHOW CREATE TABLE habilidade_com_lin
SELECT *FROM hab_pro_com_lin
show CREATE TABLE hab_pro_com_lin
SELECT *FROM result_eixo_com_lin
SHOW CREATE TABLE result_eixo_com_lin





SELECT *FROM result_eixo_com_lin AS a INNER JOIN habilidade_com_lin AS b ON
a.fk_hab_pro_com_lin = b.id_hab_com_lin WHERE a.fk_result_alu_id_ecomling = 25

SELECT *FROM atividade_com_lin
SHOW CREATE TABLE atividade_com_lin

SELECT *FROM result_eixo_com_lin AS c INNER JOIN atividade_com_lin AS d ON
c.fk_id_pro_com_lin = d.id_ati_com_lin WHERE c.fk_result_alu_id_ecomling = 25



SELECT DISTINCT
    b.desc_hab_com_lin AS habilidade
FROM
    result_eixo_com_lin AS a
INNER JOIN habilidade_com_lin AS b
    ON a.fk_hab_pro_com_lin = b.id_hab_com_lin
WHERE
    a.fk_result_alu_id_ecomling = 25
ORDER BY
    b.desc_hab_com_lin;
    
    
 
 
 SELECT DISTINCT
    d.desc_ati_com_lin AS atividade
FROM
    result_eixo_com_lin AS c
INNER JOIN atividade_com_lin AS d 
    ON c.fk_id_pro_com_lin = d.id_ati_com_lin 
WHERE c.fk_result_alu_id_ecomling = 25
ORDER BY d.desc_ati_com_lin;
   
   
   
--resultado atividadess- comportamento
 
    SELECT *FROM atividade_comportamento
SHOW CREATE TABLE atividade_comportamento

SELECT *FROM result_eixo_comportamento
SHOW CREATE TABLE result_eixo_comportamento


SELECT *FROM result_eixo_comportamento AS c INNER JOIN atividade_comportamento AS d ON
c.fk_id_pro_comportamento = d.id_ati_comportamento WHERE c.fk_result_alu_id_comportamento = 25

======
SELECT DISTINCT
  d.desc_ati_comportamento AS atividade
FROM
  result_eixo_comportamento AS c
INNER JOIN atividade_comportamento AS d 
  ON c.fk_id_pro_comportamento = d.id_ati_comportamento 
   WHERE c.fk_result_alu_id_comportamento = 25
ORDER BY d.desc_ati_comportamento;



===

--resultado habilidade- comportamento
 
    SELECT *FROM habilidade_comportamento
SHOW CREATE TABLE habilidade_comportamento

SELECT *FROM result_eixo_comportamento
SHOW CREATE TABLE result_eixo_comportamento


SELECT *FROM result_eixo_comportamento AS a INNER JOIN habilidade_comportamento AS b ON
a.fk_hab_pro_comportamento = b.id_hab_comportamento WHERE a.fk_result_alu_id_comportamento = 25

===========
SELECT DISTINCT
  b.desc_hab_comportamento AS habilidade
FROM
  result_eixo_comportamento AS a
INNER JOIN habilidade_comportamento AS b 
  ON a.fk_hab_pro_comportamento = b.id_hab_comportamento
 WHERE a.fk_result_alu_id_comportamento = 25
ORDER BY b.desc_hab_comportamento;


===========





--resultado das atividades eixos inteemocional
SELECT *FROM atividade_int_soc
SHOW CREATE TABLE atividade_int_soc

SELECT *FROM result_eixo_int_socio
SHOW CREATE TABLE result_eixo_int_socio


SELECT *FROM result_eixo_int_socio AS c INNER JOIN atividade_int_soc AS d ON
c.fk_id_pro_int_socio = d.id_ati_int_soc WHERE c.fk_result_alu_id_int_socio = 25

=====
SELECT DISTINCT
  d.desc_ati_int_soc AS atividade
FROM
  result_eixo_int_socio AS c
INNER JOIN atividade_int_soc AS d 
  ON c.fk_id_pro_int_socio = d.id_ati_int_soc 
WHERE c.fk_result_alu_id_int_socio = 25
ORDER BY d.desc_ati_int_soc;




=====






--resultado habilidade- comportamento
 
    SELECT *FROM habilidade_int_soc
SHOW CREATE TABLE habilidade_int_soc

SELECT *FROM result_eixo_int_socio
SHOW CREATE TABLE result_eixo_int_socio


SELECT *FROM result_eixo_int_socio AS a INNER JOIN habilidade_int_soc AS b ON
a.fk_hab_pro_int_socio = b.id_hab_int_soc WHERE a.fk_result_alu_id_int_socio = 25

====
SELECT DISTINCT
  b.desc_hab_int_soc AS habilidade
FROM
  result_eixo_int_socio AS a
INNER JOIN habilidade_int_soc AS b 
  ON a.fk_hab_pro_int_socio = b.id_hab_int_soc

ORDER BY b.desc_hab_int_soc;




===




