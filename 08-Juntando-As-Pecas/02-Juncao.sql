SHOW DATABASES;
USE COMERCIO;
SHOW TABLES;
DESC CLIENTE;
SELECT IDCLIENTE, NOME, SEXO, EMAIL, CPF FROM CLIENTE;

/* JUNÇÃO */

SELECT NOME, EMAIL, IDCLIENTE FROM CLIENTE;
SELECT ID_CLIENTE, BAIRRO, CIDADE FROM ENDERECO;
+--------+-------------------+-----------+
| NOME   | EMAIL             | IDCLIENTE |
+--------+-------------------+-----------+
| JOAO   | JOAO@IG.COM.BR    |         1 |
| CARLOS | CARLOS@GLOBO.COM  |         2 |
| ANA    | ANA@GMAIL.COM     |         3 |
| CLARA  | NULL              |         4 |
| JORGE  | JORGE@HOTMAIL.COM |         5 |
| CELIA  | CELIA@OUTLOOK.COM |         6 |
+--------+-------------------+-----------+
+------------+----------+----------------+
| ID_CLIENTE | BAIRRO   | CIDADE         |
+------------+----------+----------------+
|          4 | CENTRO   | B. HORIZONTE   |
|          1 | CENTRO   | RIO DE JANEIRO |
|          3 | JARDINS  | SAO PAULO      |
|          2 | ESTACIO  | RIO DE JANEIRO |
|          6 | FLAMENGO | RIO DE JANEIRO |
|          5 | CENTRO   | VITORIA        |
+------------+----------+----------------+

/* NOME, SEXO, BAIRRO, CIDADE */
/* VAI FUNCIONAR, MAS NÃO É CERTO */
SELECT NOME, SEXO, BAIRRO, CIDADE 
FROM CLIENTE, ENDERECO
WHERE IDCLIENTE = ID_CLIENTE;
+--------+------+----------+----------------+
| NOME   | SEXO | BAIRRO   | CIDADE         |
+--------+------+----------+----------------+
| JOAO   | M    | CENTRO   | RIO DE JANEIRO |
| CARLOS | M    | ESTACIO  | RIO DE JANEIRO |
| ANA    | F    | JARDINS  | SAO PAULO      |
| CLARA  | F    | CENTRO   | B. HORIZONTE   |
| JORGE  | M    | CENTRO   | VITORIA        |
| CELIA  | F    | FLAMENGO | RIO DE JANEIRO |
+--------+------+----------+----------------+

SELECT NOME, SEXO, BAIRRO, CIDADE 
FROM CLIENTE, ENDERECO
WHERE IDCLIENTE = ID_CLIENTE
AND SEXO = 'F';
+-------+------+----------+----------------+
| NOME  | SEXO | BAIRRO   | CIDADE         |
+-------+------+----------+----------------+
| ANA   | F    | JARDINS  | SAO PAULO      |
| CLARA | F    | CENTRO   | B. HORIZONTE   |
| CELIA | F    | FLAMENGO | RIO DE JANEIRO |
+-------+------+----------+----------------+