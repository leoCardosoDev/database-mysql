SHOW DATABASES;
/*
+--------------------+
| Database           |
+--------------------+
| COMERCIO           |
| information_schema |
| mysql              |
| performance_schema |
| portal_noticias    |
| sys                |
+--------------------+
*/
USE COMERCIO;
SHOW TABLES;
/*
+--------------------+
| Tables_in_comercio |
+--------------------+
| ALUNOS             |
| CLIENTE            |
| ENDERECO           |
| JOGADORES          |
| PRODUTO            |
| TELEFONE           |
| v_jogadores        |
| v_relatorio        |
| VENDEDORES         |
+--------------------+
*/
DESC VENDEDORES;
/*
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| IDVENDEDOR | int         | NO   | PRI | NULL    | auto_increment |
| NOME       | varchar(30) | YES  |     | NULL    |                |
| SEXO       | char(1)     | YES  |     | NULL    |                |
| JANEIRO    | float(10,2) | YES  |     | NULL    |                |
| FEVEREIRO  | float(10,2) | YES  |     | NULL    |                |
| MARCO      | float(10,2) | YES  |     | NULL    |                |
+------------+-------------+------+-----+---------+----------------+
*/
DROP TABLE VENDEDORES;
CREATE TABLE VENDEDORES(
    IDVENDEDOR INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30),
    SEXO CHAR(1),
    JANEIRO FLOAT(10,2),
    FEVEREIRO FLOAT(10,2),
    MARCO FLOAT(10,2)
);

INSERT INTO VENDEDORES VALUES(NULL, 'CARLOS', 'M', 762.78, 543.87, 863.45);
INSERT INTO VENDEDORES VALUES(NULL, 'MARIA', 'F', 454.78, 765.87, 456.45);
INSERT INTO VENDEDORES VALUES(NULL, 'ANTONIO', 'M', 684.78, 635.87, 567.45);
INSERT INTO VENDEDORES VALUES(NULL, 'CLARA', 'F', 356.78, 654.87, 678.45);
INSERT INTO VENDEDORES VALUES(NULL, 'ANDERSON', 'M', 876.78, 135.87, 234.45);
INSERT INTO VENDEDORES VALUES(NULL, 'IVONE', 'F', 987.78, 841.87, 568.45);
INSERT INTO VENDEDORES VALUES(NULL, 'JOAO', 'M', 734.78, 563.87, 876.45);
INSERT INTO VENDEDORES VALUES(NULL, 'CELIA', 'F', 97.78, 754.87, 967.45);

SELECT IDVENDEDOR, NOME, SEXO, JANEIRO, FEVEREIRO, MARCO FROM VENDEDORES;
/*
+------------+----------+------+---------+-----------+--------+
| IDVENDEDOR | NOME     | SEXO | JANEIRO | FEVEREIRO | MARCO  |
+------------+----------+------+---------+-----------+--------+
|          1 | CARLOS   | M    |  762.78 |    543.87 | 863.45 |
|          2 | MARIA    | F    |  454.78 |    765.87 | 456.45 |
|          3 | ANTONIO  | M    |  684.78 |    635.87 | 567.45 |
|          4 | CLARA    | F    |  356.78 |    654.87 | 678.45 |
|          5 | ANDERSON | M    |  876.78 |    135.87 | 234.45 |
|          6 | IVONE    | F    |  987.78 |    841.87 | 568.45 |
|          7 | JOAO     | M    |  734.78 |    563.87 | 876.45 |
|          8 | CELIA    | F    |   97.78 |    754.87 | 967.45 |
+------------+----------+------+---------+-----------+--------+
*/

-- SOMANDO AS LINHAS
SELECT NOME, JANEIRO, FEVEREIRO, MARCO, (JANEIRO+FEVEREIRO+MARCO) AS "TOTAL" FROM VENDEDORES;
/*
+----------+---------+-----------+--------+---------+
| NOME     | JANEIRO | FEVEREIRO | MARCO  | TOTAL   |
+----------+---------+-----------+--------+---------+
| CARLOS   |  762.78 |    543.87 | 863.45 | 2170.10 |
| MARIA    |  454.78 |    765.87 | 456.45 | 1677.10 |
| ANTONIO  |  684.78 |    635.87 | 567.45 | 1888.10 |
| CLARA    |  356.78 |    654.87 | 678.45 | 1690.10 |
| ANDERSON |  876.78 |    135.87 | 234.45 | 1247.10 |
| IVONE    |  987.78 |    841.87 | 568.45 | 2398.10 |
| JOAO     |  734.78 |    563.87 | 876.45 | 2175.10 |
| CELIA    |   97.78 |    754.87 | 967.45 | 1820.10 |
+----------+---------+-----------+--------+---------+
*/

-- MEDIA
SELECT NOME, JANEIRO, FEVEREIRO, MARCO,
(JANEIRO + FEVEREIRO + MARCO) AS "TOTAL",
TRUNCATE((JANEIRO + FEVEREIRO + MARCO) / 3, 2) AS "MEDIA"
FROM VENDEDORES;
/*
+----------+---------+-----------+--------+---------+--------+
| NOME     | JANEIRO | FEVEREIRO | MARCO  | TOTAL   | MEDIA  |
+----------+---------+-----------+--------+---------+--------+
| CARLOS   |  762.78 |    543.87 | 863.45 | 2170.10 | 723.36 |
| MARIA    |  454.78 |    765.87 | 456.45 | 1677.10 | 559.03 |
| ANTONIO  |  684.78 |    635.87 | 567.45 | 1888.10 | 629.36 |
| CLARA    |  356.78 |    654.87 | 678.45 | 1690.10 | 563.36 |
| ANDERSON |  876.78 |    135.87 | 234.45 | 1247.10 | 415.70 |
| IVONE    |  987.78 |    841.87 | 568.45 | 2398.10 | 799.36 |
| JOAO     |  734.78 |    563.87 | 876.45 | 2175.10 | 725.03 |
| CELIA    |   97.78 |    754.87 | 967.45 | 1820.10 | 606.70 |
+----------+---------+-----------+--------+---------+--------+
*/

-- APLICANDO 25% DE DESCONTO DO TOTAL
SELECT NOME, JANEIRO, FEVEREIRO, MARCO,
(JANEIRO + FEVEREIRO + MARCO) AS "TOTAL",
(JANEIRO + FEVEREIRO + MARCO) * 0.25 AS "DESCONTO",
TRUNCATE((JANEIRO + FEVEREIRO + MARCO) / 3, 2) AS "MEDIA"
FROM VENDEDORES;
/*
+----------+---------+-----------+--------+---------+----------+--------+
| NOME     | JANEIRO | FEVEREIRO | MARCO  | TOTAL   | DESCONTO | MEDIA  |
+----------+---------+-----------+--------+---------+----------+--------+
| CARLOS   |  762.78 |    543.87 | 863.45 | 2170.10 |   542.53 | 723.36 |
| MARIA    |  454.78 |    765.87 | 456.45 | 1677.10 |   419.28 | 559.03 |
| ANTONIO  |  684.78 |    635.87 | 567.45 | 1888.10 |   472.03 | 629.36 |
| CLARA    |  356.78 |    654.87 | 678.45 | 1690.10 |   422.53 | 563.36 |
| ANDERSON |  876.78 |    135.87 | 234.45 | 1247.10 |   311.78 | 415.70 |
| IVONE    |  987.78 |    841.87 | 568.45 | 2398.10 |   599.53 | 799.36 |
| JOAO     |  734.78 |    563.87 | 876.45 | 2175.10 |   543.78 | 725.03 |
| CELIA    |   97.78 |    754.87 | 967.45 | 1820.10 |   455.03 | 606.70 |
+----------+---------+-----------+--------+---------+----------+--------+
*/


