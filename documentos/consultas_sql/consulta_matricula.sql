-- consultas relativas a guia matricula
SELECT *FROM instituicao
SELECT *FROM aluno
DELETE FROM aluno
ALTER TABLE aluno AUTO_INCREMENT = 1
SELECT *FROM aluno AS al WHERE al.alu_inep = "12375642"

-- verifica aluno por inep na escola em que ele se encontra
SELECT al.alu_id, al.alu_ra, al.alu_nome,
                       (SELECT COUNT(*) FROM matricula WHERE fk_id_aluno = al.alu_id) AS matricula_existe
                    sap_tea   FROM aluno AS al 
                       INNER JOIN escola AS es ON al.alu_inep = es.esc_inep 
                       WHERE al.alu_inep = "12375642"


eixo_int_socioALTER TABLE enturmacao AUTO_INCREMENT = 1
SELECT *FROM enturmacao
DELETE FROM enturmacao
DELETE FROM turma
DELETE FROM enturmacao_professor
SHOW tables

SELECT *FROM modalidade
DESC funcionario
DESC escola
DESC tipo_funcao
SELECT *from matricula
DELETE FROM matricula

SELECT *FROM aluno
ALTER TABLE aluno CONVERT TO CHARACTER SET utf8mb4 COLLATE UTF8MB4_UNICODE_CI;
ALTER TABLE instituicao CONVERT TO CHARACTER SET utf8mb4 COLLATE UTF8MB4_UNICODE_CI;
ALTER TABLE orgao CONVERT TO CHARACTER SET utf8mb4 COLLATE UTF8MB4_UNICODE_CI;
ALTER TABLE escola CONVERT TO CHARACTER SET utf8mb4 COLLATE UTF8MB4_UNICODE_CI;
ALTER TABLE modalidade CONVERT TO CHARACTER SET utf8mb4 COLLATE UTF8MB4_UNICODE_CI;
ALTER TABLE funcionario CONVERT TO CHARACTER SET utf8mb4 COLLATE UTF8MB4_UNICODE_CI;
ALTER TABLE matricula CONVERT TO CHARACTER SET utf8mb4 COLLATE UTF8MB4_UNICODE_CI;
ALTER TABLE perfil_estudante CONVERT TO CHARACTER SET utf8mb4 COLLATE UTF8MB4_UNICODE_CI;
ALTER TABLE perfil_familia CONVERT TO CHARACTER SET utf8mb4 COLLATE UTF8MB4_UNICODE_CI;
ALTER TABLE personalidade CONVERT TO CHARACTER SET utf8mb4 COLLATE UTF8MB4_UNICODE_CI;
ALTER TABLE comunicacao CONVERT TO CHARACTER SET utf8mb4 COLLATE UTF8MB4_UNICODE_CI;
ALTER TABLE preferencia CONVERT TO CHARACTER SET utf8mb4 COLLATE UTF8MB4_UNICODE_CI;
ALTER TABLE tipo_funcao CONVERT TO CHARACTER SET utf8mb4 COLLATE UTF8MB4_UNICODE_CI;
ALTER TABLE turma CONVERT TO CHARACTER SET utf8mb4 COLLATE UTF8MB4_UNICODE_CI;


SHOW tables



ALTER DATABASE sap_tea CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


-- seleciona funcionario por 
SELECT *FROM tipo_funcao

SELECT *FROM funcionarioenturmacao_professor AS fun WHERE  fun.func_cod_funcao = 6

	SELECT * FROM funcionario AS fun 
		INNER JOIN escola AS esc on 
		fun.inep = esc.esc_inep
		
UPDATE funcionario AS fun  SET fun.func_cod_funcao = 5   WHERE fun.func_id = 1 	
UPDATE funcionario AS fun  SET fun.func_cod_funcao = 6   WHERE fun.func_id = 2 	
UPDATE funcionario AS fun  SET fun.func_cod_funcao = 5   WHERE fun.func_id = 3 
UPDATE funcionario AS fun  SET fun.func_cod_funcao = 6   WHERE fun.func_id = 4 
UPDATE funcionario AS fun  SET fun.func_cod_funcao = 5   WHERE fun.func_id = 5 
UPDATE funcionario AS fun  SET fun.func_cod_funcao = 6   WHERE fun.func_id = 6 



		
SELECT 
    fun.func_id, 
    esc.esc_inep,
    fun.func_nome, 
    tp.desc_tipo_funcao,
    esc.esc_razao_social
FROM 
    funcionario AS fun
INNER JOIN 
    escola AS esc ON fun.inep = esc.esc_inep
INNER JOIN 
    tipo_funcao AS tp ON tp.tipo_funcao_id = fun.func_cod_funcao
WHERE 
    fun.func_cod_funcao IN (5, 6)
   AND fun.inep IS NOT NULL
AND fun.inep != ''



/*
Instituto Alfa e Ômega	
ensino infantil

*/




-- deletando registros de perfil de estudante 
DESC aluno
UPDATE aluno SET flag_perfil = " "


DELETE FROM perfil_estudante
DELETE FROM personalidade
DELETE FROM preferencia
DELETE FROM perfil_familia


SELECT *FROM perfil_estudante


--- limpando vinculo escola com 

SELECT *FROM escola WHERE esc_inep = '78901234'
SELECT *FROM aluno WHERE alu_inep = '78901234'
SELECT *from turma WHERE fk_inep = '78901234'
SELECT *FROM funcionario WHERE inep = '78901234'
SELECT *FROM matricula WHERE fk_inep = '78901234'


UPDATE escola SET fk_org_esc_id = " "


DELETE FROM enturmacao
DELETE from enturmacao_professor


SELECT *FROM funcionario

UPDATE funcionario SET email_func = 'marcosbarrosobia@gmail.com' WHERE func_id = 22
UPDATE funcionario SET func_cpf = '685.552.704-30' WHERE func_id = 22


USE sap_tea
SELECT *FROM hab_pro_int_soc


SELECT *FROM turma
UPDATE aluno SET alu_inep = '78901234' WHERE alu_id = 1;

SELECT *FROM aluno WHERE alu_inep = '78901234'
SELECT *FROM aluno WHERE alu_inep NOT in (SELECT esc_inep FROM escola)

SELECT *FROM escola WHERE esc_inep NOT IN(SELECT alu_inep FROM aluno)

DELETE FROM escola
WHERE esc_inep NOT IN (
    SELECT alu_inep FROM aluno WHERE alu_inep IS NOT NULL
);


SELECT *FROM escola

UPDATE escola fk_or_esc_id = " " NOT IN (selec

UPDATE aluno SET alu_inep = '12375642' WHERE alu_inep = '35060136'


SELECT *FROM 

SELECT *FROM escola WHERE esc_inep = '12375642'

SELECT *FROM escola

SELECT *FROM escola as esc INNER JOIN aluno AS al ON
esc.esc_inep = al.alu_inep

SELECT *FROM enturmacao
DELETE FROM enturmacao
ALTER TABLE enturmacao AUTO_INCREMENT = 1

SELECT *FROM turma

DELETE FROM turma 
ALTER TABLE turma AUTO_INCREMENT = 1

SELECT *FROM matricula AS mat INNER JOIN turma AS tur ON tur.cod_valor =  mat.fk_cod_valor_turma INNER JOIN
enturmacao AS ent ON ent.id_enturmacao = mat.


DELETE FROM matricula
ALTER TABLE matricula AUTO_INCREMENT = 1

SELECT *FROM turma




