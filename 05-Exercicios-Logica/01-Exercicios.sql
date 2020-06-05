-- Traga todos os funcionarios que trabalham no departamento
--de filmes ou de no departamento de roupas
SELECT COUNT(*) FROM FUNCIONARIOS WHERE DEPARTAMENTO = 'FILMES';
SELECT COUNT(*) FROM FUNCIONARIOS WHERE DEPARTAMENTO = 'ROUPAS';
/* CORRIGIDO */
SELECT COUNT(*), DEPARTAMENTO FROM FUNCIONARIOS GROUP BY DEPARTAMENTO ORDER BY DEPARTAMENTO;
/*
FILMES = 21 FUNCIONARIOS
ROUPAS = 53 FUNCIONARIOS
*/
SELECT NOME, SEXO, DEPARTAMENTO FROM FUNCIONARIOS WHERE DEPARTAMENTO = 'ROUPAS' OR DEPARTAMENTO = 'FILMES' ORDER BY DEPARTAMENTO DESC;



--O gestor de marketing pediu a lista das funcionarias (AS) = FEMININO que trabalhem no departamento 
--de filmes ou no departamento lar. Ele necessita enviar um email para as colaboradoras
--desses dois setores. OR +  AND *
SELECT COUNT(*) FROM FUNCIONARIOS WHERE SEXO = 'FEMININO';
SELECT COUNT(*) FROM FUNCIONARIOS WHERE SEXO = 'MASCULINO';
/* 491 MULHERES - 484 HOMENS*/
/* CORRIGIDOS */
SELECT COUNT(*), SEXO FROM FUNCIONARIOS GROUP BY SEXO;

SELECT COUNT(*) FROM FUNCIONARIOS WHERE SEXO = 'FEMININO' AND DEPARTAMENTO = 'FILMES';
SELECT COUNT(*) FROM FUNCIONARIOS WHERE SEXO = 'FEMININO' AND DEPARTAMENTO = 'LAR';
/* 09 MULHERES - FILMES - 32 MULHERES - LAR */
SELECT NOME, EMAIL, SEXO, DEPARTAMENTO FROM FUNCIONARIOS WHERE DEPARTAMENTO = "LAR" OR DEPARTAMENTO = "FILMES" AND SEXO = "FEMININO";
SELECT NOME, EMAIL, SEXO, DEPARTAMENTO FROM FUNCIONARIOS WHERE SEXO = "FEMININO" AND DEPARTAMENTO = "LAR" OR DEPARTAMENTO = "FILMES";
SELECT NOME, EMAIL, SEXO, DEPARTAMENTO FROM FUNCIONARIOS WHERE SEXO = "FEMININO" AND  DEPARTAMENTO = "FILMES" OR DEPARTAMENTO = "LAR";
SELECT NOME, EMAIL, SEXO, DEPARTAMENTO FROM FUNCIONARIOS WHERE SEXO = "FEMININO" AND  (DEPARTAMENTO = "LAR" OR DEPARTAMENTO = "FILMES") ORDER BY DEPARTAMENTO DESC;
/* CORRETA */
SELECT NOME, EMAIL, SEXO, DEPARTAMENTO FROM FUNCIONARIOS WHERE (DEPARTAMENTO = 'LAR' OR DEPARTAMENTO = 'FILMES') AND SEXO = 'FEMININO';
/* CORRGIDO */
SELECT NOME, EMAIL, SEXO, DEPARTAMENTO FROM FUNCIONARIOS 
WHERE
(DEPARTAMENTO = 'LAR' AND SEXO = 'FEMININO')
OR
(DEPARTAMENTO = 'FILMEs' AND SEXO = 'FEMININO');

--Traga os funcionarios do sexo masculino
--ou os funcionarios que trabalhem no setor Jardim
SELECT COUNT(*) FROM FUNCIONARIOS WHERE SEXO = 'MASCULINO'; -- 484 HOMENS
SELECT COUNT(*) FROM FUNCIONARIOS WHERE DEPARTAMENTO = 'JARDIM'; -- 47 FUNCIONARIOS

SELECT NOME, SEXO, DEPARTAMENTO FROM FUNCIONARIOS WHERE SEXO = 'MASCULINO' OR DEPARTAMENTO = 'JARDIM' ORDER BY DEPARTAMENTO DESC;

