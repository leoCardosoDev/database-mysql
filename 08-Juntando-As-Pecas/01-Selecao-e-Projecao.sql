/*
    PROJEÇAO, SELEÇAO E JUNÇAO
*/

SHOW DATABASES;
USE COMERCIO;
SHOW TABLES;
DESC CLIENTE;
SELECT IDCLIENTE, NOME, SEXO, EMAIL, CPF FROM CLIENTE;

/* PROJEÇÃO -> É TUDO QUE VC VER NA TELA */
SELECT IDTELEFONE, TIPO, NUMERO, ID_CLIENTE FROM TELEFONE;
SELECT NOW();
SELECT NOW() AS DATA_ATUAL;
SELECT 2 + 2 AS SOMA;
SELECT 2 + 2 AS SOMA, NOME, NOW() AS DATA_ATUAL FROM CLIENTE;

/*  SELEÇÃO -> É UM SUBCONJUNTO TOTAL DE REGISTROS DE UMA TABELA
    A CLAUSULA DE SELEÇÃO É O WHERE
*/ 
SELECT NOME, SEXO, EMAIL FROM CLIENTE WHERE SEXO = 'F';
SELECT NOME, SEXO, EMAIL /* PROJEÇÃO */
FROM CLIENTE /* ORIGEM */
WHERE SEXO = 'F'; /* SELEÇÃO */

SELECT NUMERO FROM TELEFONE WHERE TIPO = 'CEL';
SELECT NUMERO /* PROJEÇÃO */
FROM TELEFONE /* ORIGEM */
WHERE TIPO = 'CEL'; /* SELEÇÃO */
