SHOW DATABASES;
USE COMERCIO;
SHOW TABLES;
DESC CLIENTE;
SELECT IDCLIENTE, NOME, SEXO, EMAIL, CPF FROM CLIENTE;

/* JEITO CERTO */

SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTE
INNER JOIN ENDERECO
ON IDCLIENTE = ID_CLIENTE;
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

SELECT NOME, SEXO, BAIRRO, CIDADE /* PROJECAO */
FROM CLIENTE /* ORIGEM */
    INNER JOIN ENDERECO /* JUNCAO */
    ON IDCLIENTE = ID_CLIENTE
WHERE SEXO = 'F'; /* SELECAO */

SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTE
    INNER JOIN ENDERECO
    ON IDCLIENTE = ID_CLIENTE
WHERE SEXO = 'F';
+-------+------+----------+----------------+
| NOME  | SEXO | BAIRRO   | CIDADE         |
+-------+------+----------+----------------+
| ANA   | F    | JARDINS  | SAO PAULO      |
| CLARA | F    | CENTRO   | B. HORIZONTE   |
| CELIA | F    | FLAMENGO | RIO DE JANEIRO |
+-------+------+----------+----------------+

/* NOME SEXO, EMAIL, TIPO, NUMERO */
SELECT NOME, SEXO, EMAIL, TIPO, NUMERO
FROM CLIENTE
INNER JOIN TELEFONE
ON IDCLIENTE = ID_CLIENTE;
+--------+------+-------------------+------+------------+
| NOME   | SEXO | EMAIL             | TIPO | NUMERO     |
+--------+------+-------------------+------+------------+
| JORGE  | M    | JORGE@HOTMAIL.COM | CEL  | 91111-1111 |
| JORGE  | M    | JORGE@HOTMAIL.COM | RES  | 1111-1111  |
| JOAO   | M    | JOAO@IG.COM.BR    | CEL  | 92222-2222 |
| CARLOS | M    | CARLOS@GLOBO.COM  | COM  | 2222-2222  |
| JOAO   | M    | JOAO@IG.COM.BR    | RES  | 3333-3333  |
| ANA    | F    | ANA@GMAIL.COM     | CEL  | 93333-3333 |
| ANA    | F    | ANA@GMAIL.COM     | CEL  | 94444-4444 |
| JOAO   | M    | JOAO@IG.COM.BR    | COM  | 4444-4444  |
| JORGE  | M    | JORGE@HOTMAIL.COM | RES  | 5555-5555  |
| CARLOS | M    | CARLOS@GLOBO.COM  | CEL  | 95555-5555 |
+--------+------+-------------------+------+------------+
