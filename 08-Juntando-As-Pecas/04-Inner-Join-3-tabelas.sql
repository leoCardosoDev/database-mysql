SHOW DATABASES;
USE COMERCIO;
SHOW TABLES;
DESC CLIENTE;
SELECT IDCLIENTE, NOME, SEXO, EMAIL, CPF FROM CLIENTE;

/* NOME, SEXO, BAIRRO, CIDADE, TIPO, NUMERO */

SELECT CLIENTE.NOME, CLIENTE.SEXO, ENDERECO.BAIRRO, ENDERECO.CIDADE, TELEFONE.TIPO, TELEFONE.NUMERO
FROM CLIENTE
INNER JOIN ENDERECO
ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
INNER JOIN TELEFONE
ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE;
+--------+------+---------+----------------+------+------------+
| NOME   | SEXO | BAIRRO  | CIDADE         | TIPO | NUMERO     |
+--------+------+---------+----------------+------+------------+
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | CEL  | 92222-2222 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | RES  | 3333-3333  |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | COM  | 4444-4444  |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | COM  | 2222-2222  |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | CEL  | 95555-5555 |
| ANA    | F    | JARDINS | SAO PAULO      | CEL  | 93333-3333 |
| ANA    | F    | JARDINS | SAO PAULO      | CEL  | 94444-4444 |
| JORGE  | M    | CENTRO  | VITORIA        | CEL  | 91111-1111 |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 1111-1111  |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 5555-5555  |
+--------+------+---------+----------------+------+------------+


SELECT C.NOME, C.SEXO, E.BAIRRO, E.CIDADE, T.TIPO, T.NUMERO
FROM CLIENTE AS C
INNER JOIN ENDERECO AS E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE AS T
ON C.IDCLIENTE = T.ID_CLIENTE;
+--------+------+---------+----------------+------+------------+
| NOME   | SEXO | BAIRRO  | CIDADE         | TIPO | NUMERO     |
+--------+------+---------+----------------+------+------------+
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | CEL  | 92222-2222 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | RES  | 3333-3333  |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | COM  | 4444-4444  |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | COM  | 2222-2222  |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | CEL  | 95555-5555 |
| ANA    | F    | JARDINS | SAO PAULO      | CEL  | 93333-3333 |
| ANA    | F    | JARDINS | SAO PAULO      | CEL  | 94444-4444 |
| JORGE  | M    | CENTRO  | VITORIA        | CEL  | 91111-1111 |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 1111-1111  |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 5555-5555  |
+--------+------+---------+----------------+------+------------+

