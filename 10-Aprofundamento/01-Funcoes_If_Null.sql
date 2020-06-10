SHOW DATABASES;
USE COMERCIO;
-- SHOW TABLES;

-- FUNÇÃO NOW() -- RETORNA A DATA E HORA ATUAL 
SELECT NOW();

-- NOME, EMAIL, NUMERO, ESTADO

SELECT C.IDCLIENTE, C.NOME, C.EMAIL, T.NUMERO, E.ESTADO
FROM CLIENTE AS C
INNER JOIN TELEFONE AS T
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO AS E
ON C.IDCLIENTE = E.ID_CLIENTE ORDER BY IDCLIENTE;
/*
+-----------+---------+-------------------+------------+--------+
| IDCLIENTE | NOME    | EMAIL             | NUMERO     | ESTADO |
+-----------+---------+-------------------+------------+--------+
|         1 | JOAO    | JOAO@IG.COM.BR    | 92222-2222 | RJ     |
|         1 | JOAO    | JOAO@IG.COM.BR    | 3333-3333  | RJ     |
|         1 | JOAO    | JOAO@IG.COM.BR    | 4444-4444  | RJ     |
|         2 | CARLOS  | CARLOS@GLOBO.COM  | 2222-2222  | RJ     |
|         2 | CARLOS  | CARLOS@GLOBO.COM  | 95555-5555 | RJ     |
|         3 | ANA     | ANA@GMAIL.COM     | 93333-3333 | SP     |
|         3 | ANA     | ANA@GMAIL.COM     | 94444-4444 | SP     |
|         5 | JORGE   | JORGE@HOTMAIL.COM | 91111-1111 | ES     |
|         5 | JORGE   | JORGE@HOTMAIL.COM | 1111-1111  | ES     |
|         5 | JORGE   | JORGE@HOTMAIL.COM | 5555-5555  | ES     |
|         9 | FLAVIO  | FLAVIO@IG.COM     | 68976565   | MG     |
|         9 | FLAVIO  | FLAVIO@IG.COM     | 99656675   | MG     |
|        11 | GIOVANA | NULL              | 33567765   | RJ     |
|        11 | GIOVANA | NULL              | 88668786   | RJ     |
|        11 | GIOVANA | NULL              | 55689654   | RJ     |
|        12 | KARLA   | KARLA@GMAIL.COM   | 88687979   | RJ     |
|        13 | DANIELE | DANIELE@GMAIL.COM | 88965676   | ES     |
|        15 | EDUARDO | NULL              | 89966809   | PR     |
|        16 | ANTONIO | ANTONIO@IG.COM    | 88679978   | SP     |
|        17 | ANTONIO | ANTONIO@UOL.COM   | 99655768   | PR     |
|        18 | ELAINE  | ELAINE@GLOBO.COM  | 89955665   | SP     |
|        19 | CARMEM  | CARMEM@IG.COM     | 77455786   | RJ     |
|        19 | CARMEM  | CARMEM@IG.COM     | 89766554   | RJ     |
|        20 | ADRIANA | ADRIANA@GMAIL.COM | 77755785   | RJ     |
|        20 | ADRIANA | ADRIANA@GMAIL.COM | 44522578   | RJ     |
+-----------+---------+-------------------+------------+--------+
*/

SELECT 
C.IDCLIENTE, C.NOME, IFNULL(C.EMAIL, '***************'),
E.ESTADO,
T.NUMERO
FROM CLIENTE AS C 
INNER JOIN ENDERECO AS E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE AS T
ON C.IDCLIENTE = T.ID_CLIENTE
ORDER BY IDCLIENTE;
/*
+-----------+---------+------------------------------------+--------+------------+
| IDCLIENTE | NOME    | IFNULL(C.EMAIL, '***************') | ESTADO | NUMERO     |
+-----------+---------+------------------------------------+--------+------------+
|         1 | JOAO    | JOAO@IG.COM.BR                     | RJ     | 92222-2222 |
|         1 | JOAO    | JOAO@IG.COM.BR                     | RJ     | 3333-3333  |
|         1 | JOAO    | JOAO@IG.COM.BR                     | RJ     | 4444-4444  |
|         2 | CARLOS  | CARLOS@GLOBO.COM                   | RJ     | 2222-2222  |
|         2 | CARLOS  | CARLOS@GLOBO.COM                   | RJ     | 95555-5555 |
|         3 | ANA     | ANA@GMAIL.COM                      | SP     | 93333-3333 |
|         3 | ANA     | ANA@GMAIL.COM                      | SP     | 94444-4444 |
|         5 | JORGE   | JORGE@HOTMAIL.COM                  | ES     | 91111-1111 |
|         5 | JORGE   | JORGE@HOTMAIL.COM                  | ES     | 1111-1111  |
|         5 | JORGE   | JORGE@HOTMAIL.COM                  | ES     | 5555-5555  |
|         9 | FLAVIO  | FLAVIO@IG.COM                      | MG     | 68976565   |
|         9 | FLAVIO  | FLAVIO@IG.COM                      | MG     | 99656675   |
|        11 | GIOVANA | ***************                    | RJ     | 33567765   |
|        11 | GIOVANA | ***************                    | RJ     | 88668786   |
|        11 | GIOVANA | ***************                    | RJ     | 55689654   |
|        12 | KARLA   | KARLA@GMAIL.COM                    | RJ     | 88687979   |
|        13 | DANIELE | DANIELE@GMAIL.COM                  | ES     | 88965676   |
|        15 | EDUARDO | ***************                    | PR     | 89966809   |
|        16 | ANTONIO | ANTONIO@IG.COM                     | SP     | 88679978   |
|        17 | ANTONIO | ANTONIO@UOL.COM                    | PR     | 99655768   |
|        18 | ELAINE  | ELAINE@GLOBO.COM                   | SP     | 89955665   |
|        19 | CARMEM  | CARMEM@IG.COM                      | RJ     | 77455786   |
|        19 | CARMEM  | CARMEM@IG.COM                      | RJ     | 89766554   |
|        20 | ADRIANA | ADRIANA@GMAIL.COM                  | RJ     | 77755785   |
|        20 | ADRIANA | ADRIANA@GMAIL.COM                  | RJ     | 44522578   |
+-----------+---------+------------------------------------+--------+------------+
*/

SELECT 
C.IDCLIENTE, C.NOME, IFNULL(C.EMAIL, '**************') AS EMAIL,
E.ESTADO AS UF,
T.NUMERO
FROM CLIENTE AS C 
INNER JOIN ENDERECO AS E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE AS T
ON C.IDCLIENTE = T.ID_CLIENTE
ORDER BY IDCLIENTE;
/*
+-----------+---------+-------------------+------+------------+
| IDCLIENTE | NOME    | EMAIL             | UF   | NUMERO     |
+-----------+---------+-------------------+------+------------+
|         1 | JOAO    | JOAO@IG.COM.BR    | RJ   | 92222-2222 |
|         1 | JOAO    | JOAO@IG.COM.BR    | RJ   | 3333-3333  |
|         1 | JOAO    | JOAO@IG.COM.BR    | RJ   | 4444-4444  |
|         2 | CARLOS  | CARLOS@GLOBO.COM  | RJ   | 2222-2222  |
|         2 | CARLOS  | CARLOS@GLOBO.COM  | RJ   | 95555-5555 |
|         3 | ANA     | ANA@GMAIL.COM     | SP   | 93333-3333 |
|         3 | ANA     | ANA@GMAIL.COM     | SP   | 94444-4444 |
|         5 | JORGE   | JORGE@HOTMAIL.COM | ES   | 91111-1111 |
|         5 | JORGE   | JORGE@HOTMAIL.COM | ES   | 1111-1111  |
|         5 | JORGE   | JORGE@HOTMAIL.COM | ES   | 5555-5555  |
|         9 | FLAVIO  | FLAVIO@IG.COM     | MG   | 68976565   |
|         9 | FLAVIO  | FLAVIO@IG.COM     | MG   | 99656675   |
|        11 | GIOVANA | **************    | RJ   | 33567765   |
|        11 | GIOVANA | **************    | RJ   | 88668786   |
|        11 | GIOVANA | **************    | RJ   | 55689654   |
|        12 | KARLA   | KARLA@GMAIL.COM   | RJ   | 88687979   |
|        13 | DANIELE | DANIELE@GMAIL.COM | ES   | 88965676   |
|        15 | EDUARDO | **************    | PR   | 89966809   |
|        16 | ANTONIO | ANTONIO@IG.COM    | SP   | 88679978   |
|        17 | ANTONIO | ANTONIO@UOL.COM   | PR   | 99655768   |
|        18 | ELAINE  | ELAINE@GLOBO.COM  | SP   | 89955665   |
|        19 | CARMEM  | CARMEM@IG.COM     | RJ   | 77455786   |
|        19 | CARMEM  | CARMEM@IG.COM     | RJ   | 89766554   |
|        20 | ADRIANA | ADRIANA@GMAIL.COM | RJ   | 77755785   |
|        20 | ADRIANA | ADRIANA@GMAIL.COM | RJ   | 44522578   |
+-----------+---------+-------------------+------+------------+
*/