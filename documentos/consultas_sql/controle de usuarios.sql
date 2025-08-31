-- autenticacao

SHOW CREATE table funcionario
SHOW CREATE TABLE tipo_funcao
DESC tipo_funcao
SELECT *FROM tipo_funcao
INSERT INTO tipo_funcao(desc_tipo_funcao) VALUE ("Administrador")
SELECT *FROM funcionario



UPDATE funcionario SET func_nome = "Barcos Barroso" WHERE func_id= 1
UPDATE funcionario SET func_cpf = "68555270430" WHERE func_id= 1
UPDATE funcionario SET func_cod_funcao = 7 WHERE func_id= 1
UPDATE funcionario 
SET `password` = '68555270430' 
WHERE func_id = 1;
UPDATE funcionario SET email_func = "marcosbarrosobia@gmail.com" WHERE func_id= 1

ALTER TABLE funcionario
ADD COLUMN precisa_trocar_senha TINYINT(1) NOT NULL DEFAULT 1 AFTER PASSWORD;


SHOW CREATE TABLE  password_resets;