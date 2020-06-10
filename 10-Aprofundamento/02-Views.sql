SELECT 
C.IDCLIENTE, C.NOME, C.SEXO, IFNULL(C.EMAIL, '**************') AS 'E-MAIL', 
T.TIPO, T.NUMERO, 
E.BAIRRO, E.CIDADE, E.ESTADO
FROM CLIENTE AS C
INNER JOIN TELEFONE AS T 
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO AS E 
ON C.IDCLIENTE = E.ID_CLIENTE
ORDER BY C.IDCLIENTE;

CREATE VIEW RELATORIO AS 
SELECT 
C.IDCLIENTE, C.NOME, C.SEXO, IFNULL(C.EMAIL, '**************') AS 'E-MAIL',
T.TIPO, T.NUMERO,
E.BAIRRO, E.CIDADE, E.ESTADO AS UF
FROM CLIENTE AS C
INNER JOIN TELEFONE AS T
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO AS E
ON C.IDCLIENTE = E.ID_CLIENTE
ORDER BY C.IDCLIENTE;

SELECT IDCLIENTE, NOME, SEXO, `E-MAIL`, TIPO, NUMERO, BAIRRO, CIDADE, UF FROM RELATORIO;
/*
+-----------+---------+------+-------------------+------+------------+------------+----------------+------+
| IDCLIENTE | NOME    | SEXO | E-MAIL            | TIPO | NUMERO     | BAIRRO     | CIDADE         | UF   |
+-----------+---------+------+-------------------+------+------------+------------+----------------+------+
|         1 | JOAO    | M    | JOAO@IG.COM.BR    | CEL  | 92222-2222 | CENTRO     | RIO DE JANEIRO | RJ   |
|         1 | JOAO    | M    | JOAO@IG.COM.BR    | RES  | 3333-3333  | CENTRO     | RIO DE JANEIRO | RJ   |
|         1 | JOAO    | M    | JOAO@IG.COM.BR    | COM  | 4444-4444  | CENTRO     | RIO DE JANEIRO | RJ   |
|         2 | CARLOS  | M    | CARLOS@GLOBO.COM  | COM  | 2222-2222  | ESTACIO    | RIO DE JANEIRO | RJ   |
|         2 | CARLOS  | M    | CARLOS@GLOBO.COM  | CEL  | 95555-5555 | ESTACIO    | RIO DE JANEIRO | RJ   |
|         3 | ANA     | F    | ANA@GMAIL.COM     | CEL  | 93333-3333 | JARDINS    | SAO PAULO      | SP   |
|         3 | ANA     | F    | ANA@GMAIL.COM     | CEL  | 94444-4444 | JARDINS    | SAO PAULO      | SP   |
|         5 | JORGE   | M    | JORGE@HOTMAIL.COM | CEL  | 91111-1111 | CENTRO     | VITORIA        | ES   |
|         5 | JORGE   | M    | JORGE@HOTMAIL.COM | RES  | 1111-1111  | CENTRO     | VITORIA        | ES   |
|         5 | JORGE   | M    | JORGE@HOTMAIL.COM | RES  | 5555-5555  | CENTRO     | VITORIA        | ES   |
|         9 | FLAVIO  | M    | FLAVIO@IG.COM     | RES  | 68976565   | CASCADURA  | B. HORIZONTE   | MG   |
|         9 | FLAVIO  | M    | FLAVIO@IG.COM     | CEL  | 99656675   | CASCADURA  | B. HORIZONTE   | MG   |
|        11 | GIOVANA | F    | **************    | CEL  | 33567765   | CENTRO     | RIO DE JANEIRO | RJ   |
|        11 | GIOVANA | F    | **************    | CEL  | 88668786   | CENTRO     | RIO DE JANEIRO | RJ   |
|        11 | GIOVANA | F    | **************    | COM  | 55689654   | CENTRO     | RIO DE JANEIRO | RJ   |
|        12 | KARLA   | F    | KARLA@GMAIL.COM   | COM  | 88687979   | COPACABANA | RIO DE JANEIRO | RJ   |
|        13 | DANIELE | F    | DANIELE@GMAIL.COM | COM  | 88965676   | CENTRO     | VITORIA        | ES   |
|        15 | EDUARDO | M    | **************    | CEL  | 89966809   | CENTRO     | CURITIBA       | PR   |
|        16 | ANTONIO | M    | ANTONIO@IG.COM    | COM  | 88679978   | JARDINS    | SAO PAULO      | SP   |
|        17 | ANTONIO | M    | ANTONIO@UOL.COM   | CEL  | 99655768   | BOM RETIRO | CURITIBA       | PR   |
|        18 | ELAINE  | F    | ELAINE@GLOBO.COM  | RES  | 89955665   | LAPA       | SAO PAULO      | SP   |
|        19 | CARMEM  | F    | CARMEM@IG.COM     | RES  | 77455786   | CENTRO     | RIO DE JANEIRO | RJ   |
|        19 | CARMEM  | F    | CARMEM@IG.COM     | RES  | 89766554   | CENTRO     | RIO DE JANEIRO | RJ   |
|        20 | ADRIANA | F    | ADRIANA@GMAIL.COM | RES  | 77755785   | CENTRO     | RIO DE JANEIRO | RJ   |
|        20 | ADRIANA | F    | ADRIANA@GMAIL.COM | COM  | 44522578   | CENTRO     | RIO DE JANEIRO | RJ   |
+-----------+---------+------+-------------------+------+------------+------------+----------------+------+
*/

SHOW VIEWS; -- NAO EXITE
SHOW TABLES;
/*
    +--------------------+
    | Tables_in_comercio |
    +--------------------+
    | CLIENTE            |
    | ENDERECO           |
    | PRODUTO            |
    | relatorio          | <-
    | TELEFONE           |
    +--------------------+
*/

-- APAGANDO UM VIEW
DROP VIEW RELATORIO;

CREATE VIEW V_RELATORIO AS 
SELECT 
C.IDCLIENTE, C.NOME, C.SEXO, IFNULL(C.EMAIL, '**************') AS 'E-MAIL',
T.TIPO, T.NUMERO,
E.BAIRRO, E.CIDADE, E.ESTADO
FROM CLIENTE AS C 
INNER JOIN TELEFONE AS T 
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO AS E 
ON C.IDCLIENTE = E.ID_CLIENTE
ORDER BY C.IDCLIENTE;

SHOW TABLES;
/*
+--------------------+
| Tables_in_comercio |
+--------------------+
| CLIENTE            |
| ENDERECO           |
| PRODUTO            |
| TELEFONE           |
| v_relatorio        |
+--------------------+
*/

SELECT IDCLIENTE, NOME, SEXO, `E-MAIL`, NUMERO, TIPO, BAIRRO, CIDADE, ESTADO FROM V_RELATORIO;
/*
+-----------+---------+------+-------------------+------------+------+------------+----------------+--------+
| IDCLIENTE | NOME    | SEXO | E-MAIL            | NUMERO     | TIPO | BAIRRO     | CIDADE         | ESTADO |
+-----------+---------+------+-------------------+------------+------+------------+----------------+--------+
|         1 | JOAO    | M    | JOAO@IG.COM.BR    | 92222-2222 | CEL  | CENTRO     | RIO DE JANEIRO | RJ     |
|         1 | JOAO    | M    | JOAO@IG.COM.BR    | 3333-3333  | RES  | CENTRO     | RIO DE JANEIRO | RJ     |
|         1 | JOAO    | M    | JOAO@IG.COM.BR    | 4444-4444  | COM  | CENTRO     | RIO DE JANEIRO | RJ     |
|         2 | CARLOS  | M    | CARLOS@GLOBO.COM  | 2222-2222  | COM  | ESTACIO    | RIO DE JANEIRO | RJ     |
|         2 | CARLOS  | M    | CARLOS@GLOBO.COM  | 95555-5555 | CEL  | ESTACIO    | RIO DE JANEIRO | RJ     |
|         3 | ANA     | F    | ANA@GMAIL.COM     | 93333-3333 | CEL  | JARDINS    | SAO PAULO      | SP     |
|         3 | ANA     | F    | ANA@GMAIL.COM     | 94444-4444 | CEL  | JARDINS    | SAO PAULO      | SP     |
|         5 | JORGE   | M    | JORGE@HOTMAIL.COM | 91111-1111 | CEL  | CENTRO     | VITORIA        | ES     |
|         5 | JORGE   | M    | JORGE@HOTMAIL.COM | 1111-1111  | RES  | CENTRO     | VITORIA        | ES     |
|         5 | JORGE   | M    | JORGE@HOTMAIL.COM | 5555-5555  | RES  | CENTRO     | VITORIA        | ES     |
|         9 | FLAVIO  | M    | FLAVIO@IG.COM     | 68976565   | RES  | CASCADURA  | B. HORIZONTE   | MG     |
|         9 | FLAVIO  | M    | FLAVIO@IG.COM     | 99656675   | CEL  | CASCADURA  | B. HORIZONTE   | MG     |
|        11 | GIOVANA | F    | **************    | 33567765   | CEL  | CENTRO     | RIO DE JANEIRO | RJ     |
|        11 | GIOVANA | F    | **************    | 88668786   | CEL  | CENTRO     | RIO DE JANEIRO | RJ     |
|        11 | GIOVANA | F    | **************    | 55689654   | COM  | CENTRO     | RIO DE JANEIRO | RJ     |
|        12 | KARLA   | F    | KARLA@GMAIL.COM   | 88687979   | COM  | COPACABANA | RIO DE JANEIRO | RJ     |
|        13 | DANIELE | F    | DANIELE@GMAIL.COM | 88965676   | COM  | CENTRO     | VITORIA        | ES     |
|        15 | EDUARDO | M    | **************    | 89966809   | CEL  | CENTRO     | CURITIBA       | PR     |
|        16 | ANTONIO | M    | ANTONIO@IG.COM    | 88679978   | COM  | JARDINS    | SAO PAULO      | SP     |
|        17 | ANTONIO | M    | ANTONIO@UOL.COM   | 99655768   | CEL  | BOM RETIRO | CURITIBA       | PR     |
|        18 | ELAINE  | F    | ELAINE@GLOBO.COM  | 89955665   | RES  | LAPA       | SAO PAULO      | SP     |
|        19 | CARMEM  | F    | CARMEM@IG.COM     | 77455786   | RES  | CENTRO     | RIO DE JANEIRO | RJ     |
|        19 | CARMEM  | F    | CARMEM@IG.COM     | 89766554   | RES  | CENTRO     | RIO DE JANEIRO | RJ     |
|        20 | ADRIANA | F    | ADRIANA@GMAIL.COM | 77755785   | RES  | CENTRO     | RIO DE JANEIRO | RJ     |
|        20 | ADRIANA | F    | ADRIANA@GMAIL.COM | 44522578   | COM  | CENTRO     | RIO DE JANEIRO | RJ     |
+-----------+---------+------+-------------------+------------+------+------------+----------------+--------+
*/

SELECT IDCLIENTE, NOME, NUMERO, ESTADO FROM V_RELATORIO;
/*
+-----------+---------+------------+--------+
| IDCLIENTE | NOME    | NUMERO     | ESTADO |
+-----------+---------+------------+--------+
|         1 | JOAO    | 92222-2222 | RJ     |
|         1 | JOAO    | 3333-3333  | RJ     |
|         1 | JOAO    | 4444-4444  | RJ     |
|         2 | CARLOS  | 2222-2222  | RJ     |
|         2 | CARLOS  | 95555-5555 | RJ     |
|         3 | ANA     | 93333-3333 | SP     |
|         3 | ANA     | 94444-4444 | SP     |
|         5 | JORGE   | 91111-1111 | ES     |
|         5 | JORGE   | 1111-1111  | ES     |
|         5 | JORGE   | 5555-5555  | ES     |
|         9 | FLAVIO  | 68976565   | MG     |
|         9 | FLAVIO  | 99656675   | MG     |
|        11 | GIOVANA | 33567765   | RJ     |
|        11 | GIOVANA | 88668786   | RJ     |
|        11 | GIOVANA | 55689654   | RJ     |
|        12 | KARLA   | 88687979   | RJ     |
|        13 | DANIELE | 88965676   | ES     |
|        15 | EDUARDO | 89966809   | PR     |
|        16 | ANTONIO | 88679978   | SP     |
|        17 | ANTONIO | 99655768   | PR     |
|        18 | ELAINE  | 89955665   | SP     |
|        19 | CARMEM  | 77455786   | RJ     |
|        19 | CARMEM  | 89766554   | RJ     |
|        20 | ADRIANA | 77755785   | RJ     |
|        20 | ADRIANA | 44522578   | RJ     |
+-----------+---------+------------+--------+
*/
