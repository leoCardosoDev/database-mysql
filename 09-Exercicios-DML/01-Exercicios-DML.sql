/* EXERCICIOS DML */

INSERT INTO CLIENTE VALUES(NULL,'FLAVIO','M','FLAVIO@IG.COM','4657765');
INSERT INTO CLIENTE VALUES(NULL,'ANDRE','M','ANDRE@GLOBO.COM','7687567');
INSERT INTO CLIENTE VALUES(NULL,'GIOVANA','F',NULL,'0876655');
INSERT INTO CLIENTE VALUES(NULL,'KARLA','M','KARLA@GMAIL.COM','545676778');
INSERT INTO CLIENTE VALUES(NULL,'DANIELE','M','DANIELE@GMAIL.COM','43536789');
INSERT INTO CLIENTE VALUES(NULL,'LORENA','M',NULL,'774557887');
INSERT INTO CLIENTE VALUES(NULL,'EDUARDO','M',NULL,'54376457');
INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','F','ANTONIO@IG.COM','12436767');
INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','M','ANTONIO@UOL.COM','3423565');
INSERT INTO CLIENTE VALUES(NULL,'ELAINE','M','ELAINE@GLOBO.COM','32567763');
INSERT INTO CLIENTE VALUES(NULL,'CARMEM','M','CARMEM@IG.COM','787832213');
INSERT INTO CLIENTE VALUES(NULL,'ADRIANA','F','ADRIANA@GMAIL.COM','88556942');
INSERT INTO CLIENTE VALUES(NULL,'JOICE','F','JOICE@GMAIL.COM','55412256');

/* CADASTRE UM ENDERECO PARA CADA CLIENTE */

INSERT INTO ENDERECO VALUES(NULL,'RUA GUEDES','CASCADURA','B. HORIZONTE','MG',9);
INSERT INTO ENDERECO VALUES(NULL,'RUA MAIA LACERDA','ESTACIO','RIO DE JANEIRO','RJ',10);
INSERT INTO ENDERECO VALUES(NULL,'RUA VISCONDESSA','CENTRO','RIO DE JANEIRO','RJ',11);
INSERT INTO ENDERECO VALUES(NULL,'RUA NELSON MANDELA','COPACABANA','RIO DE JANEIRO','RJ',12);
INSERT INTO ENDERECO VALUES(NULL,'RUA ARAUJO LIMA','CENTRO','VITORIA','ES',13);
INSERT INTO ENDERECO VALUES(NULL,'RUA CASTRO ALVES','LEBLON','RIO DE JANEIRO','RJ',14);
INSERT INTO ENDERECO VALUES(NULL,'AV CAPITAO ANTUNES','CENTRO','CURITIBA','PR',15);
INSERT INTO ENDERECO VALUES(NULL,'AV CARLOS BARROSO','JARDINS','SAO PAULO','SP',16);
INSERT INTO ENDERECO VALUES(NULL,'ALAMEDA SAMPAIO','BOM RETIRO','CURITIBA','PR',17);
INSERT INTO ENDERECO VALUES(NULL,'RUA DA LAPA','LAPA','SAO PAULO','SP',18);
INSERT INTO ENDERECO VALUES(NULL,'RUA GERONIMO','CENTRO','RIO DE JANEIRO','RJ',19);
INSERT INTO ENDERECO VALUES(NULL,'RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',20);
INSERT INTO ENDERECO VALUES(NULL,'RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',21);

/* CADASTRE TELEFONES PARA OS CLIENTES */


INSERT INTO TELEFONE VALUES(NULL,'RES','68976565',9);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99656675',9);
INSERT INTO TELEFONE VALUES(NULL,'CEL','33567765',11);
INSERT INTO TELEFONE VALUES(NULL,'CEL','88668786',11);
INSERT INTO TELEFONE VALUES(NULL,'COM','55689654',11);
INSERT INTO TELEFONE VALUES(NULL,'COM','88687979',12);
INSERT INTO TELEFONE VALUES(NULL,'COM','88965676',13);
INSERT INTO TELEFONE VALUES(NULL,'CEL','89966809',15);
INSERT INTO TELEFONE VALUES(NULL,'COM','88679978',16);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99655768',17);
INSERT INTO TELEFONE VALUES(NULL,'RES','89955665',18);
INSERT INTO TELEFONE VALUES(NULL,'RES','77455786',19);
INSERT INTO TELEFONE VALUES(NULL,'RES','89766554',19);
INSERT INTO TELEFONE VALUES(NULL,'RES','77755785',20);
INSERT INTO TELEFONE VALUES(NULL,'COM','44522578',20);

SHOW DATABASES;
USE COMERCIO;
SHOW TABLES;

DESC CLIENTE;
/*
+-----------+---------------+------+-----+---------+----------------+
| Field     | Type          | Null | Key | Default | Extra          |
+-----------+---------------+------+-----+---------+----------------+
| IDCLIENTE | int           | NO   | PRI | NULL    | auto_increment |
| NOME      | varchar(30)   | NO   |     | NULL    |                |
| SEXO      | enum('M','F') | NO   |     | NULL    |                |
| EMAIL     | varchar(50)   | YES  | UNI | NULL    |                |
| CPF       | varchar(15)   | YES  | UNI | NULL    |                |
+-----------+---------------+------+-----+---------+----------------+
*/
DESC ENDERECO;
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| IDENDERECO | int         | NO   | PRI | NULL    | auto_increment |
| RUA        | varchar(50) | NO   |     | NULL    |                |
| BAIRRO     | varchar(30) | NO   |     | NULL    |                |
| CIDADE     | varchar(30) | NO   |     | NULL    |                |
| ESTADO     | char(2)     | YES  |     | NULL    |                |
| ID_CLIENTE | int         | YES  | UNI | NULL    |                |
+------------+-------------+------+-----+---------+----------------+

DESC TELEFONE;
+------------+-------------------------+------+-----+---------+----------------+
| Field      | Type                    | Null | Key | Default | Extra          |
+------------+-------------------------+------+-----+---------+----------------+
| IDTELEFONE | int                     | NO   | PRI | NULL    | auto_increment |
| TIPO       | enum('RES','COM','CEL') | NO   |     | NULL    |                |
| NUMERO     | varchar(10)             | NO   |     | NULL    |                |
| ID_CLIENTE | int                     | YES  | MUL | NULL    |                |
+------------+-------------------------+------+-----+---------+----------------+

SELECT IDCLIENTE, NOME, SEXO, EMAIL, CPF FROM CLIENTE;
SELECT IDENDEREC0, RUA, BAIRRO, CIDADE, ESTADO, ID_CLIENTE FROM ENDERECO;
SELECT IDTELEFONE, TIPO, NUMERO, ID_CLIENTE FROM TELEFONE;

SELECT IDCLIENTE, NOME, SEXO, EMAIL, CPF FROM CLIENTE WHERE SEXO = 'F';

/* RELATORIO FERAL DE TODOS OS CLIENTES */
SELECT 
C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF, 
E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO, 
T.NUMERO, T.TIPO
FROM CLIENTE AS C
INNER JOIN ENDERECO AS E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE AS T
ON C.IDCLIENTE = T.ID_CLIENTE;

/*
    +---------+------+-------------------+----------------+--------------------+------------+----------------+--------+------------+------+
| NOME    | SEXO | EMAIL             | CPF            | RUA                | BAIRRO     | CIDADE         | ESTADO | NUMERO     | TIPO |
+---------+------+-------------------+----------------+--------------------+------------+----------------+--------+------------+------+
| JORGE   | M    | JORGE@HOTMAIL.COM | 555.666.777-88 | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     | 91111-1111 | CEL  |
| JORGE   | M    | JORGE@HOTMAIL.COM | 555.666.777-88 | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     | 1111-1111  | RES  |
| JOAO    | M    | JOAO@IG.COM.BR    | 111.222.333-44 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     | 92222-2222 | CEL  |
| CARLOS  | M    | CARLOS@GLOBO.COM  | 222.333.444-55 | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ     | 2222-2222  | COM  |
| JOAO    | M    | JOAO@IG.COM.BR    | 111.222.333-44 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     | 3333-3333  | RES  |
| ANA     | F    | ANA@GMAIL.COM     | 333.444.555-66 | RUA PRES VARGAS    | JARDINS    | SAO PAULO      | SP     | 93333-3333 | CEL  |
| ANA     | F    | ANA@GMAIL.COM     | 333.444.555-66 | RUA PRES VARGAS    | JARDINS    | SAO PAULO      | SP     | 94444-4444 | CEL  |
| JOAO    | M    | JOAO@IG.COM.BR    | 111.222.333-44 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     | 4444-4444  | COM  |
| JORGE   | M    | JORGE@HOTMAIL.COM | 555.666.777-88 | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     | 5555-5555  | RES  |
| CARLOS  | M    | CARLOS@GLOBO.COM  | 222.333.444-55 | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ     | 95555-5555 | CEL  |
| FLAVIO  | M    | FLAVIO@IG.COM     | 4657765        | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     | 68976565   | RES  |
| FLAVIO  | M    | FLAVIO@IG.COM     | 4657765        | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     | 99656675   | CEL  |
| GIOVANA | F    | NULL              | 0876655        | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | 33567765   | CEL  |
| GIOVANA | F    | NULL              | 0876655        | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | 88668786   | CEL  |
| GIOVANA | F    | NULL              | 0876655        | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | 55689654   | COM  |
| KARLA   | M    | KARLA@GMAIL.COM   | 545676778      | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | RJ     | 88687979   | COM  |
| DANIELE | M    | DANIELE@GMAIL.COM | 43536789       | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | ES     | 88965676   | COM  |
| EDUARDO | M    | NULL              | 54376457       | AV CAPITAO ANTUNES | CENTRO     | CURITIBA       | PR     | 89966809   | CEL  |
| ANTONIO | F    | ANTONIO@IG.COM    | 12436767       | AV CARLOS BARROSO  | JARDINS    | SAO PAULO      | SP     | 88679978   | COM  |
| ANTONIO | M    | ANTONIO@UOL.COM   | 3423565        | ALAMEDA SAMPAIO    | BOM RETIRO | CURITIBA       | PR     | 99655768   | CEL  |
| ELAINE  | M    | ELAINE@GLOBO.COM  | 32567763       | RUA DA LAPA        | LAPA       | SAO PAULO      | SP     | 89955665   | RES  |
| CARMEM  | M    | CARMEM@IG.COM     | 787832213      | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     | 77455786   | RES  |
| CARMEM  | M    | CARMEM@IG.COM     | 787832213      | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     | 89766554   | RES  |
| ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942       | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | 77755785   | RES  |
| ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942       | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | 44522578   | COM  |
+---------+------+-------------------+----------------+--------------------+------------+----------------+--------+------------+------+
*/

SELECT IDCLIENTE, NOME, SEXO, EMAIL, CPF FROM CLIENTE;
SELECT IDENDEREC0, RUA, BAIRRO, CIDADE, ESTADO, ID_CLIENTE FROM ENDERECO;
SELECT IDTELEFONE, TIPO, NUMERO, ID_CLIENTE FROM TELEFONE;

SELECT 
C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF,
E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO,
T.NUMERO, T.TIPO
FROM CLIENTE AS C
INNER JOIN ENDERECO AS E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE AS T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE C.SEXO = 'M';

SELECT IDCLIENTE, NOME, SEXO, EMAIL, CPF FROM CLIENTE
WHERE IDCLIENTE IN(12,13,18,19);

UPDATE CLIENTE SET SEXO = 'F' WHERE IDCLIENTE IN(12,13,18,19);

SELECT
C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF,
E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO,
T.NUMERO, T.TIPO
FROM CLIENTE AS C
INNER JOIN ENDERECO AS E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE AS T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE C.SEXO = 'F';

SELECT IDCLIENTE, NOME, SEXO, EMAIL, CPF FROM CLIENTE  WHERE IDCLIENTE = 16;
UPDATE CLIENTE SET SEXO = 'M' WHERE IDCLIENTE = 16;

SELECT SEXO, COUNT(*) AS QUANTIDADE FROM CLIENTE GROUP BY SEXO;
SELECT IDCLIENTE, NOME, SEXO, EMAIL, CPF FROM CLIENTE ORDER BY SEXO;

SELECT ESTADO, COUNT(*) FROM ENDERECO GROUP BY ESTADO;
SELECT BAIRRO, COUNT(*) FROM ENDERECO GROUP BY BAIRRO;
/*
    11 RJ
    9 CENTRO
    8 MULHERES
*/
SELECT C.IDCLIENTE, C.EMAIL, E.BAIRRO, E.ESTADO, T.TIPO
FROM CLIENTE AS C
INNER JOIN ENDERECO AS E 
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE AS T 
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE 
(E.BAIRRO = 'CENTRO' AND E.ESTADO = 'RJ')
AND
(T.TIPO <> 'CEL' AND C.SEXO = 'F');



SELECT C.IDCLIENTE, C.EMAIL, C.NOME, C.SEXO, E.BAIRRO, E.ESTADO, T.TIPO
FROM CLIENTE AS C
INNER JOIN ENDERECO AS E 
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE AS T 
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE 
(E.BAIRRO = 'CENTRO' AND E.ESTADO = 'RJ')
AND
(T.TIPO <> 'CEL' AND C.SEXO = 'F');

SELECT C.IDCLIENTE, C.EMAIL, C.NOME, C.SEXO, E.BAIRRO, E.ESTADO, T.TIPO
FROM CLIENTE AS C
INNER JOIN ENDERECO AS E 
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE AS T 
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE 
C.SEXO = 'F' AND
E.BAIRRO = 'CENTRO' AND E.ESTADO = 'RJ'
AND
(T.TIPO = 'RES' OR T.TIPO = 'COM');


SELECT C.NOME, C.EMAIL, T.NUMERO AS CELULAR, E.ESTADO
FROM CLIENTE AS C 
INNER JOIN TELEFONE AS T
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO AS E
ON C.IDCLIENTE = E.ID_CLIENTE
WHERE T.TIPO = 'CEL' AND E.ESTADO = 'RJ';

SELECT C.NOME, C.EMAIL, C.SEXO, T.NUMERO AS CELULAR, E.ESTADO
FROM CLIENTE AS C
INNER JOIN TELEFONE AS T 
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO AS E 
ON C.IDCLIENTE = E.ID_CLIENTE
WHERE C.SEXO = 'F'  AND E.ESTADO = 'SP' AND T.TIPO = 'CEL';
